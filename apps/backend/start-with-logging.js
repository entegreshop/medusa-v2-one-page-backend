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

          if (tables.includes('user')) {
            const users = await pgClient.query('SELECT id, email FROM "user"');
            console.log('[logger] Existing Users:', JSON.stringify(users.rows));
          }
          if (tables.includes('auth_identity')) {
            const auths = await pgClient.query('SELECT id, identifier FROM auth_identity');
            console.log('[logger] Existing Auth Identities:', JSON.stringify(auths.rows));
          }

          console.log('[logger] Attempting to delete old admin@medusa.com...');
          const authDelRes = await pgClient.query("DELETE FROM auth_identity WHERE identifier = 'admin@medusa.com'");
          console.log('[logger] Deleted from auth_identity rows:', authDelRes.rowCount);
          const userDelRes = await pgClient.query("DELETE FROM \"user\" WHERE email = 'admin@medusa.com'");
          console.log('[logger] Deleted from user rows:', userDelRes.rowCount);
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
