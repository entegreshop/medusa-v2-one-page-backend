import { MedusaRequest, MedusaResponse } from "@medusajs/framework/http"
import fs from "fs"
import path from "path"

export async function POST(req: MedusaRequest, res: MedusaResponse) {
  try {
    const { filename, filetype, base64 } = req.body as {
      filename: string
      filetype: string
      base64: string
    }

    if (!filename || !base64) {
      return res.status(400).json({ success: false, message: "Dosya adı veya veri eksik" })
    }

    // Extract the raw base64 data
    const base64Data = base64.includes(",") ? base64.split(",")[1] : base64
    const buffer = Buffer.from(base64Data, "base64")

    // Define the upload directory in the storefront public folder dynamically
    let currentDir = process.cwd()
    let uploadDir = ""
    for (let i = 0; i < 5; i++) {
      const checkParentStorefront = path.join(currentDir, "storefront")
      if (fs.existsSync(checkParentStorefront)) {
        uploadDir = path.join(checkParentStorefront, "public", "uploads")
        break
      }
      currentDir = path.join(currentDir, "..")
    }
    
    if (!uploadDir) {
      // Fallback
      uploadDir = path.join(process.cwd(), "..", "..", "..", "storefront", "public", "uploads")
    }

    if (!fs.existsSync(uploadDir)) {
      fs.mkdirSync(uploadDir, { recursive: true })
    }

    // Make filename safe
    const ext = path.extname(filename)
    const base = path.basename(filename, ext).replace(/[^a-zA-Z0-9\-_]/g, "")
    const safeFilename = `${Date.now()}-${base}${ext}`
    const filePath = path.join(uploadDir, safeFilename)

    // Write file to storefront public uploads
    fs.writeFileSync(filePath, buffer)

    // Dynamic storefront URL resolution
    let storefrontUrl = "http://localhost:8001"
    const referer = req.headers.referer || ""
    let isLocalRequest = true

    if (referer) {
      try {
        const parsedReferer = new URL(referer)
        const hostname = parsedReferer.hostname
        if (hostname !== "localhost" && hostname !== "127.0.0.1") {
          isLocalRequest = false
        }
        
        // If sslip.io subdomain, map to storefront subdomain
        if (hostname.includes("sslip.io")) {
          const parts = hostname.split(".")
          if (parts.length > 2) {
            parts[0] = "storefront"
          }
          storefrontUrl = `${parsedReferer.protocol}//${parts.join(".")}:8001`
        } else if (!isLocalRequest) {
          // Custom domain fallback (e.g. replace admin.cizgibutik.com with cizgibutik.com)
          const domain = hostname.replace("admin.", "www.").replace("backend.", "www.")
          storefrontUrl = `${parsedReferer.protocol}//${domain}`
        }
      } catch (e) {
        console.error("Error parsing referer in upload route:", e)
      }
    }

    // Fallback to STORE_CORS if sslip.io/referer logic didn't override it and we are in production
    if (storefrontUrl === "http://localhost:8001" && process.env.STORE_CORS) {
      const origins = process.env.STORE_CORS.split(",")
      if (isLocalRequest) {
        const localOrigin = origins.find(o => o.includes("localhost:8001") || o.includes("localhost:8000"))
        if (localOrigin) storefrontUrl = localOrigin.trim()
      } else {
        const nonLocalOrigin = origins.find(o => !o.includes("localhost:") && !o.includes("127.0.0.1:"))
        if (nonLocalOrigin) storefrontUrl = nonLocalOrigin.trim()
      }
    }

    const publicUrl = `${storefrontUrl}/uploads/${safeFilename}`

    res.json({
      success: true,
      url: publicUrl,
      filename: safeFilename
    })
  } catch (err: any) {
    console.error("Error uploading hero media:", err)
    res.status(500).json({ success: false, message: err.message || "Yükleme başarısız oldu" })
  }
}
