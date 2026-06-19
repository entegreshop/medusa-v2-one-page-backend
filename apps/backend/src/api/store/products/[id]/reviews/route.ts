import { MedusaRequest, MedusaResponse } from "@medusajs/framework/http"
import { IProductModuleService } from "@medusajs/framework/types"
import { Modules } from "@medusajs/framework/utils"

export async function POST(req: MedusaRequest, res: MedusaResponse) {
  try {
    const { id } = req.params
    const { name, color, rating, comment, image, media_type } = req.body as {
      name: string
      color: string
      rating: number
      comment: string
      image?: string
      media_type?: "image" | "video"
    }

    if (!name || !rating || !comment) {
      return res.status(400).json({ success: false, message: "Eksik parametreler" })
    }

    const productModuleService = req.scope.resolve<IProductModuleService>(
      Modules.PRODUCT
    )

    const product = await productModuleService.retrieveProduct(id)
    const metadata = product.metadata || {}
    const reviews = (metadata.reviews as any[]) || []

    const newReview = {
      id: `rev_${Date.now()}`,
      name,
      color: color || "Standart",
      rating: Number(rating),
      comment,
      image: image || "",
      media_type: media_type || "image",
      is_active: false, // Default is false (pending admin approval)
      created_at: new Date().toISOString()
    }

    reviews.push(newReview)
    
    await productModuleService.updateProducts(id, {
      metadata: {
        ...metadata,
        reviews
      }
    })

    res.json({ success: true, review: newReview })
  } catch (err: any) {
    console.error("Error submitting review:", err)
    res.status(500).json({ success: false, message: err.message || "İşlem başarısız" })
  }
}
