import { ModuleProvider, Modules } from "@medusajs/framework/utils"
import { CashOnDeliveryProvider, CardOnDeliveryProvider, BankTransferProvider, PaytrProvider } from "./service"

export default ModuleProvider(Modules.PAYMENT, {
  services: [CashOnDeliveryProvider, CardOnDeliveryProvider, BankTransferProvider, PaytrProvider],
})
