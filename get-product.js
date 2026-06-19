const { Client } = require('pg');

async function main() {
  const client = new Client({
    connectionString: 'postgres://postgres@localhost:5432/medusa_v2_ikinci'
  });

  await client.connect();
  try {
    const productsRes = await client.query("SELECT * FROM product LIMIT 1");
    const product = productsRes.rows[0];
    if (product) {
      console.log('PRODUCT:', product.id, product.title, product.handle);
      
      const variantsRes = await client.query("SELECT * FROM product_variant WHERE product_id = $1", [product.id]);
      console.log('VARIANTS count:', variantsRes.rows.length);
      console.log('VARIANT sample:', JSON.stringify(variantsRes.rows[0]));
      
      const optionsRes = await client.query("SELECT * FROM product_option WHERE product_id = $1", [product.id]);
      console.log('OPTIONS count:', optionsRes.rows.length);
      console.log('OPTIONS sample:', JSON.stringify(optionsRes.rows));

      const pricesRes = await client.query("SELECT * FROM price LIMIT 5");
      console.log('PRICES sample:', JSON.stringify(pricesRes.rows));
    } else {
      console.log('No products found.');
    }
  } catch (err) {
    console.error('Hata:', err);
  } finally {
    await client.end();
  }
}
main();
