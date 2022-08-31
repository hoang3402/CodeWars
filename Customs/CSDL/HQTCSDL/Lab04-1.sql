-- QUẢN LÝ ĐỀ ÁN [Tạo bảng và thêm dữ liệu]

use master
go
if not exists (
    select name
from sys.databases
where name = N'QLDEAN'
)
create database QLDEAN
go

-- NHANVIEN (MaNV, HoNV, TenLot, TenNV, NgaySinh, DiaChi, Phai, Luong, MaNQL, MaPhong) 


-- THANNHAN(MaNV, TenTN, NgaySinh, Phai, QuanHe)

-- PHONGBAN(MaPhong,TenPhong,TruongPhong,NgayNhanChuc) 

-- DEAN(MaDA,TenDA,DiaDiemDA,MaPhong) 

-- DIADIEM_PHONG(MaPhong,DiaDiem)

-- PHANCONG(MaNV,MaDA,ThoiGian) 


drop database QLDEAN