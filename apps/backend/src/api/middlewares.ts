import { defineMiddlewares } from "@medusajs/framework/http"
import express from "express"

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
