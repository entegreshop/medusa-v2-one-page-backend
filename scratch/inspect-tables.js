const { Client } = require('pg');

async function main() {
  const client = new Client({
    connectionString: 'postgres://postgres@localhost:5432/medusa_v2_ikinci'
  });
  await client.connect();
  try {
    const res = await client.query(`
      SELECT table_name 
      FROM information_schema.tables 
      WHERE table_schema = 'public' AND table_name LIKE '%order%' OR table_name LIKE '%fulfillment%'
      ORDER BY table_name
    `);
    console.log('Tables matching order or fulfillment:');
    res.rows.forEach(row => {
      console.log(row.table_name);
    });
  } catch (err) {
    console.error(err);
  } finally {
    await client.end();
  }
}
main();
