const { Client } = require('pg');

async function run() {
  const client = new Client({ connectionString: 'postgres://postgres:postgres@localhost:5432/medusa_v2_ikinci' });
  await client.connect();
  const res = await client.query('SELECT metadata FROM product');
  console.log(JSON.stringify(res.rows, null, 2));
  
  const imgRes = await client.query('SELECT url FROM image');
  console.log("IMAGES:", JSON.stringify(imgRes.rows, null, 2));
  await client.end();
}

run().catch(console.error);
