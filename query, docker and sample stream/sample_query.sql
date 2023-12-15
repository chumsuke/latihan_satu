# Membuat Tabel Mahasiswa:
CREATE TABLE Mahasiswa (
    ID INT PRIMARY KEY,
    Nama VARCHAR(100),
    NIM VARCHAR(20),
    Jurusan VARCHAR(50),
    IPK DECIMAL(3, 2)
);

# Menambahkan Data Mahasiswa:
INSERT INTO Mahasiswa (ID, Nama, NIM, Jurusan, IPK) VALUES 
(1, 'John Doe', '123456', 'Teknik Informatika', 3.75),
(2, 'Jane Doe', '654321', 'Manajemen', 3.90);

# Mengambil Data Semua Mahasiswa:
SELECT * FROM Mahasiswa;

# Memperbarui IPK Mahasiswa dengan NIM tertentu:
UPDATE Mahasiswa SET IPK = 3.85 WHERE NIM = '123456';

# Menghapus Data Mahasiswa dengan ID tertentu:
DELETE FROM Mahasiswa WHERE ID = 2;

# Mengambil Mahasiswa dari Jurusan Tertentu:
SELECT * FROM Mahasiswa WHERE Jurusan = 'Teknik Informatika';

# Menghitung Jumlah Mahasiswa dalam Jurusan Tertentu:
SELECT Jurusan, COUNT(*) AS JumlahMahasiswa FROM Mahasiswa GROUP BY Jurusan;

# Menggunakan Fungsi Agregasi untuk Menemukan IPK Rata-rata:
SELECT AVG(IPK) AS IPKRataRata FROM Mahasiswa;

# Menggunakan Join untuk Menampilkan Nama dan Jurusan Mahasiswa
SELECT Mahasiswa.Nama, Mahasiswa.Jurusan, JurusanKeterangan.Keterangan 
FROM Mahasiswa 
INNER JOIN JurusanKeterangan ON Mahasiswa.Jurusan = JurusanKeterangan.Jurusan;

# Menangani Transaksi:
-- Memulai transaksi
BEGIN TRANSACTION;

-- Operasi SQL lainnya (misalnya, UPDATE, INSERT, DELETE)

-- Menyelesaikan transaksi jika berhasil
COMMIT;

-- Membatalkan transaksi jika terjadi kesalahan
ROLLBACK;


# Menyimpan Prosedur:
-- Contoh prosedur untuk memperbarui IPK mahasiswa
CREATE PROCEDURE UpdateIPKMahasiswa
    @NIM VARCHAR(20),
    @IPKBaru DECIMAL(3, 2)
AS
BEGIN
    UPDATE Mahasiswa SET IPK = @IPKBaru WHERE NIM = @NIM;
END;


# Menyimpan Fungsi:
-- Contoh fungsi untuk menghitung jumlah mahasiswa dalam suatu jurusan
CREATE FUNCTION JumlahMahasiswaJurusan
    (@Jurusan VARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @Jumlah INT;
    SELECT @Jumlah = COUNT(*) FROM Mahasiswa WHERE Jurusan = @Jurusan;
    RETURN @Jumlah;
END;

# Menyimpan Trigger:
-- Contoh trigger untuk mengupdate timestamp setiap kali ada perubahan pada data mahasiswa
CREATE TRIGGER UpdateTimestampMahasiswa
ON Mahasiswa
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    UPDATE Mahasiswa SET Timestamp = GETDATE() WHERE ID IN (SELECT ID FROM INSERTED);
END;


# Mengoptimalkan Kinerja: 
-- Menambahkan indeks pada kolom NIM untuk meningkatkan pencarian
CREATE INDEX IndeksNIM ON Mahasiswa (NIM);

# Mengamankan Database:
-- Memberikan izin SELECT kepada pengguna tertentu
GRANT SELECT ON Mahasiswa TO NamaPengguna;

-- Memberikan izin INSERT, UPDATE, DELETE kepada pengguna tertentu
GRANT INSERT, UPDATE, DELETE ON Mahasiswa TO NamaPengguna;








