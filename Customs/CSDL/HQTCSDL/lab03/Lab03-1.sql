-- QUẢN LÝ ĐỀ ÁN [Tạo bảng và thêm dữ liệu]

use master
if not exists (
    select name
from sys.databases
where name = N'QLDEAN'
)
create database QLDEAN

use QLDEAN
set dateformat DMY

-- PHONGBAN(MaPhong,TenPhong,TruongPhong,NgayNhanChuc)
create table PHONGBAN
(
    MaPhong      int          primary key,
    TenPhong     nvarchar(50) not null,
    TruongPhong  nvarchar(50) not null,
    NgayNhanChuc date         not null
)

-- NHANVIEN (MaNV, HoNV, TenLot, TenNV, NgaySinh, DiaChi, Phai, Luong, MaNQL, MaPhong)
create table NHANVIEN
(
    MaNV     int          primary key,
    HoNV     nvarchar(50) not null,
    TenLot   nvarchar(50) not null,
    TenNV    nvarchar(50) not null,
    NgaySinh date         not null,
    DiaChi   nvarchar(50) default N'Hồ Chí Minh',
    Phai     nvarchar(5)  not null,
    Luong    int          not null,
    MaNQL    int,
    MaPhong  int          not null,
    foreign key (MaPhong) references PHONGBAN(MaPhong),
    constraint CheckPhai check (Phai = N'Nữ' or Phai = 'Nam')
)

-- THANNHAN(MaNV, TenTN, NgaySinh, Phai, QuanHe)
create table THANNHAN
(
    MaNV     int          not null,
    TenTN    nvarchar(50) not null,
    NgaySinh date         not null,
    Phai     nvarchar(5)  not null,
    QuanHe   nvarchar(50) not null,
    foreign key (MaNV) references NHANVIEN(MaNV)
)

-- DEAN(MaDA,TenDA,DiaDiemDA,MaPhong)
create table DEAN
(
    MaDA      int          primary key,
    TenDA     nvarchar(50) not null,
    DiaDiemDA nvarchar(50) not null,
    MaPhong   int          not null,
    foreign key (MaPhong) references PHONGBAN(MaPhong)
)

-- DIADIEM_PHONG(MaPhong,DiaDiem)
create table DIADIEM_PHONG
(
    MaPhong int          not null,
    DiaDiem nvarchar(50) not null,
    foreign key (MaPhong) references PHONGBAN(MaPhong)
)

-- PHANCONG(MaNV,MaDA,ThoiGian)
create table PHANCONG
(
    MaNV     int not null,
    MaDA     int not null,
    ThoiGian int not null,
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

insert into PHONGBAN
values
    ('5', N'Nghiên cứu', '005', '22/05/2008'),
    ('4', N'Điều hành', '008', '01/01/2005'),
    ('1', N'Quản lý', '006', '19/06/2001');

insert into NHANVIEN
values
    ('009', N'Đinh', N'Bá', N'Tiên', '11/02/1980', N'119 Cống Quỳnh, Tp HCM', N'Nam', '30000', '005', '5'),
    ('005', N'Nguyễn', N'Thanh', N'Tùng', '20/08/1982', N'222 Nguyễn Văn Cừ, Tp HCM', N'Nam', '40000', '006', '5'),
    ('007', N'Bùi', N'Ngọc', N'Hằng', '11/3/1974', N'332 Nguyễn Thái Học, Tp HCM', N'Nam', '25000', '001', '4'),
    ('001', N'Lê', N'Quỳnh', N'Như', '01/02/1987', N'291 Hồ Văn Huê, Tp HCM', N'Nữ', '43000', '006', '4'),
    ('004', N'Nguyễn', N'Mạnh', N'Hùng', '04/03/1987', N'95 Bà Rịa, Vũng Tàu', N'Nam', '38000', '005', '5'),
    ('003', N'Trần', N'Thanh', N'Tâm', '04/05/1997', N'34 Mai Thị Lự, Tp HCM', N'Nam', '25000', '005', '5'),
    ('008', N'Trần', N'Hồng', N'Quang', '01/09/1987', N'80 Lê Hồng Phong, Tp HCM', N'Nam', '25000', '001', '4'),
    ('006', N'Phạm', N'Văn', N'Vinh', '01/01/1985', N'45 Trưng Vương, Hà Nội', N'Nữ', '55000', '', '1');

insert into THANNHAN
values
    ('005', N'Trinh', '05/04/1996', N'Nữ', N'Con gái'),
    ('005', N'Khang', '25/10/1993', N'Nam', N'Con trai'),
    ('005', N'Phương', '03/05/1968', N'Nữ', N'Vợ chồng'),
    ('001', N'Minh', '29/02/1972', N'Nam', N'Vợ chồng'),
    ('009', N'Tiến', '01/01/1998', N'Nam', N'Con trai'),
    ('009', N'Châu', '30/12/1998', N'Nữ', N'Con gái'),
    ('009', N'Phương', '05/05/1977', N'Nữ', N'Vợ chồng');

insert into DEAN
values
    ('1', N'Sản phẩm X', N'Vũng Tàu', '5'),
    ('2', N'Sản phẩmY', N'Nha Trang', '5'),
    ('3', N'Sản phẩm Z', N'TP HCM', '5'),
    ('10', N'Tin học hóa', N'Hà Nội', '4'),
    ('20', N'Cáp quang', N'TP HCM', '1'),
    ('30', N'Đào tạo', N'Hà Nội', '4');

insert into DIADIEM_PHONG
values
    ('1', 'TP HCM'),
    ('4', 'Ha Noi'),
    ('5', 'Vung Tau'),
    ('5', 'Nha Trang'),
    ('5', 'TP HCM');

insert into PHANCONG
values
    ('009', '1', '32'),
    ('009', '2', '8'),
    ('004', '3', '40'),
    ('003', '1', '20'),
    ('003', '2', '20'),
    ('008', '10', '35'),
    ('008', '30', '5'),
    ('001', '30', '20'),
    ('001', '20', '15'),
    ('006', '20', '30'),
    ('005', '3', '10'),
    ('005', '10', '10'),
    ('005', '20', '10'),
    ('007', '30', '30'),
    ('007', '10', '10');

-- use master
-- DROP DATABASE QLDEAN