-- QUẢN LÝ ĐỀ ÁN [Tạo bảng và thêm dữ liệu]

USE master
GO
IF NOT EXISTS (
    SELECT name
FROM sys.databases
WHERE name = N'QLDEAN'
)
CREATE DATABASE QLDEAN
GO

-- PHONGBAN(MaPhong,TenPhong,TruongPhong,NgayNhanChuc)
CREATE TABLE PHONGBAN
(
    MaPhong INT PRIMARY KEY,
    TenPhong NVARCHAR(50) NOT NULL,
    TruongPhong NVARCHAR(50) NOT NULL,
    NgayNhanChuc DATE NOT NULL
)

-- NHANVIEN (MaNV, HoNV, TenLot, TenNV, NgaySinh, DiaChi, Phai, Luong, MaNQL, MaPhong)
CREATE TABLE NHANVIEN
(
    MaNV INT PRIMARY KEY,
    HoNV NVARCHAR(50) NOT NULL,
    TenLot NVARCHAR(50) NOT NULL,
    TenNV NVARCHAR(50) NOT NULL,
    NgaySinh DATETIME NOT NULL,
    DiaChi NVARCHAR(50) NOT NULL,
    Phai NVARCHAR(5),
    Luong MONEY NOT NULL,
    MaNQL INT NOT NULL,
    MaPhong INT NOT NULL,
    FOREIGN KEY (MaNQL) REFERENCES NHANVIEN(MaNV),
    FOREIGN KEY (MaPhong) REFERENCES PHONGBAN(MaPhong)
)

-- THANNHAN(MaNV, TenTN, NgaySinh, Phai, QuanHe)
CREATE TABLE THANNHAN
(
    MaNV INT NOT NULL,
    TenTN NVARCHAR(50) NOT NULL,
    NgaySinh DATE NOT NULL,
    Phai NVARCHAR(5) NOT NULL,
    QuanHe NVARCHAR(50) NOT NULL,
    FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV)
)

-- DEAN(MaDA,TenDA,DiaDiemDA,MaPhong)
CREATE TABLE DEAN
(
    MaDA INT PRIMARY KEY,
    TenDA NVARCHAR(50) NOT NULL,
    DiaDiemDA NVARCHAR(50) NOT NULL,
    MaPhong INT NOT NULL,
    FOREIGN KEY (MaPhong) REFERENCES PHONGBAN(MaPhong)
)

-- DIADIEM_PHONG(MaPhong,DiaDiem)
CREATE TABLE DIADIEM_PHONG
(
    MaPhong INT NOT NULL,
    DiaDiem NVARCHAR(50) NOT NULL,
    FOREIGN KEY (MaPhong) REFERENCES PHONGBAN(MaPhong)
)

-- PHANCONG(MaNV,MaDA,ThoiGian)
CREATE TABLE PHANCONG
(
    MaNV INT NOT NULL,
    MaDA INT NOT NULL,
    ThoiGian DATE NOT NULL,
    FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV),
    FOREIGN KEY (MaDA) REFERENCES DEAN(MaDA)
)

SELECT *
FROM PHONGBAN

SELECT *
FROM NHANVIEN

SELECT *
FROM THANNHAN

SELECT *
FROM DIADIEM_PHONG

SELECT *
FROM DEAN

SELECT *
FROM PHANCONG



-- DROP DATABASE QLDEAN