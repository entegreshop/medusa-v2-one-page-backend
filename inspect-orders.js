const { Client } = require('pg');

async function main() {
  const client = new Client({
    connectionString: 'postgres://postgres@localhost:5432/medusa_v2_ikinci'
  });

  await client.connect();
  try {
    const ordersRes = await client.query("SELECT id, display_id, email, status, metadata, created_at FROM \"order\" ORDER BY created_at DESC LIMIT 20");
    console.log('Orders count:', ordersRes.rows.length);
    console.log('Recent Orders:', JSON.stringify(ordersRes.rows, null, 2));
  } catch (err) {
    console.error('Hata:', err);
  } finally {
    await client.end();
  }
}
main();
