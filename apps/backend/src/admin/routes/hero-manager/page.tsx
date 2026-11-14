import { useState, useEffect } from "react"
import { defineRouteConfig } from "@medusajs/admin-sdk"
import { Sparkles, ComputerDesktop, CheckCircle, Plus, Trash, ArrowPath } from "@medusajs/icons"

interface Category {
  name: string
  handle: string
  icon: string
}

interface Banner {
  tag: string
  title: string
  description: string
  btn_text: string
  btn_link: string
  image_url: string
}

const defaultCategories: Category[] = [
  {
    name: "Jean Pantolon",
    handle: "jean-pantolon",
    icon: `<svg class="w-8 h-8" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M8.25 3v18M15.75 3v18M8.25 8.25h7.5M8.25 15.75h7.5M3.75 5.25h16.5M3.75 18.75h16.5" /></svg>`
  },
  {
    name: "Tayt",
    handle: "tayt",
    icon: `<svg class="w-8 h-8" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M9 3v18l3-4 3 4V3H9z" /><path stroke-linecap="round" stroke-linejoin="round" d="M6 5.25h12M6 18.75h12" /></svg>`
  },
  {
    name: "Sweat",
    handle: "sweat",
    icon: `<svg class="w-8 h-8" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M5.25 5.25h13.5v15H5.25z" /><path stroke-linecap="round" stroke-linejoin="round" d="M9 5.25V3h6v2.25M9.75 10.5h4.5M9.75 14.25h4.5" /></svg>`
  },
  {
    name: "Mont & Kürk",
    handle: "mont",
    icon: `<svg class="w-8 h-8" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M4.5 5.25v15a1.5 1.5 0 0 0 1.5 1.5h12a1.5 1.5 0 0 0 1.5-1.5v-15a3 3 0 0 0-3-3h-9a3 3 0 0 0-3 3z" /><path stroke-linecap="round" stroke-linejoin="round" d="M12 2.25v19.5M8.25 7.5h7.5M8.25 11.25h7.5" /></svg>`
  },
  {
    name: "Kombin",
    handle: "kombin",
    icon: `<svg class="w-8 h-8" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M12 3v18M3 12h18M6.75 6.75h10.5v10.5H6.75z" /></svg>`
  },
  {
    name: "Tshirt",
    handle: "tshirt",
    icon: `<svg class="w-8 h-8" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M18 5.25V3.75a1.5 1.5 0 0 0-1.5-1.5h-9A1.5 1.5 0 0 0 6 3.75v1.5M6 5.25 3 6v4.5l3-.75V20.25a1.5 1.5 0 0 0 1.5 1.5h9a1.5 1.5 0 0 0 1.5-1.5V9.75l3 .75V6l-3-.75" /></svg>`
  },
  {
    name: "Gözlük",
    handle: "gozluk",
    icon: `<svg class="w-8 h-8" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M6 9h12a3 3 0 0 1 3 3v1.5a3 3 0 0 1-3 3H6a3 3 0 0 1-3-3V12a3 3 0 0 1 3-3Z" /><path stroke-linecap="round" stroke-linejoin="round" d="M12 9.75a3 3 0 0 1-3 3H6a3 3 0 0 1-3-3M18 9.75a3 3 0 0 1-3 3h-3" /></svg>`
  },
  {
    name: "Çanta",
    handle: "canta",
    icon: `<svg class="w-8 h-8" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 1 0-7.5 0v4.5m11.356-1.993 1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 0 1-1.12-1.243l1.264-12A1.125 1.125 0 0 1 5.513 7.5h12.974c.576 0 1.059.435 1.119 1.007ZM8.625 10.5a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm7.5 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z" /></svg>`
  }
]

const defaultBanners: Banner[] = [
  {
    tag: "Trend Koleksiyon",
    title: "PREMIUM JEAN KOLEKSİYONU",
    description: "En boy likralı kot taytlar ve yüksek bel toparlayıcı jean pantolonlar şimdi en popüler kesimleriyle vitrinde.",
    btn_text: "Koleksiyonu Keşfet",
    btn_link: "/categories/jean-pantolon",
    image_url: ""
  },
  {
    tag: "Özel Seçki",
    title: "YAZ SEZONU KOMBİNLERİ",
    description: "Oysho modal kumaş şalvar takımlar ve çift şerit paraşüt kargo pantolonlar ile konforlu ve şık kombinler.",
    btn_text: "Şimdi İncele",
    btn_link: "/categories/kombin",
    image_url: ""
  }
]


const THEME_3095_HTML = "  <section id=\"theme-view-section\" class=\"flex-1 flex flex-col bg-[#f1f3f6]\">\n    <!-- Sub-Navigation Bar: Tasarım (Exact bildirimler.html hsub-menu) -->\n    <div class=\"bg-white border-b border-slate-200 shadow-2xs\">\n      <div class=\"max-w-[1640px] mx-auto px-5 min-h-[52px] flex items-center justify-between gap-3 relative\">\n        <div class=\"text-[13.5px] font-bold text-slate-900 shrink-0\">Tasarım</div>\n        <div class=\"flex items-center gap-4 overflow-x-auto text-[12px] font-semibold py-1\">\n          <button type=\"button\" id=\"theme-subtab-theme\" onclick=\"switchThemeSubView('theme')\" class=\"theme-subtab py-3.5 border-b-2 border-[#1565c0] text-[#1565c0] whitespace-nowrap cursor-pointer\">Temalar</button>\n          <button type=\"button\" id=\"theme-subtab-modules\" onclick=\"switchThemeSubView('modules')\" class=\"theme-subtab py-3.5 border-b-2 border-transparent text-slate-600 hover:text-slate-900 whitespace-nowrap cursor-pointer\">Blok Yönetimi</button>\n          <button type=\"button\" id=\"theme-subtab-image\" onclick=\"switchThemeSubView('image')\" class=\"theme-subtab py-3.5 border-b-2 border-transparent text-slate-600 hover:text-slate-900 whitespace-nowrap cursor-pointer\">Görsel Optimizasyonu</button>\n          <button type=\"button\" id=\"theme-subtab-seo\" onclick=\"switchThemeSubView('seo')\" class=\"theme-subtab py-3.5 border-b-2 border-transparent text-slate-600 hover:text-slate-900 whitespace-nowrap cursor-pointer\">SEO Optimizasyonu</button>\n          <button type=\"button\" id=\"theme-subtab-redirect301\" onclick=\"switchThemeSubView('redirect301')\" class=\"theme-subtab py-3.5 border-b-2 border-transparent text-slate-600 hover:text-slate-900 whitespace-nowrap cursor-pointer\">301 Yönlendirmeleri</button>\n          <button type=\"button\" id=\"theme-subtab-page404\" onclick=\"switchThemeSubView('page404')\" class=\"theme-subtab py-3.5 border-b-2 border-transparent text-slate-600 hover:text-slate-900 whitespace-nowrap cursor-pointer\">404 Kırık Linkler</button>\n          <button type=\"button\" id=\"theme-subtab-sitemap\" onclick=\"switchThemeSubView('sitemap')\" class=\"theme-subtab py-3.5 border-b-2 border-transparent text-slate-600 hover:text-slate-900 whitespace-nowrap cursor-pointer\">Sitemap</button>\n          <button type=\"button\" id=\"theme-subtab-upload\" onclick=\"switchThemeSubView('upload')\" class=\"theme-subtab py-3.5 border-b-2 border-transparent text-slate-600 hover:text-slate-900 whitespace-nowrap cursor-pointer\">Görsel Yükle</button>\n          <span class=\"text-slate-300\">|</span>\n          <span class=\"text-[11px] font-bold text-[#1565c0] uppercase tracking-wider whitespace-nowrap\">İçerikler:</span>\n          <button type=\"button\" id=\"theme-subtab-pages\" onclick=\"switchThemeSubView('pages')\" class=\"theme-subtab py-3.5 border-b-2 border-transparent text-slate-600 hover:text-slate-900 whitespace-nowrap cursor-pointer\">Sayfalar</button>\n          <button type=\"button\" id=\"theme-subtab-help\" onclick=\"switchThemeSubView('help')\" class=\"theme-subtab py-3.5 border-b-2 border-transparent text-slate-600 hover:text-slate-900 whitespace-nowrap cursor-pointer\">Yardım İçerikleri</button>\n          <button type=\"button\" id=\"theme-subtab-sss\" onclick=\"switchThemeSubView('sss')\" class=\"theme-subtab py-3.5 border-b-2 border-transparent text-slate-600 hover:text-slate-900 whitespace-nowrap cursor-pointer\">S.S.S.</button>\n          <button type=\"button\" id=\"theme-subtab-blog\" onclick=\"switchThemeSubView('blog')\" class=\"theme-subtab py-3.5 border-b-2 border-transparent text-slate-600 hover:text-slate-900 whitespace-nowrap cursor-pointer\">Blog</button>\n          <button type=\"button\" id=\"theme-subtab-headlines\" onclick=\"switchThemeSubView('headlines')\" class=\"theme-subtab py-3.5 border-b-2 border-transparent text-slate-600 hover:text-slate-900 whitespace-nowrap cursor-pointer\">Manşetler</button>\n          <button type=\"button\" id=\"theme-subtab-banners\" onclick=\"switchThemeSubView('banners')\" class=\"theme-subtab py-3.5 border-b-2 border-transparent text-slate-600 hover:text-slate-900 whitespace-nowrap cursor-pointer\">Bannerlar</button>\n          <button type=\"button\" id=\"theme-subtab-popup\" onclick=\"switchThemeSubView('popup')\" class=\"theme-subtab py-3.5 border-b-2 border-transparent text-slate-600 hover:text-slate-900 whitespace-nowrap cursor-pointer\">Popup</button>\n          <button type=\"button\" id=\"theme-subtab-story\" onclick=\"switchThemeSubView('story')\" class=\"theme-subtab py-3.5 border-b-2 border-transparent text-slate-600 hover:text-slate-900 whitespace-nowrap cursor-pointer\">Story</button>\n        </div>\n      </div>\n    </div>\n\n    <!-- 1. TEMALAR (/admin/store/theme - .selected-theme-v2 & .theme-list-v2) -->\n    <div id=\"subview-theme-theme\" class=\"theme-subview max-w-[1260px] w-full mx-auto px-5 py-7\">\n      <!-- .selected-theme-v2 -->\n      <div class=\"bg-white rounded-[8px] border border-[#ebedf2] p-[30px] mb-[30px] shadow-2xs grid grid-cols-1 lg:grid-cols-12 gap-8 items-center\">\n        <div class=\"lg:col-span-6\">\n          <div class=\"inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-[#e0f6e7] text-[#08976d] text-[12px] font-bold mb-3\">\n            <span>✓</span> Aktif Mağaza Teması\n          </div>\n          <div class=\"text-[28px] font-bold text-[#0abb87] leading-tight\">EntegreShop Pro V5.2</div>\n          <p class=\"text-[14px] text-[#74788d] mt-2 mb-6 leading-relaxed\">\n            Yüksek dönüşüm odaklı, %100 mobil uyumlu (Responsive), Google Core Web Vitals &amp; Rocket Cache hız optimizasyonlu yeni nesil e-ticaret teması.\n          </p>\n          <div class=\"grid grid-cols-1 sm:grid-cols-2 gap-[12px]\">\n            \n              <button type=\"button\" onclick=\"alert('Renkler & Görünüm Ayarları özelleştirme paneli açıldı.')\" class=\"p-[14px] rounded-[5px] border border-[#e6e6e6] bg-[#f8f9fb] hover:bg-[#eef4ff] hover:border-[#3d94fb] text-left text-[13px] font-semibold text-[#48465b] flex items-center gap-2.5 transition cursor-pointer\">\n                <span class=\"text-[16px]\">🎨</span>\n                <span>Renkler & Görünüm Ayarları</span>\n              </button>\n            \n              <button type=\"button\" onclick=\"alert('Yazı Tipleri (Fontlar) özelleştirme paneli açıldı.')\" class=\"p-[14px] rounded-[5px] border border-[#e6e6e6] bg-[#f8f9fb] hover:bg-[#eef4ff] hover:border-[#3d94fb] text-left text-[13px] font-semibold text-[#48465b] flex items-center gap-2.5 transition cursor-pointer\">\n                <span class=\"text-[16px]\">🔤</span>\n                <span>Yazı Tipleri (Fontlar)</span>\n              </button>\n            \n              <button type=\"button\" onclick=\"alert('Üst Alan (Header) Tasarımı özelleştirme paneli açıldı.')\" class=\"p-[14px] rounded-[5px] border border-[#e6e6e6] bg-[#f8f9fb] hover:bg-[#eef4ff] hover:border-[#3d94fb] text-left text-[13px] font-semibold text-[#48465b] flex items-center gap-2.5 transition cursor-pointer\">\n                <span class=\"text-[16px]\">🔝</span>\n                <span>Üst Alan (Header) Tasarımı</span>\n              </button>\n            \n              <button type=\"button\" onclick=\"alert('Alt Alan (Footer) Tasarımı özelleştirme paneli açıldı.')\" class=\"p-[14px] rounded-[5px] border border-[#e6e6e6] bg-[#f8f9fb] hover:bg-[#eef4ff] hover:border-[#3d94fb] text-left text-[13px] font-semibold text-[#48465b] flex items-center gap-2.5 transition cursor-pointer\">\n                <span class=\"text-[16px]\">🔻</span>\n                <span>Alt Alan (Footer) Tasarımı</span>\n              </button>\n            \n              <button type=\"button\" onclick=\"alert('Ürün Kartı & Liste Görünümü özelleştirme paneli açıldı.')\" class=\"p-[14px] rounded-[5px] border border-[#e6e6e6] bg-[#f8f9fb] hover:bg-[#eef4ff] hover:border-[#3d94fb] text-left text-[13px] font-semibold text-[#48465b] flex items-center gap-2.5 transition cursor-pointer\">\n                <span class=\"text-[16px]\">🛍️</span>\n                <span>Ürün Kartı & Liste Görünümü</span>\n              </button>\n            \n              <button type=\"button\" onclick=\"alert('Özel CSS / JS Düzenleyici özelleştirme paneli açıldı.')\" class=\"p-[14px] rounded-[5px] border border-[#e6e6e6] bg-[#f8f9fb] hover:bg-[#eef4ff] hover:border-[#3d94fb] text-left text-[13px] font-semibold text-[#48465b] flex items-center gap-2.5 transition cursor-pointer\">\n                <span class=\"text-[16px]\"></></span>\n                <span>Özel CSS / JS Düzenleyici</span>\n              </button>\n            \n          </div>\n        </div>\n        <div class=\"lg:col-span-6\">\n          <div class=\"rounded-[10px] border border-[#e6e6e6] bg-[#f8fafc] p-4 shadow-inner\">\n            <div class=\"bg-white rounded-[6px] border border-slate-200 overflow-hidden\">\n              <div class=\"bg-slate-900 text-white px-4 py-2 flex items-center justify-between text-[11px]\">\n                <div class=\"flex items-center gap-1.5\">\n                  <span class=\"w-2.5 h-2.5 rounded-full bg-red-400\"></span>\n                  <span class=\"w-2.5 h-2.5 rounded-full bg-amber-400\"></span>\n                  <span class=\"w-2.5 h-2.5 rounded-full bg-emerald-400\"></span>\n                </div>\n                <span class=\"font-mono text-slate-300\">Canlı Tema Önizleme (Masaüstü &amp; Mobil)</span>\n                <span class=\"text-emerald-400 font-bold\">100/100 Hız</span>\n              </div>\n              <div class=\"p-5\">\n                <div class=\"flex items-center justify-between pb-3 mb-4 border-b border-slate-100\">\n                  <img src=\"data:image/png;base64,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\" alt=\"Logo\" class=\"h-7 object-contain\" />\n                  <div class=\"flex items-center gap-3 text-[11px] font-bold text-slate-600\">\n                    <span>YENİ GELENLER</span>\n                    <span>KATEGORİLER</span>\n                    <span>KAMPANYALAR</span>\n                    <span class=\"px-2 py-0.5 rounded bg-[#0abb87] text-white\">SEPET (2)</span>\n                  </div>\n                </div>\n                <div class=\"grid grid-cols-3 gap-3\">\n                  <img src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAYEBQUFBAYFBQUHBgYHCQ8KCQgICRMNDgsPFhMXFxYTFRUYGyMeGBohGhUVHikfISQlJygnGB0rLismLiMmJyb/2wBDAQYHBwkICRIKChImGRUZJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJib/wAARCABAAEADASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDudUv4La1NjauXtmZXmndfnu5Bzk55Cg9B+JrM01p73WLN5VURrMuF2jCjNZuryvpOotBqG66uXbbCAMLgKDye35VRtdXifxFpaXErzSNexoqw/LFGcg9M5J9z+lQUk3sd14m1600fVtEsbqJfLv5XjEuPuMAMcAHOSQPavN/EVoLfxikhUbTaMxGB/wA9BmvWLyzivL7Tp2iR3t5yQxUEqCOcfpXBeKbYN4iQEf8AMOlP/kRardEsgl1VLrzIo5YrtYmKtFwQig4GMfd6e/NZGq2sklmn2B0M4l35OFfbzwCOvNcVqEs1pqO2CYxO00gDAkdGPpV/RvEtw9u3mLHdbWwxGVbPvjr19KtSJt1IPGLS2z2kjwKlzLBmdQg+Z84yccdq537bJLHs3gd8YDZP0rV8WarDdyoyW7K0YZWD8+mP84rEgAfO5EOCACBnHtUy3Gj6a8faUs+p6bMB/rHYAj/rlXk2kQLB4w0nGSEvY85OSfmAr33xJCryaacfdlOP+/LV4KIFt/GtoWDAi8jOA3H3xzSeo1Jxbse92ACttI5Df0ry/wAdXU9tdrc28csspsJI08qIysC0yDdtHUKCSfYV6bbyf6TLjt0/I183fFjUdf0vxoZ1uHht5LbybT7PcMrBMfPnGMZycj6VN9DelSVSdmcv4j1RJdbaJSjGEg5jLkSFsliN3qefT09Km8JOslnOpYn97wSOpx05rKhlu/EGvW8RjAb5225Z9q8nag5wBliAOOTXQeDLe2jtZEe4ieNZNwZNyscjPPbNEdrBiKfJMwtfvkSadVjfd5m3AI5+lN0e6EsDOkeRvPyk5xirN5pxvtSa03FFluCFlBwQfcnp1og0+GykltGaWRkYDdEUcMT7g4pnOfYcptjBDBqCXBWIhlubdt5HyY+ZDz0J6ZrB1HwbpUsZ1jT75LmO2YSsY35GDnBU5I/zxWhI8pPzS7flXoPYVVlghYs4ZxNjBkQ7WI9D6j2Oai9i7JhY3rSTfLbuA5wzblIXg985/SvAfj2bZru1EUga+RiZFDHKJtGB6YJz+Ve620i2EzfaLJrqDIJe3fy3Hvt6H9K+ZPi2t/F4s1a4ujK1vd3LvYtJjcYAAFyO2BgY9jSWvyOmhpO3cxfCOpzHxZYXKwwRTFjEAqbQcgjoO/P6V1tjpsem27holyTlvLyD0x0qnaaPGvxqtNGWLzkimijZIRtLFYFyBzwcg16vN4XiLFLW/ms5Sci3vo8fgM4z+Ga0RnXlex4+kx/tG5CvIpkJJBPzHJ/nS/ZlEjMlxJGHkzukJJB9ea7jUPBmt297JPLo0N0hbcJLZvm6+n/1qx7i1tIZgswns5c8pKv/AOqqsc1z6NlOSCD/AAjn8KrNJztHX24qecSfK3lOAwHUewqm6vn5o3JHQYNYmw5yoB3P82OcV8+fH54p/FenW0bKzQ2Y80A5K7pGIB9yMfnXvTGTdtETLjnG3rXKeJvCPhbXb63vrnQZrW9ibdO63DMbthgBmA4A46CmjSnJQldnjXgWTUrH4l22tz2M8sgllmX7RuTzcgrkMeuA3X1r6h0nxToOrIlpqMX2SV+BBeINrfRuhrk7k3c6wo7ySRwKVhjkJYRr3AB6DgcD0ql9m3r5LoXj6FHXKD39jVXZE5c7PR7rwrp8g36dcz6exGQI23xn/gLZH5Yrn9S8N6wvyXOnWmtW+f8AllhX/wC+H4/I1kabNrGlJv067lhQ/wDLCbMkJ/qK6bS/GwSSFNasJbJiwHnxfPGfx7VSaMnE/9k=\" class=\"w-full h-28 object-cover rounded border border-slate-200\" />\n                  <img src=\"data:image/jpeg;base64,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\" class=\"w-full h-28 object-cover rounded border border-slate-200\" />\n                  <img src=\"data:image/jpeg;base64,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\" class=\"w-full h-28 object-cover rounded border border-slate-200\" />\n                </div>\n              </div>\n            </div>\n          </div>\n        </div>\n      </div>\n\n      <!-- .theme-list-v2 -->\n      <h3 class=\"text-[16px] font-bold text-[#48465b] mb-4\">Hazır Tema Kütüphanesi</h3>\n      <div class=\"grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5\">\n        \n          <div class=\"bg-white rounded-[8px] border border-2 border-[#0abb87] p-4 shadow-2xs flex flex-col justify-between\">\n            <div>\n              <div class=\"h-44 rounded-[6px] overflow-hidden border border-slate-100 mb-3 bg-slate-50\">\n                <img src=\"data:image/jpeg;base64,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\" alt=\"EntegreShop Pro V5.2\" class=\"w-full h-full object-cover\" />\n              </div>\n              <div class=\"text-[14.5px] font-bold text-[#1e293b]\">EntegreShop Pro V5.2</div>\n              <div class=\"text-[12px] text-[#74788d] mt-0.5 mb-4\">Genel & Çok Amaçlı</div>\n            </div>\n            <button type=\"button\" class=\"w-full h-[34px] rounded-[4px] bg-[#e0f6e7] text-[#08976d] text-[12.5px] font-bold cursor-default\">✓ Etkin Tema</button>\n          </div>\n        \n          <div class=\"bg-white rounded-[8px] border border-[#ebedf2] p-4 shadow-2xs flex flex-col justify-between\">\n            <div>\n              <div class=\"h-44 rounded-[6px] overflow-hidden border border-slate-100 mb-3 bg-slate-50\">\n                <img src=\"data:image/jpeg;base64,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\" alt=\"Moda & Butik Luxury V5\" class=\"w-full h-full object-cover\" />\n              </div>\n              <div class=\"text-[14.5px] font-bold text-[#1e293b]\">Moda & Butik Luxury V5</div>\n              <div class=\"text-[12px] text-[#74788d] mt-0.5 mb-4\">Kadın / Erkek Giyim & Tekstil</div>\n            </div>\n            <button type=\"button\" onclick=\"alert('Moda & Butik Luxury V5 teması aktif edildi!')\" class=\"w-full h-[34px] rounded-[4px] bg-[#3d94fb] hover:bg-[#2b82ec] text-white text-[12.5px] font-semibold cursor-pointer\">Temayı Etkinleştir</button>\n          </div>\n        \n          <div class=\"bg-white rounded-[8px] border border-[#ebedf2] p-4 shadow-2xs flex flex-col justify-between\">\n            <div>\n              <div class=\"h-44 rounded-[6px] overflow-hidden border border-slate-100 mb-3 bg-slate-50\">\n                <img src=\"data:image/jpeg;base64,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\" alt=\"AutoParts & Bodykit Pro\" class=\"w-full h-full object-cover\" />\n              </div>\n              <div class=\"text-[14.5px] font-bold text-[#1e293b]\">AutoParts & Bodykit Pro</div>\n              <div class=\"text-[12px] text-[#74788d] mt-0.5 mb-4\">Otomotiv & Yedek Parça</div>\n            </div>\n            <button type=\"button\" onclick=\"alert('AutoParts & Bodykit Pro teması aktif edildi!')\" class=\"w-full h-[34px] rounded-[4px] bg-[#3d94fb] hover:bg-[#2b82ec] text-white text-[12.5px] font-semibold cursor-pointer\">Temayı Etkinleştir</button>\n          </div>\n        \n          <div class=\"bg-white rounded-[8px] border border-[#ebedf2] p-4 shadow-2xs flex flex-col justify-between\">\n            <div>\n              <div class=\"h-44 rounded-[6px] overflow-hidden border border-slate-100 mb-3 bg-slate-50\">\n                <img src=\"data:image/jpeg;base64,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\" alt=\"MegaStore Elektronik V5\" class=\"w-full h-full object-cover\" />\n              </div>\n              <div class=\"text-[14.5px] font-bold text-[#1e293b]\">MegaStore Elektronik V5</div>\n              <div class=\"text-[12px] text-[#74788d] mt-0.5 mb-4\">Teknoloji & Yapı Market</div>\n            </div>\n            <button type=\"button\" onclick=\"alert('MegaStore Elektronik V5 teması aktif edildi!')\" class=\"w-full h-[34px] rounded-[4px] bg-[#3d94fb] hover:bg-[#2b82ec] text-white text-[12.5px] font-semibold cursor-pointer\">Temayı Etkinleştir</button>\n          </div>\n        \n      </div>\n    </div>\n\n    <!-- 2. BLOK YÖNETİMİ (/admin/store/modules - .pattern-modules & .pattern-module-groups) -->\n    <div id=\"subview-theme-modules\" class=\"theme-subview hidden max-w-[1260px] w-full mx-auto px-5 py-7\">\n      <div class=\"bg-white rounded-[6px] border border-[#ebedf2] p-[25px] shadow-2xs\">\n        <div class=\"flex flex-wrap items-center justify-between gap-4 pb-5 mb-6 border-b border-[#ebedf2]\">\n          <div>\n            <h3 class=\"text-[18px] font-medium text-[#48465b]\">Blok Yönetimi (Sürükle &amp; Bırak Sayfa Düzeni)</h3>\n            <p class=\"text-[13px] text-[#74788d] mt-1\">Ana sayfa, ürün detay ve kategori sayfalarındaki modül bloklarının sırasını ve genişliklerini yönetebilirsiniz.</p>\n          </div>\n          <div class=\"flex items-center gap-3\">\n            <select id=\"modules-theme-id\" class=\"h-[38px] px-3 rounded-[4px] border border-[#e2e5ec] bg-white text-[13px] font-medium\">\n              <option>Sayfa: Ana Sayfa Şablonu</option>\n              <option>Sayfa: Ürün Detay Şablonu</option>\n              <option>Sayfa: Kategori Listeleme Şablonu</option>\n              <option>Sayfa: Sepet &amp; Ödeme Şablonu</option>\n            </select>\n            <button type=\"button\" onclick=\"alert('Yeni Blok Grubu eklendi!')\" class=\"h-[38px] px-4 rounded-[4px] bg-[#0abb87] text-white text-[13px] font-medium cursor-pointer\">+ Yeni Blok Satırı Ekle</button>\n          </div>\n        </div>\n\n        <div class=\"grid grid-cols-1 lg:grid-cols-12 gap-6\">\n          <!-- Left: Available Modules (.pattern-modules) -->\n          <div class=\"lg:col-span-4 border border-[#e6e8f2] rounded-[4px] p-4 bg-[#fafbfe]\">\n            <div class=\"text-[13.5px] font-bold text-[#48465b] mb-3\">Eklenebilir Modül Blokları</div>\n            <div class=\"space-y-2\">\n              \n                <div class=\"bg-[#e8edf7] border border-[#cad2e3] rounded-[4px] px-3.5 py-2.5 flex items-center justify-between text-[12.5px] font-semibold text-[#1e293b] cursor-move\">\n                  <span>☰ Yuvarlak Story (Hikayeler) Barı</span>\n                  <span class=\"px-2 py-0.5 rounded bg-white text-[#3d94fb] text-[11px] font-bold\">Story</span>\n                </div>\n              \n                <div class=\"bg-[#e8edf7] border border-[#cad2e3] rounded-[4px] px-3.5 py-2.5 flex items-center justify-between text-[12.5px] font-semibold text-[#1e293b] cursor-move\">\n                  <span>☰ Ana Manşet Slider (Tam Genişlik)</span>\n                  <span class=\"px-2 py-0.5 rounded bg-white text-[#3d94fb] text-[11px] font-bold\">Slider</span>\n                </div>\n              \n                <div class=\"bg-[#e8edf7] border border-[#cad2e3] rounded-[4px] px-3.5 py-2.5 flex items-center justify-between text-[12.5px] font-semibold text-[#1e293b] cursor-move\">\n                  <span>☰ 3'lü Kampanya Vitrin Banner</span>\n                  <span class=\"px-2 py-0.5 rounded bg-white text-[#3d94fb] text-[11px] font-bold\">Banner</span>\n                </div>\n              \n                <div class=\"bg-[#e8edf7] border border-[#cad2e3] rounded-[4px] px-3.5 py-2.5 flex items-center justify-between text-[12.5px] font-semibold text-[#1e293b] cursor-move\">\n                  <span>☰ Çok Satan Ürünler Karuseli</span>\n                  <span class=\"px-2 py-0.5 rounded bg-white text-[#3d94fb] text-[11px] font-bold\">Ürünler</span>\n                </div>\n              \n                <div class=\"bg-[#e8edf7] border border-[#cad2e3] rounded-[4px] px-3.5 py-2.5 flex items-center justify-between text-[12.5px] font-semibold text-[#1e293b] cursor-move\">\n                  <span>☰ Yeni Eklenen Ürünler Vitrini</span>\n                  <span class=\"px-2 py-0.5 rounded bg-white text-[#3d94fb] text-[11px] font-bold\">Ürünler</span>\n                </div>\n              \n                <div class=\"bg-[#e8edf7] border border-[#cad2e3] rounded-[4px] px-3.5 py-2.5 flex items-center justify-between text-[12.5px] font-semibold text-[#1e293b] cursor-move\">\n                  <span>☰ Hızlı İndirim / Fırsat Sayacı</span>\n                  <span class=\"px-2 py-0.5 rounded bg-white text-[#3d94fb] text-[11px] font-bold\">Kampanya</span>\n                </div>\n              \n                <div class=\"bg-[#e8edf7] border border-[#cad2e3] rounded-[4px] px-3.5 py-2.5 flex items-center justify-between text-[12.5px] font-semibold text-[#1e293b] cursor-move\">\n                  <span>☰ Popüler Kategoriler Grid</span>\n                  <span class=\"px-2 py-0.5 rounded bg-white text-[#3d94fb] text-[11px] font-bold\">Kategori</span>\n                </div>\n              \n                <div class=\"bg-[#e8edf7] border border-[#cad2e3] rounded-[4px] px-3.5 py-2.5 flex items-center justify-between text-[12.5px] font-semibold text-[#1e293b] cursor-move\">\n                  <span>☰ Müşteri Yorumları & Güvence İkonları</span>\n                  <span class=\"px-2 py-0.5 rounded bg-white text-[#3d94fb] text-[11px] font-bold\">Güven</span>\n                </div>\n              \n            </div>\n          </div>\n\n          <!-- Right: Active Page Layout (.pattern-module-groups) -->\n          <div class=\"lg:col-span-8 space-y-4\">\n            \n              <div class=\"border border-dashed border-[#cccccc] rounded-[4px] p-4 bg-white\">\n                <div class=\"flex items-center justify-between mb-3\">\n                  <div class=\"flex items-center gap-2\">\n                    <span class=\"px-2.5 py-1 rounded bg-[#eef1f8] text-[#48465b] text-[12px] font-bold\">1. Satır — Üst Hikayeler & Geniş Manşet Alanı</span>\n                    <span class=\"px-2.5 py-1 rounded bg-[#f0f3ff] text-[#3d94fb] text-[11px] font-semibold\">Tam Genişlik (12 Sütun)</span>\n                  </div>\n                  <div class=\"flex items-center gap-1.5\">\n                    <button type=\"button\" class=\"h-[26px] px-2.5 rounded border border-slate-200 text-[11.5px] font-semibold text-slate-600 cursor-pointer\">+ Sütun</button>\n                    <button type=\"button\" class=\"w-[26px] h-[26px] rounded bg-red-50 text-red-600 text-[12px] cursor-pointer\">🗑</button>\n                  </div>\n                </div>\n                <div class=\"grid grid-cols-1 md:grid-cols-2 gap-3\">\n                  \n                    <div class=\"border border-dashed border-[#cad2e3] rounded-[4px] p-3 bg-[#f8fafc] flex items-center justify-between text-[12.5px] font-semibold text-[#334155]\">\n                      <span>Yuvarlak Story (Hikayeler) Barı</span>\n                      <span class=\"text-[#0abb87] text-[11px] font-bold\">✓ Aktif</span>\n                    </div>\n                  \n                    <div class=\"border border-dashed border-[#cad2e3] rounded-[4px] p-3 bg-[#f8fafc] flex items-center justify-between text-[12.5px] font-semibold text-[#334155]\">\n                      <span>Ana Manşet Slider (Masaüstü + Mobil)</span>\n                      <span class=\"text-[#0abb87] text-[11px] font-bold\">✓ Aktif</span>\n                    </div>\n                  \n                </div>\n              </div>\n            \n              <div class=\"border border-dashed border-[#cccccc] rounded-[4px] p-4 bg-white\">\n                <div class=\"flex items-center justify-between mb-3\">\n                  <div class=\"flex items-center gap-2\">\n                    <span class=\"px-2.5 py-1 rounded bg-[#eef1f8] text-[#48465b] text-[12px] font-bold\">2. Satır — 3'lü Kategori & Kampanya Bannerları</span>\n                    <span class=\"px-2.5 py-1 rounded bg-[#f0f3ff] text-[#3d94fb] text-[11px] font-semibold\">Kutu İçi (Container)</span>\n                  </div>\n                  <div class=\"flex items-center gap-1.5\">\n                    <button type=\"button\" class=\"h-[26px] px-2.5 rounded border border-slate-200 text-[11.5px] font-semibold text-slate-600 cursor-pointer\">+ Sütun</button>\n                    <button type=\"button\" class=\"w-[26px] h-[26px] rounded bg-red-50 text-red-600 text-[12px] cursor-pointer\">🗑</button>\n                  </div>\n                </div>\n                <div class=\"grid grid-cols-1 md:grid-cols-3 gap-3\">\n                  \n                    <div class=\"border border-dashed border-[#cad2e3] rounded-[4px] p-3 bg-[#f8fafc] flex items-center justify-between text-[12.5px] font-semibold text-[#334155]\">\n                      <span>Sol Banner (4 Sütun)</span>\n                      <span class=\"text-[#0abb87] text-[11px] font-bold\">✓ Aktif</span>\n                    </div>\n                  \n                    <div class=\"border border-dashed border-[#cad2e3] rounded-[4px] p-3 bg-[#f8fafc] flex items-center justify-between text-[12.5px] font-semibold text-[#334155]\">\n                      <span>Orta Banner (4 Sütun)</span>\n                      <span class=\"text-[#0abb87] text-[11px] font-bold\">✓ Aktif</span>\n                    </div>\n                  \n                    <div class=\"border border-dashed border-[#cad2e3] rounded-[4px] p-3 bg-[#f8fafc] flex items-center justify-between text-[12.5px] font-semibold text-[#334155]\">\n                      <span>Sağ Banner (4 Sütun)</span>\n                      <span class=\"text-[#0abb87] text-[11px] font-bold\">✓ Aktif</span>\n                    </div>\n                  \n                </div>\n              </div>\n            \n              <div class=\"border border-dashed border-[#cccccc] rounded-[4px] p-4 bg-white\">\n                <div class=\"flex items-center justify-between mb-3\">\n                  <div class=\"flex items-center gap-2\">\n                    <span class=\"px-2.5 py-1 rounded bg-[#eef1f8] text-[#48465b] text-[12px] font-bold\">3. Satır — Vitrin & Çok Satan Ürünler</span>\n                    <span class=\"px-2.5 py-1 rounded bg-[#f0f3ff] text-[#3d94fb] text-[11px] font-semibold\">Kutu İçi (Container)</span>\n                  </div>\n                  <div class=\"flex items-center gap-1.5\">\n                    <button type=\"button\" class=\"h-[26px] px-2.5 rounded border border-slate-200 text-[11.5px] font-semibold text-slate-600 cursor-pointer\">+ Sütun</button>\n                    <button type=\"button\" class=\"w-[26px] h-[26px] rounded bg-red-50 text-red-600 text-[12px] cursor-pointer\">🗑</button>\n                  </div>\n                </div>\n                <div class=\"grid grid-cols-1 md:grid-cols-1 gap-3\">\n                  \n                    <div class=\"border border-dashed border-[#cad2e3] rounded-[4px] p-3 bg-[#f8fafc] flex items-center justify-between text-[12.5px] font-semibold text-[#334155]\">\n                      <span>Çok Satan Ürünler (12 Sütun - 4'lü Dizilim)</span>\n                      <span class=\"text-[#0abb87] text-[11px] font-bold\">✓ Aktif</span>\n                    </div>\n                  \n                </div>\n              </div>\n            \n              <div class=\"border border-dashed border-[#cccccc] rounded-[4px] p-4 bg-white\">\n                <div class=\"flex items-center justify-between mb-3\">\n                  <div class=\"flex items-center gap-2\">\n                    <span class=\"px-2.5 py-1 rounded bg-[#eef1f8] text-[#48465b] text-[12px] font-bold\">4. Satır — Yeni Gelenler & Mağaza Güvence Şeridi</span>\n                    <span class=\"px-2.5 py-1 rounded bg-[#f0f3ff] text-[#3d94fb] text-[11px] font-semibold\">Kutu İçi (Container)</span>\n                  </div>\n                  <div class=\"flex items-center gap-1.5\">\n                    <button type=\"button\" class=\"h-[26px] px-2.5 rounded border border-slate-200 text-[11.5px] font-semibold text-slate-600 cursor-pointer\">+ Sütun</button>\n                    <button type=\"button\" class=\"w-[26px] h-[26px] rounded bg-red-50 text-red-600 text-[12px] cursor-pointer\">🗑</button>\n                  </div>\n                </div>\n                <div class=\"grid grid-cols-1 md:grid-cols-2 gap-3\">\n                  \n                    <div class=\"border border-dashed border-[#cad2e3] rounded-[4px] p-3 bg-[#f8fafc] flex items-center justify-between text-[12.5px] font-semibold text-[#334155]\">\n                      <span>Yeni Eklenen Ürünler Vitrini</span>\n                      <span class=\"text-[#0abb87] text-[11px] font-bold\">✓ Aktif</span>\n                    </div>\n                  \n                    <div class=\"border border-dashed border-[#cad2e3] rounded-[4px] p-3 bg-[#f8fafc] flex items-center justify-between text-[12.5px] font-semibold text-[#334155]\">\n                      <span>Güvenli Alışveriş & Hızlı Kargo İkonları</span>\n                      <span class=\"text-[#0abb87] text-[11px] font-bold\">✓ Aktif</span>\n                    </div>\n                  \n                </div>\n              </div>\n            \n            <div class=\"flex justify-end pt-2\">\n              <button type=\"button\" onclick=\"alert('Sayfa blok düzeni kaydedildi!')\" class=\"h-[38px] px-6 rounded-[4px] bg-[#0abb87] text-white text-[13px] font-bold cursor-pointer\">✓ Blok Düzenini Kaydet</button>\n            </div>\n          </div>\n        </div>\n      </div>\n    </div>\n\n    <!-- 3. GÖRSEL OPTİMİZASYONU (/admin/store/image) -->\n    <div id=\"subview-theme-image\" class=\"theme-subview hidden max-w-[1140px] w-full mx-auto px-5 py-7\">\n      <div class=\"bg-white rounded-[6px] border border-[#ebedf2] p-[25px] shadow-2xs\">\n        <div class=\"flex flex-wrap items-center justify-between gap-3 pb-4 mb-6 border-b border-[#ebedf2]\">\n          <div>\n            <h3 class=\"text-[18px] font-medium text-[#48465b]\">Görsel Optimizasyonu &amp; WebP Dönüştürücü</h3>\n            <p class=\"text-[13px] text-[#74788d] mt-1\">Ürün, kategori ve banner görsellerinizi otomatik WebP formatına dönüştürerek sayfa açılış hızınızı %60'a kadar artırın.</p>\n          </div>\n          <button type=\"button\" onclick=\"alert('Mevcut tüm görseller için WebP optimizasyon kuyruğu başlatıldı!')\" class=\"h-[38px] px-4 rounded-[4px] bg-[#3d94fb] text-white text-[13px] font-medium cursor-pointer\">⚡ Tüm Görselleri Şimdi Optimize Et</button>\n        </div>\n        <div class=\"grid grid-cols-1 md:grid-cols-3 gap-5 mb-6\">\n          <div>\n            <label class=\"block text-[13px] text-[#48465b] mb-2\">Otomatik WebP Dönüşümü</label>\n            <select class=\"w-full h-[38px] px-3 rounded-[4px] border border-[#e2e5ec] bg-white text-[13px]\">\n              <option selected>Aktif (Önerilen - Google PageSpeed Uyumlu)</option>\n              <option>Pasif (Orijinal JPG/PNG Kalsın)</option>\n            </select>\n          </div>\n          <div>\n            <label class=\"block text-[13px] text-[#48465b] mb-2\">Görsel Sıkıştırma Kalitesi (%)</label>\n            <input type=\"number\" value=\"85\" class=\"w-full h-[38px] px-3 rounded-[4px] border border-[#e2e5ec] text-[13px]\" />\n          </div>\n          <div>\n            <label class=\"block text-[13px] text-[#48465b] mb-2\">Lazy Load (Geç Yükleme)</label>\n            <select class=\"w-full h-[38px] px-3 rounded-[4px] border border-[#e2e5ec] bg-white text-[13px]\">\n              <option selected>Aktif</option>\n              <option>Pasif</option>\n            </select>\n          </div>\n          <div>\n            <label class=\"block text-[13px] text-[#48465b] mb-2\">Küçük Ürün Görseli (Thumbnail) Ölçüsü</label>\n            <input type=\"text\" value=\"300 x 450 px\" class=\"w-full h-[38px] px-3 rounded-[4px] border border-[#e2e5ec] text-[13px]\" />\n          </div>\n          <div>\n            <label class=\"block text-[13px] text-[#48465b] mb-2\">Orta Ürün Görseli (Liste) Ölçüsü</label>\n            <input type=\"text\" value=\"600 x 900 px\" class=\"w-full h-[38px] px-3 rounded-[4px] border border-[#e2e5ec] text-[13px]\" />\n          </div>\n          <div>\n            <label class=\"block text-[13px] text-[#48465b] mb-2\">Büyük Ürün Görseli (Zoom) Ölçüsü</label>\n            <input type=\"text\" value=\"1200 x 1800 px\" class=\"w-full h-[38px] px-3 rounded-[4px] border border-[#e2e5ec] text-[13px]\" />\n          </div>\n        </div>\n        <button type=\"button\" onclick=\"alert('Görsel optimizasyon ayarları kaydedildi!')\" class=\"h-[38px] px-5 rounded-[4px] bg-[#0abb87] text-white text-[13px] font-medium cursor-pointer\">✓ Ayarları Kaydet</button>\n      </div>\n    </div>\n\n    <!-- 4. SEO OPTİMİZASYONU (/admin/store/seo - seoSettingsTable) -->\n    <div id=\"subview-theme-seo\" class=\"theme-subview hidden max-w-[1140px] w-full mx-auto px-5 py-7\">\n      <div class=\"bg-white rounded-[4px] border border-[#ebedf2] p-[25px] shadow-2xs\">\n        <div class=\"mb-5\">\n          <h3 class=\"text-[18px] font-medium text-[#48465b]\">SEO Optimizasyonu (Varsayılan Sayfa Meta Ayarları)</h3>\n          <p class=\"text-[13px] text-[#74788d] mt-1\">Sistemdeki sabit sayfaların SEO başlık (Title) ve açıklama (Description) şablonlarını düzenleyebilirsiniz.</p>\n        </div>\n        <table class=\"w-full text-left border-collapse text-[13px]\">\n          <thead>\n            <tr class=\"bg-[#f8f9fb] border-b border-[#ebedf2] text-[#48465b] font-semibold\">\n              <th class=\"py-3 px-3 w-[190px]\">Sayfa Adı</th>\n              <th class=\"py-3 px-3\">SEO Başlığı</th>\n              <th class=\"py-3 px-3\">SEO Açıklama</th>\n              <th class=\"py-3 px-3 w-[90px] text-right\">İşlemler</th>\n            </tr>\n          </thead>\n          <tbody class=\"divide-y divide-[#ebedf2] text-[#48465b]\">\n            \n              <tr>\n                <td class=\"py-3 px-3 font-bold\">Ana Sayfa</td>\n                <td class=\"py-3 px-3\">Çizgi Butik | Oto Bodykit, Tampon, Spoiler ve Modifiye</td>\n                <td class=\"py-3 px-3 text-[#74788d]\">Aracınıza özel bodykit setleri, ön lip, difüzör ve spoiler modelleri.</td>\n                <td class=\"py-3 px-3 text-right\">\n                  <button type=\"button\" onclick=\"alert('Ana Sayfa SEO düzenleme ekranı')\" class=\"w-[30px] h-[30px] rounded-[4px] bg-[#9b59b6] text-white inline-flex items-center justify-center text-[12px] cursor-pointer\">✎</button>\n                </td>\n              </tr>\n            \n              <tr>\n                <td class=\"py-3 px-3 font-bold\">Yeni Ürünler</td>\n                <td class=\"py-3 px-3\">Yeni Gelen Ürünler | Çizgi Butik</td>\n                <td class=\"py-3 px-3 text-[#74788d]\">En yeni sezon ürünleri ve güncel stoklarımızı hemen inceleyin.</td>\n                <td class=\"py-3 px-3 text-right\">\n                  <button type=\"button\" onclick=\"alert('Yeni Ürünler SEO düzenleme ekranı')\" class=\"w-[30px] h-[30px] rounded-[4px] bg-[#9b59b6] text-white inline-flex items-center justify-center text-[12px] cursor-pointer\">✎</button>\n                </td>\n              </tr>\n            \n              <tr>\n                <td class=\"py-3 px-3 font-bold\">İndirimdeki Ürünler</td>\n                <td class=\"py-3 px-3\">Fırsat & İndirimli Ürünler | Çizgi Butik</td>\n                <td class=\"py-3 px-3 text-[#74788d]\">Kampanyalı ve özel indirimli ürünleri kaçırmayın.</td>\n                <td class=\"py-3 px-3 text-right\">\n                  <button type=\"button\" onclick=\"alert('İndirimdeki Ürünler SEO düzenleme ekranı')\" class=\"w-[30px] h-[30px] rounded-[4px] bg-[#9b59b6] text-white inline-flex items-center justify-center text-[12px] cursor-pointer\">✎</button>\n                </td>\n              </tr>\n            \n              <tr>\n                <td class=\"py-3 px-3 font-bold\">Çok Satan Ürünler</td>\n                <td class=\"py-3 px-3\">En Çok Satanlar | Çizgi Butik</td>\n                <td class=\"py-3 px-3 text-[#74788d]\">Müşterilerimizin en çok tercih ettiği popüler ürünler.</td>\n                <td class=\"py-3 px-3 text-right\">\n                  <button type=\"button\" onclick=\"alert('Çok Satan Ürünler SEO düzenleme ekranı')\" class=\"w-[30px] h-[30px] rounded-[4px] bg-[#9b59b6] text-white inline-flex items-center justify-center text-[12px] cursor-pointer\">✎</button>\n                </td>\n              </tr>\n            \n              <tr>\n                <td class=\"py-3 px-3 font-bold\">İletişim Sayfası</td>\n                <td class=\"py-3 px-3\">İletişim & Mağaza Adresimiz | Çizgi Butik</td>\n                <td class=\"py-3 px-3 text-[#74788d]\">Bize ulaşın, adres, telefon ve WhatsApp destek hattımız.</td>\n                <td class=\"py-3 px-3 text-right\">\n                  <button type=\"button\" onclick=\"alert('İletişim Sayfası SEO düzenleme ekranı')\" class=\"w-[30px] h-[30px] rounded-[4px] bg-[#9b59b6] text-white inline-flex items-center justify-center text-[12px] cursor-pointer\">✎</button>\n                </td>\n              </tr>\n            \n              <tr>\n                <td class=\"py-3 px-3 font-bold\">Blog Ana Sayfa</td>\n                <td class=\"py-3 px-3\">Blog & Rehber Yazıları | Çizgi Butik</td>\n                <td class=\"py-3 px-3 text-[#74788d]\">Modifiye, bakım ve stil önerileri hakkında güncel blog yazıları.</td>\n                <td class=\"py-3 px-3 text-right\">\n                  <button type=\"button\" onclick=\"alert('Blog Ana Sayfa SEO düzenleme ekranı')\" class=\"w-[30px] h-[30px] rounded-[4px] bg-[#9b59b6] text-white inline-flex items-center justify-center text-[12px] cursor-pointer\">✎</button>\n                </td>\n              </tr>\n            \n          </tbody>\n        </table>\n      </div>\n    </div>\n\n    <!-- 5. 301 YÖNLENDİRMELERİ (/admin/store/redirect301 - linksTable) -->\n    <div id=\"subview-theme-redirect301\" class=\"theme-subview hidden max-w-[1140px] w-full mx-auto px-5 py-7\">\n      <div class=\"bg-white rounded-[4px] border border-[#ebedf2] p-[25px] shadow-2xs\">\n        <div class=\"flex flex-wrap items-center justify-between gap-3 mb-5\">\n          <div>\n            <h3 class=\"text-[18px] font-medium text-[#48465b]\">301 Yönlendirmeleri</h3>\n            <p class=\"text-[13px] text-[#74788d] mt-1\">Değişen ürün veya kategori URL adreslerinizi SEO değerini kaybetmeden yeni adreslerine yönlendirebilirsiniz.</p>\n          </div>\n          <div class=\"flex items-center gap-2\">\n            <button type=\"button\" onclick=\"alert('Yeni 301 Yönlendirmesi ekleme modalı')\" class=\"h-[38px] px-4 rounded-[4px] bg-[#0abb87] text-white text-[13px] font-medium cursor-pointer\">+ Yeni Yönlendirme</button>\n            <button type=\"button\" class=\"h-[38px] px-4 rounded-[4px] bg-[#3d94fb] text-white text-[13px] font-medium cursor-pointer\">📊 Excel İşlemleri</button>\n          </div>\n        </div>\n        <table class=\"w-full text-left border-collapse text-[13px]\">\n          <thead>\n            <tr class=\"bg-[#f8f9fb] border-b border-[#ebedf2] text-[#48465b] font-semibold\">\n              <th class=\"py-3 px-3 w-[40px] text-center\"><input type=\"checkbox\" class=\"w-4 h-4\" /></th>\n              <th class=\"py-3 px-3 w-[70px]\">No</th>\n              <th class=\"py-3 px-3\">Link (Eski URL)</th>\n              <th class=\"py-3 px-3\">Yönlendirme Linki (Yeni URL)</th>\n              <th class=\"py-3 px-3 w-[120px]\">Tip</th>\n              <th class=\"py-3 px-3 w-[100px] text-right\">İşlemler</th>\n            </tr>\n          </thead>\n          <tbody class=\"divide-y divide-[#ebedf2] text-[#48465b]\">\n            \n              <tr>\n                <td class=\"py-3 px-3 text-center\"><input type=\"checkbox\" class=\"w-4 h-4\" /></td>\n                <td class=\"py-3 px-3\">104</td>\n                <td class=\"py-3 px-3 font-mono text-[12px] text-red-600\">/eski-sezon-urunler</td>\n                <td class=\"py-3 px-3 font-mono text-[12px] text-[#0abb87]\">/yeni-urunler</td>\n                <td class=\"py-3 px-3\"><span class=\"px-2 py-0.5 rounded bg-blue-50 text-[#1565c0] text-[11.5px] font-semibold\">301 (Kalıcı)</span></td>\n                <td class=\"py-3 px-3 text-right\">\n                  <button type=\"button\" class=\"w-[30px] h-[30px] rounded-[4px] bg-[#9b59b6] text-white text-[12px] cursor-pointer\">👁</button>\n                  <button type=\"button\" class=\"w-[30px] h-[30px] rounded-[4px] bg-[#e74c3c] text-white text-[12px] cursor-pointer ml-1\">🗑</button>\n                </td>\n              </tr>\n            \n              <tr>\n                <td class=\"py-3 px-3 text-center\"><input type=\"checkbox\" class=\"w-4 h-4\" /></td>\n                <td class=\"py-3 px-3\">103</td>\n                <td class=\"py-3 px-3 font-mono text-[12px] text-red-600\">/kampanya-2025</td>\n                <td class=\"py-3 px-3 font-mono text-[12px] text-[#0abb87]\">/kampanyalar</td>\n                <td class=\"py-3 px-3\"><span class=\"px-2 py-0.5 rounded bg-blue-50 text-[#1565c0] text-[11.5px] font-semibold\">301 (Kalıcı)</span></td>\n                <td class=\"py-3 px-3 text-right\">\n                  <button type=\"button\" class=\"w-[30px] h-[30px] rounded-[4px] bg-[#9b59b6] text-white text-[12px] cursor-pointer\">👁</button>\n                  <button type=\"button\" class=\"w-[30px] h-[30px] rounded-[4px] bg-[#e74c3c] text-white text-[12px] cursor-pointer ml-1\">🗑</button>\n                </td>\n              </tr>\n            \n              <tr>\n                <td class=\"py-3 px-3 text-center\"><input type=\"checkbox\" class=\"w-4 h-4\" /></td>\n                <td class=\"py-3 px-3\">102</td>\n                <td class=\"py-3 px-3 font-mono text-[12px] text-red-600\">/iletisim.html</td>\n                <td class=\"py-3 px-3 font-mono text-[12px] text-[#0abb87]\">/iletisim</td>\n                <td class=\"py-3 px-3\"><span class=\"px-2 py-0.5 rounded bg-blue-50 text-[#1565c0] text-[11.5px] font-semibold\">301 (Kalıcı)</span></td>\n                <td class=\"py-3 px-3 text-right\">\n                  <button type=\"button\" class=\"w-[30px] h-[30px] rounded-[4px] bg-[#9b59b6] text-white text-[12px] cursor-pointer\">👁</button>\n                  <button type=\"button\" class=\"w-[30px] h-[30px] rounded-[4px] bg-[#e74c3c] text-white text-[12px] cursor-pointer ml-1\">🗑</button>\n                </td>\n              </tr>\n            \n          </tbody>\n        </table>\n      </div>\n    </div>\n\n    <!-- 6. 404 KIRIK LİNKLER (/admin/store/page404 - links404Table) -->\n    <div id=\"subview-theme-page404\" class=\"theme-subview hidden max-w-[1140px] w-full mx-auto px-5 py-7\">\n      <div class=\"bg-white rounded-[4px] border border-[#ebedf2] p-[25px] shadow-2xs\">\n        <div class=\"flex flex-wrap items-center justify-between gap-3 mb-5\">\n          <div>\n            <h3 class=\"text-[18px] font-medium text-[#48465b]\">404 Kırık Linkler</h3>\n            <p class=\"text-[13px] text-[#74788d] mt-1\">Ziyaretçilerin veya arama motoru botlarının karşılaştığı 404 bulunamayan sayfaları tek tıkla 301 yönlendirmesine dönüştürebilirsiniz.</p>\n          </div>\n        </div>\n        <table class=\"w-full text-left border-collapse text-[13px]\">\n          <thead>\n            <tr class=\"bg-[#f8f9fb] border-b border-[#ebedf2] text-[#48465b] font-semibold\">\n              <th class=\"py-3 px-3 w-[40px] text-center\"><input type=\"checkbox\" class=\"w-4 h-4\" /></th>\n              <th class=\"py-3 px-3 w-[65px]\">No</th>\n              <th class=\"py-3 px-3\">Link</th>\n              <th class=\"py-3 px-3 w-[110px]\">Ziyaret Sayısı</th>\n              <th class=\"py-3 px-3\">İlk Ziyaret Tarihi</th>\n              <th class=\"py-3 px-3\">Son Ziyaret Tarihi</th>\n              <th class=\"py-3 px-3 w-[175px]\">Yönlendirme</th>\n              <th class=\"py-3 px-3 w-[70px] text-right\">İşlemler</th>\n            </tr>\n          </thead>\n          <tbody class=\"divide-y divide-[#ebedf2] text-[#48465b]\">\n            \n              <tr>\n                <td class=\"py-3 px-3 text-center\"><input type=\"checkbox\" class=\"w-4 h-4\" /></td>\n                <td class=\"py-3 px-3\">41</td>\n                <td class=\"py-3 px-3 font-mono text-[12px]\">/urun/eski-model-on-tampon-eki</td>\n                <td class=\"py-3 px-3 font-bold\">28</td>\n                <td class=\"py-3 px-3 text-[12px]\">10.11.2026 14:12<div class=\"text-[#74788d]\">88.241.19.104</div></td>\n                <td class=\"py-3 px-3 text-[12px]\">13.11.2026 09:45<div class=\"text-[#74788d]\">88.241.19.104</div></td>\n                <td class=\"py-3 px-3\">\n                  <button type=\"button\" onclick=\"alert('/urun/eski-model-on-tampon-eki için 301 Yönlendirmesi oluşturuldu!')\" class=\"h-[28px] px-2.5 rounded-[4px] bg-[#0abb87] text-white text-[11.5px] font-medium cursor-pointer\">+ Yönlendirme Oluştur</button>\n                </td>\n                <td class=\"py-3 px-3 text-right\">\n                  <button type=\"button\" class=\"w-[30px] h-[30px] rounded-[4px] bg-[#e74c3c] text-white text-[12px] cursor-pointer\">🗑</button>\n                </td>\n              </tr>\n            \n              <tr>\n                <td class=\"py-3 px-3 text-center\"><input type=\"checkbox\" class=\"w-4 h-4\" /></td>\n                <td class=\"py-3 px-3\">40</td>\n                <td class=\"py-3 px-3 font-mono text-[12px]\">/kategori/kis-koleksiyonu-2024</td>\n                <td class=\"py-3 px-3 font-bold\">14</td>\n                <td class=\"py-3 px-3 text-[12px]\">08.11.2026 11:05<div class=\"text-[#74788d]\">176.88.42.11</div></td>\n                <td class=\"py-3 px-3 text-[12px]\">12.11.2026 21:18<div class=\"text-[#74788d]\">176.88.42.11</div></td>\n                <td class=\"py-3 px-3\">\n                  <button type=\"button\" class=\"h-[28px] px-2.5 rounded-[4px] bg-[#3d94fb] text-white text-[11.5px] font-medium cursor-pointer\">Yönlendirmeyi Görüntüle</button>\n                </td>\n                <td class=\"py-3 px-3 text-right\">\n                  <button type=\"button\" class=\"w-[30px] h-[30px] rounded-[4px] bg-[#e74c3c] text-white text-[12px] cursor-pointer\">🗑</button>\n                </td>\n              </tr>\n            \n          </tbody>\n        </table>\n      </div>\n    </div>\n\n    <!-- 7. SITEMAP (/admin/store/sitemap) -->\n    <div id=\"subview-theme-sitemap\" class=\"theme-subview hidden max-w-[1140px] w-full mx-auto px-5 py-7\">\n      <div class=\"bg-white rounded-[4px] border border-[#ebedf2] p-[25px] shadow-2xs\">\n        <div class=\"flex flex-wrap items-center justify-between gap-3 mb-5\">\n          <div>\n            <h3 class=\"text-[18px] font-medium text-[#48465b]\">XML Sitemap (Site Haritası) Yönetimi</h3>\n            <p class=\"text-[13px] text-[#74788d] mt-1\">Google, Yandex ve Bing arama motorları için otomatik oluşturulan site haritası adresleriniz.</p>\n          </div>\n          <button type=\"button\" onclick=\"alert('Tüm XML Sitemap dosyaları yeniden oluşturuldu!')\" class=\"h-[38px] px-4 rounded-[4px] bg-[#0abb87] text-white text-[13px] font-medium cursor-pointer\">🔄 Sitemap Dosyalarını Şimdi Güncelle</button>\n        </div>\n        <div class=\"divide-y divide-[#ebedf2] text-[13px]\">\n          \n            <div class=\"py-3.5 flex flex-wrap items-center justify-between gap-3\">\n              <div>\n                <div class=\"font-semibold text-[#48465b]\">Ana Sitemap İndeksi</div>\n                <div class=\"font-mono text-[12px] text-[#3d94fb] mt-0.5\">https://cizgibutik.com/sitemap.xml</div>\n              </div>\n              <div class=\"flex items-center gap-3\">\n                <span class=\"px-2.5 py-1 rounded bg-slate-100 text-slate-700 text-[12px] font-semibold\">Tüm Alt Haritalar</span>\n                <button type=\"button\" onclick=\"navigator.clipboard?.writeText('https://cizgibutik.com/sitemap.xml');alert('Link kopyalandı!')\" class=\"h-[30px] px-3 rounded border border-slate-300 bg-white hover:bg-slate-50 text-[12px] font-semibold cursor-pointer\">📋 Linki Kopyala</button>\n              </div>\n            </div>\n          \n            <div class=\"py-3.5 flex flex-wrap items-center justify-between gap-3\">\n              <div>\n                <div class=\"font-semibold text-[#48465b]\">Ürünler Sitemap</div>\n                <div class=\"font-mono text-[12px] text-[#3d94fb] mt-0.5\">https://cizgibutik.com/sitemap-products-1.xml</div>\n              </div>\n              <div class=\"flex items-center gap-3\">\n                <span class=\"px-2.5 py-1 rounded bg-slate-100 text-slate-700 text-[12px] font-semibold\">1.420 Ürün URL</span>\n                <button type=\"button\" onclick=\"navigator.clipboard?.writeText('https://cizgibutik.com/sitemap-products-1.xml');alert('Link kopyalandı!')\" class=\"h-[30px] px-3 rounded border border-slate-300 bg-white hover:bg-slate-50 text-[12px] font-semibold cursor-pointer\">📋 Linki Kopyala</button>\n              </div>\n            </div>\n          \n            <div class=\"py-3.5 flex flex-wrap items-center justify-between gap-3\">\n              <div>\n                <div class=\"font-semibold text-[#48465b]\">Kategoriler Sitemap</div>\n                <div class=\"font-mono text-[12px] text-[#3d94fb] mt-0.5\">https://cizgibutik.com/sitemap-categories.xml</div>\n              </div>\n              <div class=\"flex items-center gap-3\">\n                <span class=\"px-2.5 py-1 rounded bg-slate-100 text-slate-700 text-[12px] font-semibold\">48 Kategori URL</span>\n                <button type=\"button\" onclick=\"navigator.clipboard?.writeText('https://cizgibutik.com/sitemap-categories.xml');alert('Link kopyalandı!')\" class=\"h-[30px] px-3 rounded border border-slate-300 bg-white hover:bg-slate-50 text-[12px] font-semibold cursor-pointer\">📋 Linki Kopyala</button>\n              </div>\n            </div>\n          \n            <div class=\"py-3.5 flex flex-wrap items-center justify-between gap-3\">\n              <div>\n                <div class=\"font-semibold text-[#48465b]\">Sayfalar Sitemap</div>\n                <div class=\"font-mono text-[12px] text-[#3d94fb] mt-0.5\">https://cizgibutik.com/sitemap-pages.xml</div>\n              </div>\n              <div class=\"flex items-center gap-3\">\n                <span class=\"px-2.5 py-1 rounded bg-slate-100 text-slate-700 text-[12px] font-semibold\">12 Sayfa URL</span>\n                <button type=\"button\" onclick=\"navigator.clipboard?.writeText('https://cizgibutik.com/sitemap-pages.xml');alert('Link kopyalandı!')\" class=\"h-[30px] px-3 rounded border border-slate-300 bg-white hover:bg-slate-50 text-[12px] font-semibold cursor-pointer\">📋 Linki Kopyala</button>\n              </div>\n            </div>\n          \n            <div class=\"py-3.5 flex flex-wrap items-center justify-between gap-3\">\n              <div>\n                <div class=\"font-semibold text-[#48465b]\">Blog Yazıları Sitemap</div>\n                <div class=\"font-mono text-[12px] text-[#3d94fb] mt-0.5\">https://cizgibutik.com/sitemap-blog.xml</div>\n              </div>\n              <div class=\"flex items-center gap-3\">\n                <span class=\"px-2.5 py-1 rounded bg-slate-100 text-slate-700 text-[12px] font-semibold\">24 Blog URL</span>\n                <button type=\"button\" onclick=\"navigator.clipboard?.writeText('https://cizgibutik.com/sitemap-blog.xml');alert('Link kopyalandı!')\" class=\"h-[30px] px-3 rounded border border-slate-300 bg-white hover:bg-slate-50 text-[12px] font-semibold cursor-pointer\">📋 Linki Kopyala</button>\n              </div>\n            </div>\n          \n        </div>\n      </div>\n    </div>\n\n    <!-- 8. GÖRSEL YÜKLE (/admin/store/upload-image - .lag-banner-uploader) -->\n    <div id=\"subview-theme-upload\" class=\"theme-subview hidden max-w-[1140px] w-full mx-auto px-5 py-7\">\n      <div class=\"bg-white rounded-[4px] border border-[#ebedf2] p-[25px] shadow-2xs\">\n        <h3 class=\"text-[18px] font-medium text-[#48465b] mb-2\">Görsel Yükle (CDN Medya Kütüphanesi)</h3>\n        <p class=\"text-[13px] text-[#74788d] mb-5\">Açıklama alanlarında, özel HTML bloklarında veya pazaryeri şablonlarında kullanmak üzere görsel yükleyip direkt link alabilirsiniz.</p>\n        <div onclick=\"alert('Dosya seçici açıldı.')\" class=\"border-2 border-dashed border-[#3d94fb] rounded-[8px] bg-[#f8faff] p-10 text-center cursor-pointer hover:bg-[#eef4ff] transition mb-6\">\n          <div class=\"text-[32px] mb-2\">☁️</div>\n          <div class=\"text-[15px] font-bold text-[#1e293b]\">Görselleri buraya sürükleyin veya bilgisayarınızdan seçmek için tıklayın</div>\n          <div class=\"text-[12px] text-[#74788d] mt-1\">PNG, JPG, WEBP, SVG veya GIF (Maks. 10 MB)</div>\n        </div>\n        <div class=\"grid grid-cols-2 sm:grid-cols-3 md:grid-cols-6 gap-4\">\n          \n            <div class=\"border border-[#ebedf2] rounded-[6px] p-2 bg-white\">\n              <img src=\"data:image/jpeg;base64,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\" class=\"w-full h-28 object-cover rounded mb-2\" />\n              <button type=\"button\" onclick=\"alert('CDN Görsel Linki Kopyalandı!')\" class=\"w-full h-[28px] rounded bg-[#f0f3ff] hover:bg-[#3d94fb] hover:text-white text-[#3d94fb] text-[11.5px] font-semibold transition cursor-pointer\">📋 URL Kopyala</button>\n            </div>\n          \n            <div class=\"border border-[#ebedf2] rounded-[6px] p-2 bg-white\">\n              <img src=\"data:image/jpeg;base64,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\" class=\"w-full h-28 object-cover rounded mb-2\" />\n              <button type=\"button\" onclick=\"alert('CDN Görsel Linki Kopyalandı!')\" class=\"w-full h-[28px] rounded bg-[#f0f3ff] hover:bg-[#3d94fb] hover:text-white text-[#3d94fb] text-[11.5px] font-semibold transition cursor-pointer\">📋 URL Kopyala</button>\n            </div>\n          \n            <div class=\"border border-[#ebedf2] rounded-[6px] p-2 bg-white\">\n              <img src=\"data:image/jpeg;base64,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\" class=\"w-full h-28 object-cover rounded mb-2\" />\n              <button type=\"button\" onclick=\"alert('CDN Görsel Linki Kopyalandı!')\" class=\"w-full h-[28px] rounded bg-[#f0f3ff] hover:bg-[#3d94fb] hover:text-white text-[#3d94fb] text-[11.5px] font-semibold transition cursor-pointer\">📋 URL Kopyala</button>\n            </div>\n          \n            <div class=\"border border-[#ebedf2] rounded-[6px] p-2 bg-white\">\n              <img src=\"data:image/jpeg;base64,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\" class=\"w-full h-28 object-cover rounded mb-2\" />\n              <button type=\"button\" onclick=\"alert('CDN Görsel Linki Kopyalandı!')\" class=\"w-full h-[28px] rounded bg-[#f0f3ff] hover:bg-[#3d94fb] hover:text-white text-[#3d94fb] text-[11.5px] font-semibold transition cursor-pointer\">📋 URL Kopyala</button>\n            </div>\n          \n            <div class=\"border border-[#ebedf2] rounded-[6px] p-2 bg-white\">\n              <img src=\"data:image/jpeg;base64,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\" class=\"w-full h-28 object-cover rounded mb-2\" />\n              <button type=\"button\" onclick=\"alert('CDN Görsel Linki Kopyalandı!')\" class=\"w-full h-[28px] rounded bg-[#f0f3ff] hover:bg-[#3d94fb] hover:text-white text-[#3d94fb] text-[11.5px] font-semibold transition cursor-pointer\">📋 URL Kopyala</button>\n            </div>\n          \n            <div class=\"border border-[#ebedf2] rounded-[6px] p-2 bg-white\">\n              <img src=\"data:image/jpeg;base64,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\" class=\"w-full h-28 object-cover rounded mb-2\" />\n              <button type=\"button\" onclick=\"alert('CDN Görsel Linki Kopyalandı!')\" class=\"w-full h-[28px] rounded bg-[#f0f3ff] hover:bg-[#3d94fb] hover:text-white text-[#3d94fb] text-[11.5px] font-semibold transition cursor-pointer\">📋 URL Kopyala</button>\n            </div>\n          \n        </div>\n      </div>\n    </div>\n\n    <!-- 9. SAYFALAR (/admin/store/pages - pagesTable) -->\n    <div id=\"subview-theme-pages\" class=\"theme-subview hidden max-w-[1140px] w-full mx-auto px-5 py-7\">\n      <div class=\"bg-white rounded-[4px] border border-[#ebedf2] p-[25px] shadow-2xs\">\n        <div class=\"flex flex-wrap items-center justify-between gap-3 mb-5\">\n          <div>\n            <h3 class=\"text-[18px] font-medium text-[#48465b]\">Sayfalar (Kurumsal İçerik Sayfaları)</h3>\n            <p class=\"text-[13px] text-[#74788d] mt-1\">Hakkımızda, Banka Hesaplarımız, Kargo &amp; Teslimat gibi bilgi sayfalarını yönetebilirsiniz.</p>\n          </div>\n          <button type=\"button\" onclick=\"alert('Yeni Sayfa Oluşturma editörü')\" class=\"h-[38px] px-4 rounded-[4px] bg-[#0abb87] text-white text-[13px] font-medium cursor-pointer\">+ Yeni Sayfa</button>\n        </div>\n        <table class=\"w-full text-left border-collapse text-[13px]\">\n          <thead>\n            <tr class=\"bg-[#f8f9fb] border-b border-[#ebedf2] text-[#48465b] font-semibold\">\n              <th class=\"py-3 px-3 w-[40px] text-center\"><input type=\"checkbox\" class=\"w-4 h-4\" /></th>\n              <th class=\"py-3 px-3 w-[70px]\">No</th>\n              <th class=\"py-3 px-3\">Başlık</th>\n              <th class=\"py-3 px-3 text-center\">Durum</th>\n              <th class=\"py-3 px-3 text-center\">Listede Göster</th>\n              <th class=\"py-3 px-3 text-center\">Özel Kodlar</th>\n              <th class=\"py-3 px-3 w-[80px]\">Sıra</th>\n              <th class=\"py-3 px-3 w-[125px] text-right\">İşlemler</th>\n            </tr>\n          </thead>\n          <tbody class=\"divide-y divide-[#ebedf2] text-[#48465b]\">\n            \n              <tr>\n                <td class=\"py-3 px-3 text-center\"><input type=\"checkbox\" class=\"w-4 h-4\" /></td>\n                <td class=\"py-3 px-3\">1</td>\n                <td class=\"py-3 px-3 font-semibold\">Hakkımızda & Kurumsal Bilgiler</td>\n                <td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#0abb87] text-[#0abb87] items-center justify-center text-[11px] font-bold\">✓</span></td>\n                <td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#0abb87] text-[#0abb87] items-center justify-center text-[11px] font-bold\">✓</span></td>\n                <td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#282a3c] text-[#282a3c] items-center justify-center text-[11px] font-bold\">✕</span></td>\n                <td class=\"py-3 px-3\">1</td>\n                <td class=\"py-3 px-3 text-right\">\n                  <button type=\"button\" class=\"w-[28px] h-[28px] rounded-[4px] bg-[#9b59b6] text-white text-[12px] cursor-pointer\">👁</button>\n                  <button type=\"button\" class=\"w-[28px] h-[28px] rounded-[4px] border border-slate-200 bg-white text-[12px] cursor-pointer ml-1\">🔗</button>\n                  <button type=\"button\" class=\"w-[28px] h-[28px] rounded-[4px] bg-[#e74c3c] text-white text-[12px] cursor-pointer ml-1\">🗑</button>\n                </td>\n              </tr>\n            \n              <tr>\n                <td class=\"py-3 px-3 text-center\"><input type=\"checkbox\" class=\"w-4 h-4\" /></td>\n                <td class=\"py-3 px-3\">2</td>\n                <td class=\"py-3 px-3 font-semibold\">Banka Hesap Numaralarımız (Havale / EFT)</td>\n                <td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#0abb87] text-[#0abb87] items-center justify-center text-[11px] font-bold\">✓</span></td>\n                <td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#0abb87] text-[#0abb87] items-center justify-center text-[11px] font-bold\">✓</span></td>\n                <td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#282a3c] text-[#282a3c] items-center justify-center text-[11px] font-bold\">✕</span></td>\n                <td class=\"py-3 px-3\">2</td>\n                <td class=\"py-3 px-3 text-right\">\n                  <button type=\"button\" class=\"w-[28px] h-[28px] rounded-[4px] bg-[#9b59b6] text-white text-[12px] cursor-pointer\">👁</button>\n                  <button type=\"button\" class=\"w-[28px] h-[28px] rounded-[4px] border border-slate-200 bg-white text-[12px] cursor-pointer ml-1\">🔗</button>\n                  <button type=\"button\" class=\"w-[28px] h-[28px] rounded-[4px] bg-[#e74c3c] text-white text-[12px] cursor-pointer ml-1\">🗑</button>\n                </td>\n              </tr>\n            \n              <tr>\n                <td class=\"py-3 px-3 text-center\"><input type=\"checkbox\" class=\"w-4 h-4\" /></td>\n                <td class=\"py-3 px-3\">3</td>\n                <td class=\"py-3 px-3 font-semibold\">Kargo, Teslimat ve Montaj Hizmetlerimiz</td>\n                <td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#0abb87] text-[#0abb87] items-center justify-center text-[11px] font-bold\">✓</span></td>\n                <td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#0abb87] text-[#0abb87] items-center justify-center text-[11px] font-bold\">✓</span></td>\n                <td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#282a3c] text-[#282a3c] items-center justify-center text-[11px] font-bold\">✕</span></td>\n                <td class=\"py-3 px-3\">3</td>\n                <td class=\"py-3 px-3 text-right\">\n                  <button type=\"button\" class=\"w-[28px] h-[28px] rounded-[4px] bg-[#9b59b6] text-white text-[12px] cursor-pointer\">👁</button>\n                  <button type=\"button\" class=\"w-[28px] h-[28px] rounded-[4px] border border-slate-200 bg-white text-[12px] cursor-pointer ml-1\">🔗</button>\n                  <button type=\"button\" class=\"w-[28px] h-[28px] rounded-[4px] bg-[#e74c3c] text-white text-[12px] cursor-pointer ml-1\">🗑</button>\n                </td>\n              </tr>\n            \n              <tr>\n                <td class=\"py-3 px-3 text-center\"><input type=\"checkbox\" class=\"w-4 h-4\" /></td>\n                <td class=\"py-3 px-3\">4</td>\n                <td class=\"py-3 px-3 font-semibold\">İptal, İade ve Değişim Şartları</td>\n                <td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#0abb87] text-[#0abb87] items-center justify-center text-[11px] font-bold\">✓</span></td>\n                <td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#0abb87] text-[#0abb87] items-center justify-center text-[11px] font-bold\">✓</span></td>\n                <td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#282a3c] text-[#282a3c] items-center justify-center text-[11px] font-bold\">✕</span></td>\n                <td class=\"py-3 px-3\">4</td>\n                <td class=\"py-3 px-3 text-right\">\n                  <button type=\"button\" class=\"w-[28px] h-[28px] rounded-[4px] bg-[#9b59b6] text-white text-[12px] cursor-pointer\">👁</button>\n                  <button type=\"button\" class=\"w-[28px] h-[28px] rounded-[4px] border border-slate-200 bg-white text-[12px] cursor-pointer ml-1\">🔗</button>\n                  <button type=\"button\" class=\"w-[28px] h-[28px] rounded-[4px] bg-[#e74c3c] text-white text-[12px] cursor-pointer ml-1\">🗑</button>\n                </td>\n              </tr>\n            \n              <tr>\n                <td class=\"py-3 px-3 text-center\"><input type=\"checkbox\" class=\"w-4 h-4\" /></td>\n                <td class=\"py-3 px-3\">5</td>\n                <td class=\"py-3 px-3 font-semibold\">Gizlilik ve Güvenlik Politikası</td>\n                <td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#0abb87] text-[#0abb87] items-center justify-center text-[11px] font-bold\">✓</span></td>\n                <td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#0abb87] text-[#0abb87] items-center justify-center text-[11px] font-bold\">✓</span></td>\n                <td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#282a3c] text-[#282a3c] items-center justify-center text-[11px] font-bold\">✕</span></td>\n                <td class=\"py-3 px-3\">5</td>\n                <td class=\"py-3 px-3 text-right\">\n                  <button type=\"button\" class=\"w-[28px] h-[28px] rounded-[4px] bg-[#9b59b6] text-white text-[12px] cursor-pointer\">👁</button>\n                  <button type=\"button\" class=\"w-[28px] h-[28px] rounded-[4px] border border-slate-200 bg-white text-[12px] cursor-pointer ml-1\">🔗</button>\n                  <button type=\"button\" class=\"w-[28px] h-[28px] rounded-[4px] bg-[#e74c3c] text-white text-[12px] cursor-pointer ml-1\">🗑</button>\n                </td>\n              </tr>\n            \n          </tbody>\n        </table>\n      </div>\n    </div>\n\n    <!-- 10. YARDIM İÇERİKLERİ (/admin/store/help - helpTitlesTable) -->\n    <div id=\"subview-theme-help\" class=\"theme-subview hidden max-w-[1140px] w-full mx-auto px-5 py-7\">\n      <div class=\"bg-white rounded-[4px] border border-[#ebedf2] p-[25px] shadow-2xs\">\n        <div class=\"flex flex-wrap items-center justify-between gap-3 mb-5\">\n          <div>\n            <h3 class=\"text-[18px] font-medium text-[#48465b]\">Yardım İçerikleri (Müşteri Destek Rehberi)</h3>\n            <p class=\"text-[13px] text-[#74788d] mt-1\">Müşteri yardım merkezinde yer alan kategori başlıklarını ve rehber maddelerini yönetebilirsiniz.</p>\n          </div>\n          <button type=\"button\" class=\"h-[38px] px-4 rounded-[4px] bg-[#0abb87] text-white text-[13px] font-medium cursor-pointer\">+ Yeni Yardım Başlığı</button>\n        </div>\n        <table class=\"w-full text-left border-collapse text-[13px]\">\n          <thead>\n            <tr class=\"bg-[#f8f9fb] border-b border-[#ebedf2] text-[#48465b] font-semibold\">\n              <th class=\"py-3 px-3 w-[70px]\">No</th>\n              <th class=\"py-3 px-3\">Başlık</th>\n              <th class=\"py-3 px-3\">Kısa Başlık</th>\n              <th class=\"py-3 px-3 text-center\">Durum</th>\n              <th class=\"py-3 px-3 w-[80px]\">Sıra</th>\n              <th class=\"py-3 px-3 w-[110px] text-right\">İşlemler</th>\n            </tr>\n          </thead>\n          <tbody class=\"divide-y divide-[#ebedf2] text-[#48465b]\">\n            <tr><td class=\"py-3 px-3\">1</td><td class=\"py-3 px-3 font-semibold\">Sipariş ve Teslimat Süreçleri</td><td class=\"py-3 px-3\">Sipariş &amp; Kargo</td><td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#0abb87] text-[#0abb87] items-center justify-center text-[11px] font-bold\">✓</span></td><td class=\"py-3 px-3\">1</td><td class=\"py-3 px-3 text-right\"><button class=\"w-[28px] h-[28px] rounded bg-[#9b59b6] text-white\">👁</button></td></tr>\n            <tr><td class=\"py-3 px-3\">2</td><td class=\"py-3 px-3 font-semibold\">Ödeme, Taksit ve Güvenlik</td><td class=\"py-3 px-3\">Ödeme İşlemleri</td><td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#0abb87] text-[#0abb87] items-center justify-center text-[11px] font-bold\">✓</span></td><td class=\"py-3 px-3\">2</td><td class=\"py-3 px-3 text-right\"><button class=\"w-[28px] h-[28px] rounded bg-[#9b59b6] text-white\">👁</button></td></tr>\n            <tr><td class=\"py-3 px-3\">3</td><td class=\"py-3 px-3 font-semibold\">İade, Değişim ve Garanti Koşulları</td><td class=\"py-3 px-3\">İade &amp; Değişim</td><td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#0abb87] text-[#0abb87] items-center justify-center text-[11px] font-bold\">✓</span></td><td class=\"py-3 px-3\">3</td><td class=\"py-3 px-3 text-right\"><button class=\"w-[28px] h-[28px] rounded bg-[#9b59b6] text-white\">👁</button></td></tr>\n          </tbody>\n        </table>\n      </div>\n    </div>\n\n    <!-- 11. SIKÇA SORULAN SORULAR (/admin/store/sss - FAQTable) -->\n    <div id=\"subview-theme-sss\" class=\"theme-subview hidden max-w-[1140px] w-full mx-auto px-5 py-7\">\n      <div class=\"bg-white rounded-[4px] border border-[#ebedf2] p-[25px] shadow-2xs\">\n        <div class=\"flex flex-wrap items-center justify-between gap-3 mb-5\">\n          <div>\n            <h3 class=\"text-[18px] font-medium text-[#48465b]\">Sıkça Sorulan Sorular (S.S.S.)</h3>\n            <p class=\"text-[13px] text-[#74788d] mt-1\">Müşterilerinizin en sık yönelttiği soruları ve cevaplarını akordiyon yapısında yayınlayın.</p>\n          </div>\n          <button type=\"button\" class=\"h-[38px] px-4 rounded-[4px] bg-[#0abb87] text-white text-[13px] font-medium cursor-pointer\">+ Yeni Soru Ekle</button>\n        </div>\n        <table class=\"w-full text-left border-collapse text-[13px]\">\n          <thead>\n            <tr class=\"bg-[#f8f9fb] border-b border-[#ebedf2] text-[#48465b] font-semibold\">\n              <th class=\"py-3 px-3 w-[70px]\">No</th>\n              <th class=\"py-3 px-3\">Soru</th>\n              <th class=\"py-3 px-3 w-[80px]\">Sıra</th>\n              <th class=\"py-3 px-3 w-[110px] text-right\">İşlemler</th>\n            </tr>\n          </thead>\n          <tbody class=\"divide-y divide-[#ebedf2] text-[#48465b]\">\n            <tr><td class=\"py-3 px-3\">1</td><td class=\"py-3 px-3 font-semibold\">Siparişim ne zaman kargoya verilir?</td><td class=\"py-3 px-3\">1</td><td class=\"py-3 px-3 text-right\"><button class=\"w-[28px] h-[28px] rounded bg-[#9b59b6] text-white\">👁</button> <button class=\"w-[28px] h-[28px] rounded bg-[#e74c3c] text-white\">🗑</button></td></tr>\n            <tr><td class=\"py-3 px-3\">2</td><td class=\"py-3 px-3 font-semibold\">Kapıda ödeme ve kredi kartına taksit imkanınız var mı?</td><td class=\"py-3 px-3\">2</td><td class=\"py-3 px-3 text-right\"><button class=\"w-[28px] h-[28px] rounded bg-[#9b59b6] text-white\">👁</button> <button class=\"w-[28px] h-[28px] rounded bg-[#e74c3c] text-white\">🗑</button></td></tr>\n            <tr><td class=\"py-3 px-3\">3</td><td class=\"py-3 px-3 font-semibold\">Satın aldığım ürünü nasıl iade edebilir veya değiştirebilirim?</td><td class=\"py-3 px-3\">3</td><td class=\"py-3 px-3 text-right\"><button class=\"w-[28px] h-[28px] rounded bg-[#9b59b6] text-white\">👁</button> <button class=\"w-[28px] h-[28px] rounded bg-[#e74c3c] text-white\">🗑</button></td></tr>\n          </tbody>\n        </table>\n      </div>\n    </div>\n\n    <!-- 12. BLOG (/admin/store/blog - blogsTable) -->\n    <div id=\"subview-theme-blog\" class=\"theme-subview hidden max-w-[1140px] w-full mx-auto px-5 py-7\">\n      <div class=\"bg-white rounded-[4px] border border-[#ebedf2] p-[25px] shadow-2xs\">\n        <div class=\"flex flex-wrap items-center justify-between gap-3 mb-5\">\n          <div>\n            <h3 class=\"text-[18px] font-medium text-[#48465b]\">Blog Yönetimi</h3>\n            <p class=\"text-[13px] text-[#74788d] mt-1\">Organik SEO trafiğinizi artırmak için blog makaleleri, rehber içerikler ve duyurular yayınlayın.</p>\n          </div>\n          <div class=\"flex items-center gap-2\">\n            <button type=\"button\" class=\"h-[38px] px-4 rounded-[4px] bg-[#0abb87] text-white text-[13px] font-medium cursor-pointer\">+ Yeni Blog Yazısı</button>\n            <button type=\"button\" class=\"h-[38px] px-4 rounded-[4px] bg-[#3d94fb] text-white text-[13px] font-medium cursor-pointer\">📂 Blog Kategorileri</button>\n          </div>\n        </div>\n        <table class=\"w-full text-left border-collapse text-[13px]\">\n          <thead>\n            <tr class=\"bg-[#f8f9fb] border-b border-[#ebedf2] text-[#48465b] font-semibold\">\n              <th class=\"py-3 px-3 w-[70px]\">No</th>\n              <th class=\"py-3 px-3\">Başlık</th>\n              <th class=\"py-3 px-3\">Kategori</th>\n              <th class=\"py-3 px-3 w-[95px]\">Okunma</th>\n              <th class=\"py-3 px-3 w-[150px]\">Yayınlanma Tarihi</th>\n              <th class=\"py-3 px-3 text-center w-[85px]\">Durum</th>\n              <th class=\"py-3 px-3 w-[110px] text-right\">İşlemler</th>\n            </tr>\n          </thead>\n          <tbody class=\"divide-y divide-[#ebedf2] text-[#48465b]\">\n            <tr><td class=\"py-3 px-3\">12</td><td class=\"py-3 px-3 font-semibold\">2026 Sezonunun En Çok Tercih Edilen Kombin ve Modelleri</td><td class=\"py-3 px-3\">Moda &amp; Trend</td><td class=\"py-3 px-3 font-bold\">1.482</td><td class=\"py-3 px-3\">10.11.2026 15:30</td><td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#0abb87] text-[#0abb87] items-center justify-center text-[11px] font-bold\">✓</span></td><td class=\"py-3 px-3 text-right\"><button class=\"w-[28px] h-[28px] rounded bg-[#9b59b6] text-white\">👁</button> <button class=\"w-[28px] h-[28px] rounded bg-[#e74c3c] text-white\">🗑</button></td></tr>\n            <tr><td class=\"py-3 px-3\">11</td><td class=\"py-3 px-3 font-semibold\">Aracınız İçin Doğru Bodykit ve Lip Seçimi Rehberi</td><td class=\"py-3 px-3\">Uygulama Rehberi</td><td class=\"py-3 px-3 font-bold\">2.910</td><td class=\"py-3 px-3\">02.11.2026 11:20</td><td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#0abb87] text-[#0abb87] items-center justify-center text-[11px] font-bold\">✓</span></td><td class=\"py-3 px-3 text-right\"><button class=\"w-[28px] h-[28px] rounded bg-[#9b59b6] text-white\">👁</button> <button class=\"w-[28px] h-[28px] rounded bg-[#e74c3c] text-white\">🗑</button></td></tr>\n          </tbody>\n        </table>\n      </div>\n    </div>\n\n    <!-- 13. MANŞETLER (/admin/store/headlines - headlineSort) -->\n    <div id=\"subview-theme-headlines\" class=\"theme-subview hidden max-w-[1140px] w-full mx-auto px-5 py-7\">\n      <div class=\"bg-white rounded-[4px] border border-[#ebedf2] p-[25px] shadow-2xs\">\n        <div class=\"flex flex-wrap items-center justify-between gap-3 mb-5\">\n          <div>\n            <h3 class=\"text-[18px] font-medium text-[#48465b]\">Manşetler (Ana Sayfa Slider Yönetimi)</h3>\n            <p class=\"text-[13px] text-[#74788d] mt-1\">Masaüstü ve mobil cihazlar için ayrı görseller tanımlayabilir, sürükle-bırak ile manşet sırasını değiştirebilirsiniz.</p>\n          </div>\n          <button type=\"button\" onclick=\"alert('Yeni Manşet Slider ekleme ekranı')\" class=\"h-[38px] px-4 rounded-[4px] bg-[#0abb87] text-white text-[13px] font-medium cursor-pointer\">+ Yeni Manşet Ekle</button>\n        </div>\n        <div class=\"grid grid-cols-1 md:grid-cols-2 gap-5\">\n          \n            <div class=\"border border-[#ebedf2] rounded-[6px] p-4 bg-[#fafbfe] flex items-center gap-4\">\n              <img src=\"data:image/jpeg;base64,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\" class=\"w-28 h-20 object-cover rounded border border-slate-200 shrink-0\" />\n              <div class=\"flex-1 min-w-0\">\n                <div class=\"text-[14px] font-bold text-[#1e293b] truncate\">Yeni Sezon Koleksiyonu — %30'a Varan İndirim</div>\n                <div class=\"text-[12px] text-[#3d94fb] font-mono mt-0.5\">/kampanyalar</div>\n                <div class=\"flex items-center gap-2 mt-2\">\n                  <span class=\"px-2 py-0.5 rounded bg-[#e0f6e7] text-[#08976d] text-[11px] font-bold\">✓ Aktif</span>\n                  <span class=\"text-[11.5px] text-slate-500\">Sıra: 1</span>\n                </div>\n              </div>\n              <div class=\"flex flex-col gap-1\">\n                <button type=\"button\" class=\"w-[28px] h-[28px] rounded bg-[#9b59b6] text-white text-[12px] cursor-pointer\">✎</button>\n                <button type=\"button\" class=\"w-[28px] h-[28px] rounded bg-[#e74c3c] text-white text-[12px] cursor-pointer\">🗑</button>\n              </div>\n            </div>\n          \n            <div class=\"border border-[#ebedf2] rounded-[6px] p-4 bg-[#fafbfe] flex items-center gap-4\">\n              <img src=\"data:image/jpeg;base64,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\" class=\"w-28 h-20 object-cover rounded border border-slate-200 shrink-0\" />\n              <div class=\"flex-1 min-w-0\">\n                <div class=\"text-[14px] font-bold text-[#1e293b] truncate\">1.000 TL ve Üzeri Siparişlerde Ücretsiz Kargo</div>\n                <div class=\"text-[12px] text-[#3d94fb] font-mono mt-0.5\">/yeni-urunler</div>\n                <div class=\"flex items-center gap-2 mt-2\">\n                  <span class=\"px-2 py-0.5 rounded bg-[#e0f6e7] text-[#08976d] text-[11px] font-bold\">✓ Aktif</span>\n                  <span class=\"text-[11.5px] text-slate-500\">Sıra: 2</span>\n                </div>\n              </div>\n              <div class=\"flex flex-col gap-1\">\n                <button type=\"button\" class=\"w-[28px] h-[28px] rounded bg-[#9b59b6] text-white text-[12px] cursor-pointer\">✎</button>\n                <button type=\"button\" class=\"w-[28px] h-[28px] rounded bg-[#e74c3c] text-white text-[12px] cursor-pointer\">🗑</button>\n              </div>\n            </div>\n          \n        </div>\n      </div>\n    </div>\n\n    <!-- 14. BANNERLAR (/admin/store/banners - bannersTable) -->\n    <div id=\"subview-theme-banners\" class=\"theme-subview hidden max-w-[1140px] w-full mx-auto px-5 py-7\">\n      <div class=\"bg-white rounded-[4px] border border-[#ebedf2] p-[25px] shadow-2xs\">\n        <div class=\"flex flex-wrap items-center justify-between gap-3 mb-5\">\n          <div>\n            <h3 class=\"text-[18px] font-medium text-[#48465b]\">Bannerlar (Vitrin &amp; Kampanya Görsel Grupları)</h3>\n            <p class=\"text-[13px] text-[#74788d] mt-1\">Blok yönetiminde kullandığınız 2'li, 3'lü veya tam genişlikteki görsel banner gruplarını yönetebilirsiniz.</p>\n          </div>\n          <button type=\"button\" class=\"h-[38px] px-4 rounded-[4px] bg-[#0abb87] text-white text-[13px] font-medium cursor-pointer\">+ Yeni Banner Grubu</button>\n        </div>\n        <table class=\"w-full text-left border-collapse text-[13px]\">\n          <thead>\n            <tr class=\"bg-[#f8f9fb] border-b border-[#ebedf2] text-[#48465b] font-semibold\">\n              <th class=\"py-3 px-3 w-[40px] text-center\"><input type=\"checkbox\" class=\"w-4 h-4\" /></th>\n              <th class=\"py-3 px-3 w-[80px]\">No</th>\n              <th class=\"py-3 px-3\">Banner Adı</th>\n              <th class=\"py-3 px-3 w-[110px] text-right\">İşlemler</th>\n            </tr>\n          </thead>\n          <tbody class=\"divide-y divide-[#ebedf2] text-[#48465b]\">\n            <tr><td class=\"py-3 px-3 text-center\"><input type=\"checkbox\" class=\"w-4 h-4\" /></td><td class=\"py-3 px-3\">1</td><td class=\"py-3 px-3 font-semibold\">Ana Sayfa Üst 3'lü Kategori Vitrin Bannerları</td><td class=\"py-3 px-3 text-right\"><button class=\"w-[28px] h-[28px] rounded bg-[#9b59b6] text-white\">👁</button> <button class=\"w-[28px] h-[28px] rounded bg-[#e74c3c] text-white\">🗑</button></td></tr>\n            <tr><td class=\"py-3 px-3 text-center\"><input type=\"checkbox\" class=\"w-4 h-4\" /></td><td class=\"py-3 px-3\">2</td><td class=\"py-3 px-3 font-semibold\">Ana Sayfa Orta Geniş Kampanya &amp; Kargo Bannerı</td><td class=\"py-3 px-3 text-right\"><button class=\"w-[28px] h-[28px] rounded bg-[#9b59b6] text-white\">👁</button> <button class=\"w-[28px] h-[28px] rounded bg-[#e74c3c] text-white\">🗑</button></td></tr>\n            <tr><td class=\"py-3 px-3 text-center\"><input type=\"checkbox\" class=\"w-4 h-4\" /></td><td class=\"py-3 px-3\">3</td><td class=\"py-3 px-3 font-semibold\">Mobil Uygulama &amp; WhatsApp Sipariş Hattı Bannerı</td><td class=\"py-3 px-3 text-right\"><button class=\"w-[28px] h-[28px] rounded bg-[#9b59b6] text-white\">👁</button> <button class=\"w-[28px] h-[28px] rounded bg-[#e74c3c] text-white\">🗑</button></td></tr>\n          </tbody>\n        </table>\n      </div>\n    </div>\n\n    <!-- 15. POPUP (/admin/store/popup - popupsTable) -->\n    <div id=\"subview-theme-popup\" class=\"theme-subview hidden max-w-[1140px] w-full mx-auto px-5 py-7\">\n      <div class=\"bg-white rounded-[4px] border border-[#ebedf2] p-[25px] shadow-2xs\">\n        <div class=\"flex flex-wrap items-center justify-between gap-3 mb-5\">\n          <div>\n            <h3 class=\"text-[18px] font-medium text-[#48465b]\">Popup (Açılır Pencere Kampanya &amp; Duyuru)</h3>\n            <p class=\"text-[13px] text-[#74788d] mt-1\">Siteye ilk girişte veya belirli tarih aralıklarında müşterilere gösterilecek kupon ve kampanya popuplarını yönetin.</p>\n          </div>\n          <button type=\"button\" class=\"h-[38px] px-4 rounded-[4px] bg-[#0abb87] text-white text-[13px] font-medium cursor-pointer\">+ Yeni Popup Ekle</button>\n        </div>\n        <table class=\"w-full text-left border-collapse text-[13px]\">\n          <thead>\n            <tr class=\"bg-[#f8f9fb] border-b border-[#ebedf2] text-[#48465b] font-semibold\">\n              <th class=\"py-3 px-3 w-[70px]\">No</th>\n              <th class=\"py-3 px-3\">Başlık</th>\n              <th class=\"py-3 px-3 text-center w-[90px]\">Mobil</th>\n              <th class=\"py-3 px-3 text-center w-[90px]\">Masaüstü</th>\n              <th class=\"py-3 px-3 w-[160px]\">Başlangıç Tarihi</th>\n              <th class=\"py-3 px-3 w-[160px]\">Bitiş Tarihi</th>\n              <th class=\"py-3 px-3 w-[100px] text-right\">İşlemler</th>\n            </tr>\n          </thead>\n          <tbody class=\"divide-y divide-[#ebedf2] text-[#48465b]\">\n            <tr>\n              <td class=\"py-3 px-3\">1</td>\n              <td class=\"py-3 px-3 font-semibold\">Hoş Geldin %15 İndirim Kuponu (HOSGELDIN15)</td>\n              <td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#0abb87] text-[#0abb87] items-center justify-center text-[11px] font-bold\">✓</span></td>\n              <td class=\"py-3 px-3 text-center\"><span class=\"inline-flex w-[22px] h-[22px] rounded-full border-2 border-[#0abb87] text-[#0abb87] items-center justify-center text-[11px] font-bold\">✓</span></td>\n              <td class=\"py-3 px-3\">01.11.2026 00:00</td>\n              <td class=\"py-3 px-3\">31.12.2026 23:59</td>\n              <td class=\"py-3 px-3 text-right\"><button class=\"w-[28px] h-[28px] rounded bg-[#9b59b6] text-white\">👁</button> <button class=\"w-[28px] h-[28px] rounded bg-[#e74c3c] text-white\">🗑</button></td>\n            </tr>\n          </tbody>\n        </table>\n      </div>\n    </div>\n\n    <!-- 16. STORY (/admin/store/story - .story-items .item from style.min.css) -->\n    <div id=\"subview-theme-story\" class=\"theme-subview hidden max-w-[1140px] w-full mx-auto px-5 py-7\">\n      <div class=\"bg-white rounded-[4px] border border-[#ebedf2] p-[25px] shadow-2xs\">\n        <div class=\"flex flex-wrap items-center justify-between gap-3 mb-6\">\n          <div>\n            <h3 class=\"text-[18px] font-medium text-[#48465b]\">Story (Instagram Tarzı Yuvarlak Hikaye Vitrini)</h3>\n            <p class=\"text-[13px] text-[#74788d] mt-1\">Ana sayfanın en üstünde yer alan dairesel kampanya ve kategori hikayelerini yönetebilirsiniz.</p>\n          </div>\n          <button type=\"button\" onclick=\"alert('Yeni Story Halkası ekleme modalı')\" class=\"h-[38px] px-4 rounded-[4px] bg-[#0abb87] text-white text-[13px] font-medium cursor-pointer\">+ Yeni Story Ekle</button>\n        </div>\n\n        <!-- .story-items flex-wrap (160px dashed cards from style.min.css) -->\n        <div class=\"flex flex-wrap gap-4\">\n          \n            <div class=\"w-[165px] border border-dashed border-[#cccccc] rounded-[6px] p-[10px] bg-white flex flex-col items-center text-center\">\n              <div class=\"w-[130px] h-[130px] rounded-full p-1 bg-gradient-to-tr from-amber-500 via-pink-500 to-purple-600 mb-2.5\">\n                <img src=\"data:image/jpeg;base64,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\" alt=\"Yeni Gelenler\" class=\"w-full h-full object-cover rounded-full border-2 border-white\" />\n              </div>\n              <div class=\"text-[13.5px] font-bold text-[#1e293b] truncate w-full\">Yeni Gelenler</div>\n              <div class=\"text-[11.5px] text-[#74788d] truncate w-full mt-0.5\">/yeni-urunler</div>\n              <div class=\"grid grid-cols-2 gap-1.5 w-full mt-3 pt-2.5 border-t border-dashed border-[#cccccc]\">\n                <button type=\"button\" class=\"h-[26px] rounded bg-[#f0f3ff] text-[#3d94fb] text-[11.5px] font-semibold cursor-pointer\">✎ Düzenle</button>\n                <button type=\"button\" class=\"h-[26px] rounded bg-red-50 text-red-600 text-[11.5px] font-semibold cursor-pointer\">🗑 Sil</button>\n              </div>\n            </div>\n          \n            <div class=\"w-[165px] border border-dashed border-[#cccccc] rounded-[6px] p-[10px] bg-white flex flex-col items-center text-center\">\n              <div class=\"w-[130px] h-[130px] rounded-full p-1 bg-gradient-to-tr from-amber-500 via-pink-500 to-purple-600 mb-2.5\">\n                <img src=\"data:image/jpeg;base64,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\" alt=\"Çok Satanlar\" class=\"w-full h-full object-cover rounded-full border-2 border-white\" />\n              </div>\n              <div class=\"text-[13.5px] font-bold text-[#1e293b] truncate w-full\">Çok Satanlar</div>\n              <div class=\"text-[11.5px] text-[#74788d] truncate w-full mt-0.5\">/cok-satanlar</div>\n              <div class=\"grid grid-cols-2 gap-1.5 w-full mt-3 pt-2.5 border-t border-dashed border-[#cccccc]\">\n                <button type=\"button\" class=\"h-[26px] rounded bg-[#f0f3ff] text-[#3d94fb] text-[11.5px] font-semibold cursor-pointer\">✎ Düzenle</button>\n                <button type=\"button\" class=\"h-[26px] rounded bg-red-50 text-red-600 text-[11.5px] font-semibold cursor-pointer\">🗑 Sil</button>\n              </div>\n            </div>\n          \n            <div class=\"w-[165px] border border-dashed border-[#cccccc] rounded-[6px] p-[10px] bg-white flex flex-col items-center text-center\">\n              <div class=\"w-[130px] h-[130px] rounded-full p-1 bg-gradient-to-tr from-amber-500 via-pink-500 to-purple-600 mb-2.5\">\n                <img src=\"data:image/jpeg;base64,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\" alt=\"Fırsat Ürünleri\" class=\"w-full h-full object-cover rounded-full border-2 border-white\" />\n              </div>\n              <div class=\"text-[13.5px] font-bold text-[#1e293b] truncate w-full\">Fırsat Ürünleri</div>\n              <div class=\"text-[11.5px] text-[#74788d] truncate w-full mt-0.5\">/indirimdekiler</div>\n              <div class=\"grid grid-cols-2 gap-1.5 w-full mt-3 pt-2.5 border-t border-dashed border-[#cccccc]\">\n                <button type=\"button\" class=\"h-[26px] rounded bg-[#f0f3ff] text-[#3d94fb] text-[11.5px] font-semibold cursor-pointer\">✎ Düzenle</button>\n                <button type=\"button\" class=\"h-[26px] rounded bg-red-50 text-red-600 text-[11.5px] font-semibold cursor-pointer\">🗑 Sil</button>\n              </div>\n            </div>\n          \n            <div class=\"w-[165px] border border-dashed border-[#cccccc] rounded-[6px] p-[10px] bg-white flex flex-col items-center text-center\">\n              <div class=\"w-[130px] h-[130px] rounded-full p-1 bg-gradient-to-tr from-amber-500 via-pink-500 to-purple-600 mb-2.5\">\n                <img src=\"data:image/jpeg;base64,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\" alt=\"Kombini Tamamla\" class=\"w-full h-full object-cover rounded-full border-2 border-white\" />\n              </div>\n              <div class=\"text-[13.5px] font-bold text-[#1e293b] truncate w-full\">Kombini Tamamla</div>\n              <div class=\"text-[11.5px] text-[#74788d] truncate w-full mt-0.5\">/kombinler</div>\n              <div class=\"grid grid-cols-2 gap-1.5 w-full mt-3 pt-2.5 border-t border-dashed border-[#cccccc]\">\n                <button type=\"button\" class=\"h-[26px] rounded bg-[#f0f3ff] text-[#3d94fb] text-[11.5px] font-semibold cursor-pointer\">✎ Düzenle</button>\n                <button type=\"button\" class=\"h-[26px] rounded bg-red-50 text-red-600 text-[11.5px] font-semibold cursor-pointer\">🗑 Sil</button>\n              </div>\n            </div>\n          \n            <div class=\"w-[165px] border border-dashed border-[#cccccc] rounded-[6px] p-[10px] bg-white flex flex-col items-center text-center\">\n              <div class=\"w-[130px] h-[130px] rounded-full p-1 bg-gradient-to-tr from-amber-500 via-pink-500 to-purple-600 mb-2.5\">\n                <img src=\"data:image/jpeg;base64,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\" alt=\"Müşteri Memnuniyeti\" class=\"w-full h-full object-cover rounded-full border-2 border-white\" />\n              </div>\n              <div class=\"text-[13.5px] font-bold text-[#1e293b] truncate w-full\">Müşteri Memnuniyeti</div>\n              <div class=\"text-[11.5px] text-[#74788d] truncate w-full mt-0.5\">/yorumlar</div>\n              <div class=\"grid grid-cols-2 gap-1.5 w-full mt-3 pt-2.5 border-t border-dashed border-[#cccccc]\">\n                <button type=\"button\" class=\"h-[26px] rounded bg-[#f0f3ff] text-[#3d94fb] text-[11.5px] font-semibold cursor-pointer\">✎ Düzenle</button>\n                <button type=\"button\" class=\"h-[26px] rounded bg-red-50 text-red-600 text-[11.5px] font-semibold cursor-pointer\">🗑 Sil</button>\n              </div>\n            </div>\n          \n            <div class=\"w-[165px] border border-dashed border-[#cccccc] rounded-[6px] p-[10px] bg-white flex flex-col items-center text-center\">\n              <div class=\"w-[130px] h-[130px] rounded-full p-1 bg-gradient-to-tr from-amber-500 via-pink-500 to-purple-600 mb-2.5\">\n                <img src=\"data:image/jpeg;base64,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\" alt=\"Aynı Gün Kargo\" class=\"w-full h-full object-cover rounded-full border-2 border-white\" />\n              </div>\n              <div class=\"text-[13.5px] font-bold text-[#1e293b] truncate w-full\">Aynı Gün Kargo</div>\n              <div class=\"text-[11.5px] text-[#74788d] truncate w-full mt-0.5\">/kargo-takip</div>\n              <div class=\"grid grid-cols-2 gap-1.5 w-full mt-3 pt-2.5 border-t border-dashed border-[#cccccc]\">\n                <button type=\"button\" class=\"h-[26px] rounded bg-[#f0f3ff] text-[#3d94fb] text-[11.5px] font-semibold cursor-pointer\">✎ Düzenle</button>\n                <button type=\"button\" class=\"h-[26px] rounded bg-red-50 text-red-600 text-[11.5px] font-semibold cursor-pointer\">🗑 Sil</button>\n              </div>\n            </div>\n          \n        </div>\n      </div>\n    </div>\n  </section>";

const HeroManagerPage = () => {
  useEffect(() => {
    if (typeof window === "undefined") return
    ;(window as any).switchThemeSubView = (sub: string) => {
      document.querySelectorAll(".theme-subview").forEach((el) => el.classList.add("hidden"))
      document.querySelectorAll(".theme-subtab").forEach((btn) => {
        btn.className =
          "theme-subtab py-3.5 border-b-2 border-transparent text-slate-600 hover:text-slate-900 whitespace-nowrap cursor-pointer"
      })
      const targetView =
        document.getElementById("subview-theme-" + sub) ||
        document.getElementById("subview-theme-theme")
      const targetBtn =
        document.getElementById("theme-subtab-" + sub) ||
        document.getElementById("theme-subtab-theme")
      if (targetView) targetView.classList.remove("hidden")
      if (targetBtn) {
        targetBtn.className =
          "theme-subtab py-3.5 border-b-2 border-[#1565c0] text-[#1565c0] whitespace-nowrap cursor-pointer"
      }
    }
    const syncThemeTab = () => {
      const sp = new URLSearchParams(window.location.search)
      const rawTab = sp.get("tab") || "theme"
      const tabMap: Record<string, string> = {
        "blok-yonetimi": "modules",
        "gorsel-optimizasyonu": "image",
        "301-yonlendirmeleri": "redirect301",
        "404-kirik-linkler": "page404",
        "gorsel-yukle": "upload",
        yardim: "help",
      }
      const resolved = tabMap[rawTab] || rawTab
      if (typeof (window as any).switchThemeSubView === "function") {
        ;(window as any).switchThemeSubView(resolved)
      }
    }
    syncThemeTab()
    window.addEventListener("popstate", syncThemeTab)
    return () => window.removeEventListener("popstate", syncThemeTab)
  }, [])

  const [tag, setTag] = useState("")
  const [title, setTitle] = useState("")
  const [subtitle, setSubtitle] = useState("")
  const [btnText, setBtnText] = useState("")
  const [btnLink, setBtnLink] = useState("")
  const [mediaType, setMediaType] = useState("image")
  const [mediaUrl, setMediaUrl] = useState("")
  const [categories, setCategories] = useState<Category[]>([])
  const [banners, setBanners] = useState<Banner[]>([])
  const [topAnnouncement, setTopAnnouncement] = useState("")
  const [topAnnouncementEnabled, setTopAnnouncementEnabled] = useState(true)
  const [topAnnouncementBg, setTopAnnouncementBg] = useState("#000000")
  const [topAnnouncementTextColor, setTopAnnouncementTextColor] = useState("#ffffff")
  const [scrollingTextHome, setScrollingTextHome] = useState("")
  const [scrollingTextHomeEnabled, setScrollingTextHomeEnabled] = useState(true)
  const [scrollingTextHomeBg, setScrollingTextHomeBg] = useState("#000000")
  const [scrollingTextHomeTextColor, setScrollingTextHomeTextColor] = useState("#ffffff")
  const [scrollingTextProduct, setScrollingTextProduct] = useState("")
  const [scrollingTextProductEnabled, setScrollingTextProductEnabled] = useState(true)
  const [scrollingTextProductBg, setScrollingTextProductBg] = useState("#FFD700")
  const [scrollingTextProductTextColor, setScrollingTextProductTextColor] = useState("#000000")

  // Buton Ayarları state'leri
  const [buyNowEnabled, setBuyNowEnabled] = useState(true)
  const [buyNowBg, setBuyNowBg] = useState("#E50000")
  const [buyNowTextColor, setBuyNowTextColor] = useState("#ffffff")
  const [addToCartEnabled, setAddToCartEnabled] = useState(true)
  const [addToCartBg, setAddToCartBg] = useState("#000000")
  const [addToCartTextColor, setAddToCartTextColor] = useState("#ffffff")
  const [whatsappEnabled, setWhatsappEnabled] = useState(true)
  const [whatsappNumber, setWhatsappNumber] = useState("905323370081")
  const [whatsappBg, setWhatsappBg] = useState("#ffffff")
  const [whatsappTextColor, setWhatsappTextColor] = useState("#25D366")

  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [uploading, setUploading] = useState(false)
  const [toastMessage, setToastMessage] = useState("")

  useEffect(() => {
    const linkId = "plus-jakarta-sans-font";
    if (!document.getElementById(linkId)) {
      const link = document.createElement("link");
      link.id = linkId;
      link.rel = "stylesheet";
      link.href = "https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap";
      document.head.appendChild(link);
    }
  }, []);

  const handleFileUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0]
    if (!file) return

    setUploading(true)

    // Auto-detect media type
    if (file.type.startsWith("video/")) {
      setMediaType("video")
    } else if (file.type.startsWith("image/")) {
      setMediaType("image")
    }

    const reader = new FileReader()
    reader.onload = async () => {
      try {
        const base64 = reader.result as string
        const res = await fetch("/admin/hero-config/upload", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            filename: file.name,
            filetype: file.type,
            base64,
          }),
        })

        const data = await res.json()
        if (data && data.success) {
          setMediaUrl(data.url)
        } else {
          alert("Dosya yüklenirken hata oluştu: " + (data.message || "Bilinmeyen hata"))
        }
      } catch (err) {
        console.error("Upload error:", err)
        alert("Dosya yüklenirken bağlantı hatası oluştu.")
      } finally {
        setUploading(false)
      }
    }

    reader.onerror = () => {
      alert("Dosya okunurken bir hata oluştu.")
      setUploading(false)
    }

    reader.readAsDataURL(file)
  }

  // Fetch the current config on mount
  useEffect(() => {
    const fetchConfig = async () => {
      try {
        const res = await fetch("/admin/hero-config")
        const data = await res.json()
        if (data && data.config) {
          setTag(data.config.tag || "")
          setTitle(data.config.title || "")
          setSubtitle(data.config.subtitle || "")
          setBtnText(data.config.btn_text || "")
          setBtnLink(data.config.btn_link || "")
          setMediaType(data.config.media_type || "image")
          setMediaUrl(data.config.media_url || "")
          setCategories(data.config.categories || defaultCategories)
          setBanners(data.config.banners || defaultBanners)
          setTopAnnouncement(data.config.top_announcement || "")
          setTopAnnouncementEnabled(data.config.top_announcement_enabled ?? true)
          setTopAnnouncementBg(data.config.top_announcement_bg || "#000000")
          setTopAnnouncementTextColor(data.config.top_announcement_text_color || "#ffffff")
          setScrollingTextHome(data.config.scrolling_text_home || "")
          setScrollingTextHomeEnabled(data.config.scrolling_text_home_enabled ?? true)
          setScrollingTextHomeBg(data.config.scrolling_text_home_bg || "#000000")
          setScrollingTextHomeTextColor(data.config.scrolling_text_home_text_color || "#ffffff")
          setScrollingTextProduct(data.config.scrolling_text_product || "")
          setScrollingTextProductEnabled(data.config.scrolling_text_product_enabled ?? true)
          setScrollingTextProductBg(data.config.scrolling_text_product_bg || "#FFD700")
          setScrollingTextProductTextColor(data.config.scrolling_text_product_text_color || "#000000")
          setBuyNowEnabled(data.config.buy_now_enabled ?? true)
          setBuyNowBg(data.config.buy_now_bg || "#E50000")
          setBuyNowTextColor(data.config.buy_now_text_color || "#ffffff")
          setAddToCartEnabled(data.config.add_to_cart_enabled ?? true)
          setAddToCartBg(data.config.add_to_cart_bg || "#000000")
          setAddToCartTextColor(data.config.add_to_cart_text_color || "#ffffff")
          setWhatsappEnabled(data.config.whatsapp_enabled ?? true)
          setWhatsappNumber(data.config.whatsapp_number || "905323370081")
          setWhatsappBg(data.config.whatsapp_bg || "#ffffff")
          setWhatsappTextColor(data.config.whatsapp_text_color || "#25D366")
        }
      } catch (err) {
        console.error("Failed to load hero configuration:", err)
      } finally {
        setLoading(false)
      }
    }

    fetchConfig()
  }, [])

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setSaving(true)
    setToastMessage("")

    try {
      const res = await fetch("/admin/hero-config", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          tag,
          title,
          subtitle,
          btn_text: btnText,
          btn_link: btnLink,
          media_type: mediaType,
          media_url: mediaUrl,
          categories,
          banners,
          top_announcement: topAnnouncement,
          top_announcement_enabled: topAnnouncementEnabled,
          top_announcement_bg: topAnnouncementBg,
          top_announcement_text_color: topAnnouncementTextColor,
          scrolling_text_home: scrollingTextHome,
          scrolling_text_home_enabled: scrollingTextHomeEnabled,
          scrolling_text_home_bg: scrollingTextHomeBg,
          scrolling_text_home_text_color: scrollingTextHomeTextColor,
          scrolling_text_product: scrollingTextProduct,
          scrolling_text_product_enabled: scrollingTextProductEnabled,
          scrolling_text_product_bg: scrollingTextProductBg,
          scrolling_text_product_text_color: scrollingTextProductTextColor,
          buy_now_enabled: buyNowEnabled,
          buy_now_bg: buyNowBg,
          buy_now_text_color: buyNowTextColor,
          add_to_cart_enabled: addToCartEnabled,
          add_to_cart_bg: addToCartBg,
          add_to_cart_text_color: addToCartTextColor,
          whatsapp_enabled: whatsappEnabled,
          whatsapp_number: whatsappNumber,
          whatsapp_bg: whatsappBg,
          whatsapp_text_color: whatsappTextColor,
        }),
      })

      const data = await res.json()
      if (data && data.success) {
        setToastMessage("Vitrin, Kategori ve Kampanya ayarları başarıyla güncellendi! ✔")
        setTimeout(() => setToastMessage(""), 4000)
      } else {
        alert("Ayarlar kaydedilirken bir hata oluştu.")
      }
    } catch (err) {
      console.error("Error saving config:", err)
      alert("Sunucuyla bağlantı kurulamadı.")
    } finally {
      setSaving(false)
    }
  }

  // Category list modification handlers
  const handleCategoryChange = (index: number, field: keyof Category, value: string) => {
    const newCategories = [...categories]
    newCategories[index] = {
      ...newCategories[index],
      [field]: value
    }
    setCategories(newCategories)
  }

  const handleCategoryIconUpload = async (index: number, e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0]
    if (!file) return

    const reader = new FileReader()
    reader.onload = async () => {
      try {
        const base64 = reader.result as string
        const res = await fetch("/admin/hero-config/upload", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            filename: file.name,
            filetype: file.type,
            base64,
          }),
        })

        const data = await res.json()
        if (data && data.success) {
          handleCategoryChange(index, "icon", data.url)
        } else {
          alert("İkon yüklenirken hata oluştu: " + (data.message || "Bilinmeyen hata"))
        }
      } catch (err) {
        console.error("Icon upload error:", err)
        alert("İkon yüklenirken bağlantı hatası oluştu.")
      }
    }
    reader.readAsDataURL(file)
  }

  const addCategory = () => {
    setCategories([
      ...categories,
      {
        name: "Yeni Kategori",
        handle: "yeni-kategori",
        icon: `<svg class="w-8 h-8" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" /></svg>`
      }
    ])
  }

  const removeCategory = (index: number) => {
    if (confirm("Bu kategoriyi silmek istediğinize emin misiniz?")) {
      const newCategories = categories.filter((_, idx) => idx !== index)
      setCategories(newCategories)
    }
  }

  const resetCategories = () => {
    if (confirm("Kategorileri ilk varsayılan ayarlarına döndürmek istediğinize emin misiniz?")) {
      setCategories(defaultCategories)
    }
  }

  const renderIconPreview = (iconString: string) => {
    if (!iconString) {
      return (
        <svg className="w-8 h-8 text-zinc-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path strokeLinecap="round" strokeLinejoin="round" d="M12 9v3m0 0v3m0-3h3m-3 0H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
        </svg>
      )
    }

    if (iconString.trim().startsWith("<svg")) {
      return <div dangerouslySetInnerHTML={{ __html: iconString }} className="w-8 h-8 flex items-center justify-center" />
    }

    return <img src={iconString} className="w-8 h-8 object-contain" alt="İkon Önizleme" />
  }

  // Banner modification handlers
  const handleBannerChange = (index: number, field: keyof Banner, value: string) => {
    const newBanners = [...banners]
    newBanners[index] = {
      ...newBanners[index],
      [field]: value
    }
    setBanners(newBanners)
  }

  const handleBannerImageUpload = async (index: number, e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0]
    if (!file) return

    const reader = new FileReader()
    reader.onload = async () => {
      try {
        const base64 = reader.result as string
        const res = await fetch("/admin/hero-config/upload", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            filename: file.name,
            filetype: file.type,
            base64,
          }),
        })

        const data = await res.json()
        if (data && data.success) {
          handleBannerChange(index, "image_url", data.url)
        } else {
          alert("Görsel yüklenirken hata oluştu: " + (data.message || "Bilinmeyen hata"))
        }
      } catch (err) {
        console.error("Banner image upload error:", err)
        alert("Görsel yüklenirken bağlantı hatası oluştu.")
      }
    }
    reader.readAsDataURL(file)
  }

  if (loading) {
    return (
      <div className="flex h-[60vh] items-center justify-center bg-white rounded-2xl border border-zinc-200 p-8 shadow-sm">
        <div className="flex flex-col items-center gap-3">
          <div className="w-10 h-10 border-4 border-violet-500 border-t-transparent rounded-full animate-spin" />
          <span className="text-sm font-semibold text-zinc-500">Konfigürasyon Yükleniyor...</span>
        </div>
      </div>
    )
  }

  return (
    <div className="bg-zinc-50 min-h-screen p-8 custom-admin-wrapper">
      <style>{`
        .custom-admin-wrapper {
          font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif !important;
          text-rendering: optimizeLegibility !important;
        }
        
        .custom-admin-wrapper * {
          font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif !important;
        }
      `}</style>
      <div className="max-w-4xl mx-auto flex flex-col gap-6">
        
        {/* Header Block */}
        <div className="flex items-center justify-between pb-6 border-b border-zinc-200">
          <div className="flex items-center gap-3">
            <div className="p-3 rounded-2xl bg-violet-600 text-white shadow-[0_4px_12px_rgba(124,58,237,0.3)]">
              <ComputerDesktop className="w-6 h-6" />
            </div>
            <div>
              <h1 className="text-2xl font-black text-zinc-950 tracking-tight">Ana Sayfa Vitrin & Kategori Özelleştirme</h1>
              <p className="text-xs text-zinc-500 font-semibold mt-0.5">Hero banner, görsel/video arka planları, hızlı kategori çemberleri ve ikili kampanya banner'larını canlı düzenleyin.</p>
            </div>
          </div>
        </div>

        {/* Toast Notification */}
        {toastMessage && (
          <div className="flex items-center gap-3 p-4 rounded-xl bg-emerald-50 border border-emerald-200 text-emerald-800 shadow-[0_4px_12px_rgba(16,185,129,0.1)] transition-all duration-300 animate-fade-in">
            <CheckCircle className="w-5 h-5 text-emerald-600" />
            <span className="text-sm font-bold">{toastMessage}</span>
          </div>
        )}

        {/* Main Form */}
        <form onSubmit={handleSubmit} className="flex flex-col gap-8">
          
          {/* KAYAN YAZI & DUYURU AYARLARI KARTI */}
          <div className="bg-white rounded-2xl border border-zinc-200 p-8 shadow-[0_4px_25px_rgba(0,0,0,0.02)] flex flex-col gap-6">
            <div className="border-b border-zinc-100 pb-3 flex items-center justify-between">
              <h2 className="text-base font-bold text-zinc-900 flex items-center gap-2">
                <span className="w-2.5 h-2.5 rounded-full bg-violet-500" />
                Kayan Yazı & Duyuru Ayarları
              </h2>
            </div>
            
            <div className="flex flex-col gap-8">
              
              {/* SECTION 1: TEPE DUYURU METNİ */}
              <div className="p-6 rounded-xl border border-zinc-200 bg-zinc-50/30 flex flex-col gap-4">
                <div className="flex items-center justify-between border-b border-zinc-100 pb-3">
                  <span className="text-xs font-extrabold text-violet-600 uppercase tracking-wider">1. Tepe Duyuru Metni Ayarları</span>
                  <label className="flex items-center gap-2 cursor-pointer select-none">
                    <input
                      type="checkbox"
                      checked={topAnnouncementEnabled}
                      onChange={(e) => setTopAnnouncementEnabled(e.target.checked)}
                      className="w-4 h-4 rounded text-violet-600 border-zinc-300 focus:ring-violet-500 cursor-pointer"
                    />
                    <span className="text-xs font-extrabold text-zinc-700">Bu Alanı Aktif Et</span>
                  </label>
                </div>
                
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div className="flex flex-col gap-2">
                    <label className="text-xs font-extrabold text-zinc-700 uppercase tracking-wider">Duyuru Metni (Virgülle Ayrılmış Çoklu Cümle Destekler)</label>
                    <input
                      type="text"
                      value={topAnnouncement}
                      onChange={(e) => setTopAnnouncement(e.target.value)}
                      placeholder="Örn: 2026 YENİ SEZON MODELLER, AYNI GÜN KARGO, HIZLI TESLİMAT"
                      className="w-full px-4 py-2.5 rounded-lg border border-zinc-300 focus:outline-none focus:border-violet-500 focus:ring-2 focus:ring-violet-500/10 text-sm font-medium transition-all"
                    />
                    <p className="text-[10px] text-zinc-400 font-semibold">
                      Sitenin en üstündeki duyuru barı metni. Virgüllerle ayırarak birden fazla duyuru girebilirsiniz (örneğin: "Yeni Sezon, Aynı Gün Kargo"). Bu durumda metinler sırayla sağdan sola kayarak ve ortada 3 saniye durarak görüntülenecektir.
                    </p>
                  </div>
                  
                  <div className="flex items-center gap-4">
                    <div className="flex flex-col gap-1.5 flex-1">
                      <label className="text-[10px] font-extrabold text-zinc-500 uppercase tracking-wider">Bant Arka Plan Rengi</label>
                      <div className="flex items-center gap-2">
                        <input
                          type="color"
                          value={topAnnouncementBg}
                          onChange={(e) => setTopAnnouncementBg(e.target.value)}
                          className="w-10 h-10 p-0.5 border border-zinc-200 rounded-lg cursor-pointer shrink-0"
                        />
                        <input
                          type="text"
                          value={topAnnouncementBg}
                          onChange={(e) => setTopAnnouncementBg(e.target.value)}
                          className="w-full px-3 py-2 border border-zinc-300 rounded-lg text-xs font-mono font-bold"
                          placeholder="#000000"
                        />
                      </div>
                    </div>
                    
                    <div className="flex flex-col gap-1.5 flex-1">
                      <label className="text-[10px] font-extrabold text-zinc-500 uppercase tracking-wider">Yazı Rengi</label>
                      <div className="flex items-center gap-2">
                        <input
                          type="color"
                          value={topAnnouncementTextColor}
                          onChange={(e) => setTopAnnouncementTextColor(e.target.value)}
                          className="w-10 h-10 p-0.5 border border-zinc-200 rounded-lg cursor-pointer shrink-0"
                        />
                        <input
                          type="text"
                          value={topAnnouncementTextColor}
                          onChange={(e) => setTopAnnouncementTextColor(e.target.value)}
                          className="w-full px-3 py-2 border border-zinc-300 rounded-lg text-xs font-mono font-bold"
                          placeholder="#ffffff"
                        />
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              {/* SECTION 2: ANA SAYFA KAYAN YAZI (MARQUEE) */}
              <div className="p-6 rounded-xl border border-zinc-200 bg-zinc-50/30 flex flex-col gap-4">
                <div className="flex items-center justify-between border-b border-zinc-100 pb-3">
                  <span className="text-xs font-extrabold text-violet-600 uppercase tracking-wider">2. Ana Sayfa Kayan Yazı (Marquee) Ayarları</span>
                  <label className="flex items-center gap-2 cursor-pointer select-none">
                    <input
                      type="checkbox"
                      checked={scrollingTextHomeEnabled}
                      onChange={(e) => setScrollingTextHomeEnabled(e.target.checked)}
                      className="w-4 h-4 rounded text-violet-600 border-zinc-300 focus:ring-violet-500 cursor-pointer"
                    />
                    <span className="text-xs font-extrabold text-zinc-700">Bu Alanı Aktif Et</span>
                  </label>
                </div>
                
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div className="flex flex-col gap-2">
                    <label className="text-xs font-extrabold text-zinc-700 uppercase tracking-wider">Kayan Yazı Metni</label>
                    <input
                      type="text"
                      value={scrollingTextHome}
                      onChange={(e) => setScrollingTextHome(e.target.value)}
                      placeholder="Örn: 3000 ₺ Üzeri Alışverişlerinizde Kargo Ücretsiz"
                      className="w-full px-4 py-2.5 rounded-lg border border-zinc-300 focus:outline-none focus:border-violet-500 focus:ring-2 focus:ring-violet-500/10 text-sm font-medium transition-all"
                    />
                    <p className="text-[10px] text-zinc-400 font-semibold">
                      Ana sayfada Hero banner'ın altında sonsuz döngüyle kayan duyuru bandı metni.
                    </p>
                  </div>
                  
                  <div className="flex items-center gap-4">
                    <div className="flex flex-col gap-1.5 flex-1">
                      <label className="text-[10px] font-extrabold text-zinc-500 uppercase tracking-wider">Bant Arka Plan Rengi</label>
                      <div className="flex items-center gap-2">
                        <input
                          type="color"
                          value={scrollingTextHomeBg}
                          onChange={(e) => setScrollingTextHomeBg(e.target.value)}
                          className="w-10 h-10 p-0.5 border border-zinc-200 rounded-lg cursor-pointer shrink-0"
                        />
                        <input
                          type="text"
                          value={scrollingTextHomeBg}
                          onChange={(e) => setScrollingTextHomeBg(e.target.value)}
                          className="w-full px-3 py-2 border border-zinc-300 rounded-lg text-xs font-mono font-bold"
                          placeholder="#000000"
                        />
                      </div>
                    </div>
                    
                    <div className="flex flex-col gap-1.5 flex-1">
                      <label className="text-[10px] font-extrabold text-zinc-500 uppercase tracking-wider">Yazı Rengi</label>
                      <div className="flex items-center gap-2">
                        <input
                          type="color"
                          value={scrollingTextHomeTextColor}
                          onChange={(e) => setScrollingTextHomeTextColor(e.target.value)}
                          className="w-10 h-10 p-0.5 border border-zinc-200 rounded-lg cursor-pointer shrink-0"
                        />
                        <input
                          type="text"
                          value={scrollingTextHomeTextColor}
                          onChange={(e) => setScrollingTextHomeTextColor(e.target.value)}
                          className="w-full px-3 py-2 border border-zinc-300 rounded-lg text-xs font-mono font-bold"
                          placeholder="#ffffff"
                        />
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              {/* SECTION 3: ÜRÜN DETAY KAYAN YAZI */}
              <div className="p-6 rounded-xl border border-zinc-200 bg-zinc-50/30 flex flex-col gap-4">
                <div className="flex items-center justify-between border-b border-zinc-100 pb-3">
                  <span className="text-xs font-extrabold text-violet-600 uppercase tracking-wider">3. Ürün Detay Kayan Yazı Ayarları</span>
                  <label className="flex items-center gap-2 cursor-pointer select-none">
                    <input
                      type="checkbox"
                      checked={scrollingTextProductEnabled}
                      onChange={(e) => setScrollingTextProductEnabled(e.target.checked)}
                      className="w-4 h-4 rounded text-violet-600 border-zinc-300 focus:ring-violet-500 cursor-pointer"
                    />
                    <span className="text-xs font-extrabold text-zinc-700">Bu Alanı Aktif Et</span>
                  </label>
                </div>
                
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div className="flex flex-col gap-2">
                    <label className="text-xs font-extrabold text-zinc-700 uppercase tracking-wider">Kayan Yazı Metni</label>
                    <input
                      type="text"
                      value={scrollingTextProduct}
                      onChange={(e) => setScrollingTextProduct(e.target.value)}
                      placeholder="Örn: Sepette %10 İndirim Kodu : MDS10 • 3000 ₺ Üzeri Ücretsiz Kargo"
                      className="w-full px-4 py-2.5 rounded-lg border border-zinc-300 focus:outline-none focus:border-violet-500 focus:ring-2 focus:ring-violet-500/10 text-sm font-medium transition-all"
                    />
                    <p className="text-[10px] text-zinc-400 font-semibold">
                      Ürün detay sayfalarında satın alma butonlarının hemen üzerinde sonsuz döngüyle kayan şerit metni.
                    </p>
                  </div>
                  
                  <div className="flex items-center gap-4">
                    <div className="flex flex-col gap-1.5 flex-1">
                      <label className="text-[10px] font-extrabold text-zinc-500 uppercase tracking-wider">Bant Arka Plan Rengi</label>
                      <div className="flex items-center gap-2">
                        <input
                          type="color"
                          value={scrollingTextProductBg}
                          onChange={(e) => setScrollingTextProductBg(e.target.value)}
                          className="w-10 h-10 p-0.5 border border-zinc-200 rounded-lg cursor-pointer shrink-0"
                        />
                        <input
                          type="text"
                          value={scrollingTextProductBg}
                          onChange={(e) => setScrollingTextProductBg(e.target.value)}
                          className="w-full px-3 py-2 border border-zinc-300 rounded-lg text-xs font-mono font-bold"
                          placeholder="#FFD700"
                        />
                      </div>
                    </div>
                    
                    <div className="flex flex-col gap-1.5 flex-1">
                      <label className="text-[10px] font-extrabold text-zinc-500 uppercase tracking-wider">Yazı Rengi</label>
                      <div className="flex items-center gap-2">
                        <input
                          type="color"
                          value={scrollingTextProductTextColor}
                          onChange={(e) => setScrollingTextProductTextColor(e.target.value)}
                          className="w-10 h-10 p-0.5 border border-zinc-200 rounded-lg cursor-pointer shrink-0"
                        />
                        <input
                          type="text"
                          value={scrollingTextProductTextColor}
                          onChange={(e) => setScrollingTextProductTextColor(e.target.value)}
                          className="w-full px-3 py-2 border border-zinc-300 rounded-lg text-xs font-mono font-bold"
                          placeholder="#000000"
                        />
                      </div>
                    </div>
                  </div>
                </div>
              </div>

            </div>
          </div>

          {/* BANNER AYARLARI KARTI */}
          <div className="bg-white rounded-2xl border border-zinc-200 p-8 shadow-[0_4px_25px_rgba(0,0,0,0.02)] flex flex-col gap-8">
            
            {/* Section 1: Metinler */}
            <div className="flex flex-col gap-6">
              <h2 className="text-base font-bold text-zinc-900 border-b border-zinc-100 pb-3 flex items-center gap-2">
                <span className="w-2.5 h-2.5 rounded-full bg-violet-500" />
                Hero Banner Yazı Alanları ve İçerik
              </h2>
              
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                {/* Tag Input */}
                <div className="flex flex-col gap-2">
                  <label className="text-xs font-extrabold text-zinc-700 uppercase tracking-wider">Üst Etiket (Tag)</label>
                  <input
                    type="text"
                    value={tag}
                    onChange={(e) => setTag(e.target.value)}
                    placeholder="MEDUSA V2 × NEXT.JS"
                    className="w-full px-4 py-2.5 rounded-lg border border-zinc-300 focus:outline-none focus:border-violet-500 focus:ring-2 focus:ring-violet-500/10 text-sm font-medium transition-all"
                  />
                </div>

                {/* Title Input */}
                <div className="flex flex-col gap-2 md:col-span-2">
                  <label className="text-xs font-extrabold text-zinc-700 uppercase tracking-wider">Ana Başlık (Title)</label>
                  <input
                    type="text"
                    required
                    value={title}
                    onChange={(e) => setTitle(e.target.value)}
                    placeholder="XOOX Mağazasına Hoş Geldiniz"
                    className="w-full px-4 py-2.5 rounded-lg border border-zinc-300 focus:outline-none focus:border-violet-500 focus:ring-2 focus:ring-violet-500/10 text-sm font-bold text-zinc-950 transition-all"
                  />
                </div>

                {/* Subtitle Input */}
                <div className="flex flex-col gap-2 md:col-span-2">
                  <label className="text-xs font-extrabold text-zinc-700 uppercase tracking-wider">Alt Başlık (Subtitle)</label>
                  <textarea
                    value={subtitle}
                    onChange={(e) => setSubtitle(e.target.value)}
                    placeholder="Koleksiyonlarimizi keşfedin..."
                    rows={3}
                    className="w-full px-4 py-2.5 rounded-lg border border-zinc-300 focus:outline-none focus:border-violet-500 focus:ring-2 focus:ring-violet-500/10 text-sm font-medium transition-all resize-none"
                  />
                </div>
              </div>
            </div>

            {/* Section 2: Buton Ayarları */}
            <div className="flex flex-col gap-6">
              <h2 className="text-base font-bold text-zinc-900 border-b border-zinc-100 pb-3 flex items-center gap-2">
                <span className="w-2.5 h-2.5 rounded-full bg-violet-500" />
                Buton (CTA) Özellikleri
              </h2>
              
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                {/* Button Text */}
                <div className="flex flex-col gap-2">
                  <label className="text-xs font-extrabold text-zinc-700 uppercase tracking-wider">Buton Yazısı (Button Text)</label>
                  <input
                    type="text"
                    value={btnText}
                    onChange={(e) => setBtnText(e.target.value)}
                    placeholder="Şimdi Alışverişe Başla"
                    className="w-full px-4 py-2.5 rounded-lg border border-zinc-300 focus:outline-none focus:border-violet-500 focus:ring-2 focus:ring-violet-500/10 text-sm font-medium transition-all"
                  />
                </div>

                {/* Button Link */}
                <div className="flex flex-col gap-2">
                  <label className="text-xs font-extrabold text-zinc-700 uppercase tracking-wider">Buton Bağlantısı (Button URL)</label>
                  <input
                    type="text"
                    value={btnLink}
                    onChange={(e) => setBtnLink(e.target.value)}
                    placeholder="/store"
                    className="w-full px-4 py-2.5 rounded-lg border border-zinc-300 focus:outline-none focus:border-violet-500 focus:ring-2 focus:ring-violet-500/10 text-sm font-medium transition-all"
                  />
                </div>
              </div>
            </div>

            {/* Section 3: Arka Plan Medyası */}
            <div className="flex flex-col gap-6">
              <h2 className="text-base font-bold text-zinc-900 border-b border-zinc-100 pb-3 flex items-center gap-2">
                <span className="w-2.5 h-2.5 rounded-full bg-violet-500" />
                Arka Plan Medyası (Görsel veya .mp4 Video)
              </h2>
              
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                {/* Media Type Dropdown */}
                <div className="flex flex-col gap-2">
                  <label className="text-xs font-extrabold text-zinc-700 uppercase tracking-wider">Medya Türü (Media Type)</label>
                  <select
                    value={mediaType}
                    onChange={(e) => setMediaType(e.target.value)}
                    className="w-full px-4 py-2.5 rounded-lg border border-zinc-300 focus:outline-none focus:border-violet-500 focus:ring-2 focus:ring-violet-500/10 text-sm font-medium transition-all"
                  >
                    <option value="image">Görsel (Image)</option>
                    <option value="video">Video (.mp4)</option>
                  </select>
                </div>

                {/* File Upload Area */}
                <div className="flex flex-col gap-2 md:col-span-2">
                  <label className="text-xs font-extrabold text-zinc-700 uppercase tracking-wider">
                    Dosya Yükle (Görsel veya .mp4 Video - Maks 25MB)
                  </label>
                  <div className="flex items-center justify-center w-full">
                    <label className="flex flex-col items-center justify-center w-full h-36 border-2 border-dashed rounded-xl cursor-pointer hover:bg-zinc-50 border-zinc-300 hover:border-violet-500 transition-all duration-300 relative overflow-hidden">
                      <div className="flex flex-col items-center justify-center pt-5 pb-6 px-4 text-center">
                        {uploading ? (
                          <>
                            <div className="w-8 h-8 mb-3 border-4 border-violet-500 border-t-transparent rounded-full animate-spin" />
                            <p className="text-sm font-bold text-violet-600">Medya Sunucuya Yükleniyor...</p>
                            <p className="text-xs text-zinc-400 mt-1">Lütfen bekleyin, dosya boyutu büyükse birkaç saniye sürebilir.</p>
                          </>
                        ) : (
                          <>
                            <Sparkles className="w-8 h-8 mb-3 text-violet-500 animate-pulse" />
                            <p className="text-sm font-bold text-zinc-700">Yüklemek istediğiniz dosyayı seçin</p>
                            <p className="text-xs text-zinc-400 mt-1">Görsel (PNG, JPG, WEBP) veya MP4 Video dosyası seçebilirsiniz</p>
                            {mediaUrl && (
                              <p className="text-[11px] font-semibold text-emerald-600 mt-2 bg-emerald-50 px-2 py-0.5 rounded-full border border-emerald-100 truncate max-w-full">
                                Şu an yüklü: {mediaUrl.substring(mediaUrl.lastIndexOf("/") + 1)}
                              </p>
                            )}
                          </>
                        )}
                      </div>
                      <input 
                        type="file" 
                        className="hidden" 
                        accept="image/*,video/mp4" 
                        disabled={uploading} 
                        onChange={handleFileUpload} 
                      />
                    </label>
                  </div>
                </div>

                {/* Media URL Input */}
                <div className="flex flex-col gap-2 md:col-span-2">
                  <label className="text-xs font-extrabold text-zinc-700 uppercase tracking-wider">Yüklenen Medya Bağlantısı / Manuel Link</label>
                  <input
                    type="text"
                    value={mediaUrl}
                    onChange={(e) => setMediaUrl(e.target.value)}
                    placeholder="https://örnek.com/banner.jpg veya https://örnek.com/banner.mp4"
                    className="w-full px-4 py-2.5 rounded-lg border border-zinc-300 focus:outline-none focus:border-violet-500 focus:ring-2 focus:ring-violet-500/10 text-sm font-medium transition-all"
                  />
                  <p className="text-[10px] text-zinc-400 font-medium">Dosya yüklediğinizde burası otomatik doldurulur. Dilerseniz harici bir CDN linki de girebilirsiniz.</p>
                </div>
              </div>
            </div>
          </div>

          {/* İKİLİ KAMPANYA BANNER'LARI YÖNETİMİ KARTI */}
          <div className="bg-white rounded-2xl border border-zinc-200 p-8 shadow-[0_4px_25px_rgba(0,0,0,0.02)] flex flex-col gap-8">
            <h2 className="text-base font-bold text-zinc-900 border-b border-zinc-100 pb-3 flex items-center gap-2">
              <span className="w-2.5 h-2.5 rounded-full bg-violet-500" />
              İkili Kampanya Banner'ları Özelleştirme
            </h2>
            
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
              {banners.map((banner, idx) => (
                <div key={idx} className="p-6 rounded-2xl border border-zinc-200 bg-zinc-50/50 hover:bg-white hover:shadow-lg transition-all duration-300 flex flex-col gap-6">
                  <div className="flex items-center justify-between border-b border-zinc-200/60 pb-3">
                    <span className="text-xs font-black text-violet-600 uppercase tracking-wider">
                      {idx === 0 ? "Left (1. Banner) Görünümü" : "Right (2. Banner) Görünümü"}
                    </span>
                  </div>

                  {/* WYSIWYG Live Preview Box */}
                  <div 
                    className="h-[180px] rounded-xl border border-zinc-200 relative overflow-hidden bg-cover bg-center flex flex-col justify-between p-4 text-left shadow-inner"
                    style={{ 
                      backgroundImage: banner.image_url ? `url(${banner.image_url})` : "none",
                      backgroundColor: idx === 0 ? "#f4f4f5" : "#fafafa" 
                    }}
                  >
                    {!banner.image_url && (
                      <div className="absolute inset-0 bg-[linear-gradient(to_right,#e4e4e7_1px,transparent_1px),linear-gradient(to_bottom,#e4e4e7_1px,transparent_1px)] bg-[size:1.5rem_1.5rem] opacity-30" />
                    )}
                    {/* Shadow overlay if image is present */}
                    {banner.image_url && (
                      <div className="absolute inset-0 bg-white/70 backdrop-blur-[0.5px]" />
                    )}

                    <div className="relative z-10 flex flex-col justify-between h-full items-start">
                      <span className="px-2 py-0.5 rounded-full border border-violet-500/20 bg-violet-500/5 text-violet-600 text-[8px] font-bold uppercase tracking-wider">
                        {banner.tag || "Üst Etiket"}
                      </span>
                      <div className="flex flex-col gap-1 max-w-[80%]">
                        <h4 className="text-sm font-black text-zinc-950 tracking-tight leading-tight uppercase">
                          {banner.title || "Başlık Girin"}
                        </h4>
                        <p className="text-[10px] text-zinc-500 font-semibold truncate">
                          {banner.description || "Açıklama metnini buraya yazın."}
                        </p>
                      </div>
                      <button type="button" className="bg-violet-600 text-white text-[9px] font-extrabold px-3 py-1 rounded shadow-sm shrink-0">
                        {banner.btn_text || "Buton"} →
                      </button>
                    </div>
                  </div>

                  {/* Edit Fields */}
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                    {/* Tag */}
                    <div className="flex flex-col gap-1.5">
                      <label className="text-[10px] font-extrabold text-zinc-700 uppercase tracking-wider">Üst Rozet/Etiket</label>
                      <input
                        type="text"
                        required
                        value={banner.tag}
                        onChange={(e) => handleBannerChange(idx, "tag", e.target.value)}
                        placeholder="Örn: Trend Koleksiyon"
                        className="w-full px-3 py-2 rounded-lg border border-zinc-300 focus:outline-none focus:border-violet-500 text-xs font-semibold text-zinc-900"
                      />
                    </div>

                    {/* Title */}
                    <div className="flex flex-col gap-1.5">
                      <label className="text-[10px] font-extrabold text-zinc-700 uppercase tracking-wider">Kampanya Başlığı</label>
                      <input
                        type="text"
                        required
                        value={banner.title}
                        onChange={(e) => handleBannerChange(idx, "title", e.target.value)}
                        placeholder="Örn: Premium Jean Koleksiyonu"
                        className="w-full px-3 py-2 rounded-lg border border-zinc-300 focus:outline-none focus:border-violet-500 text-xs font-bold text-zinc-950"
                      />
                    </div>

                    {/* Description */}
                    <div className="flex flex-col gap-1.5 md:col-span-2">
                      <label className="text-[10px] font-extrabold text-zinc-700 uppercase tracking-wider">Açıklama Metni</label>
                      <textarea
                        required
                        value={banner.description}
                        onChange={(e) => handleBannerChange(idx, "description", e.target.value)}
                        placeholder="Kampanya detaylarını buraya yazın..."
                        rows={2}
                        className="w-full px-3 py-2 rounded-lg border border-zinc-300 focus:outline-none focus:border-violet-500 text-xs font-semibold text-zinc-700 resize-none"
                      />
                    </div>

                    {/* Button Text */}
                    <div className="flex flex-col gap-1.5">
                      <label className="text-[10px] font-extrabold text-zinc-700 uppercase tracking-wider">Buton Metni</label>
                      <input
                        type="text"
                        required
                        value={banner.btn_text}
                        onChange={(e) => handleBannerChange(idx, "btn_text", e.target.value)}
                        placeholder="Örn: Koleksiyonu Keşfet"
                        className="w-full px-3 py-2 rounded-lg border border-zinc-300 focus:outline-none focus:border-violet-500 text-xs font-semibold text-zinc-900"
                      />
                    </div>

                    {/* Button Link (Collection path) */}
                    <div className="flex flex-col gap-1.5">
                      <label className="text-[10px] font-extrabold text-zinc-700 uppercase tracking-wider">Buton Bağlantısı (Koleksiyon/Kategori)</label>
                      <input
                        type="text"
                        required
                        value={banner.btn_link}
                        onChange={(e) => handleBannerChange(idx, "btn_link", e.target.value)}
                        placeholder="Örn: /categories/jean-pantolon"
                        className="w-full px-3 py-2 rounded-lg border border-zinc-300 focus:outline-none focus:border-violet-500 text-xs font-semibold text-zinc-800"
                      />
                    </div>

                    {/* Background Image Upload & Input */}
                    <div className="flex flex-col gap-1.5 md:col-span-2">
                      <label className="text-[10px] font-extrabold text-zinc-700 uppercase tracking-wider">Arka Plan Görseli / Banner Resmi</label>
                      <div className="flex items-center gap-3">
                        <input
                          type="text"
                          value={banner.image_url}
                          onChange={(e) => handleBannerChange(idx, "image_url", e.target.value)}
                          placeholder="Arka plan görsel linki (boş bırakılırsa ızgara çizimli degrade kullanılır)"
                          className="flex-1 px-3 py-2 rounded-lg border border-zinc-300 focus:outline-none focus:border-violet-500 text-xs font-medium text-zinc-800"
                        />
                        <label className="cursor-pointer bg-zinc-100 hover:bg-zinc-200 border border-zinc-300 text-zinc-700 text-xs font-extrabold px-4 py-2 rounded-lg transition-all flex items-center gap-1.5 shrink-0 select-none">
                          <span>Görsel Yükle</span>
                          <input
                            type="file"
                            accept="image/*"
                            className="hidden"
                            onChange={(e) => handleBannerImageUpload(idx, e)}
                          />
                        </label>
                      </div>
                    </div>

                  </div>
                </div>
              ))}
            </div>
          </div>

          {/* HIZLI KATEGORİ İKONLARI YÖNETİMİ KARTI */}
          <div className="bg-white rounded-2xl border border-zinc-200 p-8 shadow-[0_4px_25px_rgba(0,0,0,0.02)] flex flex-col gap-6">
            <div className="flex items-center justify-between border-b border-zinc-100 pb-4">
              <h2 className="text-base font-bold text-zinc-900 flex items-center gap-2">
                <span className="w-2.5 h-2.5 rounded-full bg-violet-500" />
                Hızlı Kategori İkonları Yönetimi
              </h2>
              <div className="flex items-center gap-2">
                <button
                  type="button"
                  onClick={resetCategories}
                  className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg border border-zinc-200 text-zinc-600 hover:text-zinc-950 hover:bg-zinc-50 text-xs font-bold transition-all"
                >
                  <ArrowPath className="w-3.5 h-3.5" />
                  Varsayılana Sıfırla
                </button>
                <button
                  type="button"
                  onClick={addCategory}
                  className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-violet-600 text-white hover:bg-violet-700 shadow-sm text-xs font-bold transition-all"
                >
                  <Plus className="w-3.5 h-3.5" />
                  Yeni Kategori Ekle
                </button>
              </div>
            </div>
            
            <p className="text-xs text-zinc-400 font-semibold leading-relaxed mt-1">
              Ana sayfadaki hızlı kategori çemberlerini buradan düzenleyebilirsiniz. İkon alanından bilgisayarınızdan doğrudan bir görsel yükleyebilir (PNG, JPG, SVG, WEBP) veya manuel olarak resim adresi ya da inline SVG kodu girebilirsiniz.
            </p>

            <div className="flex flex-col gap-4 mt-2">
              {categories.map((cat, idx) => (
                <div key={idx} className="p-5 rounded-xl border border-zinc-200 bg-zinc-50/50 hover:bg-white hover:shadow-md transition-all duration-300 flex flex-col md:flex-row gap-6 items-start">
                  
                  {/* Left: Live SVG/Image Preview */}
                  <div className="flex flex-col items-center gap-2 shrink-0">
                    <span className="text-[10px] font-extrabold text-zinc-400 uppercase tracking-wider">İkon Önizleme</span>
                    <div className="w-16 h-16 rounded-full border border-zinc-200 bg-zinc-50 flex items-center justify-center text-zinc-700 relative shadow-inner overflow-hidden">
                      {renderIconPreview(cat.icon)}
                    </div>
                  </div>

                  {/* Middle: Inputs */}
                  <div className="flex-1 grid grid-cols-1 md:grid-cols-2 gap-4 w-full">
                    {/* Category Name */}
                    <div className="flex flex-col gap-1.5">
                      <label className="text-[10px] font-extrabold text-zinc-700 uppercase tracking-wider">Kategori Adı</label>
                      <input
                        type="text"
                        required
                        value={cat.name}
                        onChange={(e) => handleCategoryChange(idx, "name", e.target.value)}
                        placeholder="Örn: Jean Pantolon"
                        className="w-full px-3 py-2 rounded-lg border border-zinc-300 focus:outline-none focus:border-violet-500 text-xs font-semibold text-zinc-900"
                      />
                    </div>

                    {/* Category Handle/Slug */}
                    <div className="flex flex-col gap-1.5">
                      <label className="text-[10px] font-extrabold text-zinc-700 uppercase tracking-wider">Bağlantı Slug'ı (Link)</label>
                      <input
                        type="text"
                        required
                        value={cat.handle}
                        onChange={(e) => handleCategoryChange(idx, "handle", e.target.value)}
                        placeholder="Örn: jean-pantolon"
                        className="w-full px-3 py-2 rounded-lg border border-zinc-300 focus:outline-none focus:border-violet-500 text-xs font-medium text-zinc-800"
                      />
                    </div>

                    {/* Custom Icon Image Upload & URL input */}
                    <div className="flex flex-col gap-1.5 md:col-span-2">
                      <label className="text-[10px] font-extrabold text-zinc-700 uppercase tracking-wider">Kategori İkonu Görseli (Dosya Seçin veya Link Girin)</label>
                      <div className="flex items-center gap-3">
                        <input
                          type="text"
                          required
                          value={cat.icon}
                          onChange={(e) => handleCategoryChange(idx, "icon", e.target.value)}
                          placeholder="Görsel bağlantısı (http...), SVG kodları veya dosya seçerek otomatik yükleyin"
                          className="flex-1 px-3 py-2 rounded-lg border border-zinc-300 focus:outline-none focus:border-violet-500 text-xs font-medium text-zinc-800"
                        />
                        <label className="cursor-pointer bg-zinc-100 hover:bg-zinc-200 border border-zinc-300 text-zinc-700 text-xs font-extrabold px-4 py-2 rounded-lg transition-all flex items-center gap-1.5 shrink-0 select-none">
                          <span>Dosya Yükle</span>
                          <input
                            type="file"
                            accept="image/*"
                            className="hidden"
                            onChange={(e) => handleCategoryIconUpload(idx, e)}
                          />
                        </label>
                      </div>
                    </div>
                  </div>

                  {/* Right: Actions */}
                  <div className="shrink-0 self-stretch flex md:flex-col justify-between md:justify-end items-end w-full md:w-auto">
                    <button
                      type="button"
                      onClick={() => removeCategory(idx)}
                      className="inline-flex items-center gap-1 px-2.5 py-1.5 rounded-lg border border-red-200 text-red-600 hover:bg-red-50 text-xs font-bold transition-all"
                    >
                      <Trash className="w-3.5 h-3.5" />
                      Sil
                    </button>
                  </div>

                </div>
              ))}
            </div>

            <div className="flex justify-center mt-2">
              <button
                type="button"
                onClick={addCategory}
                className="inline-flex items-center gap-2 px-6 py-2.5 rounded-xl border border-dashed border-zinc-300 hover:border-violet-500 hover:text-violet-600 text-zinc-500 text-xs font-extrabold transition-all duration-300 w-full justify-center bg-zinc-50/20"
              >
                <Plus className="w-4 h-4" />
                Yeni Kategori Çemberi Ekle
              </button>
            </div>

          </div>

          {/* BUTON AYARLARI KARTI */}
          <div id="buton-ayarlari" className="bg-white rounded-2xl border border-zinc-200 p-8 shadow-[0_4px_25px_rgba(0,0,0,0.02)] flex flex-col gap-6">
            <div className="flex flex-col gap-1 border-b border-zinc-100 pb-4">
              <h2 className="text-base font-bold text-zinc-900 flex items-center gap-2">
                <span className="w-2.5 h-2.5 rounded-full bg-violet-500" />
                Buton Ayarları
              </h2>
              <p className="text-xs text-zinc-400 font-semibold leading-relaxed">
                Ürün detay sayfasındaki satın alma ve WhatsApp butonlarını buradan yönetebilirsiniz.
              </p>
            </div>

            <div className="flex flex-col gap-y-6">
              {/* HEMEN AL BUTTON */}
              <div className="bg-zinc-50/40 rounded-xl border border-zinc-200 p-6 flex flex-col gap-4">
                <div className="flex items-center justify-between border-b border-zinc-100 pb-3 mb-2">
                  <h3 className="text-sm font-bold text-zinc-900 flex items-center gap-2">
                    Hemen Al Butonu
                  </h3>
                  <label className="flex items-center gap-2 cursor-pointer">
                    <span className="text-xs font-semibold text-zinc-500">Görünürlük</span>
                    <input
                      type="checkbox"
                      checked={buyNowEnabled}
                      onChange={(e) => setBuyNowEnabled(e.target.checked)}
                      className="w-4 h-4 accent-violet-600"
                    />
                  </label>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div className="flex flex-col gap-1.5">
                    <label className="text-[10px] font-extrabold text-zinc-500 uppercase">Arkaplan Rengi (HEX)</label>
                    <input
                      type="text"
                      placeholder="#E50000"
                      value={buyNowBg}
                      onChange={(e) => setBuyNowBg(e.target.value)}
                      className="w-full px-3 py-2 rounded-lg border border-zinc-300 text-xs font-bold text-zinc-900 bg-white focus:outline-none focus:border-violet-500"
                    />
                  </div>
                  <div className="flex flex-col gap-1.5">
                    <label className="text-[10px] font-extrabold text-zinc-500 uppercase">Yazı Rengi (HEX)</label>
                    <input
                      type="text"
                      placeholder="#ffffff"
                      value={buyNowTextColor}
                      onChange={(e) => setBuyNowTextColor(e.target.value)}
                      className="w-full px-3 py-2 rounded-lg border border-zinc-300 text-xs font-bold text-zinc-900 bg-white focus:outline-none focus:border-violet-500"
                    />
                  </div>
                </div>

                <div className="mt-2 p-4 rounded-lg bg-zinc-50 border border-zinc-200 flex items-center justify-center">
                  <button
                    type="button"
                    disabled
                    className="w-full max-w-sm h-12 flex items-center justify-center uppercase tracking-widest text-[14px] font-bold border-none rounded-none"
                    style={{ backgroundColor: buyNowBg, color: buyNowTextColor }}
                  >
                    HEMEN AL
                  </button>
                </div>
              </div>

              {/* SEPETE EKLE BUTTON */}
              <div className="bg-zinc-50/40 rounded-xl border border-zinc-200 p-6 flex flex-col gap-4">
                <div className="flex items-center justify-between border-b border-zinc-100 pb-3 mb-2">
                  <h3 className="text-sm font-bold text-zinc-900 flex items-center gap-2">
                    Sepete Ekle Butonu
                  </h3>
                  <label className="flex items-center gap-2 cursor-pointer">
                    <span className="text-xs font-semibold text-zinc-500">Görünürlük</span>
                    <input
                      type="checkbox"
                      checked={addToCartEnabled}
                      onChange={(e) => setAddToCartEnabled(e.target.checked)}
                      className="w-4 h-4 accent-violet-600"
                    />
                  </label>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div className="flex flex-col gap-1.5">
                    <label className="text-[10px] font-extrabold text-zinc-500 uppercase">Arkaplan Rengi (HEX)</label>
                    <input
                      type="text"
                      placeholder="#000000"
                      value={addToCartBg}
                      onChange={(e) => setAddToCartBg(e.target.value)}
                      className="w-full px-3 py-2 rounded-lg border border-zinc-300 text-xs font-bold text-zinc-900 bg-white focus:outline-none focus:border-violet-500"
                    />
                  </div>
                  <div className="flex flex-col gap-1.5">
                    <label className="text-[10px] font-extrabold text-zinc-500 uppercase">Yazı Rengi (HEX)</label>
                    <input
                      type="text"
                      placeholder="#ffffff"
                      value={addToCartTextColor}
                      onChange={(e) => setAddToCartTextColor(e.target.value)}
                      className="w-full px-3 py-2 rounded-lg border border-zinc-300 text-xs font-bold text-zinc-900 bg-white focus:outline-none focus:border-violet-500"
                    />
                  </div>
                </div>

                <div className="mt-2 p-4 rounded-lg bg-zinc-50 border border-zinc-200 flex items-center justify-center">
                  <button
                    type="button"
                    disabled
                    className="w-full max-w-sm h-12 flex items-center justify-center uppercase tracking-widest text-[14px] font-bold border-none rounded-none"
                    style={{ backgroundColor: addToCartBg, color: addToCartTextColor }}
                  >
                    SEPETE EKLE
                  </button>
                </div>
              </div>

              {/* WHATSAPP BUTTON */}
              <div className="bg-zinc-50/40 rounded-xl border border-zinc-200 p-6 flex flex-col gap-4">
                <div className="flex items-center justify-between border-b border-zinc-100 pb-3 mb-2">
                  <h3 className="text-sm font-bold text-zinc-900 flex items-center gap-2">
                    WhatsApp İle Sipariş Butonu
                  </h3>
                  <label className="flex items-center gap-2 cursor-pointer">
                    <span className="text-xs font-semibold text-zinc-500">Görünürlük</span>
                    <input
                      type="checkbox"
                      checked={whatsappEnabled}
                      onChange={(e) => setWhatsappEnabled(e.target.checked)}
                      className="w-4 h-4 accent-violet-600"
                    />
                  </label>
                </div>

                <div className="flex flex-col gap-1.5 mb-2">
                  <label className="text-[10px] font-extrabold text-zinc-500 uppercase">WhatsApp Telefon Numarası</label>
                  <input
                    type="text"
                    placeholder="örn. 905323370081"
                    value={whatsappNumber}
                    onChange={(e) => setWhatsappNumber(e.target.value)}
                    className="w-full px-3 py-2 rounded-lg border border-zinc-300 text-xs font-bold text-zinc-900 bg-white focus:outline-none focus:border-violet-500"
                  />
                  <p className="text-[10px] text-zinc-400 font-semibold mt-0.5">Ülke kodu ile birlikte boşluk bırakmadan girin (örn. 905...)</p>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div className="flex flex-col gap-1.5">
                    <label className="text-[10px] font-extrabold text-zinc-500 uppercase">Arkaplan Rengi (HEX)</label>
                    <input
                      type="text"
                      placeholder="#ffffff"
                      value={whatsappBg}
                      onChange={(e) => setWhatsappBg(e.target.value)}
                      className="w-full px-3 py-2 rounded-lg border border-zinc-300 text-xs font-bold text-zinc-900 bg-white focus:outline-none focus:border-violet-500"
                    />
                  </div>
                  <div className="flex flex-col gap-1.5">
                    <label className="text-[10px] font-extrabold text-zinc-500 uppercase">Yazı ve Çerçeve Rengi (HEX)</label>
                    <input
                      type="text"
                      placeholder="#25D366"
                      value={whatsappTextColor}
                      onChange={(e) => setWhatsappTextColor(e.target.value)}
                      className="w-full px-3 py-2 rounded-lg border border-zinc-300 text-xs font-bold text-zinc-900 bg-white focus:outline-none focus:border-violet-500"
                    />
                  </div>
                </div>

                <div className="mt-2 p-4 rounded-lg bg-zinc-50 border border-zinc-200 flex items-center justify-center">
                  <button
                    type="button"
                    disabled
                    className="w-full max-w-sm h-12 flex items-center justify-center gap-2 uppercase tracking-widest text-[14px] font-bold border rounded-none"
                    style={{
                      backgroundColor: whatsappBg,
                      color: whatsappTextColor,
                      borderColor: whatsappTextColor,
                    }}
                  >
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
                      <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413Z" />
                    </svg>
                    WHATSAPP İLE SİPARİŞ
                  </button>
                </div>
              </div>
            </div>
          </div>

          {/* SUBMIT ACTION FOOTER */}
          <div className="flex justify-end pt-4 border-t border-zinc-200">
            <button
              type="submit"
              disabled={saving}
              className="bg-violet-600 hover:bg-violet-700 text-white font-bold text-sm px-10 py-3.5 rounded-xl shadow-[0_4px_18px_rgba(124,58,237,0.35)] hover:shadow-[0_8px_25px_rgba(124,58,237,0.45)] transition-all duration-300 disabled:bg-zinc-400 disabled:cursor-not-allowed flex items-center gap-2"
            >
              {saving ? (
                <>
                  <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" />
                  Değişiklikler Kaydediliyor...
                </>
              ) : (
                <>
                  <Sparkles className="w-4 h-4 text-white" />
                  Değişiklikleri Kaydet
                </>
              )}
            </button>
          </div>

        </form>

      </div>
    </div>
  )
}

export const config = defineRouteConfig({
  label: "Vitrin & Kategori Yönetimi",
  icon: Sparkles,
})

export default HeroManagerPage
