const { Client } = require('pg');

async function main() {
  const client = new Client({
    connectionString: 'postgres://postgres@localhost:5432/medusa_v2_ikinci'
  });

  try {
    await client.connect();
    const res = await client.query("SELECT id, token, title, type FROM api_key");
    console.log('KEYS:', JSON.stringify(res.rows));
  } catch (err) {
    console.error('Hata:', err);
  } finally {
    await client.end();
  }
}
main();
