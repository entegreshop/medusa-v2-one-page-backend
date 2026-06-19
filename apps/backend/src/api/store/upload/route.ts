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

    const base64Data = base64.includes(",") ? base64.split(",")[1] : base64
    const buffer = Buffer.from(base64Data, "base64")

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
      uploadDir = path.join(process.cwd(), "..", "..", "..", "storefront", "public", "uploads")
    }

    if (!fs.existsSync(uploadDir)) {
      fs.mkdirSync(uploadDir, { recursive: true })
    }

    const ext = path.extname(filename)
    const base = path.basename(filename, ext).replace(/[^a-zA-Z0-9\-_]/g, "")
    const safeFilename = `${Date.now()}-${base}${ext}`
    const filePath = path.join(uploadDir, safeFilename)

    fs.writeFileSync(filePath, buffer)

    let storefrontUrl = "http://localhost:8001"
    if (process.env.STORE_CORS) {
      const origins = process.env.STORE_CORS.split(",")
      const localOrigin = origins.find(o => o.includes("localhost:8001") || o.includes("localhost:8000"))
      if (localOrigin) {
        storefrontUrl = localOrigin.trim()
      } else if (origins.length > 0) {
        storefrontUrl = origins[0].trim()
      }
    }

    const publicUrl = `${storefrontUrl}/uploads/${safeFilename}`

    res.json({
      success: true,
      url: publicUrl,
      filename: safeFilename
    })
  } catch (err: any) {
    console.error("Error uploading review media:", err)
    res.status(500).json({ success: false, message: err.message || "Yükleme başarısız oldu" })
  }
}
