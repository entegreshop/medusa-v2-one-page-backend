import { type SubscriberConfig, type SubscriberArgs } from "@medusajs/framework"
import { Pool } from "pg"

export default async function linkShippingProfile({ container }: SubscriberArgs) {
  console.log("Running fallback DB script to fix shipping profiles...")
  
  if (!process.env.DATABASE_URL) {
    console.log("No DATABASE_URL found")
    return
  }

  const pool = new Pool({ connectionString: process.env.DATABASE_URL })
  
  try {
    const profileRes = await pool.query("SELECT id FROM shipping_profile WHERE type = 'default' LIMIT 1")
    if (profileRes.rows.length === 0) {
      console.log("No default shipping profile found.")
      return
    }
    const defaultProfileId = profileRes.rows[0].id

    const productsRes = await pool.query("SELECT id FROM product WHERE deleted_at IS NULL")
    
    for (const p of productsRes.rows) {
      const linkRes = await pool.query(
        "SELECT id FROM product_shipping_profile WHERE product_id = $1", 
        [p.id]
      )
      
      if (linkRes.rows.length === 0) {
        console.log(`Linking product ${p.id} to default profile...`)
        const linkId = `prodsp_${Math.random().toString(36).substring(2, 15)}`
        await pool.query(
          "INSERT INTO product_shipping_profile (id, product_id, shipping_profile_id, created_at, updated_at) VALUES ($1, $2, $3, NOW(), NOW())",
          [linkId, p.id, defaultProfileId]
        )
      }
    }
    console.log("Successfully fixed shipping profiles via raw DB script!")
  } catch (error) {
    console.error("Failed to fix shipping profiles:", error)
  } finally {
    pool.end()
  }
}

export const config: SubscriberConfig = {
  event: "medusa.application.ready",
}
