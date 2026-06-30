import { MedusaRequest, MedusaResponse } from "@medusajs/framework/http"
import { Pool } from "pg"

export async function GET(req: MedusaRequest, res: MedusaResponse) {
  try {
    const pool = new Pool({ connectionString: process.env.DATABASE_URL })
    
    // Get default shipping profile
    const profileRes = await pool.query("SELECT id, type, name FROM shipping_profile")
    let defaultProfileId = profileRes.rows.find(p => p.type === 'default')?.id
    
    if (!defaultProfileId) {
       defaultProfileId = profileRes.rows[0]?.id
    }

    if (!defaultProfileId) {
      res.json({ error: "No shipping profile found in database" })
      return
    }

    const productsRes = await pool.query("SELECT id, title FROM product WHERE deleted_at IS NULL")
    let linked = []
    
    for (const p of productsRes.rows) {
      const linkRes = await pool.query("SELECT id FROM product_shipping_profile WHERE product_id = $1", [p.id])
      if (linkRes.rows.length === 0) {
        const linkId = `prodsp_${Math.random().toString(36).substring(2, 15)}`
        await pool.query(
          "INSERT INTO product_shipping_profile (id, product_id, shipping_profile_id, created_at, updated_at) VALUES ($1, $2, $3, NOW(), NOW())",
          [linkId, p.id, defaultProfileId]
        )
        linked.push(p.title)
      }
    }
    
    pool.end()
    res.json({ 
      success: true, 
      linked_products: linked, 
      total_products: productsRes.rows.length,
      defaultProfileId 
    })
  } catch(e) {
    res.json({ error: e.message })
  }
}
