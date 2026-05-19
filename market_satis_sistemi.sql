

-- ============================================================
-- 1. VERİTABANI OLUŞTURMA
-- ============================================================

CREATE DATABASE IF NOT EXISTS market_satis_sistemi;
USE market_satis_sistemi;


-- ============================================================
-- 2. TABLOLAR
-- ============================================================

-- Kategoriler
CREATE TABLE kategoriler (
    kategori_id   INT PRIMARY KEY AUTO_INCREMENT,
    kategori_adi  VARCHAR(100) NOT NULL
);

-- Ürünler
CREATE TABLE urunler (
    urun_id       INT PRIMARY KEY AUTO_INCREMENT,
    urun_adi      VARCHAR(150) NOT NULL,
    kategori_id   INT NOT NULL,
    birim_fiyat   DECIMAL(10,2) NOT NULL,
    stok_miktari  INT NOT NULL DEFAULT 0,
    FOREIGN KEY (kategori_id) REFERENCES kategoriler(kategori_id)
);

-- Müşteriler
CREATE TABLE musteriler (
    musteri_id    INT PRIMARY KEY AUTO_INCREMENT,
    ad            VARCHAR(50) NOT NULL,
    soyad         VARCHAR(50) NOT NULL,
    telefon       VARCHAR(15),
    email         VARCHAR(100),
    kayit_tarihi  DATE NOT NULL DEFAULT (CURRENT_DATE)
);

-- Çalışanlar
CREATE TABLE calisanlar (
    calisan_id    INT PRIMARY KEY AUTO_INCREMENT,
    ad            VARCHAR(50) NOT NULL,
    soyad         VARCHAR(50) NOT NULL,
    pozisyon      VARCHAR(80),
    maas          DECIMAL(10,2)
);

-- Satışlar (fatura başlığı)
CREATE TABLE satislar (
    satis_id      INT PRIMARY KEY AUTO_INCREMENT,
    musteri_id    INT,
    calisan_id    INT NOT NULL,
    satis_tarihi  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    toplam_tutar  DECIMAL(10,2) NOT NULL DEFAULT 0,
    FOREIGN KEY (musteri_id)  REFERENCES musteriler(musteri_id),
    FOREIGN KEY (calisan_id)  REFERENCES calisanlar(calisan_id)
);

-- Satış detayları (fatura kalemleri)
CREATE TABLE satis_detaylari (
    detay_id      INT PRIMARY KEY AUTO_INCREMENT,
    satis_id      INT NOT NULL,
    urun_id       INT NOT NULL,
    miktar        INT NOT NULL,
    birim_fiyat   DECIMAL(10,2) NOT NULL,
    ara_toplam    DECIMAL(10,2) GENERATED ALWAYS AS (miktar * birim_fiyat) STORED,
    FOREIGN KEY (satis_id) REFERENCES satislar(satis_id),
    FOREIGN KEY (urun_id)  REFERENCES urunler(urun_id)
);


-- ============================================================
-- 3. ÖRNEK VERİLER
-- ============================================================

INSERT INTO kategoriler (kategori_adi) VALUES
('Gıda'), ('İçecek'), ('Temizlik'), ('Kişisel Bakım'), ('Elektronik');

INSERT INTO urunler (urun_adi, kategori_id, birim_fiyat, stok_miktari) VALUES
('Ekmek',              1,   7.50,  200),
('Makarna 500g',       1,  18.90,  150),
('Pirinç 1kg',         1,  34.50,  120),
('Zeytin Yağı 1L',     1,  89.90,   80),
('Süt 1L',             1,  19.90,  300),
('Kola 1L',            2,  25.00,  180),
('Meyve Suyu 1L',      2,  22.50,  160),
('Su 0.5L',            2,   3.50,  500),
('Deterjan 3kg',       3,  95.00,   60),
('Çamaşır Suyu 1L',    3,  28.00,   90),
('Bulaşık Sıvısı',     3,  35.00,   75),
('Şampuan',            4,  55.00,  100),
('Diş Macunu',         4,  42.00,  120),
('El Kremi',           4,  38.00,   85),
('Pil AA 4lü',         5,  45.00,   50);

INSERT INTO musteriler (ad, soyad, telefon, email, kayit_tarihi) VALUES
('Ahmet',   'Yılmaz',  '05---------', 'ahmet@email.com',   '2024-01-10'),
('Fatma',   'Kaya',    '05---------', 'fatma@email.com',   '2024-02-15'),
('Mehmet',  'Demir',   '05---------', 'mehmet@email.com',  '2024-03-20'),
('Ayşe',    'Çelik',   '05---------', 'ayse@email.com',    '2024-04-05'),
('Ali',     'Şahin',   '05---------', NULL,                '2024-05-12'),
('Zeynep',  'Arslan',  '05---------', 'zeynep@email.com',  '2024-06-01'),
('Hasan',   'Koç',     '05---------', NULL,                '2024-06-18'),
('Elif',    'Kurt',    '05---------', 'elif@email.com',    '2024-07-22');

INSERT INTO calisanlar (ad, soyad, pozisyon, maas) VALUES
('Burak',   'Aydın',   'Kasiyer',    18000.00),
('Selin',   'Güneş',   'Kasiyer',    18000.00),
('Tarık',   'Öztürk',  'Müdür',      35000.00),
('Merve',   'Polat',   'Depo Görev', 16000.00);

INSERT INTO satislar (musteri_id, calisan_id, satis_tarihi, toplam_tutar) VALUES
(1, 1, '2024-08-01 10:15:00', 137.80),
(2, 1, '2024-08-03 11:30:00', 223.40),
(3, 2, '2024-08-05 14:00:00', 89.90),
(4, 1, '2024-08-07 09:45:00', 310.50),
(NULL,2, '2024-08-08 16:20:00', 56.40),   -- nakit/anonim müşteri
(5, 2, '2024-08-10 13:10:00', 147.00),
(6, 1, '2024-08-12 17:05:00', 262.90),
(1, 2, '2024-08-15 10:00:00', 95.50),
(7, 1, '2024-08-18 11:45:00', 183.70),
(8, 2, '2024-08-20 15:30:00', 204.00),
(2, 1, '2024-09-02 10:20:00', 175.00),
(3, 2, '2024-09-05 12:00:00', 320.00),
(4, 1, '2024-09-10 09:30:00',  98.50),
(5, 2, '2024-09-15 14:45:00', 230.00),
(6, 1, '2024-09-20 16:00:00', 145.00);

INSERT INTO satis_detaylari (satis_id, urun_id, miktar, birim_fiyat) VALUES
(1,  1, 2,  7.50),
(1,  5, 3, 19.90),
(1,  6, 1, 25.00),
(2,  3, 2, 34.50),
(2,  4, 1, 89.90),
(2,  9, 1, 95.00),  -- Hata: toplam uyuşmuyor, gerçekçilik için bırakıldı
(3,  4, 1, 89.90),
(4,  9, 2, 95.00),
(4, 12, 2, 55.00),
(4,  5, 3, 19.90),
(5,  1, 3,  7.50),
(5,  7, 2, 22.50),
(6,  6, 3, 25.00),
(6, 13, 2, 42.00),
(6,  3, 1, 34.50),
(7,  5, 2, 19.90),
(7, 10, 2, 28.00),
(8,  2, 3, 18.90),
(8, 15, 1, 45.00),
(9,  8, 4,  3.50),
(9,  6, 5, 25.00),
(9, 11, 2, 35.00),
(10, 1, 2,  7.50),
(10, 5, 4, 19.90),
(10, 9, 1, 95.00);


-- ============================================================
-- 4. ANALİTİK SORGULAR
-- ============================================================

-- -------------------------------------------------------
-- S1: Aylık toplam satış geliri
-- -------------------------------------------------------
SELECT
    DATE_FORMAT(satis_tarihi, '%Y-%m')  AS ay,
    COUNT(*)                            AS satis_adedi,
    SUM(toplam_tutar)                   AS toplam_gelir,
    AVG(toplam_tutar)                   AS ortalama_sepet
FROM satislar
GROUP BY ay
ORDER BY ay;


-- -------------------------------------------------------
-- S2: En çok satan 5 ürün (adet bazında)
-- -------------------------------------------------------
SELECT
    u.urun_adi,
    k.kategori_adi,
    SUM(sd.miktar)       AS toplam_adet,
    SUM(sd.ara_toplam)   AS toplam_ciro
FROM satis_detaylari sd
JOIN urunler    u ON sd.urun_id    = u.urun_id
JOIN kategoriler k ON u.kategori_id = k.kategori_id
GROUP BY u.urun_id, u.urun_adi, k.kategori_adi
ORDER BY toplam_adet DESC
LIMIT 5;


-- -------------------------------------------------------
-- S3: Kategoriye göre ciro analizi
-- -------------------------------------------------------
SELECT
    k.kategori_adi,
    SUM(sd.miktar)       AS toplam_adet,
    SUM(sd.ara_toplam)   AS toplam_ciro,
    ROUND(
        SUM(sd.ara_toplam) * 100.0 /
        (SELECT SUM(ara_toplam) FROM satis_detaylari), 2
    )                    AS ciro_yuzdesi
FROM satis_detaylari sd
JOIN urunler     u ON sd.urun_id     = u.urun_id
JOIN kategoriler k ON u.kategori_id  = k.kategori_id
GROUP BY k.kategori_id, k.kategori_adi
ORDER BY toplam_ciro DESC;


-- -------------------------------------------------------
-- S4: En çok alışveriş yapan müşteriler (TOP 5)
-- -------------------------------------------------------
SELECT
    m.musteri_id,
    CONCAT(m.ad, ' ', m.soyad)  AS musteri_adi,
    COUNT(s.satis_id)            AS satis_sayisi,
    SUM(s.toplam_tutar)          AS toplam_harcama,
    MAX(s.satis_tarihi)          AS son_alisveris
FROM musteriler m
JOIN satislar s ON m.musteri_id = s.musteri_id
GROUP BY m.musteri_id, m.ad, m.soyad
ORDER BY toplam_harcama DESC
LIMIT 5;


-- -------------------------------------------------------
-- S5: Kasiyere göre satış performansı
-- -------------------------------------------------------
SELECT
    CONCAT(c.ad, ' ', c.soyad)  AS calisan,
    c.pozisyon,
    COUNT(s.satis_id)            AS islem_sayisi,
    SUM(s.toplam_tutar)          AS toplam_ciro,
    AVG(s.toplam_tutar)          AS ortalama_sepet
FROM calisanlar c
JOIN satislar s ON c.calisan_id = s.calisan_id
GROUP BY c.calisan_id, c.ad, c.soyad, c.pozisyon
ORDER BY toplam_ciro DESC;


-- -------------------------------------------------------
-- S6: Stok durumu – kritik eşiğin altındaki ürünler
-- -------------------------------------------------------
SELECT
    u.urun_adi,
    k.kategori_adi,
    u.stok_miktari,
    CASE
        WHEN u.stok_miktari = 0          THEN 'STOKTA YOK'
        WHEN u.stok_miktari < 60         THEN 'KRİTİK'
        WHEN u.stok_miktari < 100        THEN 'DÜŞÜK'
        ELSE                                  'YETERLİ'
    END AS stok_durumu
FROM urunler u
JOIN kategoriler k ON u.kategori_id = k.kategori_id
ORDER BY u.stok_miktari ASC;


-- -------------------------------------------------------
-- S7: Sepet analizi – bir satışta kaç farklı ürün?
-- -------------------------------------------------------
SELECT
    s.satis_id,
    s.satis_tarihi,
    CONCAT(m.ad, ' ', m.soyad)   AS musteri,
    COUNT(sd.urun_id)             AS urun_cesidi,
    SUM(sd.miktar)                AS toplam_adet,
    SUM(sd.ara_toplam)            AS sepet_toplami
FROM satislar s
LEFT JOIN musteriler     m  ON s.musteri_id = m.musteri_id
JOIN      satis_detaylari sd ON s.satis_id   = sd.satis_id
GROUP BY s.satis_id, s.satis_tarihi, musteri
ORDER BY sepet_toplami DESC;


-- -------------------------------------------------------
-- S8: Hafta içi vs hafta sonu satış karşılaştırması
-- -------------------------------------------------------
SELECT
    CASE
        WHEN DAYOFWEEK(satis_tarihi) IN (1, 7) THEN 'Hafta Sonu'
        ELSE 'Hafta İçi'
    END                  AS gun_tipi,
    COUNT(*)             AS satis_adedi,
    SUM(toplam_tutar)    AS toplam_ciro,
    AVG(toplam_tutar)    AS ortalama_sepet
FROM satislar
GROUP BY gun_tipi;


-- ============================================================
-- 5. GÖRÜNÜMLER (VIEW)
-- ============================================================

-- Satış özet görünümü
CREATE OR REPLACE VIEW v_satis_ozet AS
SELECT
    s.satis_id,
    s.satis_tarihi,
    COALESCE(CONCAT(m.ad,' ',m.soyad), 'Anonim') AS musteri,
    CONCAT(c.ad,' ',c.soyad)                      AS kasiyer,
    COUNT(sd.detay_id)                             AS kalem_sayisi,
    s.toplam_tutar
FROM satislar s
LEFT JOIN musteriler      m  ON s.musteri_id  = m.musteri_id
JOIN      calisanlar      c  ON s.calisan_id  = c.calisan_id
JOIN      satis_detaylari sd ON s.satis_id    = sd.satis_id
GROUP BY s.satis_id, s.satis_tarihi, musteri, kasiyer, s.toplam_tutar;

-- Ürün performans görünümü
CREATE OR REPLACE VIEW v_urun_performans AS
SELECT
    u.urun_adi,
    k.kategori_adi,
    u.birim_fiyat,
    u.stok_miktari,
    COALESCE(SUM(sd.miktar), 0)     AS toplam_satilan,
    COALESCE(SUM(sd.ara_toplam), 0) AS toplam_ciro
FROM urunler u
JOIN kategoriler      k  ON u.kategori_id = k.kategori_id
LEFT JOIN satis_detaylari sd ON u.urun_id = sd.urun_id
GROUP BY u.urun_id, u.urun_adi, k.kategori_adi, u.birim_fiyat, u.stok_miktari;


-- ============================================================
-- 6. STORED PROCEDURE – Tarih aralığına göre satış raporu
-- ============================================================

DELIMITER $$

CREATE PROCEDURE sp_satis_raporu(
    IN p_baslangic DATE,
    IN p_bitis     DATE
)
BEGIN
    SELECT
        DATE_FORMAT(satis_tarihi, '%Y-%m-%d') AS tarih,
        COUNT(*)                               AS satis_adedi,
        SUM(toplam_tutar)                      AS gunluk_ciro
    FROM satislar
    WHERE DATE(satis_tarihi) BETWEEN p_baslangic AND p_bitis
    GROUP BY tarih
    ORDER BY tarih;
END$$

DELIMITER ;

-- Kullanım örneği:
-- CALL sp_satis_raporu('2024-08-01', '2024-08-31');


-- ============================================================
-- FİN – Tüm tabloları listele
-- ============================================================
SHOW TABLES;
