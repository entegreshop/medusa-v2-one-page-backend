import { loadEnv, defineConfig, Modules } from '@medusajs/framework/utils'

loadEnv(process.env.NODE_ENV || 'development', process.cwd())

module.exports = defineConfig({
  projectConfig: {
    databaseUrl: process.env.DATABASE_URL,
    databaseDriverOptions: process.env.DATABASE_SSL === "true" ? {
      ssl: { rejectUnauthorized: false },
      connection: { ssl: { rejectUnauthorized: false } }
    } : {},
    sessionOptions: {
      name: "medusa.sid",
      secret: process.env.COOKIE_SECRET || "supersecret",
      resave: false,
      saveUninitialized: false,
    },
    cookieOptions: {
      secure: false,
      sameSite: "lax",
      maxAge: 24 * 60 * 60 * 1000,
    },
    http: {
      storeCors: process.env.STORE_CORS! + (process.env.COOLIFY_URL ? `,${process.env.COOLIFY_URL},http://firsatbox.com,https://firsatbox.com` : ""),
      adminCors: process.env.ADMIN_CORS! + (process.env.COOLIFY_URL ? `,${process.env.COOLIFY_URL},http://firsatbox.com,https://firsatbox.com` : ""),
      authCors: process.env.AUTH_CORS! + (process.env.COOLIFY_URL ? `,${process.env.COOLIFY_URL},http://firsatbox.com,https://firsatbox.com` : ""),
      jwtSecret: process.env.JWT_SECRET || "supersecret",
      cookieSecret: process.env.COOKIE_SECRET || "supersecret",
    }
  },
  admin: {
    path: "/admin",
    backendUrl: "http://firsatbox.com",
  },
  modules: {
    [Modules.FILE]: {
      resolve: "@medusajs/file",
      options: {
        providers: [
          {
            resolve: "@medusajs/file-local",
            id: "local",
            options: {
              upload_dir: "static",
              backend_url: process.env.MEDUSA_BACKEND_URL || (process.env.COOLIFY_URL ? "http://firsatbox.com/static" : "http://localhost:9001/static"),
            },
          },
        ],
      },
    },
  }
})
