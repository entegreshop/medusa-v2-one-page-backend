const { Pool } = require('pg');
const pool = new Pool({ connectionString: process.env.DATABASE_URL || 'postgres://postgres:postgres@localhost:5432/medusa' });

pool.query(`
SELECT id, email, metadata, completed_at 
FROM cart 
WHERE email = '905323370081@kapidaodeme.com'
`).then(res => { 
  console.log(JSON.stringify(res.rows, null, 2)); 
  pool.end(); 
}).catch(console.error);
