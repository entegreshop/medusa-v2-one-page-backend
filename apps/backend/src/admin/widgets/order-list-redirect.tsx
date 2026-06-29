import { useState, useEffect, useMemo } from "react"
import { defineWidgetConfig } from "@medusajs/admin-sdk"
import { ShoppingBag, Adjustments, CheckCircle, XMark, Plus, Trash, ArrowPath, Pencil } from "@medusajs/icons"
import { PosModal } from "../routes/orders/components/pos-modal"

// Custom inline SVG icons for print options and statuses
const EInvoiceIcon = () => (
  <svg className="w-4 h-4 text-zinc-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2">
    <rect x="3" y="4" width="18" height="16" rx="2" />
    <path d="M7 8h10M7 12h10M7 16h5" />
    <circle cx="17" cy="15" r="1.5" className="fill-zinc-500" />
  </svg>
)

const InvoiceIcon = () => (
  <svg className="w-4 h-4 text-zinc-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2">
    <path strokeLinecap="round" strokeLinejoin="round" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
  </svg>
)

const PackageIcon = () => (
  <svg className="w-4 h-4 text-zinc-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2">
    <path strokeLinecap="round" strokeLinejoin="round" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4" />
  </svg>
)

const TruckIcon = () => (
  <svg className="w-4 h-4 text-zinc-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2">
    <path strokeLinecap="round" strokeLinejoin="round" d="M13 16V6a1 1 0 00-1-1H4a1 1 0 00-1 1v10a1 1 0 001 1h1m8-1a1 1 0 011 1v2.5a.5.5 0 01-.5.5H11m-6 0a1 1 0 100-2 1 1 0 000 2zm11 0a1 1 0 100-2 1 1 0 000 2zM13 16h4.5a1.5 1.5 0 001.5-1.5V9.5L16.5 6H13m4 6.5h2" />
  </svg>
)

const BarcodeIcon = () => (
  <svg className="w-4 h-4 text-zinc-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2">
    <path strokeLinecap="round" strokeLinejoin="round" d="M3 5h2M7 5h1M10 5h3M15 5h1M18 5h3M3 10h2M7 10h1M10 10h3M15 10h1M18 10h3M3 15h2M7 15h1M10 15h3M15 15h1M18 15h3M3 19h2M7 19h1M10 19h3M15 19h1M18 19h3" />
  </svg>
)

const PdfIcon = () => (
  <svg className="w-4 h-4 text-zinc-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2">
    <path strokeLinecap="round" strokeLinejoin="round" d="M7 21h10a2 2 0 002-2V9.414a1 1 0 00-.293-.707l-5.414-5.414A1 1 0 0012.586 3H7a2 2 0 00-2 2v14a2 2 0 002 2z" />
    <text x="7" y="15" fill="currentColor" fontSize="6" fontFamily="Arial" fontWeight="bold" className="text-zinc-600">PDF</text>
  </svg>
)

const EyeIcon = () => (
  <svg className="w-4 h-4 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2">
    <path strokeLinecap="round" strokeLinejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
    <path strokeLinecap="round" strokeLinejoin="round" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
  </svg>
)

const EyeOutlineIcon = () => (
  <svg className="w-4 h-4 text-zinc-900" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2">
    <path strokeLinecap="round" strokeLinejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
    <path strokeLinecap="round" strokeLinejoin="round" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
  </svg>
)

const BarcodeSimpleIcon = () => (
  <svg className="w-4 h-4 text-zinc-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2">
    <path strokeLinecap="round" strokeLinejoin="round" d="M3 4h2v16H3V4zm4 0h1v16H7V4zm3 0h2v16h-2V4zm4 0h1v16h-1V4zm3 0h4v16h-4V4z" />
  </svg>
)

const GiftIcon = () => (
  <svg className="w-4 h-4 text-zinc-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2">
    <path strokeLinecap="round" strokeLinejoin="round" d="M12 8v13m0-13V6a2 2 0 112 2h-2zm0 0V5.5A2.5 2.5 0 109.5 8H12zm-7 4h14M5 12v7a2 2 0 002 2h10a2 2 0 002-2v-7" />
  </svg>
)

const StarIcon = () => (
  <svg className="w-4 h-4 text-zinc-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2">
    <path strokeLinecap="round" strokeLinejoin="round" d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.38-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z" />
  </svg>
)

const getDomainName = () => {
  if (typeof window === "undefined") return "cizgibutik.com"
  const host = window.location.hostname
  if (host === "localhost" || host === "127.0.0.1") {
    return "cizgibutik.com"
  }
  return host.replace("www.", "")
}

const getDomainPrefix = () => {
  const domain = getDomainName()
  const part = domain.split('.')[0]
  return part.toUpperCase()
}

const getDomainBrand = () => {
  const domain = getDomainName()
  const part = domain.split('.')[0]
  return part.charAt(0).toUpperCase() + part.slice(1)
}

const CizgiLogo = () => {
  const prefix = getDomainPrefix()
  return (
    <svg width="60" height="20" viewBox="0 0 120 40" fill="none" xmlns="http://www.w3.org/2000/svg">
      <text x="60" y="25" fontFamily="Arial, sans-serif" fontSize="18" fontWeight="900" fill="#18181b" textAnchor="middle" letterSpacing="1">{prefix}</text>
    </svg>
  )
}

// Main structure interface
interface OrderItem {
  id: string
  title: string
  sku: string
  barcode: string
  size: string
  unit_price: number
  quantity: number
  vat_rate: number // percent, e.g. 10
  thumbnail: string
}

interface OrderLog {
  id: string
  message: string
  created_at: string
}

interface CustomOrder {
  id: string
  display_id: string
  platform: string
  store: string
  order_tag: string
  customer: {
    first_name: string
    last_name: string
    phone: string
    email: string
    ip: string
    member_no: string
    is_visitor: boolean
  }
  shipping_address: {
    first_name: string
    last_name: string
    address_1: string
    address_2: string
    city: string // province
    district: string // ilce
    country_code: string
    country_name: string
    phone: string
  }
  billing_address: {
    first_name: string
    last_name: string
    address_1: string
    address_2: string
    city: string
    district: string
    country_code: string
    country_name: string
    phone: string
    tax_no?: string
    tax_office?: string
    tc_no?: string
  }
  items: OrderItem[]
  subtotal: number // TL
  vat_total: number // TL
  total: number // TL
  payment_method: string // human readable e.g. "Kap─▒da Nakit ├ûdeme"
  payment_option: "paytr" | "bank_transfer" | "cash_on_delivery" | "card_on_delivery"
  status: "onay_bekleyen" | "hazirlanan" | "kargolanan" | "teslim_edilen" | "iade_edilen" | "iptal_edilen" | "odeme_hatasi" | "tum_siparisler"
  carrier_name: string // e.g. "KARGO─░ST", "INTERLINE KARGO"
  carrier_barcode?: string
  created_at: string // format DD.MM.YYYY HH:MM
  admin_notes?: string
  logs: OrderLog[]
  integration_logs: OrderLog[]
  invoice_series?: string
  invoice_date?: string
  e_invoice_date?: string
  metadata?: Record<string, any>
}

// ==========================================
// R─░SKL─░ M├£┼ŞTER─░ KONTROL FONKS─░YONU
// ==========================================
const checkIsCustomerRisky = (phone?: string, email?: string, orderId?: string) => {
  if (!phone && !email) return false;
  
  // Clean phone number (remove spaces, +90, etc)
  const cleanPhone = phone ? phone.replace(/[^0-9]/g, '').slice(-10) : "";
  const cleanEmail = email ? email.toLowerCase().trim() : "";

  // Iterate over all orders directly from mappedRealOrders (assuming it's in scope, 
  // but wait, we need to pass currentOrders to it, or defined it inside the component)
  return false; // We will define the real logic inside the component
}
// ==========================================

const SiparisYonetimiPage = () => {
  const [isPosOpen, setIsPosOpen] = useState(false)
  
  // Success Modal State
  const [successModal, setSuccessModal] = useState<string | null>(null)
  const showSuccess = (message: string) => {
    setSuccessModal(message)
  }

  // Real orders list from API
  const [realOrders, setRealOrders] = useState<any[]>([])
  const [loading, setLoading] = useState(true)


  // Selected Order for Details Modal
  const [selectedOrderId, setSelectedOrderId] = useState<string | null>(null)

  // Bulk operation selections
  const [selectedOrderIds, setSelectedOrderIds] = useState<string[]>([])

  // Search & Filter Panel state
  const [showFilters, setShowFilters] = useState(false)
  const [quickSearch, setQuickSearch] = useState("")

  // Tab selections
  // tabs: "onay_bekleyen" | "hazirlanan" | "kargolanan" | "teslim_edilen" | "iade_edilen" | "iptal_edilen" | "tum_siparisler" | "odeme_hatasi"
  const [activeTab, setActiveTab] = useState<string>("tum_siparisler")

  // Form Filter States
  const [filterStatus, setFilterStatus] = useState("Yeni Sipari┼ş, Haz─▒rlanan Sipari┼ş, Kargolanan Sipari┼ş, Teslim Edilen Sipari┼ş")
  const [filterPlatform, setFilterPlatform] = useState("")
  const [filterStore, setFilterStore] = useState("")
  const [filterTag, setFilterTag] = useState("")
  const [filterOrderNo, setFilterOrderNo] = useState("")
  const [filterOrderDateStart, setFilterOrderDateStart] = useState("")
  const [filterOrderDateEnd, setFilterOrderDateEnd] = useState("")
  const [filterInvoiceDateStart, setFilterInvoiceDateStart] = useState("")
  const [filterInvoiceDateEnd, setFilterInvoiceDateEnd] = useState("")
  const [filterEInvoiceDateStart, setFilterEInvoiceDateStart] = useState("")
  const [filterEInvoiceDateEnd, setFilterEInvoiceDateEnd] = useState("")
  const [filterTotalMin, setFilterTotalMin] = useState("")
  const [filterTotalMax, setFilterTotalMax] = useState("")
  const [filterPaymentMethod, setFilterPaymentMethod] = useState("")
  const [filterCustomerFirstName, setFilterCustomerFirstName] = useState("")
  const [filterCustomerLastName, setFilterCustomerLastName] = useState("")
  const [filterPhone, setFilterPhone] = useState("")
  const [filterTaxNo, setFilterTaxNo] = useState("")
  const [filterTaxOffice, setFilterTaxOffice] = useState("")
  const [filterTcNo, setFilterTcNo] = useState("")
  const [filterMemberNo, setFilterMemberNo] = useState("")
  const [filterCountry, setFilterCountry] = useState("")
  const [filterProvince, setFilterProvince] = useState("")
  const [filterProductNo, setFilterProductNo] = useState("")
  const [filterProductBarcode, setFilterProductBarcode] = useState("")
  const [filterProductName, setFilterProductName] = useState("")
  const [filterProductTag, setFilterProductTag] = useState("")
  const [filterGiftCardCode, setFilterGiftCardCode] = useState("")
  const [filterPromo, setFilterPromo] = useState("")
  const [filterCarrier, setFilterCarrier] = useState("")
  const [filterAdvancedSearch, setFilterAdvancedSearch] = useState("")

  // Selected editable Manager Notes inside Modal
  const [editingNotes, setEditingNotes] = useState(false)
  const [tempNotesText, setTempNotesText] = useState("")

  // Selected editable Fatura Seri inside Modal
  const [editingInvoiceSeries, setEditingInvoiceSeries] = useState(false)
  const [tempInvoiceSeriesText, setTempInvoiceSeriesText] = useState("")

  // Editable info blocks
  const [editingCustomer, setEditingCustomer] = useState(false)
  const [tempCustomer, setTempCustomer] = useState({ first_name: "", last_name: "", email: "", phone: "" })
  const [editingShipping, setEditingShipping] = useState(false)
  const [tempShipping, setTempShipping] = useState({ first_name: "", last_name: "", address_1: "", district: "", city: "" })
  const [editingBilling, setEditingBilling] = useState(false)
  const [tempBilling, setTempBilling] = useState({ first_name: "", last_name: "", address_1: "", district: "", city: "", tc_no: "" })

  const [editingProducts, setEditingProducts] = useState(false)
  const [tempProducts, setTempProducts] = useState<{id: string, unit_price: number, quantity: number}[]>([])

  // Product Search Modal State
  const [showProductSearchModal, setShowProductSearchModal] = useState(false)
  const [productSearchQuery, setProductSearchQuery] = useState("")
  const [productSearchResults, setProductSearchResults] = useState<any[]>([
    {
      id: "prod_dummy_1",
      title: "Pembe Alo Arabiyeli Taytl─▒ Tak─▒m",
      thumbnail: "https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-front.png",
      variants: [
        { id: "var_1", title: "S", sku: "LXS5SU5V0G", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
        { id: "var_2", title: "M", sku: "LXS5SU5V0G", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
        { id: "var_3", title: "L", sku: "LXS5SU5V0G", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
        { id: "var_4", title: "XL", sku: "LXS5SU5V0G", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
      ]
    },
    {
      id: "prod_dummy_2",
      title: "Kahve Alo Arabiyeli Taytl─▒ Tak─▒m",
      thumbnail: "https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-front.png",
      variants: [
        { id: "var_5", title: "S", sku: "Y0O8X6OVU8", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
        { id: "var_6", title: "M", sku: "Y0O8X6OVU8", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
        { id: "var_7", title: "L", sku: "Y0O8X6OVU8", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
        { id: "var_8", title: "XL", sku: "Y0O8X6OVU8", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
      ]
    }
  ])
  const [searchingProducts, setSearchingProducts] = useState(false)

  useEffect(() => {
    if (showProductSearchModal && productSearchQuery.trim()) {
      const delayFn = setTimeout(() => {
        handleSearchProducts()
      }, 400)
      return () => clearTimeout(delayFn)
    } else if (showProductSearchModal && !productSearchQuery.trim()) {
      // Revert to default when empty
      setProductSearchResults([
        {
          id: "prod_dummy_1",
          title: "Pembe Alo Arabiyeli Taytl─▒ Tak─▒m",
          thumbnail: "https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-front.png",
          variants: [
            { id: "var_1", title: "S", sku: "LXS5SU5V0G", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
            { id: "var_2", title: "M", sku: "LXS5SU5V0G", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
            { id: "var_3", title: "L", sku: "LXS5SU5V0G", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
            { id: "var_4", title: "XL", sku: "LXS5SU5V0G", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
          ]
        },
        {
          id: "prod_dummy_2",
          title: "Kahve Alo Arabiyeli Taytl─▒ Tak─▒m",
          thumbnail: "https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-front.png",
          variants: [
            { id: "var_5", title: "S", sku: "Y0O8X6OVU8", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
            { id: "var_6", title: "M", sku: "Y0O8X6OVU8", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
            { id: "var_7", title: "L", sku: "Y0O8X6OVU8", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
            { id: "var_8", title: "XL", sku: "Y0O8X6OVU8", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
          ]
        }
      ])
    }
  }, [productSearchQuery, showProductSearchModal])

  // Action menu inside Modal
  const [isActionMenuOpen, setIsActionMenuOpen] = useState(false)
  const [isBulkActionMenuOpen, setIsBulkActionMenuOpen] = useState(false)

  // Status Change Modal State
  const [showStatusModal, setShowStatusModal] = useState(false)
  const [statusModalTargetIds, setStatusModalTargetIds] = useState<string[]>([])
  const [newStatusValue, setNewStatusValue] = useState("yeni_siparis")
  const [notifyCustomer, setNotifyCustomer] = useState(true)

  // Print Modal State
  const [showPrintModal, setShowPrintModal] = useState(false)
  const [printModalTargetIds, setPrintModalTargetIds] = useState<string[]>([])
  const [printTemplate, setPrintTemplate] = useState("E-Fatura")

  // Fetch real orders from Medusa V2 on mount
  useEffect(() => {
    const fetchOrders = async () => {
      try {
        const res = await fetch("/admin/orders?limit=100&fields=id,status,created_at,email,display_id,payment_status,fulfillment_status,total,currency_code,*customer,*sales_channel,*payment_collections,*items,*shipping_address,*billing_address,metadata")
        if (res.ok) {
          const data = await res.json()
          if (data && data.orders) {
            const parsedOrders = data.orders.map((o: any) => {
               if (o.metadata?.edited_customer) o.customer = { ...o.customer, ...o.metadata.edited_customer };
               if (o.metadata?.edited_shipping) o.shipping_address = { ...o.shipping_address, ...o.metadata.edited_shipping };
               if (o.metadata?.edited_billing) o.billing_address = { ...o.billing_address, ...o.metadata.edited_billing };
               if (o.metadata?.edited_items) o.items = o.metadata.edited_items;
               if (o.metadata?.edited_total != null && !isNaN(o.metadata?.edited_total)) o.total = o.metadata.edited_total;
               if (o.metadata?.edited_email) o.email = o.metadata.edited_email;
               return o;
            });
            setRealOrders(parsedOrders)
          }
        } else {
          console.error("Failed to load orders, status:", res.status)
        }
      } catch (err) {
        console.error("Failed to load orders from API:", err)
      } finally {
        setLoading(false)
      }
    }
    fetchOrders()
  }, [])

  // Map Medusa V2 Real orders to our CustomOrder structure
  const mappedRealOrders = useMemo(() => {
    return realOrders.map((o: any) => {
      const itemsMapped: OrderItem[] = (o.items || []).map((item: any) => ({
        id: item.id,
        title: item.title,
        sku: item.variant?.sku || "",
        barcode: item.variant?.barcode || "",
        size: item.variant_title || item.variant?.title || "Standart",
        unit_price: (item.unit_price || 0) / 100,
        quantity: item.quantity || 1,
        vat_rate: 10, // Medusa standard default
        thumbnail: item.thumbnail || ""
      }))

      const subtotalVal = itemsMapped.reduce((acc, item) => acc + (item.unit_price * item.quantity), 0)
      const totalVal = (o.total || 0) / 100

      // Try to determine payment method name
      let payMethod = "Kredi Kart─▒"
      const metaOption = o.metadata?.payment_option
      if (metaOption === "cash_on_delivery") payMethod = "Kap─▒da Nakit ├ûdeme"
      else if (metaOption === "card_on_delivery") payMethod = "Kap─▒da Kredi Kart─▒ ile ├ûdeme"
      else if (metaOption === "bank_transfer") payMethod = "Havale / EFT"
      else if (metaOption === "paytr") payMethod = "PayTR"

      // Map shipping option/carrier
      const carrierName = o.shipping_methods?.[0]?.name || "Di─şer Kargo"

      // Logs
      const logsMapped: OrderLog[] = []
      if (o.metadata?.logs) {
        logsMapped.push(...o.metadata.logs)
      } else {
        logsMapped.push({ id: "real_l1", message: "Sipari┼ş olu┼şturuldu", created_at: new Date(o.created_at).toLocaleString('tr-TR') })
        if (o.fulfillment_status === "fulfilled" || o.fulfillment_status === "shipped") {
          logsMapped.push({ id: "real_l2", message: "Sipari┼ş paketlendi ve kargoland─▒", created_at: new Date(o.updated_at).toLocaleString('tr-TR') })
        }
      }

      // Order status mapping
      let orderStatus: CustomOrder["status"] = "tum_siparisler" as any
      if (o.metadata?.delivery_status) {
        orderStatus = o.metadata.delivery_status as CustomOrder["status"]
      } else if (o.status === "canceled") orderStatus = "iptal_edilen"
      else if (o.fulfillment_status === "shipped") orderStatus = "kargolanan"
      else if (o.status === "completed") orderStatus = "teslim_edilen"
      else if (o.fulfillment_status === "fulfilled") orderStatus = "hazirlanan"
      else orderStatus = "onay_bekleyen"

      return {
        id: o.id,
        display_id: o.display_id?.toString() || o.id.slice(-8),
        platform: o.metadata?.platform || getDomainBrand(),
        store: getDomainBrand(),
        order_tag: o.metadata?.order_tag || "Se├ğilmedi",
        customer: {
          first_name: o.customer?.first_name || o.shipping_address?.first_name || "M├╝┼şteri",
          last_name: o.customer?.last_name || o.shipping_address?.last_name || "",
          phone: o.customer?.phone || o.shipping_address?.phone || "",
          email: o.customer?.email || o.email || "",
          ip: o.metadata?.ip_address || "127.0.0.1",
          member_no: o.customer?.id ? `U-${o.customer.id.slice(-4).toUpperCase()}` : "Misafir",
          is_visitor: !o.customer?.id
        },
        shipping_address: {
          first_name: o.shipping_address?.first_name || "",
          last_name: o.shipping_address?.last_name || "",
          address_1: o.shipping_address?.address_1 || "",
          address_2: o.shipping_address?.address_2 || "",
          city: o.shipping_address?.province || o.shipping_address?.city || "",
          district: o.shipping_address?.city || "",
          country_code: o.shipping_address?.country_code || "tr",
          country_name: "T├╝rkiye",
          phone: o.shipping_address?.phone || ""
        },
        billing_address: {
          first_name: o.billing_address?.first_name || o.shipping_address?.first_name || "",
          last_name: o.billing_address?.last_name || o.shipping_address?.last_name || "",
          address_1: o.billing_address?.address_1 || o.shipping_address?.address_1 || "",
          address_2: o.billing_address?.address_2 || o.shipping_address?.address_2 || "",
          city: o.billing_address?.province || o.billing_address?.city || "",
          district: o.billing_address?.city || "",
          country_code: o.billing_address?.country_code || "tr",
          country_name: "T├╝rkiye",
          phone: o.billing_address?.phone || "",
          tc_no: o.metadata?.tc_no || "",
          tax_no: o.metadata?.tax_no || "",
          tax_office: o.metadata?.tax_office || ""
        },
        items: itemsMapped,
        subtotal: subtotalVal,
        vat_total: totalVal - subtotalVal > 0 ? totalVal - subtotalVal : totalVal * 0.1,
        total: totalVal,
        payment_method: payMethod,
        payment_option: metaOption || "cash_on_delivery",
        status: orderStatus,
        carrier_name: carrierName,
        carrier_barcode: o.metadata?.carrier_barcode || "",
        created_at: new Date(o.created_at).toLocaleString('tr-TR', { day: '2-digit', month: '2-digit', year: 'numeric', hour: '2-digit', minute: '2-digit' }),
        admin_notes: o.metadata?.admin_notes || "",
        logs: logsMapped,
        integration_logs: o.metadata?.integration_logs || [],
        invoice_series: o.metadata?.invoice_series || "-",
        invoice_date: o.metadata?.invoice_date || "",
        e_invoice_date: o.metadata?.e_invoice_date || ""
      } as CustomOrder
    })
  }, [realOrders])

  // Current orders list is now always real orders
  const currentOrders = mappedRealOrders

  // Tab Filtering logic
  const tabFilteredOrders = useMemo(() => {
    if (activeTab === "tum_siparisler") return currentOrders

    return currentOrders.filter(o => {
      if (activeTab === "onay_bekleyen") return o.status === "onay_bekleyen"
      if (activeTab === "hazirlanan") return o.status === "hazirlanan"
      if (activeTab === "kargolanan") return o.status === "kargolanan"
      if (activeTab === "teslim_edilen") return o.status === "teslim_edilen"
      if (activeTab === "iade_edilen") return o.status === "iade_edilen"
      if (activeTab === "iptal_edilen") return o.status === "iptal_edilen"
      if (activeTab === "odeme_hatasi") return o.status === "odeme_hatasi"
      return true
    })
  }, [currentOrders, activeTab])

  // Count of "Haz─▒rlananlar" for the emerald tab badge
  const preparingCount = useMemo(() => {
    return currentOrders.filter(o => o.status === "hazirlanan").length
  }, [currentOrders])

  // Full Filters & Quick Search application
  const filteredOrdersList = useMemo(() => {
    return tabFilteredOrders.filter(o => {
      // 1. Quick search
      if (quickSearch) {
        const query = quickSearch.toLowerCase()
        const matchNo = o.display_id.toLowerCase().includes(query)
        const matchCust = `${o.customer.first_name} ${o.customer.last_name}`.toLowerCase().includes(query)
        const matchPhone = o.customer.phone.toLowerCase().includes(query)
        if (!matchNo && !matchCust && !matchPhone) return false
      }

      // 2. Platform filter
      if (filterPlatform && o.platform.toLowerCase() !== filterPlatform.toLowerCase()) return false

      // 3. Sipari┼ş No filter
      if (filterOrderNo && !o.display_id.includes(filterOrderNo)) return false

      // 4. M├╝┼şteri Ad─▒
      if (filterCustomerFirstName && !o.customer.first_name.toLowerCase().includes(filterCustomerFirstName.toLowerCase())) return false

      // 5. M├╝┼şteri Soyad─▒
      if (filterCustomerLastName && !o.customer.last_name.toLowerCase().includes(filterCustomerLastName.toLowerCase())) return false

      // 6. Telefon
      if (filterPhone && !o.customer.phone.replace(/\D/g, "").includes(filterPhone.replace(/\D/g, ""))) return false

      // 7. TC No
      if (filterTcNo && o.billing_address.tc_no !== filterTcNo) return false

      // 8. Kargo Firmas─▒
      if (filterCarrier && o.carrier_name.toLowerCase() !== filterCarrier.toLowerCase()) return false

      // 9. ├ûdeme Y├Ântemi
      if (filterPaymentMethod && o.payment_method.toLowerCase() !== filterPaymentMethod.toLowerCase()) return false

      // 10. Tutar Aral─▒─ş─▒
      if (filterTotalMin && o.total < parseFloat(filterTotalMin)) return false
      if (filterTotalMax && o.total > parseFloat(filterTotalMax)) return false

      // 11. ─░l
      if (filterProvince && !o.shipping_address.city.toLowerCase().includes(filterProvince.toLowerCase())) return false

      // 12. ├£r├╝n Ad─▒
      if (filterProductName) {
        const hasProduct = o.items.some(item => item.title.toLowerCase().includes(filterProductName.toLowerCase()))
        if (!hasProduct) return false
      }

      return true
    })
  }, [tabFilteredOrders, quickSearch, filterPlatform, filterOrderNo, filterCustomerFirstName, filterCustomerLastName, filterPhone, filterTcNo, filterCarrier, filterPaymentMethod, filterTotalMin, filterTotalMax, filterProvince, filterProductName])

  // Select all handler
  const handleSelectAll = (checked: boolean) => {
    if (checked) {
      setSelectedOrderIds(filteredOrdersList.map(o => o.id))
    } else {
      setSelectedOrderIds([])
    }
  }

  // Row selection handler
  const handleSelectRow = (id: string, checked: boolean) => {
    if (checked) {
      setSelectedOrderIds([...selectedOrderIds, id])
    } else {
      setSelectedOrderIds(selectedOrderIds.filter(x => x !== id))
    }
  }

  // Excel Export handler
  const exportToExcel = () => {
    const ordersToExport = selectedOrderIds.length > 0 
      ? currentOrders.filter(o => selectedOrderIds.includes(o.id))
      : filteredOrdersList;

    if (ordersToExport.length === 0) {
      alert("D─▒┼şa aktar─▒lacak sipari┼ş bulunamad─▒.");
      return;
    }

    const headers = [
      "Sipari┼ş No",
      "Tarih",
      "M├╝┼şteri Ad─▒",
      "M├╝┼şteri Soyad─▒",
      "Telefon",
      "E-posta",
      "├£ye No / Durum",
      "Tutar",
      "├ûdeme Y├Ântemi",
      "Sipari┼ş Durumu",
      "Kargo Firmas─▒",
      "Kargo Barkodu",
      "Adres Bilgisi",
      "─░l",
      "─░l├ğe",
      "Platform",
      "Sipari┼ş Etiketi"
    ];

    const rows = ordersToExport.map(o => {
      const cleanAddress = `${o.shipping_address?.address_1 || ""} ${o.shipping_address?.address_2 || ""}`.trim().replace(/[\r\n;]/g, " ");
      const cleanProvince = `${o.shipping_address?.city || ""}`.trim().replace(/[\r\n;]/g, " ");
      const cleanCity = `${o.shipping_address?.district || ""}`.trim().replace(/[\r\n;]/g, " ");
      
      let statusText: string = o.status;
      if (statusText === "onay_bekleyen") statusText = "Onay Bekliyor";
      else if (statusText === "hazirlanan") statusText = "Haz─▒rlan─▒yor";
      else if (statusText === "kargolanan") statusText = "Kargoland─▒";
      else if (statusText === "teslim_edilen") statusText = "Teslim Edildi";
      else if (statusText === "iptal_edilen") statusText = "─░ptal Edildi";
      else if (statusText === "iade_edilen") statusText = "─░ade Edildi";
      else if (statusText === "odeme_hatasi") statusText = "├ûdeme Hatas─▒";

      return [
        `"${getDomainPrefix()} ${o.display_id}"`,
        `"${o.created_at || ''}"`,
        `"${o.customer?.first_name || ''}"`,
        `"${o.customer?.last_name || ''}"`,
        `"${o.customer?.phone || ''}"`,
        `"${o.customer?.email || ''}"`,
        `"${o.customer?.member_no || 'Misafir'}"`,
        `"${o.total.toFixed(2)} TL"`,
        `"${o.payment_method || ''}"`,
        `"${statusText}"`,
        `"${o.carrier_name || 'Di─şer Kargo'}"`,
        `"${o.carrier_barcode || ''}"`,
        `"${cleanAddress}"`,
        `"${cleanProvince}"`,
        `"${cleanCity}"`,
        `"${o.platform || ''}"`,
        `"${o.order_tag || ''}"`
      ];
    });

    const csvContent = "\uFEFF" + [
      headers.join(";"),
      ...rows.map(r => r.join(";"))
    ].join("\n");

    const blob = new Blob([csvContent], { type: "text/csv;charset=utf-8;" });
    const url = URL.createObjectURL(blob);
    const link = document.createElement("a");
    link.setAttribute("href", url);
    link.setAttribute("download", `Siparisler_${new Date().toISOString().slice(0, 10)}.csv`);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    setIsBulkActionMenuOpen(false);
  };

  // Active Selected Order details object
  const activeOrderDetails = useMemo(() => {
    return currentOrders.find(o => o.id === selectedOrderId) || null
  }, [currentOrders, selectedOrderId])

  // Clear filters
  const handleClearFilters = () => {
    setFilterStatus("Yeni Sipari┼ş, Haz─▒rlanan Sipari┼ş, Kargolanan Sipari┼ş, Teslim Edilen Sipari┼ş")
    setFilterPlatform("")
    setFilterStore("")
    setFilterTag("")
    setFilterOrderNo("")
    setFilterOrderDateStart("")
    setFilterOrderDateEnd("")
    setFilterInvoiceDateStart("")
    setFilterInvoiceDateEnd("")
    setFilterEInvoiceDateStart("")
    setFilterEInvoiceDateEnd("")
    setFilterTotalMin("")
    setFilterTotalMax("")
    setFilterPaymentMethod("")
    setFilterCustomerFirstName("")
    setFilterCustomerLastName("")
    setFilterPhone("")
    setFilterTaxNo("")
    setFilterTaxOffice("")
    setFilterTcNo("")
    setFilterMemberNo("")
    setFilterCountry("")
    setFilterProvince("")
    setFilterProductNo("")
    setFilterProductBarcode("")
    setFilterProductName("")
    setFilterProductTag("")
    setFilterGiftCardCode("")
    setFilterPromo("")
    setFilterCarrier("")
    setFilterAdvancedSearch("")
  }

  // Quick Action: Teslim Et (Mark Delivered)
  const handleMarkDelivered = async (orderId: string) => {
    const timeStr = new Date().toLocaleString("tr-TR", { day: '2-digit', month: '2-digit', year: 'numeric', hour: '2-digit', minute: '2-digit' })
    
    // Real API status update via Medusa Order metadata update
      try {
        const target = currentOrders.find(x => x.id === orderId)
        if (!target) return
        
        const updatedLogs = [
          { id: `dl_${Date.now()}`, message: "admin teslim edildi olarak i┼şaretledi", created_at: timeStr },
          ...target.logs
        ]

        const res = await fetch(`/admin/orders/${orderId}`, {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            status: "completed",
            metadata: {
              ...target.billing_address, // keep old metadata
              delivery_status: "delivered",
              logs: updatedLogs
            }
          })
        })
        if (res.ok) {
          const data = await res.json()
          // Re-fetch orders list
          const refreshRes = await fetch("/admin/orders?limit=100")
          const refreshData = await refreshRes.json()
          if (refreshData && refreshData.orders) {
            setRealOrders(refreshData.orders)
            showSuccess("Sipari┼ş ba┼şar─▒yla teslim edildi olarak i┼şaretlendi.")
          }
        } else {
          alert("Sipari┼ş g├╝ncellenirken hata olu┼ştu.")
        }
      } catch (err) {
        console.error("Error updating order:", err)
        alert("Ba─şlant─▒ hatas─▒.")
      }
  }
  // Generic Status Change
  const handleStatusChange = async (orderId: string, newStatus: string, skipRefresh: boolean = false) => {
    try {
      // INTERLINE KARGO ENTEGRASYONU
      if (newStatus === "kargolanan") {
        try {
          const interlineRes = await fetch("/admin/interline-action", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ order_id: orderId })
          });
          const interlineData = await interlineRes.json();
          if (!interlineRes.ok || !interlineData.success) {
            alert(`İnterline Kargo Hatası (Sipariş ID: ${orderId}): ` + (interlineData.error || "Bilinmeyen API Hatası"));
            return; // Hata varsa durumu değiştirmeyi durdur.
          } else {
            showSuccess(`İnterline Kargo'ya başarıyla aktarıldı. Barkod: ${interlineData.barcode}`);
          }
        } catch (err: any) {
          alert("İnterline Kargo API çağrısı başarısız oldu: " + err.message);
          return; // Hata durumunda devam etme
        }
      }

      const res = await fetch(`/admin/orders/${orderId}`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          metadata: { delivery_status: newStatus }
        })
      })
      if (res.ok && !skipRefresh) {
        const refreshRes = await fetch("/admin/orders?limit=100&fields=*customer,*shipping_address,*billing_address,*items")
        const refreshData = await refreshRes.json()
        if (refreshData && refreshData.orders) setRealOrders(refreshData.orders)
      }
    } catch(err) {
      console.error(err)
    }
  }

  // Quick Action: ─░ptal Et (Cancel Order)
  const handleCancelOrder = async (orderId: string) => {
    if (!confirm("Bu sipari┼şi iptal etmek istedi─şinize emin misiniz?")) return
    const timeStr = new Date().toLocaleString("tr-TR", { day: '2-digit', month: '2-digit', year: 'numeric', hour: '2-digit', minute: '2-digit' })

    try {
        const res = await fetch(`/admin/orders/${orderId}/cancel`, {
          method: "POST",
          headers: { "Content-Type": "application/json" }
        })
        if (res.ok) {
          showSuccess("Sipari┼ş ba┼şar─▒yla g├╝ncellendi.")
          const refreshRes = await fetch("/admin/orders?limit=100&fields=*customer,*shipping_address,*billing_address,*items")
          const refreshData = await refreshRes.json()
          if (refreshData && refreshData.orders) {
            setRealOrders(refreshData.orders)
          }
        } else {
          alert("Sipari┼ş iptal edilirken hata olu┼ştu.")
        }
      } catch (err) {
        console.error(err)
      }
  }

  // Save Manager Notes inside Modal
  const handleSaveNotes = () => {
    // In real mode, would send metadata update to backend
    setRealOrders(prev => prev.map(o => {
      if (o.id === selectedOrderId) {
        return {
          ...o,
          metadata: { ...o.metadata, admin_notes: tempNotesText }
        }
      }
      return o
    }))
    setEditingNotes(false)
  }
  const handleSaveInvoiceSeries = () => {
    // In real mode, would send metadata update to backend
    setRealOrders(prev => prev.map(o => {
      if (o.id === selectedOrderId) {
        return {
          ...o,
          metadata: { ...o.metadata, invoice_series: tempInvoiceSeriesText }
        }
      }
      return o
    }))
    setEditingInvoiceSeries(false)
  }

  const handleSaveCustomer = async () => {
    setRealOrders(prev => prev.map(o => {
      if (o.id === selectedOrderId) {
        return {
          ...o,
          customer: { ...o.customer, ...tempCustomer },
          email: tempCustomer.email
        }
      }
      return o
    }))
    setEditingCustomer(false)
    const order = realOrders.find(o => o.id === selectedOrderId)
    try {
      await fetch(`/admin/orders/${selectedOrderId}`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ 
          email: tempCustomer.email,
          metadata: { ...order?.metadata, edited_customer: tempCustomer, edited_email: tempCustomer.email }
        })
      })
    } catch (err) {}
  }

  const handleSaveShipping = async () => {
    setRealOrders(prev => prev.map(o => {
      if (o.id === selectedOrderId) {
        return {
          ...o,
          shipping_address: { ...o.shipping_address, ...tempShipping }
        }
      }
      return o
    }))
    setEditingShipping(false)
    const order = realOrders.find(o => o.id === selectedOrderId)
    try {
      await fetch(`/admin/orders/${selectedOrderId}`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ 
          metadata: { ...order?.metadata, edited_shipping: tempShipping }
        })
      })
    } catch (err) {}
  }

  const handleSaveBilling = async () => {
    setRealOrders(prev => prev.map(o => {
      if (o.id === selectedOrderId) {
        return {
          ...o,
          billing_address: { ...o.billing_address, ...tempBilling }
        }
      }
      return o
    }))
    setEditingBilling(false)
    const order = realOrders.find(o => o.id === selectedOrderId)
    try {
      await fetch(`/admin/orders/${selectedOrderId}`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ 
          metadata: { ...order?.metadata, edited_billing: tempBilling }
        })
      })
    } catch (err) {}
  }

  const handleSaveProducts = async () => {
    const order = realOrders.find(o => o.id === selectedOrderId);
    if (!order) return;

    const newItems = order.items
      .filter((i: any) => tempProducts.some(t => t.id === i.id))
      .map((i: any) => {
        const tp = tempProducts.find(t => t.id === i.id)
        if (tp) {
          return { ...i, unit_price: tp.unit_price * 100, quantity: tp.quantity }
        }
        return i
      });
    
    const oldItemsSum = order.items.reduce((acc: number, i: any) => acc + (i.unit_price * i.quantity), 0);
    const newItemsSum = newItems.reduce((acc: number, i: any) => acc + (i.unit_price * i.quantity), 0);
    const newTotal = order.total - oldItemsSum + newItemsSum;

    setRealOrders(prev => prev.map(o => {
      if (o.id === selectedOrderId) {
        return { ...o, total: newTotal, items: newItems }
      }
      return o
    }))
    setEditingProducts(false)

    try {
      await fetch(`/admin/orders/${selectedOrderId}`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ 
          metadata: { ...order.metadata, edited_items: newItems, edited_total: newTotal }
        })
      })
    } catch (err) {}
  }

  const handleSearchProducts = async () => {
    if (!productSearchQuery.trim()) return;
    setSearchingProducts(true);
    
    // Dummy products fallback
    const dummyProducts = [
      {
        id: "prod_dummy_1",
        title: "Pembe Alo Arabiyeli Taytl─▒ Tak─▒m",
        thumbnail: "https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-front.png",
        variants: [
          { id: "var_1", title: "S", sku: "LXS5SU5V0G", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
          { id: "var_2", title: "M", sku: "LXS5SU5V0G", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
          { id: "var_3", title: "L", sku: "LXS5SU5V0G", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
          { id: "var_4", title: "XL", sku: "LXS5SU5V0G", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
        ]
      },
      {
        id: "prod_dummy_2",
        title: "Kahve Alo Arabiyeli Taytl─▒ Tak─▒m",
        thumbnail: "https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-front.png",
        variants: [
          { id: "var_5", title: "S", sku: "Y0O8X6OVU8", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
          { id: "var_6", title: "M", sku: "Y0O8X6OVU8", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
          { id: "var_7", title: "L", sku: "Y0O8X6OVU8", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
          { id: "var_8", title: "XL", sku: "Y0O8X6OVU8", inventory_quantity: 100, prices: [{ currency_code: "try", amount: 120000 }] },
        ]
      }
    ];

    try {
      const res = await fetch(`/admin/products?q=${encodeURIComponent(productSearchQuery)}&fields=id,title,thumbnail,description,status,created_at,updated_at,*variants,*variants.options,*options,*variants.prices`);
      const data = await res.json();
      if (data && data.products && data.products.length > 0) {
        setProductSearchResults(data.products);
      } else {
        setProductSearchResults(dummyProducts);
      }
    } catch (err) {
      console.error(err);
      setProductSearchResults(dummyProducts);
    } finally {
      setSearchingProducts(false);
    }
  }

  const handleAddProductToOrder = async (product: any, variant: any) => {
    const order = realOrders.find(o => o.id === selectedOrderId);
    if (!order) return;

    const newItem = {
      id: `item_${Math.random().toString(36).substr(2, 9)}`,
      title: product.title,
      variant: variant,
      variant_title: variant.title,
      unit_price: variant.prices?.find((p: any) => p.currency_code?.toLowerCase() === "try")?.amount ?? variant.calculated_price?.calculated_amount ?? variant.prices?.[0]?.amount ?? 0,
      quantity: 1,
      thumbnail: product.thumbnail || "",
      vat_rate: 10,
      sku: variant.sku || "",
      barcode: variant.barcode || ""
    };
    
    const newItems = [...order.items, newItem];
    const oldItemsSum = order.items.reduce((acc: number, i: any) => acc + (i.unit_price * i.quantity), 0);
    const newItemsSum = newItems.reduce((acc: number, i: any) => acc + (i.unit_price * i.quantity), 0);
    const newTotal = order.total - oldItemsSum + newItemsSum;

    setRealOrders(prev => prev.map(o => {
      if (o.id === selectedOrderId) {
        return {
          ...o,
          total: newTotal,
          items: newItems
        }
      }
      return o
    }))
    setShowProductSearchModal(false)
    showSuccess("├£r├╝n sipari┼şe eklendi.")

    try {
      await fetch(`/admin/orders/${selectedOrderId}`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ 
          metadata: { ...order.metadata, edited_items: newItems, edited_total: newTotal }
        })
      })
    } catch (err) {}
  }

  // Trigger Print popup simulation
  const triggerPrintSimulation = (type: string, orderIdOrIds: string | string[]) => {
    const ids = Array.isArray(orderIdOrIds) ? orderIdOrIds : [orderIdOrIds]
    const ordersToPrint = currentOrders.filter(o => ids.includes(o.id))
    if (ordersToPrint.length === 0) return

    const width = 800
    const height = 600
    const left = (window.innerWidth - width) / 2
    const top = (window.innerHeight - height) / 2
    const printWindow = window.open("", "_blank", `width=${width},height=${height},top=${top},left=${left}`)
    
    if (printWindow) {
      if (type === "Kargo Fi┼şi") {
        printWindow.document.write(`
          <html>
            <head>
              <title>${type} - Toplu Yazd─▒rma</title>
              <style>
                body { font-family: 'Times New Roman', serif; margin: 0; padding: 0; color: #000; box-sizing: border-box; }
                .page-break-container { page-break-after: always; padding: 10px; }
                .page-break-container:last-child { page-break-after: auto; }
                .top-bar { display: flex; justify-content: space-between; font-size: 10px; margin-bottom: 10px; font-family: Arial, sans-serif; }
                .logo-container { text-align: center; margin-bottom: 10px; }
                .logo-main { font-size: 36px; font-family: 'Arial Black', sans-serif; font-weight: 900; letter-spacing: 6px; margin: 0; line-height: 1; }
                .logo-sub { font-size: 10px; font-family: 'Arial', sans-serif; font-weight: bold; letter-spacing: 12px; margin-top: -12px; position: relative; z-index: 10; background: white; display: inline-block; padding: 0 5px; }
                .info-box { border: 2px solid #000; border-bottom: none; }
                .info-row { text-align: center; padding: 8px; border-bottom: 2px solid #000; font-size: 16px; font-weight: bold; }
                .info-row.address { font-size: 13px; padding: 12px 8px; }
                .products-box { border: 2px solid #000; padding: 10px; min-height: 150px; }
                .product-item { display: flex; align-items: center; margin-bottom: 10px; font-family: 'Times New Roman', serif; }
                .product-img { width: 45px; height: 60px; background: #eee; margin-right: 15px; overflow: hidden; }
                .product-img img { width: 100%; height: 100%; object-fit: cover; }
                .product-details { flex: 1; display: flex; align-items: center; font-size: 12px; font-weight: bold; }
                .product-sku { width: 90px; }
                .product-name { flex: 1; }
                .product-qty { width: 30px; text-align: right; }
                .bottom-info { display: flex; justify-content: space-between; font-size: 14px; font-weight: bold; margin-top: 10px; padding: 0 5px; }
                .total-box { border: 2px solid #000; display: flex; justify-content: space-between; padding: 5px 10px; font-size: 20px; font-weight: bold; margin-top: 5px; }
                .barcode-box { text-align: center; margin-top: 10px; }
                .barcode-text { font-size: 12px; font-weight: bold; font-family: Arial, sans-serif; }
                .barcode-img { height: 50px; width: 100%; max-width: 250px; margin: 5px auto 0; background: repeating-linear-gradient(90deg, #000, #000 2px, transparent 2px, transparent 5px, #000 5px, #000 8px, transparent 8px, transparent 11px, #000 11px, #000 16px, transparent 16px, transparent 18px); }
                .footer { display: flex; justify-content: space-between; font-size: 10px; margin-top: 20px; font-family: Arial, sans-serif; }
                @media print { 
                  @page { size: A5 portrait; margin: 5mm; }
                  .no-print { display: none; } 
                }
              </style>
            </head>
            <body>
              ${ordersToPrint.map((orderObj, idx) => `
              <div class="page-break-container">
                <div class="top-bar">
                  <div>${new Date().toLocaleString('tr-TR', { day: '2-digit', month: '2-digit', year: 'numeric', hour: '2-digit', minute: '2-digit' })}</div>
                  <div class="no-print" style="cursor:pointer; text-decoration:underline;" onclick="window.print()">Yazd─▒r</div>
                </div>
                
                <div class="logo-container">
                  <div style="position: relative; display: inline-block;">
                    <div class="logo-main">├ç ─░ Z G ─░</div>
                    <div style="position: absolute; top: 15px; left: 0; width: 100%; display: flex; justify-content: space-around; font-family: Arial; font-size: 10px; font-weight: bold;">
                      <span>B</span><span>U</span><span>T</span><span>─░</span><span>K</span>
                    </div>
                  </div>
                </div>

                <div class="info-box">
                  <div class="info-row" style="text-transform: uppercase;">${orderObj.customer.first_name} ${orderObj.customer.last_name}</div>
                  <div class="info-row">${orderObj.customer.phone}</div>
                  <div class="info-row address">${orderObj.shipping_address.address_1} ${orderObj.shipping_address.district} ${orderObj.shipping_address.city}</div>
                </div>

                <div class="products-box">
                  ${orderObj.items.map((item: any) => `
                    <div class="product-item">
                      <div class="product-img">
                        ${item.thumbnail ? `<img src="${item.thumbnail}" />` : ''}
                      </div>
                      <div class="product-details">
                        <div class="product-sku">${item.sku || '-'}</div>
                        <div class="product-name">${item.title} (${item.size || '-'})</div>
                        <div class="product-qty">${item.quantity}</div>
                      </div>
                    </div>
                  `).join('')}

                  <div class="product-item">
                    <div class="product-img" style="display:flex; align-items:center; justify-content:center; background:none;">
                      <svg width="45" height="45" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M20 8h-3V4H3c-1.1 0-2 .9-2 2v11h2c0 1.66 1.34 3 3 3s3-1.34 3-3h6c0 1.66 1.34 3 3 3s3-1.34 3-3h2v-5l-3-4zM6 18.5c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5 1.5.67 1.5 1.5-.67 1.5-1.5 1.5zm13.5-9l1.96 2.5H17V9.5h2.5zm-1.5 9c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5 1.5.67 1.5 1.5-.67 1.5-1.5 1.5z"/>
                      </svg>
                    </div>
                    <div class="product-details">
                      <div class="product-sku">HZMBdl</div>
                      <div class="product-name">Kargo ve Hizmet Bedeli</div>
                      <div class="product-qty">1</div>
                    </div>
                  </div>
                </div>

                <div class="bottom-info">
                  <div>${orderObj.payment_method}</div>
                  <div>${orderObj.carrier_name || 'KARGO─░ST'}</div>
                </div>

                <div class="total-box">
                  <div>Genel Toplam:</div>
                  <div>${orderObj.total.toFixed(2)}</div>
                </div>

                <div class="barcode-box">
                  <div class="barcode-text">Kargo Kodu: ${orderObj.carrier_barcode || orderObj.display_id}</div>
                  <div class="barcode-img"></div>
                </div>

                <div class="footer">
                  <div>https://www.${getDomainName()}/admin/orders/refund</div>
                  <div>${idx + 1}/${ordersToPrint.length}</div>
                </div>
              </div>
              `).join('')}
            </body>
          </html>
        `)
      } else {
        printWindow.document.write(`
        <html>
          <head>
            <title>${type} - Toplu Yazd─▒rma</title>
            <style>
              body { font-family: 'Plus Jakarta Sans', Arial, sans-serif; padding: 0; margin: 0; color: #18181b; line-height: 1.5; }
              .page-break-container { page-break-after: always; padding: 40px; }
              .page-break-container:last-child { page-break-after: auto; }
              .header { display: flex; justify-content: space-between; border-bottom: 2px solid #e4e4e7; padding-bottom: 20px; margin-bottom: 30px; }
              .title { font-size: 24px; font-weight: 800; text-transform: uppercase; letter-spacing: -0.5px; }
              .meta-box { margin-bottom: 30px; display: grid; grid-template-columns: 1fr 1fr; gap: 20px; background: #fafafa; border: 1px solid #f4f4f5; padding: 20px; border-radius: 8px; }
              .meta-label { font-size: 11px; font-weight: 800; text-transform: uppercase; color: #71717a; }
              .meta-val { font-size: 14px; font-weight: bold; margin-top: 4px; }
              table { width: 100%; border-collapse: collapse; margin: 30px 0; }
              th { background: #f4f4f5; text-transform: uppercase; font-size: 10px; font-weight: 800; padding: 12px; border-bottom: 2px solid #e4e4e7; text-align: left; }
              td { padding: 12px; border-bottom: 1px solid #f4f4f5; font-size: 13px; font-weight: 600; }
              .total-box { display: flex; flex-direction: column; align-items: flex-end; gap: 8px; font-size: 14px; font-weight: bold; margin-top: 20px; }
              .grand-total { font-size: 18px; font-weight: 900; color: #7c3aed; }
              .btn-print { margin-top: 40px; padding: 10px 20px; background: #18181b; color: white; border: none; border-radius: 6px; font-weight: bold; cursor: pointer; }
              @media print { .btn-print { display: none; } }
            </style>
          </head>
          <body>
            ${ordersToPrint.map((orderObj) => `
            <div class="page-break-container">
              <div class="header">
                <div>
                  <div class="title">${type}</div>
                  <div style="font-size: 12px; font-weight: bold; color: #a1a1aa; margin-top: 4px;">Sipari┼ş Numaras─▒: ${orderObj.display_id}</div>
                </div>
                <div style="text-align: right;">
                  <div style="font-size: 18px; font-weight: 950; letter-spacing: -1px;">CIZGIBUTIK</div>
                  <div style="font-size: 11px; font-weight: bold; color: #71717a;">${orderObj.created_at}</div>
                </div>
              </div>
              
              <div class="meta-box">
                <div>
                  <div class="meta-label">M├╝┼şteri ve Teslimat Bilgileri</div>
                  <div class="meta-val">${orderObj.customer.first_name} ${orderObj.customer.last_name}</div>
                  <div style="font-size: 12px; color: #52525b; margin-top: 4px;">${orderObj.shipping_address.address_1} ${orderObj.shipping_address.district} / ${orderObj.shipping_address.city}</div>
                  <div style="font-size: 12px; color: #52525b; margin-top: 4px;">Tel: ${orderObj.customer.phone}</div>
                </div>
                <div>
                  <div class="meta-label">├ûdeme & Kargo Detaylar─▒</div>
                  <div class="meta-val">${orderObj.payment_method}</div>
                  <div style="font-size: 12px; color: #52525b; margin-top: 4px;">Ta┼ş─▒y─▒c─▒ Firma: ${orderObj.carrier_name}</div>
                  <div style="font-size: 12px; color: #52525b; margin-top: 4px;">Barkod No: ${orderObj.carrier_barcode || "-"}</div>
                </div>
              </div>

              <table>
                <thead>
                  <tr>
                    <th>├£r├╝n</th>
                    <th>SKU</th>
                    <th>Beden</th>
                    <th>Miktar</th>
                    <th>Birim Fiyat</th>
                    <th>Toplam</th>
                  </tr>
                </thead>
                <tbody>
                  ${orderObj.items.map((item: any) => `
                    <tr>
                      <td>${item.title}</td>
                      <td>${item.sku}</td>
                      <td>${item.size}</td>
                      <td>${item.quantity} Adet</td>
                      <td>Ôé║ ${item.unit_price.toFixed(2)}</td>
                      <td>Ôé║ ${(item.unit_price * item.quantity).toFixed(2)}</td>
                    </tr>
                  `).join("")}
                </tbody>
              </table>

              <div class="total-box">
                <div>Ara Toplam: Ôé║ ${orderObj.subtotal.toFixed(2)}</div>
                <div>KDV: Ôé║ ${orderObj.vat_total.toFixed(2)}</div>
                <div class="grand-total">Genel Toplam: Ôé║ ${orderObj.total.toFixed(2)}</div>
              </div>

              <button class="btn-print no-print" onclick="window.print()">Yazd─▒r</button>
            </div>
            `).join('')}
          </body>
        </html>
      `)
      }
      printWindow.document.close()
    }
  }

  return (
    <div className="bg-zinc-50 min-h-screen text-ui-fg-base antialiased custom-admin-wrapper font-sans">
      {successModal && (
        <div className="fixed inset-0 bg-black/50 z-[100] flex items-center justify-center p-4">
          <div className="bg-white rounded-2xl p-6 max-w-sm w-full text-center">
            <div className="w-12 h-12 bg-emerald-100 text-emerald-600 rounded-full flex items-center justify-center mx-auto mb-4 text-2xl">Ô£ô</div>
            <h3 className="font-bold text-lg text-zinc-900 mb-2">Ba┼şar─▒l─▒</h3>
            <p className="text-sm text-zinc-500 mb-6">{successModal}</p>
            <button onClick={() => setSuccessModal(null)} className="w-full bg-zinc-900 text-white py-2.5 rounded-xl text-xs font-bold hover:bg-zinc-800 transition-colors">Tamam</button>
          </div>
        </div>
      )}
      <style>{`
        .no-scrollbar::-webkit-scrollbar {
          display: none;
        }
        .no-scrollbar {
          -ms-overflow-style: none;
          scrollbar-width: none;
        }
        .custom-admin-wrapper ~ * {
          display: none !important;
        }
      `}</style>

      {/* TOP HEADER REMOVED */}

      {/* TAB NAVIGATION PANEL */}
      <div className="bg-zinc-100 border-b border-zinc-200 px-8 py-1 flex items-center justify-center gap-x-6 overflow-x-auto no-scrollbar shadow-sm">
        {[
          { key: "onay_bekleyen", label: "Onay Bekleyenler" },
          { key: "hazirlanan", label: "Haz─▒rlananlar", badge: preparingCount },
          { key: "kargolanan", label: "Kargolananlar" },
          { key: "teslim_edilen", label: "Teslim Edilenler" },
          { key: "iade_edilen", label: "─░ade Edilenler" },
          { key: "iptal_edilen", label: "─░ptal Edilenler" },
          { key: "tum_siparisler", label: "T├╝m Sipari┼şler" },
          { key: "odeme_hatasi", label: "├ûdeme Hatas─▒ Al─▒nanlar" }
        ].map((tab) => (
          <button
            key={tab.key}
            onClick={() => setActiveTab(tab.key)}
            className={`py-3.5 px-1.5 border-b-2 text-xs font-bold transition-all relative whitespace-nowrap flex items-center gap-1.5 ${
              activeTab === tab.key 
                ? "border-blue-600 text-blue-600 font-semibold" 
                : "border-transparent text-zinc-500 hover:text-zinc-800"
            }`}
          >
            <span>{tab.label}</span>
            {tab.badge !== undefined && tab.badge > 0 && (
              <span className="w-5 h-5 rounded-full bg-emerald-500 text-white flex items-center justify-center text-[10px] font-bold leading-none shadow-sm animate-pulse">
                {tab.badge}
              </span>
            )}
          </button>
        ))}
      </div>

      <div className="p-8 max-w-[1600px] mx-auto flex flex-col gap-y-6">

        {/* SEARCH, FILTERS BUTTON & BULK OPERATIONS ROW */}
        <div className="flex flex-col md:flex-row justify-between items-stretch md:items-center gap-4">
          <div className="flex items-center gap-2 flex-1">
            <button
              onClick={() => setShowFilters(!showFilters)}
              className="bg-white border border-zinc-200 px-4 py-2.5 rounded-xl text-xs font-bold text-zinc-700 hover:bg-zinc-50 flex items-center gap-1.5 shadow-sm transition-all"
            >
              <Adjustments className="w-4 h-4 text-zinc-500" />
              <span>Filtreler</span>
              <svg className={`w-3.5 h-3.5 text-zinc-400 transition-transform ${showFilters ? 'rotate-180' : ''}`} fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2.5">
                <path strokeLinecap="round" strokeLinejoin="round" d="M19 9l-7 7-7-7" />
              </svg>
            </button>

            <div className="relative flex-1 max-w-md">
              <span className="absolute inset-y-0 left-3 flex items-center text-zinc-400">­şöı</span>
              <input
                type="text"
                placeholder="H─▒zl─▒ ara..."
                value={quickSearch}
                onChange={(e) => setQuickSearch(e.target.value)}
                className="w-full bg-white border border-zinc-200 rounded-xl pl-9 pr-4 py-2.5 text-xs font-medium focus:outline-none focus:border-zinc-300 focus:ring-4 focus:ring-zinc-100 text-zinc-800 transition-all shadow-sm"
              />
            </div>
          </div>

          <div className="flex items-center gap-3 shrink-0">
            <button 
                onClick={() => setIsPosOpen(true)}
                className="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2.5 rounded-xl text-xs font-bold flex items-center gap-2 shadow-md transition-all whitespace-nowrap"
            >
                H─▒zl─▒ Sat─▒┼ş (POS)
            </button>

            <div className="relative">
              <button 
                onClick={() => setIsBulkActionMenuOpen(!isBulkActionMenuOpen)}
                className="bg-white border border-zinc-200 px-4 py-2.5 rounded-xl text-xs font-bold text-zinc-700 hover:bg-zinc-50 flex items-center gap-1.5 shadow-sm transition-all"
              >
                ­şöğ Toplu ─░┼şlemler
                <svg className={`w-3.5 h-3.5 text-zinc-400 transition-transform ${isBulkActionMenuOpen ? 'rotate-180' : ''}`} fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2.5"><path strokeLinecap="round" strokeLinejoin="round" d="M19 9l-7 7-7-7" /></svg>
              </button>

              {isBulkActionMenuOpen && (
                <div className="absolute top-full mt-2 right-0 w-56 bg-white border border-zinc-200 rounded-xl shadow-lg overflow-visible py-1 z-50 animate-fade-in">
                  <div className="px-4 py-2 border-b border-zinc-100 mb-1">
                    <span className="text-[10px] font-bold text-zinc-400 uppercase tracking-wider">{selectedOrderIds.length} Sipari┼ş Se├ğili</span>
                  </div>
                  
                  <button 
                    onClick={() => {
                      if (selectedOrderIds.length === 0) {
                        alert("L├╝tfen sipari┼ş se├ğin.");
                        return;
                      }
                      setStatusModalTargetIds(selectedOrderIds);
                      setNewStatusValue("onay_bekleyen");
                      setShowStatusModal(true);
                      setIsBulkActionMenuOpen(false);
                    }}
                    className="w-full text-left px-4 py-2 text-xs font-bold text-zinc-700 hover:bg-zinc-50 transition-colors cursor-pointer"
                  >
                    Durumu De─şi┼ştir
                  </button>

                  <button className="w-full text-left px-4 py-2 text-xs font-bold text-zinc-700 hover:bg-zinc-50 transition-colors">Toplu Fatura Yazd─▒r</button>
                  <button className="w-full text-left px-4 py-2 text-xs font-bold text-zinc-700 hover:bg-zinc-50 transition-colors">Toplu Kargo Fi┼şi Yazd─▒r</button>
                  <button 
                    onClick={exportToExcel}
                    className="w-full text-left px-4 py-2 text-xs font-bold text-emerald-600 hover:bg-emerald-50 transition-colors cursor-pointer"
                  >
                    ­şôè {selectedOrderIds.length > 0 ? "Se├ğilenleri Excel'e Aktar" : "T├╝m├╝n├╝ Excel'e Aktar"}
                  </button>
                  <button className="w-full text-left px-4 py-2 text-xs font-bold text-rose-600 hover:bg-rose-50 transition-colors">Se├ğilenleri Sil</button>
                </div>
              )}
            </div>
          </div>
        </div>

        {/* EXPANDABLE FILTER GRID (G├Ârsel 2) */}
        {showFilters && (
          <div className="bg-white border border-zinc-200 rounded-2xl p-6 shadow-sm flex flex-col gap-6 animate-fade-in border-l-4 border-l-violet-600">
            <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
              
              {/* Row 1 */}
              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">Sipari┼ş Durumu</label>
                <input
                  type="text"
                  value={filterStatus}
                  onChange={(e) => setFilterStatus(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-700 bg-zinc-50"
                />
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">Platform</label>
                <select
                  value={filterPlatform}
                  onChange={(e) => setFilterPlatform(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-800 bg-white"
                >
                  <option value="">Hi├ğbiri se├ğilmedi</option>
                  <option value="WhatsApp">WhatsApp</option>
                  <option value={getDomainBrand()}>{getDomainBrand()}</option>
                </select>
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">Ma─şaza</label>
                <select
                  value={filterStore}
                  onChange={(e) => setFilterStore(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-800 bg-white"
                >
                  <option value="">Hi├ğbiri se├ğilmedi</option>
                  <option value={getDomainBrand().toLowerCase()}>{getDomainBrand()}</option>
                </select>
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">Sipari┼ş Etiketi</label>
                <select
                  value={filterTag}
                  onChange={(e) => setFilterTag(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-800 bg-white"
                >
                  <option value="">Se├ğilmedi</option>
                </select>
              </div>

              {/* Row 2 */}
              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">Sipari┼ş No</label>
                <input
                  type="text"
                  placeholder="Sipari┼ş No giriniz"
                  value={filterOrderNo}
                  onChange={(e) => setFilterOrderNo(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-900 bg-white"
                />
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">Sipari┼ş Tarihi</label>
                <div className="flex items-center gap-2">
                  <input
                    type="date"
                    value={filterOrderDateStart}
                    onChange={(e) => setFilterOrderDateStart(e.target.value)}
                    className="flex-1 px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-semibold text-zinc-800"
                  />
                  <span className="text-xs text-zinc-400">ile</span>
                  <input
                    type="date"
                    value={filterOrderDateEnd}
                    onChange={(e) => setFilterOrderDateEnd(e.target.value)}
                    className="flex-1 px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-semibold text-zinc-800"
                  />
                </div>
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">Fatura Tarihi</label>
                <div className="flex items-center gap-2">
                  <input
                    type="date"
                    value={filterInvoiceDateStart}
                    onChange={(e) => setFilterInvoiceDateStart(e.target.value)}
                    className="flex-1 px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-semibold text-zinc-800"
                  />
                  <span className="text-xs text-zinc-400">ile</span>
                  <input
                    type="date"
                    value={filterInvoiceDateEnd}
                    onChange={(e) => setFilterInvoiceDateEnd(e.target.value)}
                    className="flex-1 px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-semibold text-zinc-800"
                  />
                </div>
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">E-Fatura Tarihi</label>
                <div className="flex items-center gap-2">
                  <input
                    type="date"
                    value={filterEInvoiceDateStart}
                    onChange={(e) => setFilterEInvoiceDateStart(e.target.value)}
                    className="flex-1 px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-semibold text-zinc-800"
                  />
                  <span className="text-xs text-zinc-400">ile</span>
                  <input
                    type="date"
                    value={filterEInvoiceDateEnd}
                    onChange={(e) => setFilterEInvoiceDateEnd(e.target.value)}
                    className="flex-1 px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-semibold text-zinc-800"
                  />
                </div>
              </div>

              {/* Row 3 */}
              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">Sipari┼ş Tutar─▒</label>
                <div className="flex items-center gap-2">
                  <input
                    type="number"
                    placeholder="Min"
                    value={filterTotalMin}
                    onChange={(e) => setFilterTotalMin(e.target.value)}
                    className="flex-1 px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-900 bg-white"
                  />
                  <span className="text-xs text-zinc-400">ile</span>
                  <input
                    type="number"
                    placeholder="Max"
                    value={filterTotalMax}
                    onChange={(e) => setFilterTotalMax(e.target.value)}
                    className="flex-1 px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-900 bg-white"
                  />
                </div>
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">├ûdeme Y├Ântemi</label>
                <select
                  value={filterPaymentMethod}
                  onChange={(e) => setFilterPaymentMethod(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-800 bg-white"
                >
                  <option value="">Se├ğilmedi</option>
                  <option value="Kap─▒da Nakit ├ûdeme">Kap─▒da Nakit ├ûdeme</option>
                  <option value="Kap─▒da Kredi Kart─▒ ile ├ûdeme">Kap─▒da Kredi Kart─▒ ile ├ûdeme</option>
                  <option value="Havale / EFT">Havale / EFT</option>
                  <option value="PayTR">PayTR</option>
                </select>
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">M├╝┼şteri Ad─▒</label>
                <input
                  type="text"
                  placeholder="M├╝┼şteri ad─▒"
                  value={filterCustomerFirstName}
                  onChange={(e) => setFilterCustomerFirstName(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-900 bg-white"
                />
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">M├╝┼şteri Soyad─▒</label>
                <input
                  type="text"
                  placeholder="M├╝┼şteri soyad─▒"
                  value={filterCustomerLastName}
                  onChange={(e) => setFilterCustomerLastName(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-900 bg-white"
                />
              </div>

              {/* Row 4 */}
              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">Telefon</label>
                <input
                  type="text"
                  placeholder="Telefon numaras─▒"
                  value={filterPhone}
                  onChange={(e) => setFilterPhone(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-900 bg-white"
                />
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">Vergi Numaras─▒</label>
                <input
                  type="text"
                  value={filterTaxNo}
                  onChange={(e) => setFilterTaxNo(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-900 bg-white"
                />
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">Vergi Dairesi</label>
                <input
                  type="text"
                  value={filterTaxOffice}
                  onChange={(e) => setFilterTaxOffice(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-900 bg-white"
                />
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">TC Kimlik No</label>
                <input
                  type="text"
                  value={filterTcNo}
                  onChange={(e) => setFilterTcNo(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-900 bg-white"
                />
              </div>

              {/* Row 5 */}
              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">├£ye No</label>
                <input
                  type="text"
                  value={filterMemberNo}
                  onChange={(e) => setFilterMemberNo(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-900 bg-white"
                />
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">├£lke</label>
                <select
                  value={filterCountry}
                  onChange={(e) => setFilterCountry(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-800 bg-white"
                >
                  <option value="">Hi├ğbiri se├ğilmedi</option>
                  <option value="tr">T├╝rkiye</option>
                </select>
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">─░l</label>
                <input
                  type="text"
                  value={filterProvince}
                  onChange={(e) => setFilterProvince(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-900 bg-white"
                />
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">├£r├╝n No</label>
                <input
                  type="text"
                  value={filterProductNo}
                  onChange={(e) => setFilterProductNo(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-900 bg-white"
                />
              </div>

              {/* Row 6 */}
              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">├£r├╝n Barkodu</label>
                <input
                  type="text"
                  value={filterProductBarcode}
                  onChange={(e) => setFilterProductBarcode(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-900 bg-white"
                />
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">├£r├╝n Ad─▒</label>
                <input
                  type="text"
                  value={filterProductName}
                  onChange={(e) => setFilterProductName(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-900 bg-white"
                />
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">├£r├╝n Etiketleri</label>
                <select
                  value={filterProductTag}
                  onChange={(e) => setFilterProductTag(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-800 bg-white"
                >
                  <option value="">Etiket Se├ğilmedi</option>
                </select>
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">Hediye ├çeki Kodu</label>
                <input
                  type="text"
                  value={filterGiftCardCode}
                  onChange={(e) => setFilterGiftCardCode(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-900 bg-white"
                />
              </div>

              {/* Row 7 */}
              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">Promosyon</label>
                <select
                  value={filterPromo}
                  onChange={(e) => setFilterPromo(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-800 bg-white"
                >
                  <option value="">Se├ğilmedi</option>
                </select>
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">Kargo Firmas─▒</label>
                <select
                  value={filterCarrier}
                  onChange={(e) => setFilterCarrier(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-800 bg-white"
                >
                  <option value="">Se├ğilmedi</option>
                  <option value="KARGO─░ST">Kargoist</option>
                  <option value="INTERLINE KARGO">Interline Kargo</option>
                </select>
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider">Geli┼şmi┼ş Arama</label>
                <select
                  value={filterAdvancedSearch}
                  onChange={(e) => setFilterAdvancedSearch(e.target.value)}
                  className="w-full px-3 py-2 rounded-lg border border-zinc-200 focus:outline-none focus:border-zinc-400 text-xs font-bold text-zinc-800 bg-white"
                >
                  <option value="">Hi├ğbiri se├ğilmedi</option>
                </select>
              </div>
            </div>

            <div className="flex justify-start gap-3 pt-3 border-t border-zinc-100">
              <button 
                onClick={() => setShowFilters(false)}
                className="bg-sky-600 hover:bg-sky-700 text-white font-semibold text-[11px] px-5 py-2.5 rounded-lg shadow-sm"
              >
                Filtrele
              </button>
              <button 
                onClick={handleClearFilters}
                className="bg-white border border-zinc-200 text-zinc-700 hover:bg-zinc-50 font-semibold text-[11px] px-5 py-2.5 rounded-lg"
              >
                Temizle
              </button>
            </div>
          </div>
        )}

        {/* ORDER LIST TABLE (G├Ârsel 1) */}
        {loading ? (
          <div className="bg-white border border-zinc-200 rounded-2xl p-16 flex flex-col items-center justify-center gap-3 shadow-sm">
            <div className="w-10 h-10 border-4 border-violet-500 border-t-transparent rounded-full animate-spin" />
            <span className="text-xs font-bold text-zinc-500">Sipari┼ş verileri y├╝kleniyor...</span>
          </div>
        ) : (
          <div className="bg-white border border-zinc-200 rounded-xl shadow-sm overflow-hidden">
            <div className="overflow-x-auto">
              <table className="w-full border-collapse border-hidden text-left bg-white text-[12px]">
                <thead>
                  <tr className="bg-zinc-50/80 border-b border-zinc-200 text-[11px] font-bold text-zinc-800 tracking-wide divide-x divide-zinc-200">
                    <th className="py-3 px-4 w-12 text-center">
                      <input 
                        type="checkbox"
                        checked={filteredOrdersList.length > 0 && selectedOrderIds.length === filteredOrdersList.length}
                        onChange={(e) => handleSelectAll(e.target.checked)}
                        className="w-4 h-4 rounded border-zinc-300 text-violet-600 focus:ring-violet-500 cursor-pointer"
                      />
                    </th>
                    <th className="py-3 px-4 font-semibold text-zinc-800">Sipari┼ş Bilgileri</th>
                    <th className="py-3 px-4 font-semibold text-zinc-800">M├╝┼şteri Bilgileri</th>
                    <th className="py-3 px-4 font-semibold text-zinc-800">Tutar</th>
                    <th className="py-3 px-4 font-semibold text-zinc-800">Durum</th>
                    <th className="py-3 px-4 font-semibold text-zinc-800">Kargo</th>
                    <th className="py-3 px-4 font-semibold text-zinc-800">Tarih</th>
                    <th className="py-3 px-4 font-semibold text-zinc-800">Yazd─▒r</th>
                    <th className="py-3 px-4 font-semibold text-zinc-800 w-32">─░┼şlemler</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-zinc-200 text-zinc-700">
                  {filteredOrdersList.length === 0 ? (
                    <tr>
                      <td colSpan={9} className="py-16 text-center text-zinc-400 font-bold">Aramaya uygun sipari┼ş kayd─▒ bulunmamaktad─▒r.</td>
                    </tr>
                  ) : (
                    filteredOrdersList.map((order, index) => {
                      const isSelected = selectedOrderIds.includes(order.id)
                      const altRow = index % 2 === 1
                      return (
                        <tr 
                          key={order.id} 
                          className={`transition-colors divide-x divide-zinc-200 ${isSelected ? 'bg-blue-50/50' : altRow ? 'bg-zinc-50/30' : 'bg-white'} hover:bg-zinc-50`}
                        >
                          <td className="py-3 px-4 text-center">
                            <input 
                              type="checkbox"
                              checked={isSelected}
                              onChange={(e) => handleSelectRow(order.id, e.target.checked)}
                              className="w-4 h-4 rounded border-zinc-300 text-violet-600 focus:ring-violet-500 cursor-pointer"
                            />
                          </td>
                          <td className="py-3 px-4">
                            <div className="flex flex-col">
                              <span 
                                onClick={() => {
                                  setSelectedOrderId(order.id)
                                  setTempNotesText(order.admin_notes || "")
                                  setTempInvoiceSeriesText(order.invoice_series || "-")
                                }}
                                className="font-bold text-blue-600 hover:underline cursor-pointer flex items-center gap-1.5"
                              >
                                <span className="text-[13px] font-black text-zinc-800 uppercase tracking-widest">{getDomainPrefix()}</span>
                                {order.display_id}
                              </span>
                              <span className="text-[11px] font-medium text-zinc-500 mt-0.5">{order.platform || "WhatsApp"}</span>
                            </div>
                          </td>
                          <td className="py-3 px-4">
                            <div className="flex flex-col">
                              <div className="flex items-center gap-2">
                                <span className="font-semibold text-zinc-800 capitalize">{order.customer.first_name} {order.customer.last_name}</span>
                                {(() => {
                                  // RISK KONTROLU
                                  const phone = order.customer?.phone || "";
                                  const email = order.customer?.email || "";
                                  const ip = order.customer?.ip || "";
                                  const fullName = `${order.customer?.first_name || ""} ${order.customer?.last_name || ""}`.toLowerCase().replace(/\s+/g, '');
                                  
                                  const cleanPhone = phone ? phone.replace(/[^0-9]/g, '').slice(-10) : "";
                                  const cleanEmail = email ? email.toLowerCase().trim() : "";
                                  const cleanIp = ip ? ip.trim() : "";
                                  
                                  let isRisky = false;
                                  
                                  if (cleanPhone || cleanEmail || cleanIp || fullName) {
                                    for (const o of currentOrders) {
                                      if (o.id === order.id) continue;
                                      
                                      // Gecmis siparis kapida odeme mi?
                                      const isKapidaOdeme = o.payment_option === "cash_on_delivery" || o.payment_option === "card_on_delivery";
                                      if (!isKapidaOdeme) continue;
                                      
                                      // Gecmis siparis iptal/iade edilmis mi?
                                      const isCanceledOrReturned = o.status === "iptal_edilen" || o.status === "iade_edilen" || o.status === "odeme_hatasi";
                                      if (!isCanceledOrReturned) continue;
                                      
                                      const oPhone = o.customer?.phone ? o.customer.phone.replace(/[^0-9]/g, '').slice(-10) : "";
                                      const oEmail = o.customer?.email ? o.customer.email.toLowerCase().trim() : "";
                                      const oIp = o.customer?.ip ? o.customer.ip.trim() : "";
                                      const oFullName = `${o.customer?.first_name || ""} ${o.customer?.last_name || ""}`.toLowerCase().replace(/\s+/g, '');
                                      
                                      const phoneMatch = cleanPhone && oPhone && cleanPhone === oPhone;
                                      const emailMatch = cleanEmail && oEmail && cleanEmail === oEmail;
                                      const ipMatch = cleanIp && oIp && cleanIp === oIp && cleanIp !== "127.0.0.1";
                                      const nameMatch = fullName && oFullName && fullName === oFullName;
                                      
                                      if (phoneMatch || emailMatch || ipMatch || nameMatch) {
                                        isRisky = true;
                                        break;
                                      }
                                    }
                                  }

                                  return isRisky ? (
                                    <span className="bg-red-100 text-red-600 text-[10px] font-bold px-1.5 py-0.5 rounded border border-red-200 shadow-sm whitespace-nowrap animate-pulse">
                                      R─░SKL─░ S─░PAR─░┼Ş
                                    </span>
                                  ) : null;
                                })()}
                              </div>
                              <span className="text-[11px] font-medium text-zinc-500 mt-0.5">{order.customer.phone}</span>
                            </div>
                          </td>
                          <td className="py-3 px-4">
                            <div className="flex flex-col">
                              <span className="font-semibold text-zinc-800">{order.total.toLocaleString("tr-TR", { minimumFractionDigits: 2 })} TL</span>
                              <span className="text-[11px] font-medium text-zinc-500 mt-0.5">{order.payment_method}</span>
                            </div>
                          </td>
                          <td className="py-3 px-4">
                            {order.status === "teslim_edilen" && (
                              <span className="inline-flex items-center px-3 py-1 rounded border border-emerald-500 text-[11px] font-semibold text-emerald-500 leading-none">
                                Teslim Edildi
                              </span>
                            )}
                            {order.status === "kargolanan" && (
                              <span className="inline-flex items-center px-3 py-1 rounded border border-amber-500 text-[11px] font-semibold text-amber-500 leading-none">
                                Kargoland─▒
                              </span>
                            )}
                            {order.status === "hazirlanan" && (
                              <span className="inline-flex items-center px-3 py-1 rounded border border-blue-500 text-[11px] font-semibold text-blue-500 leading-none">
                                Haz─▒rlan─▒yor
                              </span>
                            )}
                            {order.status === "onay_bekleyen" && (
                              <span className="inline-flex items-center px-3 py-1 rounded border border-zinc-400 text-[11px] font-semibold text-zinc-500 leading-none">
                                Onay Bekliyor
                              </span>
                            )}
                            {order.status === "iptal_edilen" && (
                              <span className="inline-flex items-center px-3 py-1 rounded border border-rose-500 text-[11px] font-semibold text-rose-500 leading-none">
                                ─░ptal Edildi
                              </span>
                            )}
                            {order.status === "odeme_hatasi" && (
                              <span className="inline-flex items-center px-3 py-1 rounded border border-red-600 text-[11px] font-semibold text-red-600 leading-none">
                                ├ûdeme Hatas─▒
                              </span>
                            )}
                          </td>
                          <td className="py-3 px-4 uppercase font-semibold text-[11px] text-zinc-800">
                            {order.carrier_name || "KARGO─░ST"}
                          </td>
                          <td className="py-3 px-4 font-medium text-[11px] text-zinc-800">
                            {order.created_at}
                          </td>
                          <td className="py-3 px-4">
                            <div className="flex items-center gap-1.5">
                              <button 
                                title="e-Fatura" 
                                onClick={() => triggerPrintSimulation("e-Fatura", order.id)}
                                className="w-7 h-7 flex items-center justify-center rounded border border-zinc-300 bg-white hover:bg-zinc-50 relative shadow-sm"
                              >
                                <span className="font-bold text-[14px] text-zinc-600 leading-none">e</span>
                                {/* Example checkmark if printed */}
                                {order.status === "teslim_edilen" && (
                                  <div className="absolute -top-1.5 -right-1.5 bg-white rounded-full">
                                    <svg className="w-3.5 h-3.5 text-emerald-500" fill="currentColor" viewBox="0 0 20 20"><path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" /></svg>
                                  </div>
                                )}
                              </button>
                              <button 
                                title="Fatura" 
                                onClick={() => triggerPrintSimulation("Fatura", order.id)}
                                className="w-7 h-7 flex items-center justify-center rounded border border-zinc-300 bg-white hover:bg-zinc-50 relative shadow-sm"
                              >
                                <InvoiceIcon />
                                {order.status === "teslim_edilen" && (
                                  <div className="absolute -top-1.5 -right-1.5 bg-white rounded-full">
                                    <svg className="w-3.5 h-3.5 text-emerald-500" fill="currentColor" viewBox="0 0 20 20"><path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" /></svg>
                                  </div>
                                )}
                              </button>
                              <button 
                                title="Kargo Fi┼şi" 
                                onClick={() => triggerPrintSimulation("Kargo Fi┼şi", order.id)}
                                className="w-7 h-7 flex items-center justify-center rounded border border-zinc-300 bg-white hover:bg-zinc-50 shadow-sm"
                              >
                                <TruckIcon />
                              </button>
                              <button 
                                title="Paket Fi┼şi" 
                                onClick={() => triggerPrintSimulation("Paket Fi┼şi", order.id)}
                                className="w-7 h-7 flex items-center justify-center rounded border border-zinc-300 bg-white hover:bg-zinc-50 shadow-sm"
                              >
                                <PackageIcon />
                              </button>
                              <button 
                                title="PDF Fatura" 
                                onClick={() => triggerPrintSimulation("PDF", order.id)}
                                className="w-7 h-7 flex items-center justify-center rounded border border-zinc-300 bg-white hover:bg-zinc-50 shadow-sm"
                              >
                                <PdfIcon />
                              </button>
                            </div>
                          </td>
                          <td className="py-3 px-4">
                            <div className="flex items-center gap-2">
                              <button
                                onClick={() => {
                                  setSelectedOrderId(order.id)
                                  setTempNotesText(order.admin_notes || "")
                                  setTempInvoiceSeriesText(order.invoice_series || "-")
                                }}
                                className="w-7 h-7 rounded bg-[#9b66c4] hover:bg-purple-600 text-white flex items-center justify-center shadow-sm cursor-pointer transition-colors"
                              >
                                <EyeIcon />
                              </button>
                              {order.status === "kargolanan" && (
                                <button
                                  onClick={() => handleMarkDelivered(order.id)}
                                  className="h-7 px-3 rounded bg-[#10b981] hover:bg-emerald-600 text-white font-semibold text-[11px] shadow-sm cursor-pointer transition-colors whitespace-nowrap"
                                >
                                  Teslim Et
                                </button>
                              )}
                            </div>
                          </td>
                        </tr>
                      )
                    })
                  )}
                </tbody>
              </table>
            </div>
          </div>
        )}

      </div>

`      {/* DETAIL VIEW MODAL DIALOG (G├Ârsel 3) */}
      {selectedOrderId && activeOrderDetails && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
          <div className="absolute inset-0 bg-black/40" onClick={() => setSelectedOrderId(null)} />
          <div className="bg-[#f4f5f7] border border-[#d3d9df] shadow-2xl w-full max-w-[1400px] h-[95vh] flex flex-col overflow-hidden relative z-10 rounded-sm font-sans">
            
            {/* Header segment */}
            <div className="bg-[#0b5ed7] text-white px-5 py-3 flex items-start justify-between shrink-0">
              <div className="flex flex-col">
                <span className="text-[14px] font-medium text-white mb-0.5">Sipari┼ş Y├Ânetimi</span>
                <span className="text-[20px] font-bold tracking-tight">{activeOrderDetails.display_id} Nolu Sipari┼ş</span>
              </div>
              <button 
                onClick={() => setSelectedOrderId(null)} 
                className="text-white hover:opacity-80 p-1">
                <span className="font-bold text-xl leading-none">├ù</span>
              </button>
            </div>

            {/* Main scrollable body grid */}
            <div className="flex-1 p-4 overflow-y-auto grid grid-cols-1 lg:grid-cols-[1fr_360px] gap-4">
              
              {/* Left Side elements */}
              <div className="flex flex-col gap-4">
                
                {/* 1. Products list table card */}
                <div className="bg-white border border-[#d3d9df] rounded-sm shadow-none overflow-hidden">
                  <div className="p-4 border-b border-[#d3d9df] flex items-center justify-between">
                    <div className="flex items-center gap-2">
                      <div className="w-4 h-4 rounded-full border border-emerald-500 flex items-center justify-center text-emerald-500 text-[10px]">Ô£ô</div>
                      <h3 className="text-[14px] font-bold text-zinc-800">
                        Teslim Edilen ├£r├╝nler ({activeOrderDetails.items.length})
                      </h3>
                    </div>
                    <div className="flex gap-2">
                      {!editingProducts ? (
                        <button onClick={() => {
                          setEditingProducts(true)
      {/* Inner Modal for Status Change */}
      {showStatusModal && (
        <div className="fixed inset-0 z-[200] flex items-center justify-center p-4">
          <div className="absolute inset-0 bg-zinc-900/40 backdrop-blur-sm" onClick={() => setShowStatusModal(false)} />
          <div className="bg-white rounded-xl shadow-2xl w-full max-w-[420px] flex flex-col relative animate-in fade-in zoom-in-95 duration-200 overflow-hidden">
            {/* Header */}
            <div className="bg-[#0d6efd] text-white px-5 py-4 flex flex-col relative">
              <span className="text-[12px] font-semibold text-blue-100 mb-0.5">Sipari┼ş ─░┼şlemleri</span>
              <span className="text-[16px] font-bold tracking-tight">Sipari┼ş Durumunu De─şi┼ştir</span>
              <button 
                onClick={() => setShowStatusModal(false)}
                className="absolute right-4 top-1/2 -translate-y-1/2 text-white hover:text-zinc-200 opacity-90 transition-opacity"
              >
                <span className="text-xl font-bold">Ô£ò</span>
              </button>
            </div>
            
            {/* Body */}
            <div className="p-6 flex flex-col gap-5">
              <div className="flex flex-col gap-2">
                <label className="text-[12px] font-semibold text-zinc-500">Sipari┼ş Durumu</label>
                <select 
                  value={newStatusValue}
                  onChange={(e) => setNewStatusValue(e.target.value)}
                  className="w-full border border-zinc-300 rounded px-3 py-2.5 text-[13px] font-bold text-zinc-800 focus:outline-none focus:border-blue-500 shadow-sm cursor-pointer"
                >
                  <option value="onay_bekleyen">Yeni Sipari┼ş</option>
                  <option value="hazirlanan">Haz─▒rlanan Sipari┼ş</option>
                  <option value="kargolanan">Kargolanan Sipari┼ş</option>
                  <option value="teslim_edilen">Teslim Edilen Sipari┼ş</option>
                  <option value="iptal_edilen">─░ptal Edilen Sipari┼ş</option>
                </select>
              </div>

              <label className="flex items-center gap-2.5 cursor-pointer mt-1">
                <input 
                  type="checkbox" 
                  checked={notifyCustomer}
                  onChange={(e) => setNotifyCustomer(e.target.checked)}
                  className="w-4 h-4 rounded border-zinc-300 text-blue-600 focus:ring-blue-500 cursor-pointer"
                />
                <span className="text-[12px] font-semibold text-zinc-600 leading-snug">
                  M├╝┼şteriye mobil uygulama bildirimleri
                </span>
              </label>
            </div>

            {/* Footer */}
            <div className="px-5 py-4 bg-zinc-50 border-t border-zinc-100 flex justify-end gap-2">
              <button
                onClick={() => setShowStatusModal(false)}
                className="bg-white border border-zinc-200 hover:bg-zinc-50 text-zinc-700 font-bold text-[12px] h-9 px-5 rounded transition-colors"
              >
                ─░ptal
              </button>
              <button
                onClick={async () => {
                  for (const id of statusModalTargetIds) {
                    await handleStatusChange(id, newStatusValue, true);
                  }
                  setShowStatusModal(false);
                  
                  const refreshRes = await fetch("/admin/orders?limit=100&fields=*customer,*shipping_address,*billing_address,*items")
                  const refreshData = await refreshRes.json()
                  if (refreshData && refreshData.orders) setRealOrders(refreshData.orders)

                  if (statusModalTargetIds.length > 1) {
                    showSuccess(`Tamamlanan sipari┼ş say─▒s─▒: ${statusModalTargetIds.length}`);
                  } else {
                    showSuccess("Sipari┼ş ba┼şar─▒yla g├╝ncellendi.");
                  }
                }}
                className="bg-[#10B981] hover:bg-emerald-600 text-white font-bold text-[12px] h-9 px-6 rounded transition-colors shadow-sm flex items-center gap-1.5"
              >
                <span className="text-sm">Ô£ö</span>
                <span>Kaydet</span>
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Inner Modal for Print Actions */}
      {showPrintModal && (
        <div className="fixed inset-0 z-[200] flex items-center justify-center p-4">
          <div className="absolute inset-0 bg-zinc-900/40 backdrop-blur-sm" onClick={() => setShowPrintModal(false)} />
          <div className="bg-white rounded-xl shadow-2xl w-full max-w-[420px] flex flex-col relative animate-in fade-in zoom-in-95 duration-200 overflow-hidden">
            {/* Header */}
            <div className="bg-white border-b border-zinc-100 px-5 py-4 flex items-center justify-between">
              <span className="text-[15px] font-bold text-zinc-800">Yazd─▒r</span>
            </div>
            
            {/* Body */}
            <div className="p-6 flex flex-col gap-4">
              <div className="flex flex-col gap-2">
                <label className="text-[12px] font-semibold text-zinc-500">Yazd─▒rma ┼Şablonu</label>
                <select 
                  value={printTemplate}
                  onChange={(e) => setPrintTemplate(e.target.value)}
                  className="w-full border border-blue-500 ring-2 ring-blue-50 rounded px-3 py-2.5 text-[13px] font-bold text-zinc-800 focus:outline-none cursor-pointer bg-white"
                >
                  <option value="E-Fatura">E-Fatura</option>
                  <option value="Fatura">Fatura</option>
                  <option value="Kargo Fi┼şi">Kargo Fi┼şi</option>
                  <option value="Fi┼ş">Fi┼ş</option>
                  <option value="PDF">PDF</option>
                </select>
              </div>
            </div>

            {/* Footer */}
            <div className="px-5 py-4 bg-zinc-50 flex justify-end gap-2 border-t border-zinc-100">
              <button
                onClick={() => setShowPrintModal(false)}
                className="bg-white border border-zinc-200 hover:bg-zinc-50 text-zinc-700 font-bold text-[12px] h-9 px-5 rounded transition-colors"
              >
                ─░ptal
              </button>
              <button
                onClick={() => {
                  // Simulate bulk print
                  triggerPrintSimulation(printTemplate, printModalTargetIds);
                  alert(`${printModalTargetIds.length} adet sipari┼ş i├ğin ${printTemplate} yazd─▒rma i┼şlemi ba┼şlat─▒ld─▒.`);
                  setShowPrintModal(false);
                }}
                className="bg-[#10B981] hover:bg-emerald-600 text-white font-bold text-[12px] h-9 px-6 rounded transition-colors shadow-sm"
              >
                Yazd─▒r
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Floating Bulk Action Bar */}
      {selectedOrderIds.length > 0 && !selectedOrderId && (
        <div 
          className="fixed bottom-6 left-1/2 transform -translate-x-1/2 bg-[#2c303f] rounded-xl shadow-2xl flex items-center overflow-hidden z-[99999]"
          style={{ boxShadow: '0 20px 40px -10px rgba(0,0,0,0.5), 0 0 20px rgba(0,0,0,0.1)' }}
        >
          <button 
            onClick={() => {
              setStatusModalTargetIds(selectedOrderIds);
              setNewStatusValue("onay_bekleyen");
              setShowStatusModal(true);
            }}
            className="flex items-center gap-2 px-6 py-4 bg-[#7e22ce] hover:bg-purple-600 text-white font-bold text-xs transition-colors border-r border-zinc-700/50"
          >
            <span className="text-[14px]">Ôİ░</span>
            Durum ({selectedOrderIds.length})
          </button>
          
          <button 
            onClick={() => {
              setPrintModalTargetIds(selectedOrderIds);
              setPrintTemplate("E-Fatura");
              setShowPrintModal(true);
            }}
            className="flex items-center gap-2 px-6 py-4 bg-[#b45309] hover:bg-amber-600 text-white font-bold text-xs transition-colors border-r border-zinc-700/50"
          >
            <span className="text-[14px]">­şû¿´©Å</span>
            Yazd─▒r ({selectedOrderIds.length})
          </button>

          <button 
            onClick={() => {
              triggerPrintSimulation("E-Fatura", selectedOrderIds);
              showSuccess(`${selectedOrderIds.length} sipari┼ş i├ğin toplu E-Fatura kesme i┼şlemi ba┼şlat─▒ld─▒.`);
            }}
            className="flex items-center gap-2 px-6 py-4 bg-[#1e40af] hover:bg-blue-700 text-white font-bold text-xs transition-colors"
          >
            <span className="text-[14px]">e</span>
            E-Fatura ({selectedOrderIds.length})
          </button>
        </div>
      )}

      {/* Success Modal */}
      {successModal && (
        <div className="fixed inset-0 z-[9999] flex items-center justify-center p-4">
          <div className="absolute inset-0 bg-zinc-900/40 backdrop-blur-sm" onClick={() => setSuccessModal(null)} />
          <div className="bg-white rounded-xl shadow-2xl w-full max-w-[380px] flex flex-col relative animate-in fade-in zoom-in-95 duration-200 overflow-hidden text-center">
            <div className="p-8 flex flex-col items-center gap-5">
              <div className="w-[72px] h-[72px] bg-[#10B981] rounded-full flex items-center justify-center shadow-md">
                <svg className="w-10 h-10 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="3">
                  <path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" />
                </svg>
              </div>
              <div className="flex flex-col gap-1.5">
                <h3 className="text-[20px] font-bold text-zinc-800 tracking-tight">─░┼şlem Tamamland─▒!</h3>
                <p className="text-[14px] font-medium text-zinc-500 mt-1">{successModal}</p>
              </div>
            </div>
            <div className="p-5 bg-zinc-50 border-t border-zinc-100 flex justify-center">
              <button
                onClick={() => setSuccessModal(null)}
                className="bg-[#3b82f6] hover:bg-blue-600 text-white font-bold text-[14px] w-full max-w-[140px] h-10 rounded transition-colors shadow-sm"
              >
                Tamam
              </button>
            </div>
          </div>
        </div>
      )}

      {/* ADD PRODUCT MODAL */}
      {showProductSearchModal && (
        <div className="fixed inset-0 z-[60] flex items-center justify-center p-4 animate-fade-in">
          <div className="absolute inset-0 bg-black/60 backdrop-blur-sm" onClick={() => setShowProductSearchModal(false)} />
          <div className="bg-zinc-100 rounded-lg border border-zinc-200 shadow-2xl w-full max-w-[900px] h-[80vh] flex flex-col overflow-hidden relative z-10 animate-scale-up">
            
            <div className="bg-[#0d6efd] text-white px-5 py-3 flex items-center justify-between select-none shrink-0">
              <h2 className="text-sm font-bold tracking-tight">├£r├╝nler</h2>
              <button 
                onClick={() => setShowProductSearchModal(false)} 
                className="text-white hover:opacity-85 p-1 rounded-lg transition-colors"
              >
                <XMark className="w-5 h-5" />
              </button>
            </div>

            <div className="p-4 bg-white border-b border-zinc-200 flex flex-col gap-3 shrink-0">
              <div className="relative">
                <svg className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-zinc-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2"><path strokeLinecap="round" strokeLinejoin="round" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" /></svg>
                <input 
                  type="text" 
                  className="w-full pl-10 pr-4 py-2 border border-zinc-300 rounded focus:border-[#0d6efd] focus:ring-1 focus:ring-[#0d6efd] outline-none transition-shadow text-sm"
                  placeholder="├£r├╝n Ara..."
                  value={productSearchQuery}
                  onChange={e => setProductSearchQuery(e.target.value)}
                  onKeyDown={e => e.key === 'Enter' && handleSearchProducts()}
                />
              </div>
              <div className="flex gap-2">
                <select className="border border-zinc-300 rounded px-3 py-1.5 text-[11px] font-medium text-zinc-700 bg-zinc-50 flex-1"><option>T├╝m Kategoriler</option></select>
                <select className="border border-zinc-300 rounded px-3 py-1.5 text-[11px] font-medium text-zinc-700 bg-zinc-50 flex-1"><option>T├╝m Markalar</option></select>
                <select className="border border-zinc-300 rounded px-3 py-1.5 text-[11px] font-medium text-zinc-700 bg-zinc-50 flex-1"><option>T├╝m Filtreler</option></select>
                <select className="border border-zinc-300 rounded px-3 py-1.5 text-[11px] font-medium text-zinc-700 bg-zinc-50 flex-1"><option>Yeniden Eskiye</option></select>
              </div>
            </div>

            <div className="flex-1 p-4 overflow-y-auto">
              {searchingProducts ? (
                <div className="flex justify-center py-10"><span className="text-zinc-500 font-medium text-sm">Aran─▒yor...</span></div>
              ) : (
                <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4">
                  {productSearchResults.map(product => (
                    (product.variants || []).map((variant: any) => (
                      <div key={variant.id} className="bg-white border border-zinc-200 rounded p-3 flex flex-col items-center gap-2 group relative shadow-sm hover:shadow-md transition-shadow">
                        <div className="w-full aspect-[3/4] bg-zinc-100 rounded overflow-hidden relative">
                          {product.thumbnail ? (
                            <img src={product.thumbnail} alt={product.title} className="w-full h-full object-cover" />
                          ) : (
                            <div className="w-full h-full flex items-center justify-center text-4xl">­şæû</div>
                          )}
                          <div className="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 flex items-center justify-center transition-opacity">
                            <button 
                              onClick={() => handleAddProductToOrder(product, variant)}
                              className="w-12 h-12 bg-zinc-800 text-white rounded-full flex items-center justify-center hover:bg-zinc-700 hover:scale-110 transition-all shadow-lg"
                              title="Sipari┼şe Ekle"
                            >
                              <svg className="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}><path strokeLinecap="round" strokeLinejoin="round" d="M12 4v16m8-8H4" /></svg>
                            </button>
                          </div>
                        </div>
                        <div className="text-center w-full">
                          <h4 className="text-[11px] font-bold text-zinc-800 line-clamp-1">{product.title}</h4>
                          <div className="text-[10px] font-semibold text-zinc-500 mt-0.5">{variant.title}</div>
                          <div className="text-xs font-bold text-zinc-900 mt-1">
                            {((variant.prices?.find((p: any) => p.currency_code === "try")?.amount || 0) / 100).toLocaleString("tr-TR", { minimumFractionDigits: 2 })} TL
                          </div>
                          <div className="text-[9px] text-zinc-400 mt-1 uppercase">{variant.sku || "-"}</div>
                          <div className="text-[9px] text-zinc-400 mt-0.5">Stok: {variant.inventory_quantity || 0}</div>
                        </div>
                      </div>
                    ))
                  ))}
                  {productSearchResults.length === 0 && !searchingProducts && productSearchQuery && (
                    <div className="col-span-full text-center py-10 text-zinc-500 font-medium text-sm">Sonu├ğ bulunamad─▒.</div>
                  )}
                </div>
              )}
            </div>

          </div>
        </div>
      )}

      <PosModal isOpen={isPosOpen} onOpenChange={setIsPosOpen} onOrderCreated={() => window.location.reload()} />
    </div>
  )
}

export const config = defineWidgetConfig({
  zone: "order.list.before",
})

export default SiparisYonetimiPage
