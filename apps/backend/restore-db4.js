const fs = require('fs');
const { Pool } = require('pg');

const pool = new Pool({ connectionString: process.env.DATABASE_URL });

async function run() {
    try {
        console.log("Eski veritabanı kalıntıları kökten temizleniyor...");
        await pool.query('DROP SCHEMA public CASCADE; CREATE SCHEMA public;');

        console.log("Yeni veritabanı (Database) geri yükleme başlatılıyor...");
        const sql = fs.readFileSync('local_db.sql', 'utf8');
        
        let cleanSql = sql.split('\n')
            .filter(line => !line.trim().startsWith('\\'))
            .filter(line => !line.trim().startsWith('SET '))
            .filter(line => !line.trim().startsWith('SELECT pg_catalog.set_config'))
            .join('\n');

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
