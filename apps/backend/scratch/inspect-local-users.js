const { Client } = require('pg');

async function main() {
  const client = new Client({
    connectionString: 'postgres://postgres@localhost:5432/medusa_v2_ikinci'
  });

  try {
    await client.connect();
    // Querying all tables with 'user' in their name to find where users are stored
    const tablesRes = await client.query(`
      SELECT table_name 
      FROM information_schema.tables 
      WHERE table_schema = 'public' AND table_name LIKE '%user%'
    `);
    console.log('Tables matching user:', tablesRes.rows.map(r => r.table_name));

    // Try to query the 'user' table
    try {
      const userRes = await client.query('SELECT id, email, first_name, last_name FROM "user"');
      console.log('Users in "user" table:', userRes.rows);
    } catch (e) {
      console.log('Could not query "user" table:', e.message);
    }

  } catch (err) {
    console.error('Database connection error:', err.message);
  } finally {
    await client.end();
  }
}
main();
