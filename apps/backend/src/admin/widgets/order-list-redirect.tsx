import { useEffect } from "react"
import { useNavigate } from "react-router-dom"
import { defineWidgetConfig } from "@medusajs/admin-sdk"

const OrderListRedirectWidget = () => {
  const navigate = useNavigate()

  useEffect(() => {
    const hasRedirected = sessionStorage.getItem("dashboard_redirected")
    if (!hasRedirected) {
      sessionStorage.setItem("dashboard_redirected", "true")
      navigate("/app/dashboard")
    }
  }, [navigate])

  return null
}

export const config = defineWidgetConfig({
  zone: "order.list.before",
})

export default OrderListRedirectWidget
