import { MedusaRequest, MedusaResponse } from "@medusajs/framework/http"
import fs from "fs"
import path from "path"

export const GET = (req: MedusaRequest, res: MedusaResponse) => {
  const fileParam = req.params.file;
  if (!fileParam) {
    return res.status(400).json({ message: "No file specified" });
  }
  
  const staticDir = path.join(process.cwd(), "static");
  const uploadsDir = path.join(process.cwd(), "uploads");
  
  let filePath = path.join(staticDir, fileParam);
  if (!fs.existsSync(filePath)) {
    filePath = path.join(uploadsDir, fileParam);
  }
  
  if (fs.existsSync(filePath)) {
    const stat = fs.statSync(filePath);
    const ext = path.extname(filePath).toLowerCase();
    
    let mimeType = 'application/octet-stream';
    if (ext === '.png') mimeType = 'image/png';
    else if (ext === '.jpg' || ext === '.jpeg') mimeType = 'image/jpeg';
    else if (ext === '.webp') mimeType = 'image/webp';
    else if (ext === '.gif') mimeType = 'image/gif';
    else if (ext === '.svg') mimeType = 'image/svg+xml';

    res.writeHead(200, {
      'Content-Type': mimeType,
      'Content-Length': stat.size,
      'Cache-Control': 'public, max-age=31536000, immutable'
    });
    
    const readStream = fs.createReadStream(filePath);
    readStream.pipe(res);
  } else {
    // If not found in uploads, check .medusa/server/public/uploads just in case
    const fallbackPath = path.join(process.cwd(), ".medusa", "server", "public", "uploads", fileParam);
    if (fs.existsSync(fallbackPath)) {
      const stat = fs.statSync(fallbackPath);
      res.writeHead(200, {
        'Content-Length': stat.size
      });
      fs.createReadStream(fallbackPath).pipe(res);
    } else {
      res.status(404).json({ 
        message: "File not found", 
        triedPaths: [filePath, fallbackPath],
        cwd: process.cwd()
      });
    }
  }
}
