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
  
  const staticPath = path.join(cwd, 'static');
  const staticContents = fs.existsSync(staticPath) ? fs.readdirSync(staticPath) : [];
  
  function findFile(dir, filename) {
    let results: string[] = [];
    try {
      const list = fs.readdirSync(dir);
      list.forEach(file => {
        file = path.join(dir, file);
        try {
          const stat = fs.statSync(file);
          if (stat && stat.isDirectory()) {
            if (!file.includes('node_modules') && !file.includes('.git')) {
              results = results.concat(findFile(file, filename));
            }
          } else {
            if (file.includes(filename)) results.push(file);
          }
        } catch (e) {}
      });
    } catch (e) {}
    return results;
  }
  
  const searchResults = findFile('/app', '1782311572736');

  res.json({
    cwd,
    cwdContents,
    rootUploadsContents,
    medusaPublicContents,
    justPublicContents,
    staticContents,
    searchResults,
    cors: {
      admin: process.env.ADMIN_CORS,
      store: process.env.STORE_CORS,
      auth: process.env.AUTH_CORS,
      coolify: process.env.COOLIFY_URL
    }
  });
}

