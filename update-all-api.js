const { Client } = require('pg');
const client = new Client({ connectionString: 'postgres://postgres:postgres@localhost:5432/medusa_v2_ikinci' });

async function fixAll() {
  try {
    await client.connect();
    
    // Fix image table
    const resImage = await client.query("UPDATE image SET url = REPLACE(url, 'http://api.firsatbox.com/static/', 'http://firsatbox.com/static/') RETURNING id, url");
    console.log(`Updated ${resImage.rowCount} images in image table.`);
    
    // Fix product metadata
    const resMeta = await client.query('SELECT id, metadata FROM product WHERE metadata IS NOT NULL');
    let updatedCount = 0;
    
    for (const row of resMeta.rows) {
      let changed = false;
      let metadataStr = JSON.stringify(row.metadata);
      
      if (metadataStr.includes('http://api.firsatbox.com/static/')) {
        metadataStr = metadataStr.replace(/http:\/\/api\.firsatbox\.com\/static\//g, 'http://firsatbox.com/static/');
        changed = true;
      }
      
      if (changed) {
        await client.query('UPDATE product SET metadata = $1 WHERE id = $2', [JSON.parse(metadataStr), row.id]);
        updatedCount++;
      }
    }
    
    console.log(`Updated metadata for ${updatedCount} products.`);
    
  } catch (error) {
    console.error(error);
  } finally {
    await client.end();
  }
}

fixAll();
