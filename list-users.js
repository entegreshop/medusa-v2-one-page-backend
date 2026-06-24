const { Client } = require('pg');
const client = new Client({ connectionString: 'postgres://postgres:postgres@localhost:5432/medusa_v2_ikinci' });
client.connect().then(() => client.query('SELECT email FROM "user"')).then(res => { console.log(res.rows); client.end(); }).catch(console.error);
