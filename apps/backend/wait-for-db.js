const net = require('net');
const { URL } = require('url');

const dbUrl = process.env.DATABASE_URL;
if (!dbUrl) {
  console.log("[wait-for-db] DATABASE_URL env variable is not set. Skipping database readiness check.");
  process.exit(0);
}

try {
  const parsedUrl = new URL(dbUrl.replace(/^postgresql:/, 'postgres:'));
  const host = parsedUrl.hostname || 'localhost';
  const port = parseInt(parsedUrl.port || '5432', 10);

  console.log(`[wait-for-db] Checking connection to PostgreSQL at ${host}:${port}...`);

  const maxRetries = 20;
  const delayMs = 3000;
  let retries = 0;

  function tryConnect() {
    const socket = new net.Socket();
    
    socket.setTimeout(2000);
    
    socket.connect(port, host, () => {
      console.log(`[wait-for-db] Database at ${host}:${port} is up and accepting connections!`);
      socket.destroy();
      process.exit(0);
    });

    socket.on('error', (err) => {
      socket.destroy();
      retries++;
      if (retries < maxRetries) {
        console.log(`[wait-for-db] Database is not ready yet. Retrying in ${delayMs / 1000}s... (${retries}/${maxRetries})`);
        setTimeout(tryConnect, delayMs);
      } else {
        console.error(`[wait-for-db] Error connecting to database after ${maxRetries} retries:`, err.message);
        process.exit(1);
      }
    });

    socket.on('timeout', () => {
      socket.destroy();
      retries++;
      if (retries < maxRetries) {
        console.log(`[wait-for-db] Connection attempt timed out. Retrying in ${delayMs / 1000}s... (${retries}/${maxRetries})`);
        setTimeout(tryConnect, delayMs);
      } else {
        console.error(`[wait-for-db] Connection attempt timed out after ${maxRetries} retries.`);
        process.exit(1);
      }
    });
  }

  tryConnect();
} catch (error) {
  console.error("[wait-for-db] Failed to parse DATABASE_URL:", error.message);
  process.exit(0);
}
