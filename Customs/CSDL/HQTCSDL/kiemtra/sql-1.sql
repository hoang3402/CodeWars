-- Nguyễn Văn Hoàng_12101005

-- Câu 1. Thiết kế CSDL trên bằng ngôn ngữ truy vấn sql Server (ràng buộc khóa chính, khóa ngoại), dựa trên thiết kế CSDL và dữ liệu mẫu chọn kiểu dữ liệu cho phù hợp với từng thuộc tính của các bảng (2đ)
create database QuanLyNhaDat
use QuanLyNhaDat
set dateformat DMY

-- NHANVIEN (MaNV,HoTen,DiaChi,DienThoai,NgaySinh,Luong)
create table NHANVIEN
(
    MaNV      varchar(10)  primary key,
    HoTen     nvarchar(30),
    DiaChi    nvarchar(30),
    DienThoai varchar(13),
    NgaySinh  date,
    Luong     int
)

-- CHUNHA(MaCN, TenCN,DiaChi,DienThoai)
create table CHUNHA
(
    MaCN      varchar(10)   primary key,
    TenCN     nvarchar(30),
    DiaChi    nvarchar(100),
    DienThoai varchar(13)
)

-- LOAINHA(MaLN,MoTa) 
create table LOAINHA
(
    MaLN varchar(10)   primary key,
    MoTa nvarchar(100)
)

-- NHA(MaNha, Quan, Duong, MaLN, SoPhong, SoTien, MaCN, MaNV) 
create table NHA
(
    MaNha   varchar(10)  primary key,
    Quan    varchar(10),
    Duong   nvarchar(30),
    MaLN    varchar(10),
    SoPhong int,
    SoTien  int,
    MaCN    varchar(10),
    MaNV    varchar(10),
    foreign key (MaLN) references LOAINHA(MaLN),
    foreign key (MaCN) references CHUNHA(MaCN),
    foreign key (MaNV) references NHANVIEN(MaNV),
)

-- KHACHHANG(MaKH, HoTen, DienThoai, MaLN, GiaTu,GiaDen,MaNV) 
create table KHACHHANG
(
    MaKH      varchar(10)  primary key,
    HoTen     nvarchar(30),
    DienThoai varchar(13),
    MaLN      varchar(10),
    GiaTu     int,
    GiaDen    int,
    MaNV      varchar(10),
    foreign key (MaLN) references LOAINHA(MaLN),
    foreign key (MaNV) references NHANVIEN(MaNV),
)

-- XEMNHA(MaKH, MaNha, NgayXem, NhanXet). 
create table XEMNHA
(
    MaKH    varchar(10),
    MaNha   varchar(10),
    NgayXem date,
    NhanXet nvarchar(100),
    foreign key (MaKH) references KHACHHANG(MaKH),
    foreign key (MaNha) references NHA(MaNha),
)

-- HopDongThue(MaKH,MaNha,NgayBD,NgayKT,TienCoc,GhiChu) 
create table HopDongThue
(
    MaKH    varchar(10),
    MaNha   varchar(10),
    NgayBD  date,
    NgayKT  date,
    TienCoc int,
    GhiChu  nvarchar(100),
    foreign key (MaKH) references KHACHHANG(MaKH),
    foreign key (MaNha) references NHA(MaNha),
)

-- Câu 2. Thêm dữ liệu vào các bảng bằng câu lệnh Insert (2đ)
-- Thêm dữ liệu
insert into NHANVIEN
values
    ('NV001', N'An', N'VP công ty', '012345671', '12/1/2001', '5000'),
    ('NV002', N'Bình', N'VP công ty', '012345672', '17/8/2002', '6000'),
    ('NV003', N'Cường', N'VP công ty', '012345673', '30/4/1997', '7000');

insert into CHUNHA
values
    ('CN0001', N'Thảo', N'63 Quang Trung, QTB', '012345674'),
    ('CN0002', N'Lan', N'2 Phan Liem, Q1', '012345675'),
    ('CN0003', N'Ngọc', N'6 An Duong Vuong, Q3', '012345676'),
    ('CN0004', N'Hưng', N'12 Phan Dinh Phung, Q7', '012345677'),
    ('CN0005', N'Phúc', N'377 Ngô Quyền, Q9', '012345678'),
    ('CN0006', N'Nhi', N'23 Lý Chính Thắng, QBT', '012345679');

insert into LOAINHA
values
    ('CC', N'Chung cư'),
    ('NRC3', N'Nhà riêng C3'),
    ('BT', N'Biệt thự'),
    ('NRC4', N'Nhà riêng C4');

insert into NHA
values
    ('MN0001', 'Q1', N'Lý Nam Đế', 'NRC4', '3', '5000', 'CN0001', 'NV001'),
    ('MN0002', 'Q2', N'Trần Hưng Đạo', 'NRC3', '5', '12000', 'CN0002', 'NV002'),
    ('MN0003', 'QBT', N'Lê Đại Hành', 'BT', '5', '20000', 'CN0001', 'NV001'),
    ('MN0004', 'Q7', N'Lê Văn Tám', 'CC', '3', '4000', 'CN0003', 'NV003'),
    ('MN0005', 'QTB', N'Hạnh Thông Tây', 'BT', '6', '45000', 'CN0006', 'NV002');

insert into KHACHHANG
values
    ('KH01', N'Lê', '0901234567', 'CC', '4000', '5000', 'NV001'),
    ('KH02', N'Chánh', '0901234568', 'BT', '15000', '35000', 'NV002');

insert into XEMNHA
values
    ('KH01', 'MN0004', '31/8/2021', N''),
    ('KH02', 'MN0003', '31/8/2021', N'ồn ào'),
    ('KH02', 'MN0002', '31/8/2021', N'giá cao');

-- use master
-- drop database QuanLyNhaDat