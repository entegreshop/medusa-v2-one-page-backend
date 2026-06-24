import { MedusaRequest, MedusaResponse } from "@medusajs/framework/http"
import fs from "fs"
import path from "path"

export const GET = (req: MedusaRequest, res: MedusaResponse) => {
  const cwd = process.cwd();
  const cwdContents = fs.existsSync(cwd) ? fs.readdirSync(cwd) : [];
  
  const rootUploads = path.join(cwd, 'uploads');
  const rootUploadsContents = fs.existsSync(rootUploads) ? fs.readdirSync(rootUploads) : [];
  
  const staticPath = path.join(cwd, 'static');
  const staticContents = fs.existsSync(staticPath) ? fs.readdirSync(staticPath) : [];
  
  res.json({
    cwd,
    cwdContents,
    rootUploadsContents,
    staticContents
  });
}
