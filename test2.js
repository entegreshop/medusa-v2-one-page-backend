const { Client } = require('pg');
const client = new Client({ connectionString: 'postgres://postgres:postgres@localhost:5432/medusa_v2_ikinci' });
client.connect().then(async () => {
  const res1 = await client.query("SELECT * FROM information_schema.tables WHERE table_schema='public' AND table_name LIKE '%image%'");
  console.log('Tables:', res1.rows.map(r => r.table_name));
  
  if (res1.rows.some(r => r.table_name === 'image')) {
    const res2 = await client.query("SELECT url FROM image LIMIT 5");
    console.log('URLs:', res2.rows);
  }
  
  client.end();
}).catch(console.error);
