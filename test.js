const { Client } = require('pg');
const client = new Client({ connectionString: 'postgres://postgres:postgres@localhost:5432/medusa_v2_ikinci' });
client.connect().then(async () => {
  const res = await client.query("SELECT p.id, p.handle FROM product p JOIN product_sales_channel psc ON p.id = psc.product_id WHERE psc.sales_channel_id = 'sc_01KTSXRACSHSTBPYBE5P2G0VHC'");
  console.log(res.rows);
  client.end();
}).catch(console.error);
