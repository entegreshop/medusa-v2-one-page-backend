const { Client } = require('pg');
const client = new Client({ connectionString: 'postgres://postgres:postgres@localhost:5432/medusa_v2_ikinci' });

async function fixMetadata() {
  try {
    await client.connect();
    
    // Fetch all products with metadata
    const res = await client.query('SELECT id, metadata FROM product WHERE metadata IS NOT NULL');
    
    let updatedCount = 0;
    
    for (const row of res.rows) {
      let changed = false;
      let metadataStr = JSON.stringify(row.metadata);
      
      if (metadataStr.includes('localhost:8001/uploads') || metadataStr.includes('localhost:9001/uploads')) {
        metadataStr = metadataStr.replace(/http:\/\/localhost:8001\/uploads\//g, 'http://firsatbox.com:9001/static/');
        metadataStr = metadataStr.replace(/http:\/\/localhost:9001\/uploads\//g, 'http://firsatbox.com:9001/static/');
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

fixMetadata();
