const { Client } = require('pg');

async function testJoin() {
  const client = new Client({
    connectionString: 'postgres://postgres@localhost:5432/medusa_v2_ikinci'
  });
  await client.connect();

  try {
    const query = `
      SELECT o.id, o.display_id, o.status, o.metadata, o.created_at, 
             os.totals->>'current_order_total' as total,
             f.id as fulfillment_id, f.packed_at, f.shipped_at, f.delivered_at, f.canceled_at as f_canceled_at
      FROM "order" o
      LEFT JOIN "order_summary" os ON os.order_id = o.id
      LEFT JOIN "order_fulfillment" ofo ON ofo.order_id = o.id AND ofo.deleted_at IS NULL
      LEFT JOIN "fulfillment" f ON f.id = ofo.fulfillment_id AND f.deleted_at IS NULL
      WHERE o.deleted_at IS NULL AND o.status != 'draft'
      ORDER BY o.created_at DESC
    `;
    const res = await client.query(query);
    console.log('Orders found:', res.rows.length);
    res.rows.forEach(row => {
      console.log(`ID: ${row.display_id}, Status: ${row.status}, Total: ${row.total}, F_ID: ${row.fulfillment_id}, Packed: ${row.packed_at}, Shipped: ${row.shipped_at}, Deliv: ${row.delivered_at}, Metadata:`, row.metadata);
    });
  } catch (err) {
    console.error('Error:', err);
  } finally {
    await client.end();
  }
}

testJoin();
