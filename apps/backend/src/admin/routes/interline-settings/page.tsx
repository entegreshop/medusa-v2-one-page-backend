import { useState, useEffect } from "react"
import { defineRouteConfig } from "@medusajs/admin-sdk"
import { CheckCircle } from "@medusajs/icons"

interface InterlineConfig {
  active: boolean
  authorization: string
  from_name: string
  branch_code: string
  tax_office: string
  tax_number: string
}

const InterlineSettings = () => {
  const [config, setConfig] = useState<InterlineConfig>({
    active: false,
    authorization: "",
    from_name: "",
    branch_code: "",
    tax_office: "",
    tax_number: ""
  })

  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [saveSuccess, setSaveSuccess] = useState(false)

  // Fetch current config on load
  useEffect(() => {
    fetch("/admin/interline-settings")
      .then(res => res.json())
      .then(data => {
        if (data.config) {
          setConfig(data.config)
        }
        setLoading(false)
      })
      .catch(err => {
        console.error("Failed to fetch Interline config", err)
        setLoading(false)
      })
  }, [])

  const handleSave = async () => {
    setSaving(true)
    setSaveSuccess(false)
    try {
      const response = await fetch("/admin/interline-settings", {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify(config)
      })
      const data = await response.json()
      if (data.success && data.config) {
        setConfig(data.config)
        setSaveSuccess(true)
        setTimeout(() => setSaveSuccess(false), 3000)
      }
    } catch (err) {
      console.error("Error saving Interline config", err)
    }
    setSaving(false)
  }

  if (loading) {
    return (
      <div className="flex h-screen items-center justify-center bg-ui-bg-base text-ui-fg-base">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-ui-fg-interactive"></div>
      </div>
    )
  }

  return (
    <div className="p-8 max-w-4xl mx-auto space-y-8 bg-ui-bg-subtle min-h-screen">
      <div className="flex flex-col gap-2">
        <h1 className="text-3xl font-semibold tracking-tight text-ui-fg-base">
          İnterline Kargo Entegrasyonu
        </h1>
        <p className="text-ui-fg-subtle text-sm">
          Siparişlerinizi tek tuşla veya otomatik olarak İnterline Kargo'ya gönderin, kargo barkodlarını yönetin.
        </p>
      </div>

      <div className="bg-ui-bg-base rounded-xl shadow-sm border border-ui-border-base overflow-hidden">
        <div className="p-6 border-b border-ui-border-base flex items-center justify-between">
          <div>
            <h2 className="text-lg font-medium text-ui-fg-base">Durum: {config.active ? "Aktif" : "Pasif"}</h2>
            <p className="text-sm text-ui-fg-subtle">
              Entegrasyonu aktif ederek kargo otomasyonunu başlatın.
            </p>
          </div>
          <label className="relative inline-flex items-center cursor-pointer">
            <input 
              type="checkbox" 
              className="sr-only peer" 
              checked={config.active}
              onChange={(e) => setConfig({ ...config, active: e.target.checked })}
            />
            <div className="w-11 h-6 bg-ui-border-strong peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-blue-600"></div>
          </label>
        </div>

        <div className="p-6 space-y-6">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div className="space-y-2">
              <label className="text-sm font-medium text-ui-fg-base">Authorization Key</label>
              <input
                type="text"
                value={config.authorization}
                onChange={(e) => setConfig({ ...config, authorization: e.target.value })}
                className="w-full px-3 py-2 bg-ui-bg-subtle border border-ui-border-base rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500/50 transition-shadow text-sm"
                placeholder="wPNB8Uz5bhSFEL7CDy..."
              />
            </div>
            <div className="space-y-2">
              <label className="text-sm font-medium text-ui-fg-base">From (Kullanıcı Adı)</label>
              <input
                type="text"
                value={config.from_name}
                onChange={(e) => setConfig({ ...config, from_name: e.target.value })}
                className="w-full px-3 py-2 bg-ui-bg-subtle border border-ui-border-base rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500/50 transition-shadow text-sm"
                placeholder="Örn: test@firma.com"
              />
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div className="space-y-2">
              <label className="text-sm font-medium text-ui-fg-base">Şube Kodu (Varış)</label>
              <input
                type="text"
                value={config.branch_code}
                onChange={(e) => setConfig({ ...config, branch_code: e.target.value })}
                className="w-full px-3 py-2 bg-ui-bg-subtle border border-ui-border-base rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500/50 transition-shadow text-sm"
                placeholder="Zorunluysa giriniz..."
              />
            </div>
            <div className="space-y-2">
              <label className="text-sm font-medium text-ui-fg-base">Vergi Dairesi (Opsiyonel)</label>
              <input
                type="text"
                value={config.tax_office}
                onChange={(e) => setConfig({ ...config, tax_office: e.target.value })}
                className="w-full px-3 py-2 bg-ui-bg-subtle border border-ui-border-base rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500/50 transition-shadow text-sm"
                placeholder="Vergi Dairesi"
              />
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div className="space-y-2">
              <label className="text-sm font-medium text-ui-fg-base">Vergi / TC No (Opsiyonel)</label>
              <input
                type="text"
                value={config.tax_number}
                onChange={(e) => setConfig({ ...config, tax_number: e.target.value })}
                className="w-full px-3 py-2 bg-ui-bg-subtle border border-ui-border-base rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500/50 transition-shadow text-sm"
                placeholder="11111111111"
              />
            </div>
          </div>
        </div>

        <div className="p-6 bg-ui-bg-subtle border-t border-ui-border-base flex items-center justify-between">
          <div className="text-sm text-ui-fg-subtle">
            API bilgilerini İnterline yöneticinizden alabilirsiniz.
          </div>
          <div className="flex gap-3 items-center">
            {saveSuccess && (
              <span className="flex items-center text-sm text-emerald-600 font-medium">
                <CheckCircle className="w-4 h-4 mr-1" />
                Kaydedildi
              </span>
            )}
            <button
              onClick={handleSave}
              disabled={saving}
              className={`px-5 py-2 rounded-md font-medium text-sm transition-all shadow-sm
                ${saving 
                  ? 'bg-blue-400 text-white cursor-not-allowed' 
                  : 'bg-blue-600 hover:bg-blue-700 text-white hover:shadow-md'
                }`}
            >
              {saving ? 'Kaydediliyor...' : 'Ayarları Kaydet'}
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}

export const config = defineRouteConfig({
  label: "İnterline Kargo",
  icon: CheckCircle,
})

export default InterlineSettings
