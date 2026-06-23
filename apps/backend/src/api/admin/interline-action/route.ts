import { MedusaRequest, MedusaResponse } from "@medusajs/framework/http"
import { getInterlineBarcode, createInterlineConsignment, InterlineConsignmentData } from "../../../utils/interline-cargo"
import { Modules } from "@medusajs/framework/utils"

export async function GET(req: MedusaRequest, res: MedusaResponse) {
  const barcode = req.query.barcode as string
  if (!barcode) {
    return res.status(400).json({ error: "Barcode is required" })
  }

  const base64Pdf = await getInterlineBarcode(barcode)
  if (base64Pdf) {
    res.json({ success: true, base64: base64Pdf })
  } else {
    res.status(404).json({ success: false, error: "Barkod bulunamadı veya API hatası" })
  }
}

export async function POST(req: MedusaRequest, res: MedusaResponse) {
  const { order_id } = req.body as any
  if (!order_id) return res.status(400).json({ error: "order_id required" })

  const query = req.scope.resolve("query")
  const orderModuleService = req.scope.resolve(Modules.ORDER)

  try {
    const { data: orders } = await query.graph({
      entity: "order",
      fields: [
        "id",
        "display_id",
        "metadata",
        "shipping_address.*",
        "customer.*"
      ],
      filters: { id: order_id },
    })

    const order = orders[0]
    if (!order) return res.status(404).json({ error: "Order not found" })

    const metadata = order.metadata || {}
    if (metadata.interline_barcode) {
      return res.status(400).json({ error: "Bu sipariş zaten İnterline kargoya gönderilmiş." })
    }

    const firstName = order.shipping_address?.first_name || order.customer?.first_name || "Müşteri"
    const lastName = order.shipping_address?.last_name || order.customer?.last_name || ""
    const fullName = `${firstName} ${lastName}`.trim()
    
    const province = order.shipping_address?.province || "İstanbul"
    const city = order.shipping_address?.city || "Merkez"
    const address = order.shipping_address?.address_1 || ""
    const phone = order.shipping_address?.phone || order.customer?.phone || ""
    const weight = metadata.weight ? parseInt(metadata.weight as string) : 1

    const consignmentData: InterlineConsignmentData = {
      customer: fullName,
      province_name: province,
      county_name: city,
      address: address,
      telephone: phone,
      quantity: 1,
      consignment_type_id: 2, 
      amount_type_id: 3, 
      distribution_type_id: 1,
      order_number: order.display_id ? order.display_id.toString() : order.id,
      weight: weight
    }

    const result = await createInterlineConsignment(consignmentData)
    if (result.success && result.barcode) {
      await orderModuleService.updateOrders(order_id, {
        metadata: {
          ...metadata,
          interline_barcode: result.barcode,
          interline_record_id: result.record_id,
          carrier_barcode: result.barcode
        }
      })
      return res.json({ success: true, barcode: result.barcode })
    } else {
      return res.status(400).json({ success: false, error: result.error })
    }
  } catch (err: any) {
    return res.status(500).json({ success: false, error: err.message })
  }
}
