const { Client } = require('pg');
const client = new Client({ connectionString: 'postgres://postgres:postgres@localhost:5432/medusa_v2_ikinci' });
client.connect().then(async () => {
  const res = await client.query("UPDATE image SET url = REPLACE(url, 'http://localhost:8001/uploads/', 'http://firsatbox.com:9001/static/') RETURNING id, url");
  console.log(`Updated ${res.rowCount} images.`);
  
  const res2 = await client.query("UPDATE image SET url = REPLACE(url, 'http://localhost:9001/uploads/', 'http://firsatbox.com:9001/static/') RETURNING id, url");
  console.log(`Updated ${res2.rowCount} images with 9001.`);
  
  client.end();
}).catch(console.error);
