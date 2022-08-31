-- QUẢN LÝ ĐỀ ÁN [Tạo bảng và thêm dữ liệu]

use master
if not exists (
    select name
from sys.databases
where name = N'QLDEAN'
)
create database QLDEAN

-- PHONGBAN(MaPhong,TenPhong,TruongPhong,NgayNhanChuc)
create table PHONGBAN
(
    MaPhong int primary key,
    TenPhong nvarchar(50) not null,
    TruongPhong nvarchar(50) not null,
    NgayNhanChuc date not null
)

-- NHANVIEN (MaNV, HoNV, TenLot, TenNV, NgaySinh, DiaChi, Phai, Luong, MaNQL, MaPhong)
create table NHANVIEN
(
    MaNV int primary key,
    HoNV nvarchar(50) not null,
    TenLot nvarchar(50) not null,
    TenNV nvarchar(50) not null,
    NgaySinh datetime not null,
    DiaChi nvarchar(50) not null,
    Phai nvarchar(5),
    Luong money not null,
    MaNQL int not null,
    MaPhong int not null,
    foreign key (MaNQL) references NHANVIEN(MaNV),
    foreign key (MaPhong) references PHONGBAN(MaPhong)
)

-- THANNHAN(MaNV, TenTN, NgaySinh, Phai, QuanHe)
create table THANNHAN
(
    MaNV int not null,
    TenTN nvarchar(50) not null,
    NgaySinh date not null,
    Phai nvarchar(5) not null,
    QuanHe nvarchar(50) not null,
    foreign key (MaNV) references NHANVIEN(MaNV)
)

-- DEAN(MaDA,TenDA,DiaDiemDA,MaPhong)
create table DEAN
(
    MaDA int primary key,
    TenDA nvarchar(50) not null,
    DiaDiemDA nvarchar(50) not null,
    MaPhong int not null,
    foreign key (MaPhong) references PHONGBAN(MaPhong)
)

-- DIADIEM_PHONG(MaPhong,DiaDiem)
create table DIADIEM_PHONG
(
    MaPhong int not null,
    DiaDiem nvarchar(50) not null,
    foreign key (MaPhong) references PHONGBAN(MaPhong)
)

-- PHANCONG(MaNV,MaDA,ThoiGian)
create table PHANCONG
(
    MaNV int not null,
    MaDA int not null,
    ThoiGian date not null,
    foreign key (MaNV) references NHANVIEN(MaNV),
    foreign key (MaDA) references DEAN(MaDA)
)

select *
from PHONGBAN

select *
from NHANVIEN

select *
from THANNHAN

select *
from DIADIEM_PHONG

select *
from DEAN

select *
from PHANCONG



-- DROP DATABASE QLDEAN