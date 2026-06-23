const { Client } = require('pg');

async function main() {
  const client = new Client({
    connectionString: 'postgres://postgres@localhost:5432/medusa_v2_ikinci'
  });
  await client.connect();
  try {
    const carts = await client.query("SELECT id, metadata FROM \"cart\" WHERE metadata IS NOT NULL AND deleted_at IS NULL LIMIT 20");
    console.log('Carts metadata:');
    carts.rows.forEach(r => {
      console.log(r.id, JSON.stringify(r.metadata));
    });

    const orders = await client.query("SELECT id, metadata FROM \"order\" WHERE metadata IS NOT NULL AND deleted_at IS NULL LIMIT 20");
    console.log('\nOrders metadata:');
    orders.rows.forEach(r => {
      console.log(r.id, JSON.stringify(r.metadata));
    });
  } catch (err) {
    console.error(err);
  } finally {
    await client.end();
  }
}
main();
