-- QUẢN LÝ CÔNG TRÌNH [Tạo bảng và thêm dữ liệu]

go
if DB_ID('QLCONGTRINH') is null
begin
    print N'Đang tạo database'
    create database QLCONGTRINH
end
go
use QLCONGTRINH
set DATEFORMAT DMY
go
-- KTS(MaKTS, HoTen, NamSinh, Phai, NoiTN, DiaChiKTS): Mỗi kiến trúc sư có một mã, họ tên, năm sinh, phái, nơi tốt nghiệp, địa chỉ liên lạc.
go
create table KTS
(
    MaKTS varchar(10) primary key,
    HoTen nvarchar(50),
    NamSinh int,
    Phai nvarchar(10),
    NoiTN nvarchar(50),
    DiaChiKTS nvarchar(50)
)
go
-- CHUTHAU(MaChuThau, HoTen, SDT, DiaChiThau): Mỗi chủ thầu xây dựng công trình đều có mà, tên thầu, một số điện thoại và một địa chỉ.
go
create table CHUTHAU
(
    MaChuThau varchar(10) primary key,
    HoTen nvarchar(50),
    SDT varchar(10),
    DiaChiThau nvarchar(50)
)
go
-- CHUNHAN(MaChu, TenChu, DiaChiChu): Mỗi chủ nhân của một công trình đều có mã, tên chủ nhân và một địa chỉ.
go
create table CHUNHAN
(
    MaChu varchar(10) primary key,
    TenChu nvarchar(50),
    SDT varchar(10),
    DiaChiChu nvarchar(50)
)
go
-- CONGNHAN(MaCN, HoTen, NamSinh, NamVao, ChuyenMon) Mỗi công nhân tham gia xây dựng các công trình đều có một mã, họ tên, năm sinh, năm vào nghề, và một chuyên môn nào đó.
go
create table CONGNHAN
(
    MaCN varchar(10) primary key,
    HoTen nvarchar(50),
    NamSinh int,
    NamVao int,
    ChuyenMon nvarchar(50)
)
go
-- CONGTRINH(SoCT, TenCT, DiaChiCT, TinhThanh, KinhPhi, MaChuThau, NgayBD): Mỗi công trình có một số công trình (số thứ tự), tên công trình, một địa chỉ, thuộc về một tỉnh thành nào đó, được xây dựng với một kinh phí (đơn vị tính là triệu đồng), thuộc về sở hữu của một chủ nhân, do một chủ thầu xây dựng, và được khởi công xây từ một ngày nào đó.
go
create table CONGTRINH
(
    SoCT int primary key,
    TenCT nvarchar(50),
    DiaChiCT nvarchar(50),
    TinhThanh nvarchar(50),
    KinhPhi int,
    MaChuThau varchar(10),
    MaChu varchar(10),
    NgayBD date,
    foreign key (MaChuThau) references CHUTHAU(MaChuThau),
    foreign key (MaChu) references CHUNHAN(MaChu),
)
go
-- THAMGIA(MaCN, SoCT, NgayTG, SoNgayTG): Một công nhân có thể tham gia xây dựng nhiều công trình, và một công trình cũng có nhiều công nhân tham gia. Khi một công nhân tham gia vào một công trình nào đó sẽ được ghi nhận lại ngày bắt đầu tham gia và số ngày tham gia.
go
create table THAMGIA
(
    MaCN varchar(10),
    SoCT int,
    NgayTG date,
    SoNgayTG int,
)
go
-- THIETKE(MaKTS, SoCT, ThuLao): Một kiến trúc sư có thể thiết kế nhiều công trình, mỗi công trình cũng có thể do nhiều kiến trúc sư cùng thiết kế. Khi một kiến trúc sư thiết kế một công trình sẽ có một thù lao tương ứng (đơn vị tính là triệu).
go
create table THIETKE
(
    MaKTS varchar(10),
    SoCT int,
    ThuLao int,
    foreign key (MaKTS) references KTS(MaKTS)
)

go
insert into KTS
values
    ('KTS01', N'Nguyễn Đăng Khoa', '1989', N'Nam', N'ĐH Kiến Trúc', N'16 Lê Lợi, P6, Đà Lạt'),
    ('KTS02', N'Lê Hồng Thắm', '1992', N'Nữ', N'ĐH Mở TP HCM', N'87 Bùi Thị Xuân, P2, Đà Lạt'),
    ('KTS03', N'Trần Anh Tú', '1983', N'Nam', N'ĐH Yersin ĐL', N'122 Phù Đổng Thiên Vương, P8, Đà Lạt'),
    ('KTS04', N'Lê Văn Thanh', '1978', N'Nam', N'ĐH Kiến Trúc', N'07 Nguyễn Siêu, p7, Đà Lạt');
go

select *
from KTS;

go
insert into CHUTHAU
values
    ('CT01', N'Công ty xây dựng số 6', '098123123', N'3 Lê Đại Hành, P1'),
    ('CT02', N'Công ty BĐS Mai Minh', '012345678', N'97 Trần Anh Tông, p8'),
    ('CT03', N'Công ty Thái Lâm', '036417263', N'421 Nguyên Tử Lực, P8');
go

select *
from CHUTHAU;

go
insert into CHUNHAN
values
    ('CN01', N'Lê Tám', '097632123', N'01 Hoang Diệu, p3, Đà Lạt'),
    ('CN02', N'Trần Huy Lâm', '097457618', N'55 Võ Trường Toản, P8, Cần Thơ'),
    ('CN03', N'Lương Minh An', '038966063', N'01 Phù Đổng Thiên Vương, P8, Đà Lạt');
go

select *
from CHUNHAN;

go
insert into CONGNHAN
values
    ('CN01', N'Nguyễn Văn An', '1985', '2005', N'Thợ sắt'),
    ('CN02', N'Nguyễn Bình', '1978', '1998', N'Thợ xây'),
    ('CN03', N'Trần Cẩm', '1974', '1994', N'Giám sát'),
    ('CN04', N'Lê Thống', '1989', '2009', N'Thợ xây chính'),
    ('CN05', N'Dương Anh', '1977', '1997', N'Thợ xây chính'),
    ('CN06', N'Lê Anh Tuấn', '1983', '2008', N'Thợ hàn'),
    ('CN07', N'Trân Đông', '1989', '2007', N'Thợ điện'),
    ('CN08', N'Lê An', '1990', '2009', N'Thợ hàn và điện');
go

select *
from CONGNHAN;

go
insert into CONGTRINH
values
    ('1', 'Nhà tư nhân cấp 3', '"01 Hoang Diệu, p3, Đà Lạt"', 'Đà Lạt', '5600', 'CT03', 'CN01', '2020-01-01'),
    ('2', 'Nhà tư nhân cấp 4', '"55 Võ Trường Toản, P8, Cần Thơ"', 'Cần Thơ', '520', 'CT01', 'CN01', '2020-07-25'),
    ('3', 'Nhà trọ', '"01 Phù Đổng Thiên Vương, P8, Đà Lạt"', 'Đà Lạt', '4000', 'CT02', 'CN03', '2020-12-13'),
    ('4', 'Nhà riêng', '"22 Lê Duẩn, Phú Nhuận, TP HCM"', 'TP HCM', '2200', 'CT01', 'CN03', '2021-03-17'),
    ('5', 'Khách sạn quốc tế', '"45/2 Đồng Tâm, Cần Thơ"', 'Cần Thơ', '11700', 'CT02', 'CN02', '2021-04-04'),
    ('6', 'Nhà riêng', '"27 Nam Kỳ Khởi Nghĩa, Đà Lạt"', 'Đà Lạt', '4500', 'CT02', 'CN02', '2021-04-16');
go

select *
from CONGTRINH;

go
insert into THAMGIA
values
    ('CN01', '1', '1/1/2020', '45'),
    ('CN02', '1', '2/1/2020', '45'),
    ('CN03', '1', '1/1/2020', '45'),
    ('CN04', '1', '1/1/2020', '45'),
    ('CN05', '1', '1/1/2020', '45'),
    ('CN01', '2', '25/7/2020', '120'),
    ('CN03', '2', '1/8/2020', '114'),
    ('CN05', '2', '25/7/2020', '120'),
    ('CN02', '3', '13/12/2020', '210'),
    ('CN03', '3', '13/12/2020', '210'),
    ('CN04', '3', '13/12/2020', '210'),
    ('CN01', '5', '5/5/2020', '190'),
    ('CN02', '5', '1/6/2020', '180'),
    ('CN03', '5', '15/7/2020', '117'),
    ('CN06', '5', '5/8/2020', '90'),
    ('CN07', '5', '5/8/2020', '90'),
    ('CN08', '5', '5/10/2020', '60'),
    ('CN03', '4', '5/10/2020', '45'),
    ('CN01', '4', '5/10/2020', '45'),
    ('CN07', '4', '5/10/2020', '45');
go

select *
from THAMGIA;

go
insert into THIETKE
values
    ('KTS01', '1', '85'),
    ('KTS02', '2', '25'),
    ('KTS01', '3', '45'),
    ('KTS03', '5', '120'),
    ('KTS01', '5', '95'),
    ('KTS02', '4', '35');
go

select *
from THIETKE;

-- DROP TABLE THIETKE;
-- DROP TABLE KTS;
-- DROP TABLE CHUNHAN;
-- DROP TABLE CONGNHAN;
-- DROP TABLE CONGTRINH;
-- DROP TABLE THAMGIA;
