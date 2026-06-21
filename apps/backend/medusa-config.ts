import { loadEnv, defineConfig } from '@medusajs/framework/utils'

loadEnv(process.env.NODE_ENV || 'development', process.cwd())

module.exports = defineConfig({
  projectConfig: {
    databaseUrl: process.env.DATABASE_URL,
    databaseDriverOptions: process.env.DATABASE_SSL === "true" ? {
      ssl: { rejectUnauthorized: false },
      connection: { ssl: { rejectUnauthorized: false } }
    } : {},
    cookieOptions: {
      secure: false,
      sameSite: "lax",
    },
    http: {
      storeCors: process.env.STORE_CORS!,
      adminCors: process.env.ADMIN_CORS!,
      authCors: process.env.AUTH_CORS!,
      jwtSecret: process.env.JWT_SECRET || "supersecret",
      cookieSecret: process.env.COOKIE_SECRET || "supersecret",
    }
  },
  admin: {
    backendUrl: process.env.MEDUSA_BACKEND_URL || (process.env.COOLIFY_URL ? "http://fnjekbskvqux7jzy4rjs1yef.204.168.136.196.sslip.io" : "http://localhost:9001"),
  }
})
