import { type SubscriberConfig, type SubscriberArgs } from "@medusajs/framework"
import { Pool } from "pg"

export default async function linkShippingProfileToNewProduct({ event: { data } }: SubscriberArgs<{ id: string }>) {
  console.log(`Product created: ${data.id}. Fixing shipping profile link...`)
  
  if (!process.env.DATABASE_URL) return

  const pool = new Pool({ connectionString: process.env.DATABASE_URL })
  
  try {
    const profileRes = await pool.query("SELECT id FROM shipping_profile WHERE type = 'default' LIMIT 1")
    let defaultProfileId = profileRes.rows[0]?.id

    if (defaultProfileId) {
      const linkRes = await pool.query("SELECT id FROM product_shipping_profile WHERE product_id = $1", [data.id])
      if (linkRes.rows.length === 0) {
        const linkId = `prodsp_${Math.random().toString(36).substring(2, 15)}`
        await pool.query(
          "INSERT INTO product_shipping_profile (id, product_id, shipping_profile_id, created_at, updated_at) VALUES ($1, $2, $3, NOW(), NOW())",
          [linkId, data.id, defaultProfileId]
        )
        console.log(`Successfully linked product ${data.id} to default shipping profile.`)
      }
    }
  } catch (error) {
    console.error("Failed to fix shipping profile for new product:", error)
  } finally {
    pool.end()
  }
}

export const config: SubscriberConfig = {
  event: "product.created",
}
