const { Client } = require('pg');

async function main() {
  const client = new Client({
    connectionString: 'postgres://postgres@localhost:5432/medusa_v2_ikinci'
  });
  await client.connect();
  try {
    const totalCarts = await client.query("SELECT COUNT(id) as count FROM \"cart\" WHERE deleted_at IS NULL");
    const cartsWithEmail = await client.query("SELECT COUNT(id) as count FROM \"cart\" WHERE email IS NOT NULL AND deleted_at IS NULL");
    const cartsWithAddress = await client.query("SELECT COUNT(id) as count FROM \"cart\" WHERE shipping_address_id IS NOT NULL AND deleted_at IS NULL");
    const completedCarts = await client.query("SELECT COUNT(id) as count FROM \"cart\" WHERE completed_at IS NOT NULL AND deleted_at IS NULL");

    console.log('Cart statistics in DB:');
    console.log('Total Carts:', totalCarts.rows[0].count);
    console.log('Carts with Email:', cartsWithEmail.rows[0].count);
    console.log('Carts with Shipping Address:', cartsWithAddress.rows[0].count);
    console.log('Completed Carts:', completedCarts.rows[0].count);

    // Let's inspect some carts
    const sample = await client.query("SELECT id, email, shipping_address_id, completed_at, created_at FROM \"cart\" ORDER BY created_at DESC LIMIT 10");
    console.log('\nSample Carts:');
    sample.rows.forEach(r => {
      console.log(r);
    });
  } catch (err) {
    console.error(err);
  } finally {
    await client.end();
  }
}
main();
