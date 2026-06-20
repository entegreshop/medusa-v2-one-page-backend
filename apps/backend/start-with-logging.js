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

    // Step 3: Start server
    const port = process.env.PORT || '3000';
    runStep('npx', ['medusa', 'start', '--port', port], (code) => {
      sendLog(`[logger] Medusa server stopped with code ${code}\n`);
      process.exit(code);
    });
  });
});
