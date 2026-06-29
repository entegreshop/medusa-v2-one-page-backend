import { MedusaRequest, MedusaResponse } from "@medusajs/framework/http"
import { Pool } from "pg"

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
  authorization: "wPNB8Uz5bhSFEL7CDy9kRfdcX4T1ZjMtJAsvQOn6",
  from_name: "",
  branch_code: "",
  tax_office: "",
  tax_number: ""
}

const pool = new Pool({
  connectionString: process.env.DATABASE_URL || "postgres://postgres:postgres@localhost:5432/medusa"
})

export async function readConfig(): Promise<InterlineConfig> {
  try {
    // Ensure table exists (safe to run multiple times, though usually done during migrations)
    await pool.query("CREATE TABLE IF NOT EXISTS interline_config (id serial PRIMARY KEY, data jsonb);")
    const res = await pool.query("SELECT data FROM interline_config ORDER BY id DESC LIMIT 1")
    if (res.rows.length > 0) {
      const parsed = res.rows[0].data
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
    console.error("Error reading Interline config from DB:", err)
  }
  return defaultData
}

export async function writeConfig(data: any) {
  try {
    await pool.query("CREATE TABLE IF NOT EXISTS interline_config (id serial PRIMARY KEY, data jsonb);")
    await pool.query(
      "INSERT INTO interline_config (data) VALUES ($1)",
      [data]
    )
    return true
  } catch (err) {
    console.error("Error writing Interline config to DB:", err)
    return false
  }
}

export async function GET(req: MedusaRequest, res: MedusaResponse) {
  const config = await readConfig()
  res.json({ config })
}

export async function POST(req: MedusaRequest, res: MedusaResponse) {
  const body = req.body as any
  const success = await writeConfig({
    active: body.active,
    authorization: body.authorization,
    from_name: body.from_name,
    branch_code: body.branch_code,
    tax_office: body.tax_office,
    tax_number: body.tax_number
  })

  if (success) {
    res.json({ success: true, config: await readConfig() })
  } else {
    res.status(500).json({ success: false, message: "Could not write configuration" })
  }
}
