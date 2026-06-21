const { spawn } = require('child_process');
const https = require('https');
const { URL } = require('url');

const topic = 'medusa-one-page-deploy-8a551e00';
const ntfyUrl = `https://ntfy.sh/${topic}`;

console.log(`[logger] Real-time logs will be sent to ${ntfyUrl}`);

function sendLog(text) {
  if (!text) return;
  try {
    const reqUrl = new URL(ntfyUrl);
    const options = {
      hostname: reqUrl.hostname,
      port: 443,
      path: reqUrl.pathname,
      method: 'POST',
      headers: {
        'Content-Type': 'text/plain',
      }
    };

    const req = https.request(options);
    req.on('error', (e) => {
      console.error(`[logger] Failed to send log: ${e.message}`);
    });
    req.write(text);
    req.end();
  } catch (err) {
    console.error(`[logger] Error sending log: ${err.message}`);
  }
}

// Send startup notice
sendLog(`--- NEW DEPLOYMENT STARTING ---
Time: ${new Date().toISOString()}
PORT: ${process.env.PORT}
DATABASE_URL: ${process.env.DATABASE_URL ? 'DEFINED' : 'UNDEFINED'}
`);

function runStep(command, args, callback) {
  sendLog(`[logger] Running: ${command} ${args.join(' ')}\n`);
  console.log(`[logger] Running: ${command} ${args.join(' ')}`);

  const child = spawn(command, args, { 
    shell: true,
    env: process.env 
  });

  child.stdout.on('data', (data) => {
    const text = data.toString();
    process.stdout.write(text);
    sendLog(text);
  });

  child.stderr.on('data', (data) => {
    const text = data.toString();
    process.stderr.write(text);
    sendLog(`[STDERR] ${text}`);
  });

  child.on('close', (code) => {
    sendLog(`[logger] Process exited with code ${code}\n`);
    console.log(`[logger] Process exited with code ${code}`);
    callback(code);
  });
}

// Step 1: Wait for DB
runStep('node', ['wait-for-db.js'], (code) => {
  if (code !== 0) {
    sendLog(`[logger] wait-for-db failed. Exiting.\n`);
    process.exit(code);
  }

  // Step 2: Migrate DB
  runStep('npx', ['medusa', 'db:migrate'], (code) => {
    if (code !== 0) {
      sendLog(`[logger] db:migrate failed. Exiting.\n`);
      process.exit(code);
    }

    // Step 2b: Reset old admin user to apply strong password and avoid browser warnings
    const { Client } = require('pg');
    const dbUrl = process.env.DATABASE_URL;
    console.log('[logger] DATABASE_URL is defined. Connecting to check and reset admin user...');

    const pgClient = new Client({ connectionString: dbUrl });
    pgClient.connect()
      .then(async () => {
        try {
          const tablesRes = await pgClient.query(`
            SELECT table_name 
            FROM information_schema.tables 
            WHERE table_schema = 'public'
          `);
          const tables = tablesRes.rows.map(r => r.table_name);
          console.log('[logger] Database Tables:', tables.join(', '));

          // Safe column inspection helper
          async function logTableDetails(tableName) {
            if (!tables.includes(tableName)) return;
            try {
              const colsRes = await pgClient.query(`
                SELECT column_name, data_type 
                FROM information_schema.columns 
                WHERE table_schema = 'public' AND table_name = $1
              `, [tableName]);
              const colNames = colsRes.rows.map(c => c.column_name);
              console.log(`[logger] Columns of ${tableName}:`, colNames.join(', '));
              
              // Print first 5 rows to see structure
              const rowsRes = await pgClient.query(`SELECT * FROM "${tableName}" LIMIT 5`);
              console.log(`[logger] Sample rows of ${tableName}:`, JSON.stringify(rowsRes.rows));
            } catch (err) {
              console.log(`[logger] Failed to inspect table ${tableName}:`, err.message);
            }
          }

          await logTableDetails('user');
          await logTableDetails('auth_identity');
          await logTableDetails('provider_identity');

          // 1. Get user ID of admin@medusa.com
          const adminUserRes = await pgClient.query("SELECT id FROM \"user\" WHERE email = 'admin@medusa.com'");
          const adminUserId = adminUserRes.rows[0] ? adminUserRes.rows[0].id : null;
          console.log('[logger] Admin user_id:', adminUserId);

          let authIdsToDelete = [];

          if (adminUserId) {
            // 2. Find auth_identity records referencing this user_id in app_metadata
            const authsRes = await pgClient.query('SELECT id, app_metadata FROM auth_identity');
            for (const row of authsRes.rows) {
              if (row.app_metadata && row.app_metadata.user_id === adminUserId) {
                authIdsToDelete.push(row.id);
              }
            }
          }

          // Also check for any auth_identity containing admin@medusa.com in JSON string
          const authsResAll = await pgClient.query('SELECT * FROM auth_identity');
          for (const row of authsResAll.rows) {
            if (JSON.stringify(row).includes('admin@medusa.com') && !authIdsToDelete.includes(row.id)) {
              authIdsToDelete.push(row.id);
            }
          }
          console.log('[logger] Auth identities to delete:', authIdsToDelete);

          // 3. Delete provider_identity records referencing these auth_identity IDs or admin@medusa.com
          if (tables.includes('provider_identity')) {
            try {
              const provRes = await pgClient.query('SELECT * FROM provider_identity');
              console.log('[logger] Existing Provider Identities:', JSON.stringify(provRes.rows));
              for (const row of provRes.rows) {
                const rowStr = JSON.stringify(row);
                const matchesAuthId = authIdsToDelete.some(authId => rowStr.includes(authId));
                const matchesEmail = rowStr.includes('admin@medusa.com');
                if (matchesAuthId || matchesEmail) {
                  console.log('[logger] Found admin/auth reference in provider_identity:', row.id);
                  if (row.id) {
                    await pgClient.query('DELETE FROM provider_identity WHERE id = $1', [row.id]);
                  } else if (row.auth_identity_id) {
                    await pgClient.query('DELETE FROM provider_identity WHERE auth_identity_id = $1', [row.auth_identity_id]);
                  }
                }
              }
            } catch (err) {
              console.log('[logger] Failed to delete from provider_identity:', err.message);
            }
          }

          // 4. Delete auth_identity records
          for (const authId of authIdsToDelete) {
            try {
              await pgClient.query('DELETE FROM auth_identity WHERE id = $1', [authId]);
              console.log('[logger] Deleted auth_identity:', authId);
            } catch (err) {
              console.log('[logger] Failed to delete auth_identity:', authId, err.message);
            }
          }

          // 5. Delete user record
          if (adminUserId) {
            try {
              const userDelRes = await pgClient.query("DELETE FROM \"user\" WHERE id = $1", [adminUserId]);
              console.log('[logger] Deleted from user rows:', userDelRes.rowCount);
            } catch (err) {
              console.log('[logger] Failed to delete from user:', err.message);
            }
          } else {
            try {
              const userDelRes = await pgClient.query("DELETE FROM \"user\" WHERE email = 'admin@medusa.com'");
              console.log('[logger] Fallback deleted from user rows:', userDelRes.rowCount);
            } catch (err) {
              console.log('[logger] Fallback delete from user failed:', err.message);
            }
          }

          // 6. Create default publishable API key for storefront compatibility
          try {
            await logTableDetails('api_key');
            await logTableDetails('publishable_api_key_sales_channel');
            await logTableDetails('sales_channel');

            if (tables.includes('api_key')) {
              const keysRes = await pgClient.query("SELECT * FROM api_key WHERE token = 'pk_7587df1c043fb92eebc89c01e37c6e50ef92da4fdc68ab9a49a731594c3d7b0e'");
              if (keysRes.rows.length === 0) {
                console.log('[logger] Creating default publishable API key in database...');
                const colsRes = await pgClient.query("SELECT column_name FROM information_schema.columns WHERE table_name = 'api_key'");
                const cols = colsRes.rows.map(c => c.column_name);
                
                const id = 'apk_default_storefront';
                const token = 'pk_7587df1c043fb92eebc89c01e37c6e50ef92da4fdc68ab9a49a731594c3d7b0e';
                const title = 'Default Storefront Key';
                const type = 'publishable';
                const salt = '';
                const redacted = 'pk_758***b0e';
                
                const insertFields = [];
                const insertValues = [];
                const insertPlaceholders = [];
                let idx = 1;
                
                if (cols.includes('id')) { insertFields.push('id'); insertValues.push(id); insertPlaceholders.push(`$${idx++}`); }
                if (cols.includes('token')) { insertFields.push('token'); insertValues.push(token); insertPlaceholders.push(`$${idx++}`); }
                if (cols.includes('title')) { insertFields.push('title'); insertValues.push(title); insertPlaceholders.push(`$${idx++}`); }
                if (cols.includes('type')) { insertFields.push('type'); insertValues.push(type); insertPlaceholders.push(`$${idx++}`); }
                if (cols.includes('salt')) { insertFields.push('salt'); insertValues.push(salt); insertPlaceholders.push(`$${idx++}`); }
                if (cols.includes('redacted')) { insertFields.push('redacted'); insertValues.push(redacted); insertPlaceholders.push(`$${idx++}`); }
                if (cols.includes('created_by')) { insertFields.push('created_by'); insertValues.push(adminUserId || 'system'); insertPlaceholders.push(`$${idx++}`); }
                
                const q = `INSERT INTO api_key (${insertFields.join(', ')}) VALUES (${insertPlaceholders.join(', ')})`;
                await pgClient.query(q, insertValues);
                console.log('[logger] Default publishable API key created successfully.');
                
                // Link to default sales channel
                if (tables.includes('sales_channel') && tables.includes('publishable_api_key_sales_channel')) {
                  const scRes = await pgClient.query("SELECT id FROM sales_channel LIMIT 1");
                  const scId = scRes.rows[0] ? scRes.rows[0].id : null;
                  console.log('[logger] Default sales_channel id:', scId);
                  
                  if (scId) {
                    const scColsRes = await pgClient.query("SELECT column_name FROM information_schema.columns WHERE table_name = 'publishable_api_key_sales_channel'");
                    const scCols = scColsRes.rows.map(c => c.column_name);
                    
                    const scInsertFields = [];
                    const scInsertValues = [];
                    const scInsertPlaceholders = [];
                    let scIdx = 1;
                    
                    if (scCols.includes('publishable_api_key_id')) {
                      scInsertFields.push('publishable_api_key_id'); scInsertValues.push(id); scInsertPlaceholders.push(`$${scIdx++}`);
                    } else if (scCols.includes('api_key_id')) {
                      scInsertFields.push('api_key_id'); scInsertValues.push(id); scInsertPlaceholders.push(`$${scIdx++}`);
                    }
                    
                    if (scCols.includes('sales_channel_id')) {
                      scInsertFields.push('sales_channel_id'); scInsertValues.push(scId); scInsertPlaceholders.push(`$${scIdx++}`);
                    }
                    
                    if (scInsertFields.length > 0) {
                      const scQ = `INSERT INTO publishable_api_key_sales_channel (${scInsertFields.join(', ')}) VALUES (${scInsertPlaceholders.join(', ')})`;
                      await pgClient.query(scQ, scInsertValues);
                      console.log('[logger] Linked publishable API key to sales channel.');
                    }
                  }
                }
              } else {
                console.log('[logger] Default publishable API key already exists in database.');
              }
            }
          } catch (keyErr) {
            console.log('[logger] Failed to create default publishable key:', keyErr.message);
          }
        } catch (dbErr) {
          console.log('[logger] Database operations error:', dbErr.message);
        } finally {
          await pgClient.end();
        }

        // Now create the new user with strong password
        console.log('[logger] Creating admin user admin@medusa.com with secure password...');
        runStep('npx', ['medusa', 'user', '-e', 'admin@medusa.com', '-p', 'ModaskopMedusa2026!'], (userCode) => {
          const fs = require('fs');
          const path = require('path');

          const rootPublicAdminIndex = path.join(__dirname, 'public', 'admin', 'index.html');
          const compiledPublicAdminIndex = path.join(__dirname, '.medusa', 'server', 'public', 'admin', 'index.html');

    function startServer() {
      const port = process.env.PORT || '3000';
      runStep('npx', ['medusa', 'start', '--port', port], (code) => {
        sendLog(`[logger] Medusa server stopped with code ${code}\n`);
        process.exit(code);
      });
    }

    function ensureCopiedAndStart() {
      try {
        const srcPublic = path.join(__dirname, '.medusa', 'server', 'public');
        const destPublic = path.join(__dirname, 'public');
        if (fs.existsSync(srcPublic)) {
          sendLog(`[logger] Copying admin build from ${srcPublic} to ${destPublic}...\n`);
          fs.cpSync(srcPublic, destPublic, { recursive: true });
          sendLog(`[logger] Admin build copied successfully!\n`);
        } else {
          sendLog(`[logger] Warning: Source public directory not found at ${srcPublic}\n`);
        }
      } catch (copyErr) {
        sendLog(`[logger] Error copying public dir: ${copyErr.message}\n`);
      }
      startServer();
    }

    if (!fs.existsSync(rootPublicAdminIndex)) {
      sendLog(`[logger] Root admin index.html not found at ${rootPublicAdminIndex}.\n`);
      if (fs.existsSync(compiledPublicAdminIndex)) {
        sendLog(`[logger] Compiled admin index.html found. Copying...\n`);
        ensureCopiedAndStart();
      } else {
        sendLog(`[logger] Compiled admin index.html not found. Running medusa build...\n`);
        runStep('npx', ['medusa', 'build'], (buildCode) => {
          if (buildCode !== 0) {
            sendLog(`[logger] medusa build failed. Exiting.\n`);
            process.exit(buildCode);
          }
          ensureCopiedAndStart();
        });
      }
    } else {
      sendLog(`[logger] Root admin index.html found. Skipping build/copy.\n`);
      startServer();
    }
        });
      })
      .catch((err) => {
        sendLog(`[logger] pgClient connection error: ${err.message}\n`);
      });
  });
});
