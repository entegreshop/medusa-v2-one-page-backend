const { Pool } = require('pg');
const pool = new Pool({ connectionString: process.env.DATABASE_URL || 'postgres://postgres:postgres@localhost:5432/medusa' });

pool.query(`
SELECT table_name, column_name 
FROM information_schema.columns 
WHERE table_name = 'order' OR table_name = 'cart'
`).then(res => { 
  console.log(JSON.stringify(res.rows, null, 2)); 
  pool.end(); 
}).catch(console.error);
