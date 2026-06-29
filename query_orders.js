const { Modules } = require("@medusajs/framework/utils");
const { MedusaApp } = require("@medusajs/modules-sdk");

async function run() {
  const app = await MedusaApp({
    modulesConfig: {
      [Modules.ORDER]: { resolve: "@medusajs/order" },
      [Modules.PAYMENT]: { resolve: "@medusajs/payment" }
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
      "total",
      "metadata",
      "payment_collections.*",
      "payment_collections.payments.*"
    ],
    filters: { display_id: [12, 13] }
  });

  console.log(JSON.stringify(orders, null, 2));
  process.exit(0);
}

run().catch(console.error);
