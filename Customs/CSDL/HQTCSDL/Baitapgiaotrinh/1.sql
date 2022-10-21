-- Nguyễn Văn Hoàng - 12101005

-- Create a new database called 'QLTHUVIEN'
-- Connect to the 'master' database to run this snippet
use master
go
-- Create the new database if it does not exist already
if not exists (
    select name
from sys.databases
where name = N'QLTHUVIEN'
)
create database QLTHUVIEN
go

use QLTHUVIEN
set DATEFORMAT DMY

create table NhaXuatBan
(
    MaNXB  varchar(5)   primary key,
    TenNXB nvarchar(30)
)

create table TheLoai
(
    MaTL  varchar(5)   primary key,
    TenTL nvarchar(30)
)

create table Sach
(
    MaSach   varchar(10)  primary key,
    TuaDe    nvarchar(30),
    MaNXB    varchar(5),
    TacGia   nvarchar(30),
    SoLuong  int          check(SoLuong >= 0),
    NgayNhap date,
    MaTL     varchar(5),
)

create table BanDoc
(
    MaThe     varchar(10)  primary key,
    TenBanDoc nvarchar(30),
    DiaChi    nvarchar(50),
    SoDT      int
)

create table MuonSach
(
    MaThe    varchar(10),
    MaSach   varchar(10),
    NgayMuon date,
    NgayTra  date,
    foreign key (MaThe) references BanDoc(MaThe),
    foreign key (MaSach) references Sach(MaSach)
)

insert into NhaXuatBan
values
    ('N001', N'Giáo dục'),
    ('N002', N'Khoa học kỹ thuật'),
    ('N003', N'Thống kê')

insert into TheLoai
values
    ('TH', N'Tin học'),
    ('HH', N'Hoá học'),
    ('KT', N'Kinh tế'),
    ('TN', N'Toán học')

insert into Sach
values
    ('TH0001', N'Sử dụng Corel Draw', 'N002', N'Đậu Quang Tuấn', 3, '8/9/2005', 'TH'),
    ('TH0002', N'Lập trình mạng', 'N003', N'Phạm Vĩnh Hưng', 2, '3/12/2003', 'TH'),
    ('TH0003', N'Thiết kế mạng chuyên nghiệp', 'N002', N'Phạm Vĩnh Hưng', 5, '4/5/2003', 'TH'),
    ('TH0004', N'Thực hành mạng', 'N003', N'Trần Quang', 3, '6/5/2004', 'TH'),
    ('TH0005', N'3D Studio kỹ xảo hoạt hình T1', 'N001', N'Trương Bình', 2, '5/2/2004', 'TH'),
    ('TH0006', N'3D Studio kỹ xảo hoạt hình T2', 'N001', N'Trương Bình', 3, '5/6/2004', 'TH'),
    ('TH0007', N'Giáo trình Access 2000', 'N001', N'Thiện Tâm', 5, '11/12/2005', 'TH')

insert into BANDOC
values
    ('050001', N'Trần Xuân', N'17 Yersin', '858936'),
    ('050002', N'Lê Nam', N'5 Hai Bà Trưng', '845623'),
    ('060001', N'Nguyễn Năm', N'10 Lý Tự Trọng', '823456'),
    ('060002', N'Trần Hùng', N'20 Trần Phú', '841256')

insert into MuonSach
values
    ('050001', 'TH0006', '12/12/2006', '1/3/2007'),
    ('050001', 'TH0007', '12/12/2006', null),
    ('050002', 'TH0001', '8/3/2006', '15/4/2007'),
    ('050002', 'TH0004', '4/3/2007', null),
    ('050002', 'TH0002', '4/3/2007', '4/4/2007'),
    ('050002', 'TH0003', '2/4/2007', '15/4/2007'),
    ('060002', 'TH0001', '8/4/2007', null),
    ('060002', 'TH0007', '15/3/2007', '15/4/2007')
