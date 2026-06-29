const { Pool } = require('pg');
const pool = new Pool({ connectionString: process.env.DATABASE_URL || 'postgres://postgres:postgres@localhost:5432/medusa' });
pool.query(`
SELECT o.id, o.display_id, p.provider_id 
FROM "order" o 
LEFT JOIN order_payment_collection opc ON o.id = opc.order_id 
LEFT JOIN payment_collection pc ON opc.payment_collection_id = pc.id 
LEFT JOIN payment p ON pc.id = p.payment_collection_id 
WHERE o.display_id = 12 OR o.display_id = 13
`).then(res => { 
  console.log(res.rows); 
  pool.end(); 
}).catch(console.error);
