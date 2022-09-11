-- QUẢN LÝ SINH VIÊN [Tạo bảng và thêm dữ liệu]

go
if DB_ID('QLSINHVIEN') is null
begin
    print N'Đang tạo database'
    create database QLSINHVIEN
end
go
use QLSINHVIEN
set DATEFORMAT DMY

-- KHOA(MaKhoa, TenKhoa)
go
create table KHOA
(
    MaKhoa varchar(10) primary key,
    TenKhoa nvarchar(30)
)

-- NGANH(MaNganh, TenNganh, MaKhoa)
go
create table NGANH
(
    MaNganh int primary key,
    TenNganh nvarchar(30),
    MaKhoa varchar(10),
    foreign key (MaKhoa) references KHOA(MaKhoa)
)

-- LOP(MaLop, TenLop, MaNganh, KhoaHoc, HeDT, NamNhapHoc)
go
create table LOP
(
    MaLop varchar(10) primary key,
    TenLop nvarchar(30),
    MaNganh int,
    KhoaHoc int,
    HeDT varchar(10),
    NamNhapHoc int,
    foreign key (MaNganh) references NGANH(MaNganh)
)

-- SINHVIEN(MaSV, HoTen, MaLop, GioiTinh, NgaySinh, DiaChi)
go
create table SINHVIEN
(
    MaSV int primary key,
    HoTen nvarchar(30),
    MaLop varchar(10),
    GioiTinh nvarchar(5),
    NgaySinh date,
    DiaChi nvarchar(30),
    foreign key (MaLop) references LOP(MaLop)
)

-- HOCPHAN(MaHP, TenHP, SoDVHT, MaNganh, HocKy)
go
create table HOCPHAN
(
    MaHP int primary key,
    TenHP nvarchar(30),
    SoDVHT int,
    MaNganh int,
    HocKy int,
    foreign key (MaNganh) references NGANH(MaNganh)
)

-- DIEMHP(MaSV, MaHP, DiemHP)
go
create table DIEMHP
(
    MaSV int,
    MaHP int,
    DiemHP float,
    foreign key (MaSV) references SINHVIEN(MaSV),
    foreign key (MaHP) references HOCPHAN(MaHP),
)

go
insert into KHOA
values
    ('CNTT', N'Công Nghệ Thông Tin'),
    ('KT', N'Kế toán'),
    ('SP', N'Sư Phạm');

select *
from KHOA

go
insert into NGANH
values
    ('140902', N'Sư phạm Toán Tin', 'SP'),
    ('480202', N'Tin học ứng dụng', 'CNTT');

select *
from NGANH

go
insert into LOP
values
    ('CT11', N'Cao đẳng tin học', '480202', '11', 'TC', '2013'),
    ('CT12', N'Cao đẳng tin học', '480202', '12', 'CÐ', '2013'),
    ('CT13', N'Cao đẳng tin học', '480202', '13', 'CÐ', '2014');

select *
from LOP

go
insert into SINHVIEN
values
    ('1', N'Phan Thanh', 'CT12', N'Nam', '12/9/1990', N'Tuy Phước'),
    ('2', N'Nguyễn Thị Cẩm Tú', 'CT12', N'Nữ', '12/1/1994', N'Quy Nhơn'),
    ('3', N'Võ Thị Hà', 'CT12', N'Nữ', '12/9/1990', N'An Nhơn'),
    ('4', N'Trần Hoài Nam', 'CT12', N'Nam', '5/4/1994', N'Tây Sơn'),
    ('5', N'Trần Văn Hoàng', 'CT13', N'Nam', '4/8/1995', N'Vĩnh Thạnh'),
    ('6', N'Đào Thị Thảo', 'CT13', N'Nữ', '12/6/1995', N'An Nhơn'),
    ('7', N'Lê Thị Sen', 'CT13', N'Nữ', '12/8/1994', N'Phú Cát'),
    ('8', N'Nguyễn Văn Huy', 'CT11', N'Nam', '4/6/1995', N'Phú Mỹ'),
    ('9', N'Trần Thị Hoa', 'CT11', N'Nữ', '9/8/1994', N'Hoài Nhơn');

select *
from SINHVIEN

go
insert into HOCPHAN
values
    ('1', N'Toán cao cấp A1', '4', '480202', '1'),
    ('2', N'Tiếng Anh 1', '3', '480202', '1'),
    ('3', N'Vật lý đại cương', '4', '480202', '1'),
    ('4', N'Tiếng anh 2', '7', '480202', '1'),
    ('5', N'Tiếng anh 1', '3', '140902', '2'),
    ('6', N'Xác suất thống kê', '3', '140902', '2');

select *
from HOCPHAN

go
insert into DIEMHP
values
    ('2', '2', '5.9'),
    ('2', '3', '4.5'),
    ('3', '1', '4.3'),
    ('3', '2', '6.7'),
    ('3', '3', '7.3'),
    ('4', '1', '4'),
    ('4', '2', '5.2'),
    ('4', '3', '3.5'),
    ('5', '1', '9.8'),
    ('5', '2', '7.9'),
    ('5', '3', '7.5'),
    ('6', '1', '6.1'),
    ('6', '2', '5.6'),
    ('6', '3', '4'),
    ('7', '1', '6.2');

select *
from DIEMHP

-- DROP TABLE DIEMHP
-- DROP TABLE HOCPHAN
-- DROP TABLE SINHVIEN
-- DROP TABLE LOP
-- DROP TABLE NGANH
-- DROP TABLE KHOA

-- DROP DATABASE QLSINHVIEN;