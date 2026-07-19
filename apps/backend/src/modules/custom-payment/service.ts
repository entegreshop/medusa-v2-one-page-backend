import { AbstractPaymentProvider, PaymentProviderError, PaymentProviderSessionResponse } from "@medusajs/framework/utils"

export class CashOnDeliveryProvider extends AbstractPaymentProvider<any> {
  static identifier = "CASH-ON-DELIVERY"

  async capturePayment(paymentData: Record<string, unknown>): Promise<PaymentProviderError | PaymentProviderSessionResponse["data"]> {
    return {}
  }

  async authorizePayment(paymentSessionData: Record<string, unknown>, context: Record<string, unknown>): Promise<PaymentProviderError | { status: string, data: PaymentProviderSessionResponse["data"] }> {
    return { status: "authorized", data: {} }
  }

  async cancelPayment(paymentData: Record<string, unknown>): Promise<PaymentProviderError | PaymentProviderSessionResponse["data"]> {
    return {}
  }

  async initiatePayment(context: any): Promise<PaymentProviderError | PaymentProviderSessionResponse> {
    return { session_data: {} }
  }

  async deletePayment(paymentSessionData: Record<string, unknown>): Promise<PaymentProviderError | PaymentProviderSessionResponse["data"]> {
    return {}
  }

  async getPaymentStatus(paymentSessionData: Record<string, unknown>): Promise<any> {
    return "authorized"
  }

  async refundPayment(paymentData: Record<string, unknown>, refundAmount: number): Promise<PaymentProviderError | PaymentProviderSessionResponse["data"]> {
    return {}
  }

  async retrievePayment(paymentSessionData: Record<string, unknown>): Promise<PaymentProviderError | PaymentProviderSessionResponse["data"]> {
    return {}
  }

  async updatePayment(context: any): Promise<PaymentProviderError | PaymentProviderSessionResponse> {
    return { session_data: {} }
  }
}

export class CardOnDeliveryProvider extends AbstractPaymentProvider<any> {
  static identifier = "CARD-ON-DELIVERY"

  async capturePayment(paymentData: Record<string, unknown>): Promise<PaymentProviderError | PaymentProviderSessionResponse["data"]> { return {} }
  async authorizePayment(paymentSessionData: Record<string, unknown>, context: Record<string, unknown>): Promise<PaymentProviderError | { status: string, data: PaymentProviderSessionResponse["data"] }> { return { status: "authorized", data: {} } }
  async cancelPayment(paymentData: Record<string, unknown>): Promise<PaymentProviderError | PaymentProviderSessionResponse["data"]> { return {} }
  async initiatePayment(context: any): Promise<PaymentProviderError | PaymentProviderSessionResponse> { return { session_data: {} } }
  async deletePayment(paymentSessionData: Record<string, unknown>): Promise<PaymentProviderError | PaymentProviderSessionResponse["data"]> { return {} }
  async getPaymentStatus(paymentSessionData: Record<string, unknown>): Promise<any> { return "authorized" }
  async refundPayment(paymentData: Record<string, unknown>, refundAmount: number): Promise<PaymentProviderError | PaymentProviderSessionResponse["data"]> { return {} }
  async retrievePayment(paymentSessionData: Record<string, unknown>): Promise<PaymentProviderError | PaymentProviderSessionResponse["data"]> { return {} }
  async updatePayment(context: any): Promise<PaymentProviderError | PaymentProviderSessionResponse> { return { session_data: {} } }
}

export class BankTransferProvider extends AbstractPaymentProvider<any> {
  static identifier = "BANK-TRANSFER"

  async capturePayment(paymentData: Record<string, unknown>): Promise<PaymentProviderError | PaymentProviderSessionResponse["data"]> { return {} }
  async authorizePayment(paymentSessionData: Record<string, unknown>, context: Record<string, unknown>): Promise<PaymentProviderError | { status: string, data: PaymentProviderSessionResponse["data"] }> { return { status: "pending", data: {} } }
  async cancelPayment(paymentData: Record<string, unknown>): Promise<PaymentProviderError | PaymentProviderSessionResponse["data"]> { return {} }
  async initiatePayment(context: any): Promise<PaymentProviderError | PaymentProviderSessionResponse> { return { session_data: {} } }
  async deletePayment(paymentSessionData: Record<string, unknown>): Promise<PaymentProviderError | PaymentProviderSessionResponse["data"]> { return {} }
  async getPaymentStatus(paymentSessionData: Record<string, unknown>): Promise<any> { return "pending" }
  async refundPayment(paymentData: Record<string, unknown>, refundAmount: number): Promise<PaymentProviderError | PaymentProviderSessionResponse["data"]> { return {} }
  async retrievePayment(paymentSessionData: Record<string, unknown>): Promise<PaymentProviderError | PaymentProviderSessionResponse["data"]> { return {} }
  async updatePayment(context: any): Promise<PaymentProviderError | PaymentProviderSessionResponse> { return { session_data: {} } }
}

export class PaytrProvider extends AbstractPaymentProvider<any> {
  static identifier = "PAYTR"

  async capturePayment(paymentData: Record<string, unknown>): Promise<PaymentProviderError | PaymentProviderSessionResponse["data"]> { return {} }
  async authorizePayment(paymentSessionData: Record<string, unknown>, context: Record<string, unknown>): Promise<PaymentProviderError | { status: string, data: PaymentProviderSessionResponse["data"] }> { return { status: "authorized", data: {} } }
  async cancelPayment(paymentData: Record<string, unknown>): Promise<PaymentProviderError | PaymentProviderSessionResponse["data"]> { return {} }
  async initiatePayment(context: any): Promise<PaymentProviderError | PaymentProviderSessionResponse> { return { session_data: {} } }
  async deletePayment(paymentSessionData: Record<string, unknown>): Promise<PaymentProviderError | PaymentProviderSessionResponse["data"]> { return {} }
  async getPaymentStatus(paymentSessionData: Record<string, unknown>): Promise<any> { return "authorized" }
  async refundPayment(paymentData: Record<string, unknown>, refundAmount: number): Promise<PaymentProviderError | PaymentProviderSessionResponse["data"]> { return {} }
  async retrievePayment(paymentSessionData: Record<string, unknown>): Promise<PaymentProviderError | PaymentProviderSessionResponse["data"]> { return {} }
  async updatePayment(context: any): Promise<PaymentProviderError | PaymentProviderSessionResponse> { return { session_data: {} } }
}
