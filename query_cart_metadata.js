const { Pool } = require('pg');
const pool = new Pool({ connectionString: process.env.DATABASE_URL || 'postgres://postgres:postgres@localhost:5432/medusa' });

pool.query(`
SELECT c.id, c.metadata 
FROM "order" o 
JOIN cart c ON o.cart_id = c.id
WHERE o.display_id IN (12, 13)
`).then(res => { 
  console.log(JSON.stringify(res.rows, null, 2)); 
  pool.end(); 
}).catch(console.error);
