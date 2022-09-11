
use master
go
if not exists (
    select name
from sys.databases
where name = N'QuanLyBanHang'
)
create database QuanLyBanHang
go

use QuanLyBanHang
set DATEFORMAT DMY

create table VATTU
(
    MaVT      varchar(10)  primary key,
    TenVT     nvarchar(30),
    DonViTinh nvarchar(10),
    PhanTram  int
)

create table PHIEUXUAT
(
    SoPX     varchar(10)  primary key,
    NgayXuat date,
    TenKH    nvarchar(30),
)

create table CTPHIEUXUAT
(
    SoPX   varchar(10),
    MaVT   varchar(10),
    SLXuat int,
    DGXuat int,
    foreign key (MaVT) references VATTU(MaVT),
    foreign key (SoPX) references PHIEUXUAT(SoPX)
)

create table TONKHO
(
    NamThang   varchar(10),
    MaVT       varchar(10),
    SLDau      int,
    TongSLNhap int,
    TongSLXuat int,
    SLCuoi     int,
    foreign key (MaVT) references VATTU(MaVT),
)

create table NHACUNGCAP
(
    MaNCC     varchar(10)  primary key,
    TenNCC    nvarchar(30),
    DiaChi    nvarchar(30),
    DienThoai nvarchar(20)
)

create table DONDATHANG
(
    SoDH   varchar(10) primary key,
    NgayDH date,
    MaNCC  varchar(10),
    foreign key (MaNCC) references NHACUNGCAP(MaNCC)
)

create table PHIEUNHAP
(
    SoPN     varchar(10) primary key,
    NgayNhap date,
    SoDH     varchar(10),
    foreign key (SoDH) references DONDATHANG(SoDH)
)

create table CTPHIEUNHAP
(
    SoPN   varchar(10),
    MaVT   varchar(10),
    SLNhap int,
    DGNhap int,
    foreign key (MaVT) references VATTU(MaVT),
    foreign key (SoPN) references PHIEUNHAP(SoPN),
)

create table CTDATHANG
(
    SoDH  varchar(10),
    MaVT  varchar(10),
    SLDat int,
    foreign key (SoDH) references DONDATHANG(SoDH),
    foreign key (MaVT) references VATTU(MaVT)
)

insert into NHACUNGCAP
values
    ('C01', N'Lê Minh Trí', N'54 Hậu Giang Q6 HCM', '8781024'),
    ('C02', N'Trần Minh Thạch', N'145 Hùng Vương Mỹ Tho', '7698154'),
    ('C03', N'Hồng Phương', N'154/85 Lê Lai Q1 HCM', '9600125'),
    ('C04', N'Nhật Thắng', N'198/40 Hương Lộ 14 QTB HCM', '8757757'),
    ('C05', N'Lưu Nguyệt Quế', N'178 Nguyễn Văn Luông Đà Lạt', '7964251'),
    ('C07', N'Cao Minh Trung', N'125 Lê Quang Sung Nha Trang', 'Chua co');

insert into VATTU
values
    ('DD01', N'Đầu DVD Hitachi 1 đĩa', N'Bộ', '40'),
    ('DD02', N'Đầu DVD Hitachi 3 đĩa', N'Bộ', '40'),
    ('TL15', N'Tủ lạnh Sanyo 150 lit', N'Cái', '25'),
    ('TL90', N'Tủ lạnh Sanyo 90 lit', N'Cái', '20'),
    ('TV14', N'Tivi Sony 14 inches', N'Cái', '15'),
    ('TV21', N'Tivi Sony 21 inches', N'Cái', '10'),
    ('TV29', N'Tivi Sony 29 inches', N'Cái', '10'),
    ('VD01', N'Đầu VCD Sony 1 đĩa', N'Bộ', '30'),
    ('VD02', N'Đầu VCD Sony 3 đĩa', N'Bộ', '30');

insert into DONDATHANG
values
    ('D001', '15/1/2007', 'C03'),
    ('D002', '30/1/2007', 'C01'),
    ('D003', '10/2/2007', 'C02'),
    ('D004', '17/2/2007', 'C05'),
    ('D005', '3/1/2007', 'C02'),
    ('D006', '3/12/2007', 'C05');

insert into CTDATHANG
values
    ('D001', 'DD01', '10'),
    ('D001', 'DD02', '15'),
    ('D002', 'VD02', '30'),
    ('D003', 'TV14', '10'),
    ('D003', 'TV29', '20'),
    ('D004', 'TL90', '10'),
    ('D005', 'TV14', '10'),
    ('D005', 'TV29', '20'),
    ('D006', 'TV14', '10'),
    ('D006', 'TV29', '20'),
    ('D006', 'VD01', '20');

insert into PHIEUNHAP
values
    ('N001', '17/1/2007', 'D001'),
    ('N002', '20/1/2007', 'D001'),
    ('N003', '31/1/2007', 'D002'),
    ('N004', '15/2/2007', 'D003');

insert into CTPHIEUNHAP
values
    ('N001', 'DD01', '8', '2500000'),
    ('N001', 'DD02', '10', '3500000'),
    ('N002', 'DD01', '2', '2500000'),
    ('N002', 'DD02', '5', '3500000'),
    ('N003', 'VD02', '30', '2500000'),
    ('N004', 'TV14', '5', '2500000'),
    ('N004', 'TV29', '12', '3500000');

insert into PHIEUXUAT
values
    ('X001', '17/1/2007', N'Nguyễn Ngọc Phương Nhi'),
    ('X002', '25/1/2007', N'Nguyễn Hồng Phương'),
    ('X003', '31/1/2007', N'Nguyễn Tuấn Tú');

insert into CTPHIEUXUAT
values
    ('X001', 'DD01', '2', '3500000'),
    ('X002', 'DD01', '1', '3500000'),
    ('X002', 'DD02', '5', '4900000'),
    ('X003', 'DD01', '3', '3500000'),
    ('X003', 'DD02', '2', '4900000'),
    ('X003', 'VD02', '10', '3250000');

insert into TONKHO
values
    ('5/2007', 'DD01', '100', '500', '300', '300'),
    ('5/2007', 'DD02', '120', '470', '50', '540'),
    ('5/2007', 'TL15', '140', '440', '20', '560'),
    ('5/2007', 'TL90', '160', '410', '40', '530'),
    ('5/2007', 'TV14', '180', '380', '70', '490'),
    ('5/2007', 'TV21', '200', '350', '140', '410'),
    ('5/2007', 'TV29', '220', '320', '250', '290');

-- use master
-- drop database QuanLyBanHang