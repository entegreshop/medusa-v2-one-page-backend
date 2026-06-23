const { Client } = require('pg');

function getDateRange(period) {
  const now = new Date()
  let start = new Date()
  let end = new Date()
  start.setMonth(0, 1)
  start.setHours(0, 0, 0, 0)
  end.setHours(23, 59, 59, 999)
  return { start, end }
}

async function testAllQueries() {
  const client = new Client({
    connectionString: 'postgres://postgres@localhost:5432/medusa_v2_ikinci'
  });
  await client.connect();

  const { start, end } = getDateRange("Bu Yıl");
  console.log('Testing all dashboard queries...');

  // Query 1: Orders (modified with JOIN to avoid o.fulfillment_status)
  try {
    const ordersRes = await client.query(`
      SELECT o.id, o.status, o.metadata, o.created_at, 
             os.totals->>'current_order_total' as total,
             f.packed_at, f.shipped_at, f.delivered_at
      FROM "order" o
      LEFT JOIN "order_summary" os ON os.order_id = o.id
      LEFT JOIN "order_fulfillment" ofo ON ofo.order_id = o.id AND ofo.deleted_at IS NULL
      LEFT JOIN "fulfillment" f ON f.id = ofo.fulfillment_id AND f.deleted_at IS NULL
      WHERE o.deleted_at IS NULL AND o.status != 'draft'
        AND o.created_at >= $1 
        AND o.created_at <= $2
    `, [start.toISOString(), end.toISOString()]);
    console.log('Query 1 (Orders) successful. Rows:', ordersRes.rows.length);
  } catch (err) {
    console.error('Query 1 failed:', err.message);
  }

  // Query 2: Items and Unit Prices
  try {
    const itemsRes = await client.query(`
      SELECT oi.quantity, oli.unit_price
      FROM order_item oi
      JOIN order_line_item oli ON oli.id = oi.item_id
      JOIN "order" o ON o.id = oi.order_id
      WHERE o.deleted_at IS NULL AND oi.deleted_at IS NULL AND oli.deleted_at IS NULL
        AND o.status != 'draft'
        AND o.created_at >= $1 AND o.created_at <= $2
    `, [start.toISOString(), end.toISOString()]);
    console.log('Query 2 (Items) successful. Rows:', itemsRes.rows.length);
  } catch (err) {
    console.error('Query 2 failed:', err.message);
  }

  // Query 3: Best Sellers
  try {
    const bestSellersRes = await client.query(`
      SELECT 
        oli.product_title, 
        oli.variant_title, 
        oli.thumbnail, 
        oli.variant_sku as sku, 
        SUM(CAST(oi.quantity AS integer)) as quantity,
        AVG(CAST(oli.unit_price AS numeric)) / 100 as price,
        pv.metadata->>'cost_price' as cost_price
      FROM order_item oi
      JOIN order_line_item oli ON oli.id = oi.item_id
      JOIN "order" o ON o.id = oi.order_id
      LEFT JOIN "product_variant" pv ON pv.id = oli.variant_id
      WHERE o.deleted_at IS NULL AND oi.deleted_at IS NULL AND oli.deleted_at IS NULL
        AND o.status != 'draft'
        AND o.created_at >= $1 AND o.created_at <= $2
      GROUP BY oli.product_title, oli.variant_title, oli.thumbnail, oli.variant_sku, pv.metadata
      ORDER BY quantity DESC
      LIMIT 10
    `, [start.toISOString(), end.toISOString()]);
    console.log('Query 3 (Best Sellers) successful. Rows:', bestSellersRes.rows.length);
  } catch (err) {
    console.error('Query 3 failed:', err.message);
  }

  // Query 4: Critical Stocks
  try {
    const stockRes = await client.query(`
      SELECT 
        pv.title as variant_title,
        p.title as product_title,
        pv.sku,
        p.thumbnail,
        COALESCE(il.stocked_quantity, 0) as stock_quantity
      FROM product_variant pv
      JOIN product p ON p.id = pv.product_id
      LEFT JOIN product_variant_inventory_item pvii ON pvii.variant_id = pv.id
      LEFT JOIN inventory_level il ON il.inventory_item_id = pvii.inventory_item_id AND il.deleted_at IS NULL
      WHERE pv.deleted_at IS NULL AND p.deleted_at IS NULL
      ORDER BY stock_quantity ASC
      LIMIT 5
    `);
    console.log('Query 4 (Critical Stocks) successful. Rows:', stockRes.rows.length);
  } catch (err) {
    console.error('Query 4 failed:', err.message);
  }

  // Query 5: All Time Averages
  try {
    const allTimeRes = await client.query(`
      SELECT COUNT(o.id) as count, SUM(CAST(os.totals->>'current_order_total' AS numeric)) as total, MIN(o.created_at) as first_order
      FROM "order" o
      LEFT JOIN "order_summary" os ON os.order_id = o.id
      WHERE o.deleted_at IS NULL AND o.status != 'draft'
    `);
    console.log('Query 5 (All Time) successful. Rows:', allTimeRes.rows.length);
  } catch (err) {
    console.error('Query 5 failed:', err.message);
  }

  // Query 6: Active Carts
  try {
    const cartsRes = await client.query(`
      SELECT COUNT(id) as count 
      FROM "cart" 
      WHERE updated_at >= NOW() - INTERVAL '30 minutes'
    `);
    console.log('Query 6 (Active Carts) successful. Rows:', cartsRes.rows.length);
  } catch (err) {
    console.error('Query 6 failed:', err.message);
  }

  await client.end();
}

testAllQueries();
