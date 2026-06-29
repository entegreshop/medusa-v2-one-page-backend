const fs = require('fs');
const newModal = `      {/* DETAIL VIEW MODAL DIALOG (Görsel 3) */}
      {selectedOrderId && activeOrderDetails && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 animate-fade-in">
          <div className="absolute inset-0 bg-black/50 backdrop-blur-[2px]" onClick={() => setSelectedOrderId(null)} />
          <div className="bg-zinc-50 rounded-lg border border-zinc-200 shadow-2xl w-full max-w-[1300px] h-[92vh] flex flex-col overflow-hidden relative z-10">
            
            {/* Header segment */}
            <div className="bg-[#0b5ed7] text-white px-6 py-4 flex items-center justify-between shadow-sm select-none shrink-0">
              <div className="flex flex-col">
                <span className="text-[14px] font-semibold text-blue-100 mb-0.5">Sipariş Yönetimi</span>
                <span className="text-[20px] font-bold tracking-tight">{activeOrderDetails.display_id} Nolu Sipariş</span>
              </div>
              <button 
                onClick={() => setSelectedOrderId(null)} 
                className="text-white hover:opacity-85 p-1 rounded-lg transition-colors">
                <XMark className="w-7 h-7" />
              </button>
            </div>

            {/* Main scrollable body grid */}
            <div className="flex-1 p-6 overflow-y-auto grid grid-cols-1 lg:grid-cols-[1fr_340px] gap-6">
              
              {/* Left Side elements */}
              <div className="flex flex-col gap-6">
                
                {/* 1. Products list table card */}
                <div className="bg-white border border-zinc-200 rounded-lg shadow-sm overflow-hidden">
                  <div className="p-4 border-b border-zinc-100 flex items-center justify-between bg-white">
                    <div className="flex items-center gap-2 text-emerald-500">
                      <CheckCircle className="w-5 h-5" />
                      <h3 className="text-[14px] font-bold text-zinc-800 tracking-tight">
                        Teslim Edilen Ürünler ({activeOrderDetails.items.length})
                      </h3>
                    </div>
                    <div className="flex gap-2">
                      {!editingProducts ? (
                        <button onClick={() => {
                          setEditingProducts(true);
                          setTempProducts(activeOrderDetails.items.map(i => ({ id: i.id, unit_price: i.unit_price, quantity: i.quantity })));
                        }} className="px-4 py-1.5 bg-white border border-zinc-200 text-zinc-700 hover:bg-zinc-50 font-medium text-[13px] rounded shadow-sm">Düzenle</button>
                      ) : (
                        <>
                          <button onClick={handleSaveProducts} className="px-4 py-1.5 bg-emerald-50 border border-emerald-200 text-emerald-700 hover:bg-emerald-100 font-bold text-[13px] rounded shadow-sm">Kaydet</button>
                          <button onClick={() => setEditingProducts(false)} className="px-4 py-1.5 bg-zinc-50 border border-zinc-200 text-zinc-600 hover:bg-zinc-100 font-medium text-[13px] rounded shadow-sm">İptal</button>
                        </>
                      )}
                      <button onClick={() => setShowProductSearchModal(true)} className="px-4 py-1.5 bg-white border border-blue-200 text-blue-600 hover:bg-blue-50 font-medium text-[13px] rounded shadow-sm">İade Oluştur</button>
                    </div>
                  </div>

                  <table className="w-full border-collapse text-left text-[13px] font-medium text-zinc-700">
                    <thead>
                      <tr className="bg-white border-b border-zinc-100 text-[13px] font-semibold text-zinc-500">
                        <th className="py-3 px-4">Ürün</th>
                        <th className="py-3 px-4 text-center">Fiyat</th>
                        <th className="py-3 px-4 text-center">KDV</th>
                        <th className="py-3 px-4 text-center">Miktar</th>
                        <th className="py-3 px-4 text-right">Tutar</th>
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-zinc-100">
                      {activeOrderDetails.items.map((item) => (
                        <tr key={item.id}>
                          <td className="py-4 px-4 flex gap-4 items-start">
                            <div className="w-16 h-20 bg-zinc-50 border border-zinc-200 rounded-md overflow-hidden flex-shrink-0 flex items-center justify-center text-xl select-none">
                              {item.thumbnail ? (
                                <img src={item.thumbnail} alt={item.title} className="w-full h-full object-cover" />
                              ) : (
                                "👖"
                              )}
                            </div>
                            <div className="flex flex-col">
                              <span className="font-medium text-zinc-800 text-[14px] leading-relaxed">{item.title}</span>
                              <span className="text-[13px] text-zinc-500 mt-1">
                                #{item.sku || "-"} {item.barcode ? \`- \${item.barcode}\` : ""}
                              </span>
                              <span className="text-[13px] text-zinc-600 mt-1">BEDEN: {item.size}</span>
                            </div>
                          </td>
                          <td className="py-4 px-4 text-center text-zinc-600">
                            {editingProducts ? (
                              <input 
                                type="number" 
                                className="w-20 border rounded px-2 py-1 text-center text-[13px]"
                                value={tempProducts.find(t => t.id === item.id)?.unit_price || 0}
                                onChange={e => {
                                  const val = parseFloat(e.target.value) || 0;
                                  setTempProducts(prev => prev.map(t => t.id === item.id ? { ...t, unit_price: val } : t))
                                }}
                              />
                            ) : (
                              <>{item.unit_price.toLocaleString("tr-TR", { minimumFractionDigits: 2 })} TL</>
                            )}
                          </td>
                          <td className="py-4 px-4 text-center text-zinc-600">
                            %{item.vat_rate}
                          </td>
                          <td className="py-4 px-4 text-center">
                            {editingProducts ? (
                              <input 
                                type="number" 
                                className="w-16 border rounded px-2 py-1 text-center text-[13px] mx-auto block"
                                value={tempProducts.find(t => t.id === item.id)?.quantity || 1}
                                onChange={e => {
                                  const val = parseInt(e.target.value) || 1;
                                  setTempProducts(prev => prev.map(t => t.id === item.id ? { ...t, quantity: val } : t))
                                }}
                              />
                            ) : (
                              <div className="flex flex-col leading-none">
                                <span className="font-medium text-zinc-800 text-[14px]">{item.quantity}</span>
                                <span className="text-[11px] text-zinc-500 mt-1">Adet</span>
                              </div>
                            )}
                          </td>
                          <td className="py-4 px-4 text-right font-medium text-zinc-800">
                            {editingProducts ? (
                              <div className="flex items-center justify-end gap-3">
                                <span>{((tempProducts.find(t => t.id === item.id)?.unit_price || 0) * (tempProducts.find(t => t.id === item.id)?.quantity || 0)).toLocaleString("tr-TR", { minimumFractionDigits: 2 })} TL</span>
                                <button
                                  title="Ürünü Sil"
                                  onClick={() => setTempProducts(prev => prev.filter(t => t.id !== item.id))}
                                  className="w-7 h-7 flex items-center justify-center rounded bg-rose-50 hover:bg-rose-100 text-rose-500 transition-colors shrink-0"
                                >
                                  <Trash className="w-4 h-4" />
                                </button>
                              </div>
                            ) : (
                              <>{(item.unit_price * item.quantity).toLocaleString("tr-TR", { minimumFractionDigits: 2 })} TL</>
                            )}
                          </td>
                        </tr>
                      ))}

                      {/* Display calculations */}
                      <tr className="bg-white text-zinc-600 text-[13px]">
                        <td colSpan={3} className="py-4 px-4 border-t border-zinc-100">
                          <div className="flex flex-col gap-2 text-zinc-500">
                            <label className="flex items-center gap-2 cursor-pointer">
                              <input type="checkbox" className="w-4 h-4 rounded text-blue-600" />
                              <span>Stok miktarını göster</span>
                            </label>
                            <label className="flex items-center gap-2 cursor-pointer">
                              <input type="checkbox" className="w-4 h-4 rounded text-blue-600" />
                              <span>Desiyi göster</span>
                            </label>
                            <label className="flex items-center gap-2 cursor-pointer">
                              <input type="checkbox" className="w-4 h-4 rounded text-blue-600" />
                              <span>Özel kodları göster</span>
                            </label>
                          </div>
                        </td>
                        <td className="py-4 px-4 text-right border-t border-zinc-100">
                          <div className="flex flex-col gap-2 text-zinc-500">
                            <span>Ara Toplam</span>
                            <span>İndirim</span>
                            <span>Kapıda Nakit Ödeme</span>
                            <span>Genel Toplam</span>
                          </div>
                        </td>
                        <td className="py-4 px-4 text-right font-medium text-zinc-800 border-t border-zinc-100">
                          <div className="flex flex-col gap-2">
                            <span>{activeOrderDetails.subtotal.toLocaleString("tr-TR", { minimumFractionDigits: 2 })} TL</span>
                            <span className="text-rose-500">-79.90 TL</span>
                            <span>100.00 TL</span>
                            <span>{activeOrderDetails.total.toLocaleString("tr-TR", { minimumFractionDigits: 2 })} TL</span>
                          </div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>

                {/* 2. Admin note card */}
                <div className="bg-white border border-zinc-200 rounded-lg p-5 flex flex-col gap-3 shadow-sm">
                  <div className="flex justify-between items-center pb-2">
                    <h3 className="text-[14px] font-bold text-zinc-800">
                      Yönetici Notu
                    </h3>
                    {!editingNotes ? (
                      <button 
                        onClick={() => { setEditingNotes(true); setTempNotesText(activeOrderDetails.admin_notes || ""); }}
                        className="text-zinc-400 hover:text-zinc-600 border border-zinc-200 rounded p-1.5 bg-white"
                      >
                        <Pencil className="w-4 h-4" />
                      </button>
                    ) : (
                      <div className="flex items-center gap-2">
                        <button 
                          onClick={handleSaveNotes}
                          className="text-[13px] font-medium text-emerald-600 hover:underline border border-emerald-200 bg-emerald-50 px-3 py-1 rounded"
                        >
                          Kaydet
                        </button>
                        <button 
                          onClick={() => setEditingNotes(false)}
                          className="text-[13px] font-medium text-zinc-500 hover:underline border border-zinc-200 bg-zinc-50 px-3 py-1 rounded"
                        >
                          Vazgeç
                        </button>
                      </div>
                    )}
                  </div>
                  
                  {editingNotes ? (
                    <textarea 
                      rows={2}
                      value={tempNotesText}
                      onChange={(e) => setTempNotesText(e.target.value)}
                      className="w-full p-3 border border-zinc-300 rounded text-[13px] text-zinc-800 outline-none focus:border-blue-500"
                    />
                  ) : (
                    <div className="text-[14px] text-zinc-800 bg-white min-h-12">
                      {activeOrderDetails.admin_notes || "Yönetici notu bulunmuyor."}
                    </div>
                  )}
                </div>

                {/* 3. Customer, shipping & billing details cards grid */}
                <div className="bg-white border border-zinc-200 rounded-lg p-0 flex flex-col md:flex-row divide-y md:divide-y-0 md:divide-x divide-zinc-100 shadow-sm">
                  {/* Customer Block */}
                  <div className="flex-1 p-5 flex flex-col gap-4">
                    <div className="flex justify-between items-center border-b border-zinc-100 pb-3">
                      <h4 className="text-[14px] font-bold text-zinc-800">Müşteri</h4>
                      <div className="flex items-center gap-2">
                        <span className="border border-zinc-200 px-2 py-0.5 rounded text-[12px] font-medium text-zinc-600 bg-zinc-50">
                          {activeOrderDetails.customer.is_visitor ? "Ziyaretçi" : "Üye"}
                        </span>
                        {!editingCustomer ? (
                          <button 
                            onClick={() => {
                              setEditingCustomer(true);
                              setTempCustomer({ first_name: activeOrderDetails.customer.first_name, last_name: activeOrderDetails.customer.last_name, email: activeOrderDetails.customer.email, phone: activeOrderDetails.customer.phone });
                            }}
                            className="text-zinc-400 hover:text-zinc-600 border border-zinc-200 rounded p-1 bg-white"
                          >
                            <Pencil className="w-3.5 h-3.5" />
                          </button>
                        ) : (
                          <div className="flex items-center gap-1">
                            <button onClick={handleSaveCustomer} className="text-[11px] font-medium text-emerald-600 bg-emerald-50 px-2 py-1 rounded border border-emerald-200">Kaydet</button>
                            <button onClick={() => setEditingCustomer(false)} className="text-[11px] font-medium text-zinc-500 bg-zinc-50 px-2 py-1 rounded border border-zinc-200">İptal</button>
                          </div>
                        )}
                      </div>
                    </div>
                    <div className="text-[14px] space-y-2.5 text-zinc-700">
                      {!editingCustomer ? (
                        <>
                          <div className="font-bold text-zinc-900">
                            {activeOrderDetails.customer.first_name} {activeOrderDetails.customer.last_name}
                          </div>
                          <div className="flex items-center gap-2 text-zinc-600">
                            <svg className="w-4 h-4 text-zinc-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2"><path strokeLinecap="round" strokeLinejoin="round" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" /></svg>
                            {activeOrderDetails.customer.email}
                          </div>
                          <div className="flex items-center gap-2 text-zinc-600">
                            <svg className="w-4 h-4 text-zinc-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2"><path strokeLinecap="round" strokeLinejoin="round" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" /></svg>
                            {activeOrderDetails.customer.phone}
                          </div>
                        </>
                      ) : (
                        <div className="flex flex-col gap-2">
                          <input type="text" className="w-full border rounded p-1.5 text-[13px]" value={tempCustomer.first_name} onChange={e => setTempCustomer({...tempCustomer, first_name: e.target.value})} placeholder="Ad" />
                          <input type="text" className="w-full border rounded p-1.5 text-[13px]" value={tempCustomer.last_name} onChange={e => setTempCustomer({...tempCustomer, last_name: e.target.value})} placeholder="Soyad" />
                          <input type="email" className="w-full border rounded p-1.5 text-[13px]" value={tempCustomer.email} onChange={e => setTempCustomer({...tempCustomer, email: e.target.value})} placeholder="E-posta" />
                          <input type="text" className="w-full border rounded p-1.5 text-[13px]" value={tempCustomer.phone} onChange={e => setTempCustomer({...tempCustomer, phone: e.target.value})} placeholder="Telefon" />
                        </div>
                      )}
                      
                      <div className="flex items-center gap-2 text-zinc-500 mt-2">
                        <svg className="w-4 h-4 text-zinc-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2"><path strokeLinecap="round" strokeLinejoin="round" d="M5 12h14M5 12a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v4a2 2 0 01-2 2M5 12a2 2 0 00-2 2v4a2 2 0 002 2h14a2 2 0 002-2v-4a2 2 0 00-2-2m-2-4h.01M17 16h.01" /></svg>
                        <span className="text-[13px]">{activeOrderDetails.customer.ip}</span>
                      </div>
                    </div>
                  </div>

                  {/* Delivery Address Block */}
                  <div className="flex-1 p-5 flex flex-col gap-4">
                    <div className="flex justify-between items-center border-b border-zinc-100 pb-3">
                      <h4 className="text-[14px] font-bold text-zinc-800">Teslimat Bilgileri</h4>
                      {!editingShipping ? (
                        <button 
                          onClick={() => {
                            setEditingShipping(true);
                            setTempShipping({ first_name: activeOrderDetails.shipping_address.first_name, last_name: activeOrderDetails.shipping_address.last_name, address_1: activeOrderDetails.shipping_address.address_1, district: activeOrderDetails.shipping_address.district, city: activeOrderDetails.shipping_address.city });
                          }}
                          className="text-zinc-400 hover:text-zinc-600 border border-zinc-200 rounded p-1 bg-white"
                        >
                          <Pencil className="w-3.5 h-3.5" />
                        </button>
                      ) : (
                        <div className="flex items-center gap-1">
                          <button onClick={handleSaveShipping} className="text-[11px] font-medium text-emerald-600 bg-emerald-50 px-2 py-1 rounded border border-emerald-200">Kaydet</button>
                          <button onClick={() => setEditingShipping(false)} className="text-[11px] font-medium text-zinc-500 bg-zinc-50 px-2 py-1 rounded border border-zinc-200">İptal</button>
                        </div>
                      )}
                    </div>
                    <div className="text-[14px] space-y-2 text-zinc-600">
                      {!editingShipping ? (
                        <>
                          <div className="font-bold text-zinc-900">{activeOrderDetails.shipping_address.first_name} {activeOrderDetails.shipping_address.last_name}</div>
                          <div className="leading-relaxed">{activeOrderDetails.shipping_address.address_1}</div>
                          <div className="text-zinc-500">{activeOrderDetails.shipping_address.district} / {activeOrderDetails.shipping_address.city} / Türkiye</div>
                        </>
                      ) : (
                        <div className="flex flex-col gap-2">
                          <input type="text" className="w-full border rounded p-1.5 text-[13px]" value={tempShipping.first_name} onChange={e => setTempShipping({...tempShipping, first_name: e.target.value})} placeholder="Ad" />
                          <input type="text" className="w-full border rounded p-1.5 text-[13px]" value={tempShipping.last_name} onChange={e => setTempShipping({...tempShipping, last_name: e.target.value})} placeholder="Soyad" />
                          <textarea rows={2} className="w-full border rounded p-1.5 text-[13px]" value={tempShipping.address_1} onChange={e => setTempShipping({...tempShipping, address_1: e.target.value})} placeholder="Adres" />
                          <input type="text" className="w-full border rounded p-1.5 text-[13px]" value={tempShipping.district} onChange={e => setTempShipping({...tempShipping, district: e.target.value})} placeholder="İlçe" />
                          <input type="text" className="w-full border rounded p-1.5 text-[13px]" value={tempShipping.city} onChange={e => setTempShipping({...tempShipping, city: e.target.value})} placeholder="İl" />
                        </div>
                      )}
                    </div>
                  </div>

                  {/* Billing Address Block */}
                  <div className="flex-1 p-5 flex flex-col gap-4">
                    <div className="flex justify-between items-center border-b border-zinc-100 pb-3">
                      <h4 className="text-[14px] font-bold text-zinc-800">Fatura Bilgileri</h4>
                      {!editingBilling ? (
                        <button 
                          onClick={() => {
                            setEditingBilling(true);
                            setTempBilling({ first_name: activeOrderDetails.billing_address.first_name, last_name: activeOrderDetails.billing_address.last_name, address_1: activeOrderDetails.billing_address.address_1, district: activeOrderDetails.billing_address.district, city: activeOrderDetails.billing_address.city, tc_no: activeOrderDetails.billing_address.tc_no || "" });
                          }}
                          className="text-zinc-400 hover:text-zinc-600 border border-zinc-200 rounded p-1 bg-white"
                        >
                          <Pencil className="w-3.5 h-3.5" />
                        </button>
                      ) : (
                        <div className="flex items-center gap-1">
                          <button onClick={handleSaveBilling} className="text-[11px] font-medium text-emerald-600 bg-emerald-50 px-2 py-1 rounded border border-emerald-200">Kaydet</button>
                          <button onClick={() => setEditingBilling(false)} className="text-[11px] font-medium text-zinc-500 bg-zinc-50 px-2 py-1 rounded border border-zinc-200">İptal</button>
                        </div>
                      )}
                    </div>
                    <div className="text-[14px] space-y-2 text-zinc-600">
                      {!editingBilling ? (
                        <>
                          <div className="font-bold text-zinc-900">{activeOrderDetails.billing_address.first_name} {activeOrderDetails.billing_address.last_name}</div>
                          <div className="leading-relaxed">{activeOrderDetails.billing_address.address_1}</div>
                          <div className="text-zinc-500">{activeOrderDetails.billing_address.district} / {activeOrderDetails.billing_address.city} / Türkiye</div>
                        </>
                      ) : (
                        <div className="flex flex-col gap-2">
                          <input type="text" className="w-full border rounded p-1.5 text-[13px]" value={tempBilling.first_name} onChange={e => setTempBilling({...tempBilling, first_name: e.target.value})} placeholder="Ad" />
                          <input type="text" className="w-full border rounded p-1.5 text-[13px]" value={tempBilling.last_name} onChange={e => setTempBilling({...tempBilling, last_name: e.target.value})} placeholder="Soyad" />
                          <textarea rows={2} className="w-full border rounded p-1.5 text-[13px]" value={tempBilling.address_1} onChange={e => setTempBilling({...tempBilling, address_1: e.target.value})} placeholder="Adres" />
                          <input type="text" className="w-full border rounded p-1.5 text-[13px]" value={tempBilling.district} onChange={e => setTempBilling({...tempBilling, district: e.target.value})} placeholder="İlçe" />
                          <input type="text" className="w-full border rounded p-1.5 text-[13px]" value={tempBilling.city} onChange={e => setTempBilling({...tempBilling, city: e.target.value})} placeholder="İl" />
                          <input type="text" className="w-full border rounded p-1.5 text-[13px]" value={tempBilling.tc_no} onChange={e => setTempBilling({...tempBilling, tc_no: e.target.value})} placeholder="TC No" />
                        </div>
                      )}
                    </div>
                  </div>
                </div>

                {/* 4. Logs Block */}
                <div className="bg-white border border-zinc-200 rounded-lg p-5 flex flex-col gap-4 shadow-sm">
                  <div className="flex justify-between items-center border-b border-zinc-100 pb-3">
                    <h3 className="text-[14px] font-bold text-zinc-800">Yönetici Logları</h3>
                  </div>
                  <div className="divide-y divide-zinc-100 text-[13px] text-zinc-600">
                    {activeOrderDetails.logs.length === 0 ? (
                      <div className="py-2 text-zinc-400">Log kaydı bulunmuyor.</div>
                    ) : (
                      activeOrderDetails.logs.map((log) => (
                        <div key={log.id} className="py-2.5 flex justify-between items-center">
                          <span className="text-zinc-700">{log.message}</span>
                          <span className="text-zinc-400">{log.created_at}</span>
                        </div>
                      ))
                    )}
                  </div>
                </div>

              </div>

              {/* Right Side Info Cards */}
              <div className="flex flex-col gap-6">
                
                {/* 1. Main Order Summary Card */}
                <div className="bg-white border border-zinc-200 rounded-lg p-5 flex flex-col gap-4 shadow-sm">
                  <div className="flex justify-between items-start">
                    <div className="flex flex-col gap-1.5">
                      <span className="text-[20px] font-bold text-[#0b5ed7] tracking-tight leading-none">{activeOrderDetails.display_id}</span>
                      <span className="text-[14px] font-bold text-zinc-800">{activeOrderDetails.store}</span>
                      <span className="text-[13px] font-medium text-zinc-500">{activeOrderDetails.created_at}</span>
                      
                      <div className="mt-2">
                        {activeOrderDetails.status === "teslim_edilen" && <span className="px-3 py-1 rounded border border-emerald-500 bg-white text-[13px] font-bold text-emerald-600 inline-block">Teslim Edildi</span>}
                        {activeOrderDetails.status === "kargolanan" && <span className="px-3 py-1 rounded border border-amber-500 bg-white text-[13px] font-bold text-amber-600 inline-block">Kargolandı</span>}
                        {activeOrderDetails.status === "hazirlanan" && <span className="px-3 py-1 rounded border border-blue-500 bg-white text-[13px] font-bold text-blue-600 inline-block">Hazırlanıyor</span>}
                        {activeOrderDetails.status === "onay_bekleyen" && <span className="px-3 py-1 rounded border border-zinc-400 bg-white text-[13px] font-bold text-zinc-600 inline-block">Onay Bekleyen</span>}
                        {activeOrderDetails.status === "iptal_edilen" && <span className="px-3 py-1 rounded border border-rose-500 bg-white text-[13px] font-bold text-rose-600 inline-block">İptal Edildi</span>}
                        {activeOrderDetails.status === "iade_edilen" && <span className="px-3 py-1 rounded border border-red-500 bg-white text-[13px] font-bold text-red-600 inline-block">İade Edildi</span>}
                      </div>
                    </div>
                    <div className="text-right">
                      <CizgiLogo />
                    </div>
                  </div>

                  <div className="h-px bg-zinc-100 my-1" />

                  <div className="text-[13px] space-y-3 font-medium text-zinc-500">
                    <div className="flex justify-between items-center">
                      <span>Ödeme</span>
                      <span className="text-zinc-900 font-semibold">{activeOrderDetails.payment_method}</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span>Sipariş Tutarı</span>
                      <span className="text-zinc-900 font-semibold">₺ {activeOrderDetails.total.toLocaleString("tr-TR", { minimumFractionDigits: 2 })}</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span>KDV (Matrah)</span>
                      <span className="text-zinc-900 font-semibold">₺ {activeOrderDetails.vat_total.toLocaleString("tr-TR", { minimumFractionDigits: 2 })}</span>
                    </div>
                  </div>
                </div>

                {/* 2. İndirimler */}
                <div className="bg-white border border-zinc-200 rounded-lg p-5 flex flex-col gap-4 shadow-sm">
                  <div className="text-[14px] font-bold text-zinc-800">İndirimler</div>
                  <div className="flex justify-between items-center text-[13px] font-medium text-zinc-500">
                    <div className="flex items-center gap-2">
                      <GiftIcon />
                      <span className="text-zinc-900 font-semibold">SEPET %5</span>
                    </div>
                    <span className="text-zinc-900 font-semibold">55.00 TL</span>
                  </div>
                </div>

                {/* 3. Kargo Bilgileri */}
                <div className="bg-white border border-zinc-200 rounded-lg p-5 flex flex-col gap-4 shadow-sm">
                  <h4 className="text-[14px] font-bold text-zinc-800 border-b border-zinc-100 pb-3">Kargo Bilgileri</h4>
                  <div className="text-[13px] space-y-3 font-medium text-zinc-500">
                    <div className="flex justify-between items-center">
                      <span>Firma</span>
                      <span className="text-zinc-900 font-semibold uppercase">{activeOrderDetails.carrier_name}</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span>Barkod</span>
                      <span className="text-zinc-900 font-semibold">{activeOrderDetails.carrier_barcode || "-"}</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span>Takip Kodu</span>
                      <span className="text-zinc-900 font-semibold">{activeOrderDetails.carrier_barcode || "-"}</span>
                    </div>
                    <div className="flex justify-end pt-2">
                      <a href="#" className="text-[#0b5ed7] hover:underline text-[12px] truncate max-w-[250px]">
                        https://webpostman.novakargo.com/tracking?har_kod={activeOrderDetails.carrier_barcode}
                      </a>
                    </div>
                  </div>
                </div>

                {/* 4. Dönüşüm Bilgileri */}
                <div className="bg-white border border-zinc-200 rounded-lg p-5 flex flex-col gap-4 shadow-sm">
                  <h4 className="text-[14px] font-bold text-zinc-800 border-b border-zinc-100 pb-3">Dönüşüm Bilgileri</h4>
                  <div className="text-[13px] space-y-3 font-medium text-zinc-500 pb-3 border-b border-zinc-100">
                    <div className="flex justify-between">
                      <span>Trafik Kaynağı:</span>
                      <span className="text-zinc-900">Sosyal Ağ</span>
                    </div>
                    <div className="flex justify-between">
                      <span>Yönlendiren:</span>
                      <span className="text-[#0b5ed7]">instagram.com</span>
                    </div>
                  </div>
                  <div className="text-[13px] space-y-2 font-medium text-zinc-500 pt-1">
                    <div className="flex justify-between">
                      <span>Cihaz:</span>
                      <span className="text-zinc-900">Akıllı Telefon - Android - Chrome</span>
                    </div>
                    <div className="flex justify-between">
                      <span>Oturum Süresi:</span>
                      <span className="text-zinc-900">04:38 dk</span>
                    </div>
                  </div>
                </div>

              </div>
            </div>

            {/* Footer buttons row */}
            <div className="bg-white border-t border-zinc-100 px-6 py-4 flex items-center justify-between shrink-0">
              <div className="flex items-center gap-3">
                <div className="relative">
                  <button 
                    onClick={() => setIsActionMenuOpen(!isActionMenuOpen)}
                    className="bg-zinc-100 hover:bg-zinc-200 text-zinc-800 font-semibold text-[13px] h-10 px-5 rounded-lg flex items-center gap-2 transition-colors"
                  >
                    <span>İşlemler</span>
                    <svg className={\`w-3.5 h-3.5 text-zinc-500 transition-transform \${isActionMenuOpen ? 'rotate-180' : ''}\`} fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2.5">
                      <path strokeLinecap="round" strokeLinejoin="round" d="M19 9l-7 7-7-7" />
                    </svg>
                  </button>
                  
                  {isActionMenuOpen && (
                    <div className="absolute bottom-full mb-2 left-0 w-48 bg-white border border-zinc-200 rounded-lg shadow-lg overflow-hidden py-1.5 z-10 animate-fade-in">
                      <button className="w-full text-left px-4 py-2.5 text-[13px] font-medium text-zinc-700 hover:bg-zinc-50 transition-colors">Risk Kriterlerine Ekle</button>
                      <button 
                        onClick={() => {
                          setStatusModalTargetIds([activeOrderDetails.id]);
                          setNewStatusValue(activeOrderDetails.status);
                          setShowStatusModal(true);
                          setIsActionMenuOpen(false);
                        }}
                        className="w-full text-left px-4 py-2.5 text-[13px] font-medium text-zinc-700 hover:bg-zinc-50 transition-colors cursor-pointer"
                      >
                        Durumu Değiştir
                      </button>
                      <button className="w-full text-left px-4 py-2.5 text-[13px] font-medium text-zinc-700 hover:bg-zinc-50 transition-colors">SMS & E-Posta Gönder</button>
                    </div>
                  )}
                </div>
                
                {activeOrderDetails.status !== "iptal_edilen" && (
                  <button 
                    onClick={() => handleCancelOrder(activeOrderDetails.id)}
                    className="bg-[#ef4444] hover:bg-[#dc2626] text-white font-semibold text-[13px] h-10 px-6 rounded-lg transition-all shadow-sm"
                  >
                    Siparişi İptal Et
                  </button>
                )}
              </div>

              {/* Print buttons row */}
              <div className="flex items-center gap-2">
                <button onClick={() => triggerPrintSimulation("e-Fatura", activeOrderDetails.id)} className="bg-white border border-zinc-200 hover:bg-zinc-50 text-zinc-700 font-semibold text-[13px] h-10 px-4 rounded flex items-center gap-2 transition-colors">
                  <span className="text-rose-500 font-bold text-lg leading-none mb-0.5">×</span>
                  <span>E-Fatura</span>
                </button>
                <button onClick={() => triggerPrintSimulation("Fatura", activeOrderDetails.id)} className="bg-white border border-zinc-200 hover:bg-zinc-50 text-zinc-700 font-semibold text-[13px] h-10 px-4 rounded flex items-center gap-2 transition-colors">
                  <span className="text-rose-500 font-bold text-lg leading-none mb-0.5">×</span>
                  <span>Fatura</span>
                </button>
                <button onClick={() => triggerPrintSimulation("Kargo Fişi", activeOrderDetails.id)} className="bg-white border border-zinc-200 hover:bg-zinc-50 text-zinc-700 font-semibold text-[13px] h-10 px-4 rounded flex items-center gap-2 transition-colors">
                  <span className="text-emerald-500 font-bold text-lg leading-none mb-1">✓</span>
                  <span>Kargo Fişi</span>
                </button>
                <button onClick={() => triggerPrintSimulation("Fiş", activeOrderDetails.id)} className="bg-white border border-zinc-200 hover:bg-zinc-50 text-zinc-700 font-semibold text-[13px] h-10 px-4 rounded flex items-center gap-2 transition-colors">
                  <span className="text-rose-500 font-bold text-lg leading-none mb-0.5">×</span>
                  <span>Fiş</span>
                </button>
                <button onClick={() => triggerPrintSimulation("PDF", activeOrderDetails.id)} className="bg-white border border-zinc-200 hover:bg-zinc-50 text-zinc-700 font-semibold text-[13px] h-10 px-4 rounded flex items-center gap-2 transition-colors">
                  <span className="text-rose-500 font-bold text-lg leading-none mb-0.5">×</span>
                  <span>PDF</span>
                </button>
              </div>
            </div>

          </div>
        </div>
      )}`;

const original = fs.readFileSync('modal_original.txt', 'utf8');
const fullFile = fs.readFileSync('c:/Users/Asus/Downloads/Medusa V2 - One Page/backend/apps/backend/src/admin/routes/orders/page.tsx', 'utf8');
const replacedFile = fullFile.replace(original, newModal);
fs.writeFileSync('c:/Users/Asus/Downloads/Medusa V2 - One Page/backend/apps/backend/src/admin/routes/orders/page.tsx', replacedFile);
console.log('Replacement successful. Length went from', fullFile.length, 'to', replacedFile.length);
