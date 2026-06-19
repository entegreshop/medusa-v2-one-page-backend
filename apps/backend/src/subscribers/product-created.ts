import {
  type SubscriberArgs,
  type SubscriberConfig,
} from "@medusajs/framework"

export default async function productCreateHandler({
  event: { data },
  container,
}: SubscriberArgs<{ id: string }>) {
  const productId = data.id
  console.log(`[Subscriber] Product created: ${productId}`)

  try {
    const pgConnection = container.resolve("pg_connection") as any
    
    // Fetch default shipping profile ID
    const profiles = await pgConnection("shipping_profile")
      .select("id")
      .where({ type: "default" })
      .first()

    const profileId = profiles?.id
    if (!profileId) {
      console.error("[Subscriber] No default shipping profile found in database!")
      return
    }
    
    // Check if link already exists
    const existing = await pgConnection("product_shipping_profile")
      .where({ product_id: productId, shipping_profile_id: profileId })
      .first()

    if (existing) {
      console.log(`[Subscriber] Product ${productId} is already linked to shipping profile ${profileId}`)
      return
    }

    // Generate a unique ID (prodsp_ + random alphanumeric)
    const linkId = `prodsp_01${Math.random().toString(36).substring(2, 12)}`.substring(0, 30)

    // Insert into product_shipping_profile
    await pgConnection("product_shipping_profile").insert({
      id: linkId,
      product_id: productId,
      shipping_profile_id: profileId,
      created_at: new Date(),
      updated_at: new Date()
    })

    console.log(`[Subscriber] Successfully linked product ${productId} to shipping profile ${profileId}`)
  } catch (err) {
    console.error(`[Subscriber] Error linking product to shipping profile:`, err)
  }
}

export const config: SubscriberConfig = {
  event: "product.created",
}
