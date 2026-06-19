const { Client } = require('pg');

async function main() {
  const client = new Client({
    connectionString: 'postgres://postgres@localhost:5432/medusa_v2_ikinci'
  });

  await client.connect();
  try {
    const imagesRes = await client.query("SELECT * FROM image");
    console.log('Database Images count:', imagesRes.rows.length);
    console.log('Database Images:', JSON.stringify(imagesRes.rows.map(img => img.url), null, 2));
  } catch (err) {
    console.error('Hata:', err);
  } finally {
    await client.end();
  }
}
main();
