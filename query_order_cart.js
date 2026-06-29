const { Modules } = require("@medusajs/framework/utils");
const { MedusaApp } = require("@medusajs/modules-sdk");

async function run() {
  const app = await MedusaApp({
    modulesConfig: {
      [Modules.ORDER]: { resolve: "@medusajs/order" }
    },
    sharedResourcesConfig: {
      database: {
        clientUrl: process.env.DATABASE_URL || "postgres://postgres:postgres@localhost:5432/medusa",
      },
    },
  });

  const query = app.query;
  const { data: orders } = await query.graph({
    entity: "order",
    fields: [
      "id",
      "display_id",
      "cart.*"
    ],
    filters: { display_id: [12, 13] }
  });

  console.log(JSON.stringify(orders, null, 2));
  process.exit(0);
}

run().catch(console.error);
