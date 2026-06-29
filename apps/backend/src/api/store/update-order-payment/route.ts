import { MedusaRequest, MedusaResponse } from "@medusajs/framework/http"
import { Modules } from "@medusajs/framework/utils"

export async function POST(req: MedusaRequest, res: MedusaResponse) {
  const { order_id, payment_method } = req.body as { order_id: string, payment_method: string }
  if (!order_id || !payment_method) {
    return res.status(400).json({ error: "Missing order_id or payment_method" })
  }

  const orderModuleService = req.scope.resolve(Modules.ORDER)
  
  try {
    const orders = await orderModuleService.listOrders({ id: order_id })
    if (!orders || orders.length === 0) return res.status(404).json({ error: "Order not found" })
    
    const order = orders[0]
    await orderModuleService.updateOrders(order.id, {
      metadata: {
        ...(order.metadata || {}),
        payment_method: payment_method
      }
    })
    
    res.json({ success: true })
  } catch (err: any) {
    res.status(500).json({ error: err.message })
  }
}
