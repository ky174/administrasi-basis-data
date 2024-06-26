-- Nama :Rizky febrinaldi  
-- NIM : 22241005
-- MODUL 5

-- Akses Database
USE mart_undikma;

--- JOIN
--- Tampilkan nama pelanggan dan qty belanja nya

SELECT mp.nama_pelanggan, tp.qty FROM tr_penjualan_dqlab AS tp JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- Join tanpa filtering ON = CrossJoin
SELECT mp.nama_pelanggan, tp.qty FROM tr_penjualan_dqlab AS tp JOIN ms_pelanggan_dqlab AS mp
ON true;

-- Penggunaan Inner Join
SELECT mp.nama_pelanggan, tp.qty FROM tr_penjualan_dqlab AS tp Inner JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- Left Outer Join
SELECT mp.nama_pelanggan, tp.qty FROM tr_penjualan_dqlab AS tp LEFT JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- Right JOIN
SELECT mp.nama_pelanggan, tp.qty FROM tr_penjualan_dqlab AS tp RIGHT JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- Left Outer JOIN untuk 3 Tabel
SELECT tp.kode_pelanggan, mp.nama_pelanggan,mpd.kategori_produk, mpd.nama_produk, tp.qty 
FROM ms_pelanggan_dqlab AS mp LEFT OUTER JOIN tr_penjualan_dqlab AS tp 
ON mp.kode_pelanggan = tp.kode_pelanggan 
LEFT OUTER JOIN ms_produk_dqlab mpd 
ON mpd.kode_produk = tp.kode_produk;


-- Order By Pada Join
SELECT tp.kode_pelanggan, mp.nama_pelanggan,mpd.kategori_produk, mpd.nama_produk, tp.qty 
FROM ms_pelanggan_dqlab AS mp LEFT OUTER JOIN tr_penjualan_dqlab AS tp 
ON mp.kode_pelanggan = tp.kode_pelanggan 
LEFT OUTER JOIN ms_produk_dqlab mpd 
ON mpd.kode_produk = tp.kode_produk
ORDER BY qty ASC;

-- Grouping dan Fungsi Agregasi
-- Menampilkan Summary total produk terjual
SELECT mpd.kategori_produk, mpd.nama_produk, sum(tp.qty) AS jml_produk_terjual
FROM ms_produk_dqlab AS mpd LEFT OUTER JOIN tr_penjualan_dqlab AS tp
ON mpd.kode_produk = tp.kode_produk 
GROUP BY mpd.kategori_produk, mpd.nama_produk
HAVING sum(tp.qty) IS NULL
ORDER BY sum(qty)DESC;

-- Menggunakan UNION
SELECT kode_produk , nama_produk
FROM ms_produk_dqlab
UNION
SELECT kode_pelanggan, nama_pelanggan 
FROM ms_pelanggan_dqlab;

-- Menggunakan UNION dengan nilai konstan
SELECT 'produkam' AS kategori, nama_produk AS nama
FROM ms_produk_dqlab
UNION
SELECT 'pelanggan', nama_pelanggan
FROM ms_pelanggan_dqlab mpd

-- Union dengan table yang sama
SELECT kode_produk, nama_produk
FROM ms_produk_dqlab
UNION
SELECT kode_produk, nama_produk 
FROM ms_produk_dqlab;

-- Union table berbeda dengan hasil unik
SELECT nama_produk
FROM ms_produk_dqlab
UNION
SELECT nama_produk 
FROM tr_penjualan_dqlab;

-- Union ALL dengan table yang sama
SELECT kode_produk, nama_produk
FROM ms_produk_dqlab
UNION ALL
SELECT kode_produk, nama_produk
FROM ms_produk_dqlab;

-- Union ALL dengan table berbeda
SELECT nama_produk FROM ms_produk_dqlab mpd 
UNION ALL
SELECT nama_produk 
FROM tr_penjualan_dqlab

-- LATIHAN MANDIRI 1
SELECT tp.kode_pelanggan, mp.nama_pelanggan,mpd.kategori_produk, mpd.nama_produk, tp.qty 
FROM ms_pelanggan_dqlab AS mp INNER JOIN tr_penjualan_dqlab AS tp 
ON mp.kode_pelanggan = tp.kode_pelanggan 
LEFT OUTER JOIN ms_produk_dqlab mpd 
ON mpd.kode_produk = tp.kode_produk;

-- LATIHAN MANDIRI 2
SELECT tp.kode_pelanggan, mp.nama_pelanggan,mpd.kategori_produk, mpd.nama_produk, tp.qty
FROM ms_pelanggan_dqlab AS mp LEFT JOIN tr_penjualan_dqlab AS tp 
ON mp.kode_pelanggan = tp.kode_pelanggan 
LEFT JOIN ms_produk_dqlab mpd 
ON mpd.kode_produk = tp.kode_produk
WHERE tp.qty is not null;

-- LATIHAN MANDIRI 3
SELECT 
mpd.kategori_produk, sum(tp.qty) AS total_qty
FROM ms_pelanggan_dqlab AS mp 
INNER JOIN tr_penjualan_dqlab AS tp 
ON mp.kode_pelanggan = tp.kode_pelanggan 
INNER JOIN ms_produk_dqlab AS mpd 
ON mpd.kode_produk = tp.kode_produk
GROUP BY mpd.kategori_produk
ORDER BY total_qty DESC;

-- LATIHAN MANDIRI 4
SELECT 
mp.kategori_produk, 
mpd.nama_produk
FROM 
ms_produk_dqlab AS mp 
INNER JOIN ms_produk_dqlab AS mpd
ON mp.kode_produk = mpd.kode_produk
ORDER BY 
mp.kategori_produk DESC;
 


