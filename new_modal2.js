const fs = require('fs');
const newModal = `      {/* DETAIL VIEW MODAL DIALOG (Görsel 3) */}
      {selectedOrderId && activeOrderDetails && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
          <div className="absolute inset-0 bg-black/40" onClick={() => setSelectedOrderId(null)} />
          <div className="bg-[#f4f5f7] border border-[#d3d9df] shadow-2xl w-full max-w-[1400px] h-[95vh] flex flex-col overflow-hidden relative z-10 rounded-sm font-sans">
            
            {/* Header segment */}
            <div className="bg-[#0b5ed7] text-white px-5 py-3 flex items-start justify-between shrink-0">
              <div className="flex flex-col">
                <span className="text-[14px] font-medium text-white mb-0.5">Sipariş Yönetimi</span>
                <span className="text-[20px] font-bold tracking-tight">{activeOrderDetails.display_id} Nolu Sipariş</span>
              </div>
              <button 
                onClick={() => setSelectedOrderId(null)} 
                className="text-white hover:opacity-80 p-1">
                <span className="font-bold text-xl leading-none">×</span>
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
                      <div className="w-4 h-4 rounded-full border border-emerald-500 flex items-center justify-center text-emerald-500 text-[10px]">✓</div>
                      <h3 className="text-[14px] font-bold text-zinc-800">
                        Teslim Edilen Ürünler ({activeOrderDetails.items.length})
                      </h3>
                    </div>
                    <div className="flex gap-2">
                      {!editingProducts ? (
                        <button onClick={() => {
                          setEditingProducts(true);
                          setTempProducts(activeOrderDetails.items.map(i => ({ id: i.id, unit_price: i.unit_price, quantity: i.quantity })));
                        }} className="px-3 py-1 bg-[#f8f9fa] border border-[#d3d9df] text-zinc-700 hover:bg-zinc-100 font-medium text-[12px] rounded-sm">Düzenle</button>
                      ) : (
                        <>
                          <button onClick={handleSaveProducts} className="px-3 py-1 bg-emerald-50 border border-emerald-200 text-emerald-700 font-bold text-[12px] rounded-sm">Kaydet</button>
                          <button onClick={() => setEditingProducts(false)} className="px-3 py-1 bg-[#f8f9fa] border border-[#d3d9df] text-zinc-700 hover:bg-zinc-100 font-medium text-[12px] rounded-sm">İptal</button>
                        </>
                      )}
                      <button onClick={() => setShowProductSearchModal(true)} className="px-3 py-1 bg-[#f8f9fa] border border-[#d3d9df] text-zinc-700 hover:bg-zinc-100 font-medium text-[12px] rounded-sm">İade Oluştur</button>
                    </div>
                  </div>

                  <table className="w-full border-collapse text-left text-[13px] text-zinc-800">
                    <thead>
                      <tr className="border-b border-[#d3d9df]">
                        <th className="py-2.5 px-4 font-normal text-zinc-700">Ürün</th>
                        <th className="py-2.5 px-4 font-normal text-zinc-700 text-center w-28">Fiyat</th>
                        <th className="py-2.5 px-4 font-normal text-zinc-700 text-center w-16">KDV</th>
                        <th className="py-2.5 px-4 font-normal text-zinc-700 text-center w-20">Miktar</th>
                        <th className="py-2.5 px-4 font-normal text-zinc-700 text-right w-32">Tutar</th>
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-[#d3d9df]">
                      {activeOrderDetails.items.map((item) => (
                        <tr key={item.id}>
                          <td className="py-3 px-4 flex gap-4 items-start">
                            <div className="w-[60px] h-[80px] bg-zinc-50 border border-[#d3d9df] overflow-hidden flex-shrink-0 flex items-center justify-center text-xl">
                              {item.thumbnail ? (
                                <img src={item.thumbnail} alt={item.title} className="w-full h-full object-cover" />
                              ) : (
                                "👖"
                              )}
                            </div>
                            <div className="flex flex-col">
                              <span className="font-bold text-zinc-800 text-[13px]">{item.title}</span>
                              <span className="text-[12px] text-zinc-500 mt-0.5">
                                #{item.sku || "-"} {item.barcode ? \`- \${item.barcode}\` : ""}
                              </span>
                              <span className="text-[12px] text-zinc-600 mt-1">BEDEN: {item.size}</span>
                            </div>
                          </td>
                          <td className="py-3 px-4 text-center">
                            {editingProducts ? (
                              <input 
                                type="number" 
                                className="w-20 border border-[#d3d9df] rounded-sm px-2 py-1 text-center text-[12px]"
                                value={tempProducts.find(t => t.id === item.id)?.unit_price || 0}
                                onChange={e => {
                                  const val = parseFloat(e.target.value) || 0;
                                  setTempProducts(prev => prev.map(t => t.id === item.id ? { ...t, unit_price: val } : t))
                                }}
                              />
                            ) : (
                              <div className="flex flex-col items-center">
                                <span className="text-[12px] text-zinc-400 line-through">1,100.00 TL</span>
                                <span className="text-[13px] text-zinc-800 mt-0.5">{item.unit_price.toLocaleString("tr-TR", { minimumFractionDigits: 2 })} TL</span>
                              </div>
                            )}
                          </td>
                          <td className="py-3 px-4 text-center text-zinc-800">
                            %{item.vat_rate}
                          </td>
                          <td className="py-3 px-4 text-center border-l border-r border-[#d3d9df] bg-zinc-50/30">
                            {editingProducts ? (
                              <input 
                                type="number" 
                                className="w-12 border border-[#d3d9df] rounded-sm px-1 py-1 text-center text-[12px] mx-auto block"
                                value={tempProducts.find(t => t.id === item.id)?.quantity || 1}
                                onChange={e => {
                                  const val = parseInt(e.target.value) || 1;
                                  setTempProducts(prev => prev.map(t => t.id === item.id ? { ...t, quantity: val } : t))
                                }}
                              />
                            ) : (
                              <div className="flex flex-col items-center justify-center">
                                <span className="font-bold text-zinc-800 text-[14px]">{item.quantity}</span>
                                <span className="text-[10px] text-zinc-500">Adet</span>
                              </div>
                            )}
                          </td>
                          <td className="py-3 px-4 text-right">
                            {editingProducts ? (
                              <div className="flex flex-col items-end gap-1">
                                <span className="text-[13px]">{((tempProducts.find(t => t.id === item.id)?.unit_price || 0) * (tempProducts.find(t => t.id === item.id)?.quantity || 0)).toLocaleString("tr-TR", { minimumFractionDigits: 2 })} TL</span>
                                <button
                                  onClick={() => setTempProducts(prev => prev.filter(t => t.id !== item.id))}
                                  className="text-[11px] text-rose-500 hover:underline"
                                >
                                  Sil
                                </button>
                              </div>
                            ) : (
                              <div className="flex flex-col items-end">
                                <span className="text-[12px] text-zinc-400 line-through">1,100.00 TL</span>
                                <span className="text-[13px] text-zinc-800 mt-0.5">{(item.unit_price * item.quantity).toLocaleString("tr-TR", { minimumFractionDigits: 2 })} TL</span>
                              </div>
                            )}
                          </td>
                        </tr>
                      ))}

                      {/* Calculations row */}
                      <tr className="bg-white text-[12px] text-zinc-600">
                        <td colSpan={3} className="py-4 px-4 align-top">
                          <div className="flex flex-col gap-1.5">
                            <label className="flex items-center gap-2 cursor-pointer w-max">
                              <input type="checkbox" className="w-3.5 h-3.5 border-[#d3d9df] rounded-sm" />
                              <span>Stok miktarını göster</span>
                            </label>
                            <label className="flex items-center gap-2 cursor-pointer w-max">
                              <input type="checkbox" className="w-3.5 h-3.5 border-[#d3d9df] rounded-sm" />
                              <span>Desiyi göster</span>
                            </label>
                            <label className="flex items-center gap-2 cursor-pointer w-max">
                              <input type="checkbox" className="w-3.5 h-3.5 border-[#d3d9df] rounded-sm" />
                              <span>Özel kodları göster</span>
                            </label>
                          </div>
                        </td>
                        <td className="py-4 px-4 text-right align-top">
                          <div className="flex flex-col gap-1.5">
                            <span>Ara Toplam</span>
                            <span>İndirim</span>
                            <span>Kapıda Nakit Ödeme</span>
                            <span>Genel Toplam</span>
                          </div>
                        </td>
                        <td className="py-4 px-4 text-right align-top text-zinc-800">
                          <div className="flex flex-col gap-1.5">
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
                <div className="bg-white border border-[#d3d9df] rounded-sm overflow-hidden flex flex-col">
                  <div className="flex justify-between items-center p-3">
                    <h3 className="text-[13px] font-bold text-zinc-800">
                      Yönetici Notu
                    </h3>
                    {!editingNotes ? (
                      <button 
                        onClick={() => { setEditingNotes(true); setTempNotesText(activeOrderDetails.admin_notes || ""); }}
                        className="text-zinc-500 hover:text-zinc-700"
                      >
                        <Pencil className="w-3.5 h-3.5" />
                      </button>
                    ) : (
                      <div className="flex items-center gap-2">
                        <button onClick={handleSaveNotes} className="text-[11px] font-medium text-emerald-600 bg-emerald-50 px-2 py-0.5 rounded-sm border border-emerald-200">Kaydet</button>
                        <button onClick={() => setEditingNotes(false)} className="text-[11px] font-medium text-zinc-500 bg-zinc-50 px-2 py-0.5 rounded-sm border border-[#d3d9df]">Vazgeç</button>
                      </div>
                    )}
                  </div>
                  <div className="border-t border-[#d3d9df] p-3 text-[12px] text-zinc-700 min-h-[40px] bg-white">
                    {editingNotes ? (
                      <textarea 
                        rows={2}
                        value={tempNotesText}
                        onChange={(e) => setTempNotesText(e.target.value)}
                        className="w-full p-2 border border-[#d3d9df] rounded-sm text-[12px] text-zinc-800 outline-none"
                      />
                    ) : (
                      <>{activeOrderDetails.admin_notes || ""}</>
                    )}
                  </div>
                </div>

                {/* 3. Customer, shipping & billing grid */}
                <div className="bg-white border border-[#d3d9df] rounded-sm flex flex-col md:flex-row divide-y md:divide-y-0 md:divide-x divide-[#d3d9df]">
                  
                  {/* Müşteri */}
                  <div className="flex-1 flex flex-col">
                    <div className="bg-[#f8f9fa] border-b border-[#d3d9df] p-3 flex justify-between items-center h-[42px]">
                      <h4 className="text-[13px] font-bold text-zinc-800">Müşteri</h4>
                      <div className="flex items-center gap-2">
                        <span className="border border-[#d3d9df] px-1.5 py-0.5 bg-white text-[11px] text-zinc-600 rounded-sm">
                          {activeOrderDetails.customer.is_visitor ? "Ziyaretçi" : "Üye"}
                        </span>
                        {!editingCustomer ? (
                          <button onClick={() => {
                            setEditingCustomer(true);
                            setTempCustomer({ first_name: activeOrderDetails.customer.first_name, last_name: activeOrderDetails.customer.last_name, email: activeOrderDetails.customer.email, phone: activeOrderDetails.customer.phone });
                          }} className="text-zinc-500 hover:text-zinc-700"><Pencil className="w-3.5 h-3.5" /></button>
                        ) : (
                          <div className="flex gap-1"><button onClick={handleSaveCustomer} className="text-[10px] text-emerald-600 border border-emerald-200 bg-emerald-50 px-1 rounded-sm">K</button><button onClick={() => setEditingCustomer(false)} className="text-[10px] border border-[#d3d9df] px-1 rounded-sm">İ</button></div>
                        )}
                      </div>
                    </div>
                    <div className="p-4 text-[12px] text-zinc-800 space-y-2">
                      {!editingCustomer ? (
                        <>
                          <div className="font-bold">{activeOrderDetails.customer.first_name} {activeOrderDetails.customer.last_name}</div>
                          <div className="flex items-center gap-2">
                            <span>✉</span> {activeOrderDetails.customer.email}
                          </div>
                          <div className="flex items-center gap-2">
                            <span>📞</span> {activeOrderDetails.customer.phone}
                          </div>
                          <div className="flex items-center gap-2 text-zinc-500 mt-3">
                            <span>🖧</span> {activeOrderDetails.customer.ip}
                          </div>
                        </>
                      ) : (
                        <div className="flex flex-col gap-1.5">
                          <input type="text" className="border border-[#d3d9df] p-1 rounded-sm text-[12px]" value={tempCustomer.first_name} onChange={e => setTempCustomer({...tempCustomer, first_name: e.target.value})} placeholder="Ad" />
                          <input type="text" className="border border-[#d3d9df] p-1 rounded-sm text-[12px]" value={tempCustomer.last_name} onChange={e => setTempCustomer({...tempCustomer, last_name: e.target.value})} placeholder="Soyad" />
                          <input type="text" className="border border-[#d3d9df] p-1 rounded-sm text-[12px]" value={tempCustomer.email} onChange={e => setTempCustomer({...tempCustomer, email: e.target.value})} placeholder="Email" />
                          <input type="text" className="border border-[#d3d9df] p-1 rounded-sm text-[12px]" value={tempCustomer.phone} onChange={e => setTempCustomer({...tempCustomer, phone: e.target.value})} placeholder="Telefon" />
                        </div>
                      )}
                    </div>
                  </div>

                  {/* Teslimat */}
                  <div className="flex-1 flex flex-col">
                    <div className="bg-[#f8f9fa] border-b border-[#d3d9df] p-3 flex justify-between items-center h-[42px]">
                      <h4 className="text-[13px] font-bold text-zinc-800">Teslimat Bilgileri</h4>
                      {!editingShipping ? (
                        <button onClick={() => {
                          setEditingShipping(true);
                          setTempShipping({ first_name: activeOrderDetails.shipping_address.first_name, last_name: activeOrderDetails.shipping_address.last_name, address_1: activeOrderDetails.shipping_address.address_1, district: activeOrderDetails.shipping_address.district, city: activeOrderDetails.shipping_address.city });
                        }} className="text-zinc-500 hover:text-zinc-700"><Pencil className="w-3.5 h-3.5" /></button>
                      ) : (
                        <div className="flex gap-1"><button onClick={handleSaveShipping} className="text-[10px] text-emerald-600 border border-emerald-200 bg-emerald-50 px-1 rounded-sm">K</button><button onClick={() => setEditingShipping(false)} className="text-[10px] border border-[#d3d9df] px-1 rounded-sm">İ</button></div>
                      )}
                    </div>
                    <div className="p-4 text-[12px] text-zinc-600 space-y-1.5">
                      {!editingShipping ? (
                        <>
                          <div className="font-bold text-zinc-800">{activeOrderDetails.shipping_address.first_name} {activeOrderDetails.shipping_address.last_name}</div>
                          <div>{activeOrderDetails.shipping_address.address_1}</div>
                          <div>{activeOrderDetails.shipping_address.district} / {activeOrderDetails.shipping_address.city} / Türkiye</div>
                        </>
                      ) : (
                        <div className="flex flex-col gap-1.5">
                          <input type="text" className="border border-[#d3d9df] p-1 rounded-sm text-[12px]" value={tempShipping.first_name} onChange={e => setTempShipping({...tempShipping, first_name: e.target.value})} placeholder="Ad" />
                          <input type="text" className="border border-[#d3d9df] p-1 rounded-sm text-[12px]" value={tempShipping.last_name} onChange={e => setTempShipping({...tempShipping, last_name: e.target.value})} placeholder="Soyad" />
                          <textarea rows={2} className="border border-[#d3d9df] p-1 rounded-sm text-[12px]" value={tempShipping.address_1} onChange={e => setTempShipping({...tempShipping, address_1: e.target.value})} placeholder="Adres" />
                          <input type="text" className="border border-[#d3d9df] p-1 rounded-sm text-[12px]" value={tempShipping.district} onChange={e => setTempShipping({...tempShipping, district: e.target.value})} placeholder="İlçe" />
                          <input type="text" className="border border-[#d3d9df] p-1 rounded-sm text-[12px]" value={tempShipping.city} onChange={e => setTempShipping({...tempShipping, city: e.target.value})} placeholder="İl" />
                        </div>
                      )}
                    </div>
                  </div>

                  {/* Fatura */}
                  <div className="flex-1 flex flex-col">
                    <div className="bg-[#f8f9fa] border-b border-[#d3d9df] p-3 flex justify-between items-center h-[42px]">
                      <h4 className="text-[13px] font-bold text-zinc-800">Fatura Bilgileri</h4>
                      {!editingBilling ? (
                        <button onClick={() => {
                          setEditingBilling(true);
                          setTempBilling({ first_name: activeOrderDetails.billing_address.first_name, last_name: activeOrderDetails.billing_address.last_name, address_1: activeOrderDetails.billing_address.address_1, district: activeOrderDetails.billing_address.district, city: activeOrderDetails.billing_address.city, tc_no: activeOrderDetails.billing_address.tc_no || "" });
                        }} className="text-zinc-500 hover:text-zinc-700"><Pencil className="w-3.5 h-3.5" /></button>
                      ) : (
                        <div className="flex gap-1"><button onClick={handleSaveBilling} className="text-[10px] text-emerald-600 border border-emerald-200 bg-emerald-50 px-1 rounded-sm">K</button><button onClick={() => setEditingBilling(false)} className="text-[10px] border border-[#d3d9df] px-1 rounded-sm">İ</button></div>
                      )}
                    </div>
                    <div className="p-4 text-[12px] text-zinc-600 space-y-1.5">
                      {!editingBilling ? (
                        <>
                          <div className="font-bold text-zinc-800">{activeOrderDetails.billing_address.first_name} {activeOrderDetails.billing_address.last_name}</div>
                          <div>{activeOrderDetails.billing_address.address_1}</div>
                          <div>{activeOrderDetails.billing_address.district} / {activeOrderDetails.billing_address.city} / Türkiye</div>
                        </>
                      ) : (
                        <div className="flex flex-col gap-1.5">
                          <input type="text" className="border border-[#d3d9df] p-1 rounded-sm text-[12px]" value={tempBilling.first_name} onChange={e => setTempBilling({...tempBilling, first_name: e.target.value})} placeholder="Ad" />
                          <input type="text" className="border border-[#d3d9df] p-1 rounded-sm text-[12px]" value={tempBilling.last_name} onChange={e => setTempBilling({...tempBilling, last_name: e.target.value})} placeholder="Soyad" />
                          <textarea rows={2} className="border border-[#d3d9df] p-1 rounded-sm text-[12px]" value={tempBilling.address_1} onChange={e => setTempBilling({...tempBilling, address_1: e.target.value})} placeholder="Adres" />
                          <input type="text" className="border border-[#d3d9df] p-1 rounded-sm text-[12px]" value={tempBilling.district} onChange={e => setTempBilling({...tempBilling, district: e.target.value})} placeholder="İlçe" />
                          <input type="text" className="border border-[#d3d9df] p-1 rounded-sm text-[12px]" value={tempBilling.city} onChange={e => setTempBilling({...tempBilling, city: e.target.value})} placeholder="İl" />
                          <input type="text" className="border border-[#d3d9df] p-1 rounded-sm text-[12px]" value={tempBilling.tc_no} onChange={e => setTempBilling({...tempBilling, tc_no: e.target.value})} placeholder="TC No" />
                        </div>
                      )}
                    </div>
                  </div>

                </div>

                {/* 4. Yönetici Logları */}
                <div className="bg-white border border-[#d3d9df] rounded-sm flex flex-col">
                  <div className="bg-[#f8f9fa] border-b border-[#d3d9df] p-3 h-[42px] flex items-center">
                    <h3 className="text-[13px] font-bold text-zinc-800">Yönetici Logları</h3>
                  </div>
                  <div className="divide-y divide-[#d3d9df] text-[12px] text-zinc-600 bg-white">
                    {activeOrderDetails.logs.length === 0 ? (
                      <div className="p-4 text-zinc-400">Log kaydı bulunmuyor.</div>
                    ) : (
                      activeOrderDetails.logs.map((log) => (
                        <div key={log.id} className="p-3 flex justify-between items-center">
                          <span className="text-zinc-700">{log.message}</span>
                          <span className="text-zinc-400">{log.created_at}</span>
                        </div>
                      ))
                    )}
                  </div>
                </div>

                {/* 5. Kargo Entegrasyon Logları */}
                <div className="bg-white border border-[#d3d9df] rounded-sm flex flex-col">
                  <div className="bg-[#f8f9fa] border-b border-[#d3d9df] p-3 h-[42px] flex items-center">
                    <h3 className="text-[13px] font-bold text-zinc-800">Kargo Entegrasyon Logları</h3>
                  </div>
                  <div className="divide-y divide-[#d3d9df] text-[12px] text-zinc-600 bg-white">
                    {activeOrderDetails.integration_logs.length === 0 ? (
                      <div className="p-4 text-zinc-400">Kargo entegrasyon log kaydı bulunmuyor.</div>
                    ) : (
                      activeOrderDetails.integration_logs.map((log) => (
                        <div key={log.id} className="p-3 flex justify-between items-center">
                          <span className="text-zinc-700">{log.message}</span>
                          <span className="text-zinc-400">{log.created_at}</span>
                        </div>
                      ))
                    )}
                  </div>
                </div>

              </div>

              {/* Right Side Info Cards */}
              <div className="flex flex-col gap-4">
                
                {/* 1. Main Order Summary Card */}
                <div className="bg-white border border-[#d3d9df] rounded-sm flex flex-col">
                  <div className="p-4 flex flex-col gap-3">
                    <div className="flex justify-between items-start">
                      <div className="flex flex-col">
                        <span className="text-[18px] font-bold text-[#0b5ed7] tracking-tight leading-none">{activeOrderDetails.display_id}</span>
                        <span className="text-[13px] text-zinc-800 mt-1">{activeOrderDetails.store}</span>
                        <span className="text-[12px] text-zinc-600 mt-0.5">{activeOrderDetails.created_at}</span>
                        
                        <div className="mt-3">
                          {activeOrderDetails.status === "teslim_edilen" && <span className="px-2 py-0.5 border border-emerald-500 bg-white text-[12px] text-emerald-600 inline-block rounded-sm">Teslim Edildi</span>}
                          {activeOrderDetails.status === "kargolanan" && <span className="px-2 py-0.5 border border-amber-500 bg-white text-[12px] text-amber-600 inline-block rounded-sm">Kargolandı</span>}
                          {activeOrderDetails.status === "hazirlanan" && <span className="px-2 py-0.5 border border-blue-500 bg-white text-[12px] text-blue-600 inline-block rounded-sm">Hazırlanıyor</span>}
                          {activeOrderDetails.status === "onay_bekleyen" && <span className="px-2 py-0.5 border border-zinc-400 bg-white text-[12px] text-zinc-600 inline-block rounded-sm">Onay Bekleyen</span>}
                          {activeOrderDetails.status === "iptal_edilen" && <span className="px-2 py-0.5 border border-rose-500 bg-white text-[12px] text-rose-600 inline-block rounded-sm">İptal Edildi</span>}
                          {activeOrderDetails.status === "iade_edilen" && <span className="px-2 py-0.5 border border-red-500 bg-white text-[12px] text-red-600 inline-block rounded-sm">İade Edildi</span>}
                        </div>
                      </div>
                      <div className="text-right">
                        <CizgiLogo />
                      </div>
                    </div>
                  </div>

                  <div className="h-px bg-[#d3d9df] w-full" />

                  <div className="p-4 text-[12px] space-y-2 text-zinc-600">
                    <div className="flex justify-between items-center">
                      <span>Ödeme</span>
                      <span className="text-zinc-900 font-bold">{activeOrderDetails.payment_method}</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span>Sipariş Tutarı</span>
                      <span className="text-zinc-900 font-bold">{activeOrderDetails.total.toLocaleString("tr-TR", { minimumFractionDigits: 2 })} TL</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span>KDV</span>
                      <span className="text-zinc-900 font-bold">{activeOrderDetails.vat_total.toLocaleString("tr-TR", { minimumFractionDigits: 2 })} TL</span>
                    </div>
                  </div>
                </div>

                {/* 2. İndirimler */}
                <div className="bg-white border border-[#d3d9df] rounded-sm flex flex-col">
                  <div className="bg-[#f8f9fa] border-b border-[#d3d9df] p-3 h-[42px] flex items-center">
                    <h4 className="text-[13px] font-bold text-zinc-800">İndirimler</h4>
                  </div>
                  <div className="p-4 flex justify-between items-center text-[12px] text-zinc-600">
                    <div className="flex items-center gap-2">
                      <GiftIcon />
                      <span className="text-zinc-900 font-medium">SEPET %5</span>
                    </div>
                    <span className="text-zinc-900 font-medium">55.00 TL</span>
                  </div>
                </div>

                {/* 3. Kargo Bilgileri */}
                <div className="bg-white border border-[#d3d9df] rounded-sm flex flex-col">
                  <div className="bg-[#f8f9fa] border-b border-[#d3d9df] p-3 h-[42px] flex items-center">
                    <h4 className="text-[13px] font-bold text-zinc-800">Kargo Bilgileri</h4>
                  </div>
                  <div className="p-4 text-[12px] space-y-2 text-zinc-600">
                    <div className="flex justify-between items-center">
                      <span>Firma</span>
                      <span className="text-zinc-900 font-medium uppercase">{activeOrderDetails.carrier_name}</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span>Barkod</span>
                      <span className="text-zinc-900 font-medium">{activeOrderDetails.carrier_barcode || "-"}</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span>Takip Kodu</span>
                      <span className="text-zinc-900 font-medium">{activeOrderDetails.carrier_barcode || "-"}</span>
                    </div>
                    <div className="flex justify-start pt-1">
                      <a href="#" className="text-zinc-600 break-all">
                        https://webpostman.novakargo.com/tracking?har_kod={activeOrderDetails.carrier_barcode}
                      </a>
                    </div>
                  </div>
                </div>

                {/* 4. Dönüşüm Bilgileri */}
                <div className="bg-white border border-[#d3d9df] rounded-sm flex flex-col">
                  <div className="bg-[#f8f9fa] border-b border-[#d3d9df] p-3 h-[42px] flex items-center">
                    <h4 className="text-[13px] font-bold text-zinc-800">Dönüşüm Bilgileri</h4>
                  </div>
                  <div className="p-4 text-[12px] space-y-2 text-zinc-600 border-b border-[#d3d9df]">
                    <div className="flex justify-between">
                      <span>Trafik Kaynağı:</span>
                      <span>Sosyal Ağ</span>
                    </div>
                    <div className="flex justify-between">
                      <span>Yönlendiren:</span>
                      <span className="text-[#0b5ed7]">instagram.com</span>
                    </div>
                  </div>
                  <div className="p-4 text-[12px] space-y-2 text-zinc-600 border-b border-[#d3d9df]">
                    <div className="flex justify-between">
                      <span>Cihaz:</span>
                      <span>Akıllı Telefon - Android - Chrome</span>
                    </div>
                    <div className="flex justify-between">
                      <span>Oturum Süresi:</span>
                      <span>04:38 dk</span>
                    </div>
                  </div>
                  <div className="p-4 text-[12px] space-y-1.5 text-zinc-500">
                    <div className="text-zinc-800 mb-1">UTM Bilgileri</div>
                    <div className="flex justify-between"><span className="text-zinc-400">utm_source:</span><span>ig</span></div>
                    <div className="flex justify-between"><span className="text-zinc-400">utm_medium:</span><span>social</span></div>
                    <div className="flex justify-between"><span className="text-zinc-400">utm_content:</span><span>link_in_bio</span></div>
                  </div>
                  <div className="p-4 border-t border-[#d3d9df] text-[12px] flex items-center gap-1.5 text-zinc-700">
                    <span>☆</span> Kurtarılan Sipariş
                  </div>
                </div>

                {/* 5. Diğer */}
                <div className="bg-white border border-[#d3d9df] rounded-sm flex flex-col">
                  <div className="bg-[#f8f9fa] border-b border-[#d3d9df] p-3 h-[42px] flex justify-between items-center">
                    <h4 className="text-[13px] font-bold text-zinc-800">Diğer</h4>
                    <button className="text-zinc-500 hover:text-zinc-700"><Pencil className="w-3.5 h-3.5" /></button>
                  </div>
                  <div className="p-4 text-[12px] space-y-2 text-zinc-600">
                    <div className="flex justify-between">
                      <span>Fatura Seri</span>
                    </div>
                    <div className="flex justify-between">
                      <span>Fatura Ek Kodlar</span>
                    </div>
                  </div>
                </div>

              </div>
            </div>

            {/* Footer buttons row */}
            <div className="bg-[#f4f5f7] border-t border-[#d3d9df] px-4 py-3 flex items-center justify-between shrink-0">
              <div className="flex items-center gap-3">
                <div className="relative">
                  <button 
                    onClick={() => setIsActionMenuOpen(!isActionMenuOpen)}
                    className="bg-[#e4e6eb] border border-[#d3d9df] text-zinc-800 text-[13px] h-9 px-4 rounded-sm flex items-center gap-2"
                  >
                    <span>İşlemler</span>
                    <span className="text-[10px]">▲</span>
                  </button>
                  
                  {isActionMenuOpen && (
                    <div className="absolute bottom-full mb-1 left-0 w-48 bg-white border border-[#d3d9df] rounded-sm shadow-lg py-1 z-10">
                      <button className="w-full text-left px-4 py-2 text-[12px] text-zinc-700 hover:bg-[#f4f5f7]">Risk Kriterlerine Ekle</button>
                      <button 
                        onClick={() => {
                          setStatusModalTargetIds([activeOrderDetails.id]);
                          setNewStatusValue(activeOrderDetails.status);
                          setShowStatusModal(true);
                          setIsActionMenuOpen(false);
                        }}
                        className="w-full text-left px-4 py-2 text-[12px] text-zinc-700 hover:bg-[#f4f5f7]"
                      >
                        Durumu Değiştir
                      </button>
                      <button className="w-full text-left px-4 py-2 text-[12px] text-zinc-700 hover:bg-[#f4f5f7]">SMS & E-Posta Gönder</button>
                    </div>
                  )}
                </div>
                
                {activeOrderDetails.status !== "iptal_edilen" && (
                  <button 
                    onClick={() => handleCancelOrder(activeOrderDetails.id)}
                    className="bg-[#e74c3c] text-white text-[13px] h-9 px-4 rounded-sm border border-[#c0392b]"
                  >
                    Siparişi İptal Et
                  </button>
                )}
              </div>

              {/* Print buttons row */}
              <div className="flex items-center gap-2">
                <button onClick={() => triggerPrintSimulation("e-Fatura", activeOrderDetails.id)} className="bg-[#e4e6eb] border border-[#d3d9df] text-zinc-700 text-[13px] h-9 px-3 rounded-sm flex items-center gap-1.5">
                  <span className="text-rose-600 font-bold">×</span>
                  <span>E-Fatura</span>
                </button>
                <button onClick={() => triggerPrintSimulation("Fatura", activeOrderDetails.id)} className="bg-[#e4e6eb] border border-[#d3d9df] text-zinc-700 text-[13px] h-9 px-3 rounded-sm flex items-center gap-1.5">
                  <span className="text-rose-600 font-bold">×</span>
                  <span>Fatura</span>
                </button>
                <button onClick={() => triggerPrintSimulation("Kargo Fişi", activeOrderDetails.id)} className="bg-[#e4e6eb] border border-[#d3d9df] text-zinc-700 text-[13px] h-9 px-3 rounded-sm flex items-center gap-1.5">
                  <span className="text-emerald-600 font-bold">✓</span>
                  <span>Kargo Fişi</span>
                </button>
                <button onClick={() => triggerPrintSimulation("Fiş", activeOrderDetails.id)} className="bg-[#e4e6eb] border border-[#d3d9df] text-zinc-700 text-[13px] h-9 px-3 rounded-sm flex items-center gap-1.5">
                  <span className="text-rose-600 font-bold">×</span>
                  <span>Fiş</span>
                </button>
                <button onClick={() => triggerPrintSimulation("PDF", activeOrderDetails.id)} className="bg-[#e4e6eb] border border-[#d3d9df] text-zinc-700 text-[13px] h-9 px-3 rounded-sm flex items-center gap-1.5">
                  <span className="text-rose-600 font-bold">×</span>
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
