const { Client } = require('pg');
const { generatePasswordHash } = require('./apps/backend/node_modules/@medusajs/utils/dist/auth/generate-password-hash');

async function reset() {
  try {
    const hash = await generatePasswordHash('supersecret');
    const client = new Client({ connectionString: 'postgres://postgres:postgres@localhost:5432/medusa_v2_ikinci' });
    await client.connect();
    
    await client.query('UPDATE "user" SET password_hash = $1 WHERE email = $2', [hash, 'admin@medusa-test.com']);
    console.log('Updated password for admin@medusa-test.com');
    
    await client.end();
  } catch (e) {
    console.error(e);
  }
}

reset();
