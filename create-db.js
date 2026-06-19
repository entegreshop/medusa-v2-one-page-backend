const { Client } = require('pg');

async function main() {
  const client = new Client({
    connectionString: 'postgres://postgres@localhost:5432/postgres'
  });

  try {
    await client.connect();
    console.log('PostgreSQL sunucusuna başarıyla bağlanıldı.');
    await client.query('CREATE DATABASE medusa_v2_ikinci');
    console.log('medusa_v2_ikinci veri tabanı başarıyla oluşturuldu!');
  } catch (err) {
    if (err.code === '42P04') {
      console.log('medusa_v2_ikinci veri tabanı zaten mevcut.');
    } else {
      console.error('Veri tabanı oluşturulurken hata:', err.message);
      process.exit(1);
    }
  } finally {
    await client.end();
  }
}

main();
