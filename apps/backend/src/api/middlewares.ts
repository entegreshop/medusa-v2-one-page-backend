import { defineMiddlewares } from "@medusajs/framework/http"

export default defineMiddlewares({
  routes: [
    {
      method: ["POST"],
      matcher: "/admin/hero-config/upload",
      bodyParser: {
        sizeLimit: "15mb",
      },
    },
  ],
})
