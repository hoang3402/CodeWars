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

-- NHANVIEN (MaNV, HoNV, TenLot, TenNV, NgaySinh, DiaChi, Phai, Luong, MaNQL, MaPhong) 


-- THANNHAN(MaNV, TenTN, NgaySinh, Phai, QuanHe)

-- PHONGBAN(MaPhong,TenPhong,TruongPhong,NgayNhanChuc) 

-- DEAN(MaDA,TenDA,DiaDiemDA,MaPhong) 

-- DIADIEM_PHONG(MaPhong,DiaDiem)

-- PHANCONG(MaNV,MaDA,ThoiGian) 


DROP DATABASE QLDEAN