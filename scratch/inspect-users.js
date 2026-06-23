const { Client } = require('pg');

async function main() {
  const client = new Client({
    connectionString: 'postgres://postgres@localhost:5432/medusa_v2_ikinci'
  });
  await client.connect();
  try {
    const res = await client.query("SELECT id, email FROM \"user\" LIMIT 10");
    console.log('Users:');
    res.rows.forEach(row => {
      console.log(row);
    });

    const res2 = await client.query("SELECT * FROM \"auth_identity\" LIMIT 10");
    console.log('Auth Identities:');
    res2.rows.forEach(row => {
      console.log(row.id, row.provider_identities);
    });
  } catch (err) {
    console.error(err);
  } finally {
    await client.end();
  }
}
main();
