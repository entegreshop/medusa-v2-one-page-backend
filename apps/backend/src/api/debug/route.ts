import { MedusaRequest, MedusaResponse } from "@medusajs/framework/http"
import fs from "fs"
import path from "path"

export const GET = (req: MedusaRequest, res: MedusaResponse) => {
  const cwd = process.cwd();
  const cwdContents = fs.existsSync(cwd) ? fs.readdirSync(cwd) : [];
  
  const rootUploads = path.join(cwd, 'uploads');
  const rootUploadsContents = fs.existsSync(rootUploads) ? fs.readdirSync(rootUploads) : [];
  
  const medusaPublic = path.join(cwd, '.medusa', 'server', 'public', 'uploads');
  const medusaPublicContents = fs.existsSync(medusaPublic) ? fs.readdirSync(medusaPublic) : [];

  const justPublic = path.join(cwd, 'public', 'uploads');
  const justPublicContents = fs.existsSync(justPublic) ? fs.readdirSync(justPublic) : [];
  
  res.json({
    cwd,
    cwdContents,
    rootUploadsContents,
    medusaPublicContents,
    justPublicContents
  });
}
