const { Pool } = require('pg');
const pool = new Pool({ connectionString: process.env.DATABASE_URL || 'postgres://postgres:postgres@localhost:5432/medusa' });

pool.query(`
SELECT id, display_id, metadata 
FROM "order" 
WHERE display_id IN (12, 13)
`).then(res => { 
  console.log(JSON.stringify(res.rows, null, 2)); 
  pool.end(); 
}).catch(console.error);
