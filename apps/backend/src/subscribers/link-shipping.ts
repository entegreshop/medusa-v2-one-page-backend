import { type SubscriberConfig, type SubscriberArgs } from "@medusajs/framework"
import { Modules } from "@medusajs/framework/utils"

export default async function linkShippingProfile({ container }: SubscriberArgs) {
  const query = container.resolve("query")
  const productModule = container.resolve(Modules.PRODUCT)
  const fulfillmentModule = container.resolve(Modules.FULFILLMENT)

  try {
    const { data: profiles } = await query.graph({
      entity: "shipping_profile",
      fields: ["id", "type"],
    })

    const defaultProfile = profiles.find((p) => p.type === "default")
    if (!defaultProfile) {
      console.log("No default shipping profile found.")
      return
    }

    const { data: products } = await query.graph({
      entity: "product",
      fields: ["id", "shipping_profile.*"],
    })

    const missingProducts = products.filter((p) => !p.shipping_profile)
    
    if (missingProducts.length > 0) {
      console.log(`Linking default shipping profile ${defaultProfile.id} to ${missingProducts.length} products...`)
      const links = missingProducts.map((p) => ({
        [Modules.PRODUCT]: { product_id: p.id },
        [Modules.FULFILLMENT]: { shipping_profile_id: defaultProfile.id }
      }))
      
      const linkModule = container.resolve("link")
      await linkModule.create(links)
      console.log("Successfully linked shipping profiles!")
    } else {
      console.log("All products already have a shipping profile.")
    }
  } catch (error) {
    console.error("Failed to link shipping profiles:", error)
  }
}

export const config: SubscriberConfig = {
  event: "medusa.application.ready",
}
