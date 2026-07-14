const fs = require('fs');
const { Pool } = require('pg');

const pool = new Pool({ connectionString: process.env.DATABASE_URL });

async function run() {
    try {
        console.log("Veritabanı (Database) geri yükleme başlatılıyor...");
        const sql = fs.readFileSync('local_db.sql', 'utf8');
        
        let cleanSql = sql
            .replace(/\\connect .*/g, '')
            .replace(/SET .*/g, '')
            .replace(/SELECT pg_catalog\.set_config.*/g, '');

        console.log("Sorgu gönderiliyor, lütfen bekleyin...");
        await pool.query(cleanSql);
        
        console.log("✅ MUHTEŞEM! VERİTABANI BAŞARIYLA KLONLANDI!");
        process.exit(0);
    } catch (err) {
        console.error("HATA OLUŞTU:", err);
        process.exit(1);
    }
}
run();
