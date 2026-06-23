const { Client } = require('pg');

async function main() {
  const client = new Client({
    connectionString: 'postgres://postgres@localhost:5432/medusa_v2_ikinci'
  });
  await client.connect();
  try {
    let res = await client.query(`
      SELECT column_name, data_type 
      FROM information_schema.columns 
      WHERE table_name = 'order_fulfillment'
    `);
    console.log('Columns of order_fulfillment table:');
    res.rows.forEach(row => {
      console.log(`${row.column_name}: ${row.data_type}`);
    });

    res = await client.query(`
      SELECT column_name, data_type 
      FROM information_schema.columns 
      WHERE table_name = 'fulfillment'
    `);
    console.log('\nColumns of fulfillment table:');
    res.rows.forEach(row => {
      console.log(`${row.column_name}: ${row.data_type}`);
    });
  } catch (err) {
    console.error(err);
  } finally {
    await client.end();
  }
}
main();
