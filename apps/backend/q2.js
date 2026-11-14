const { initialize } = require("@medusajs/medusa");

async function run() {
  const { initialize: initModules } = require("@medusajs/modules-sdk");
  const { Modules } = require("@medusajs/framework/utils");

  const productModule = await initModules({
    modules: {
      [Modules.PRODUCT]: {
        resolve: "@medusajs/product",
        options: {
          database: {
            clientUrl: "postgres://postgres@localhost:5432/medusa_v2_ikinci",
          },
        },
      },
    },
  });

  const pModule = productModule[Modules.PRODUCT];
  const products = await pModule.listProducts(
    { handle: "gold-dugmeli-denim-elbise" },
    { relations: ["options", "variants", "variants.options"] }
  );

  const p = products[0];
  console.log('Options:', JSON.stringify(p.options, null, 2));
  console.log('Variants:', JSON.stringify(p.variants.map(v => ({ id: v.id, title: v.title, options: v.options })), null, 2));
}

run().catch(console.error);
