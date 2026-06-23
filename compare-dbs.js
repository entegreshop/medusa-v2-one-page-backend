const { Client } = require('pg');

async function checkDB(dbName) {
  const client = new Client({
    connectionString: `postgres://postgres@localhost:5432/${dbName}`
  });

  await client.connect();
  try {
    const ordersRes = await client.query("SELECT id, display_id, email, status, created_at FROM \"order\" ORDER BY created_at DESC LIMIT 10");
    console.log(`--- DB: ${dbName} ---`);
    console.log('Orders:', ordersRes.rows);
  } catch (err) {
    console.error(`Error in ${dbName}:`, err.message);
  } finally {
    await client.end();
  }
}

async function main() {
  await checkDB('medusa');
  await checkDB('medusa_v2_ikinci');
}
main();
