import { MedusaRequest, MedusaResponse } from "@medusajs/framework/http"
import fs from "fs"
import path from "path"
import os from "os"

const configFilePath = path.join(os.homedir(), ".xoox-interline-settings.json")

export interface InterlineConfig {
  active: boolean
  authorization: string
  from_name: string
  branch_code: string
  tax_office?: string
  tax_number?: string
}

export const defaultData: InterlineConfig = {
  active: false,
  authorization: "wPNB8Uz5bhSFEL7CDy9kRfdcX4T1ZjMtJAsvQOn6", // Default from PDF
  from_name: "",
  branch_code: "",
  tax_office: "",
  tax_number: ""
}

export function readConfig(): InterlineConfig {
  try {
    if (fs.existsSync(configFilePath)) {
      const content = fs.readFileSync(configFilePath, "utf-8")
      const parsed = JSON.parse(content)
      return {
        active: typeof parsed.active === "boolean" ? parsed.active : defaultData.active,
        authorization: parsed.authorization !== undefined ? parsed.authorization : defaultData.authorization,
        from_name: parsed.from_name !== undefined ? parsed.from_name : defaultData.from_name,
        branch_code: parsed.branch_code !== undefined ? parsed.branch_code : defaultData.branch_code,
        tax_office: parsed.tax_office !== undefined ? parsed.tax_office : defaultData.tax_office,
        tax_number: parsed.tax_number !== undefined ? parsed.tax_number : defaultData.tax_number,
      }
    }
  } catch (err) {
    console.error("Error reading Interline config in admin api:", err)
  }
  return defaultData
}

function writeConfig(data: any) {
  try {
    fs.writeFileSync(configFilePath, JSON.stringify(data, null, 2), "utf-8")
    return true
  } catch (err) {
    console.error("Error writing Interline config in admin api:", err)
    return false
  }
}

export async function GET(req: MedusaRequest, res: MedusaResponse) {
  const config = readConfig()
  res.json({ config })
}

export async function POST(req: MedusaRequest, res: MedusaResponse) {
  const body = req.body as any

  const success = writeConfig({
    active: body.active,
    authorization: body.authorization,
    from_name: body.from_name,
    branch_code: body.branch_code,
    tax_office: body.tax_office,
    tax_number: body.tax_number
  })

  if (success) {
    res.json({ success: true, config: readConfig() })
  } else {
    res.status(500).json({ success: false, message: "Could not write configuration" })
  }
}
