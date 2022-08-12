-- QUẢN LÝ CÔNG TRÌNH [Tạo bảng và thêm dữ liệu]

GO
IF DB_ID('QLSINHVIEN') IS NULL
BEGIN
    PRINT N'Đang tạo database'
    CREATE DATABASE QLCONGTRINH
END
GO
USE QLCONGTRINH
SET DATEFORMAT DMY
GO
-- KTS(MaKTS, HoTen, NamSinh, Phai, NoiTN, DiaChiKTS): Mỗi kiến trúc sư có một mã, họ tên, năm sinh, phái, nơi tốt nghiệp, địa chỉ liên lạc.
GO
CREATE TABLE KTS
(
    MaKTS VARCHAR(10) PRIMARY KEY,
    HoTen NVARCHAR(50),
    NamSinh INT,
    Phai NVARCHAR(10),
    NoiTN NVARCHAR(50),
    DiaChiKTS NVARCHAR(50)
)
GO
-- CHUTHAU(MaChuThau, HoTen, SDT, DiaChiThau): Mỗi chủ thầu xây dựng công trình đều có mà, tên thầu, một số điện thoại và một địa chỉ.
GO
CREATE TABLE CHUTHAU
(
    MaChuThau VARCHAR(10) PRIMARY KEY,
    HoTen NVARCHAR(50),
    SDT VARCHAR(10),
    DiaChiThau NVARCHAR(50)
)
GO
-- CHUNHAN(MaChu, TenChu, DiaChiChu): Mỗi chủ nhân của một công trình đều có mã, tên chủ nhân và một địa chỉ.
GO
CREATE TABLE CHUNHAN
(
    MaChu VARCHAR(10) PRIMARY KEY,
    TenChu NVARCHAR(50),
    SDT VARCHAR(10),
    DiaChiChu NVARCHAR(50)
)
GO
-- CONGNHAN(MaCN, HoTen, NamSinh, NamVao, ChuyenMon) Mỗi công nhân tham gia xây dựng các công trình đều có một mã, họ tên, năm sinh, năm vào nghề, và một chuyên môn nào đó.
GO
CREATE TABLE CONGNHAN
(
    MaCN VARCHAR(10) PRIMARY KEY,
    HoTen NVARCHAR(50),
    NamSinh INT,
    NamVao INT,
    ChuyenMon NVARCHAR(50)
)
GO
-- CONGTRINH(SoCT, TenCT, DiaChiCT, TinhThanh, KinhPhi, MaChuThau, NgayBD): Mỗi công trình có một số công trình (số thứ tự), tên công trình, một địa chỉ, thuộc về một tỉnh thành nào đó, được xây dựng với một kinh phí (đơn vị tính là triệu đồng), thuộc về sở hữu của một chủ nhân, do một chủ thầu xây dựng, và được khởi công xây từ một ngày nào đó.
GO
CREATE TABLE CONGTRINH
(
    SoCT INT PRIMARY KEY,
    TenCT NVARCHAR(50),
    DiaChiCT NVARCHAR(50),
    TinhThanh NVARCHAR(50),
    KinhPhi INT,
    MaChuThau VARCHAR(10),
    NgayBD DATE,
    FOREIGN KEY (MaChuThau) REFERENCES CHUTHAU(MaChuThau),
)
GO
-- THAMGIA(MaCN, SoCT, NgayTG, SoNgayTG): Một công nhân có thể tham gia xây dựng nhiều công trình, và một công trình cũng có nhiều công nhân tham gia. Khi một công nhân tham gia vào một công trình nào đó sẽ được ghi nhận lại ngày bắt đầu tham gia và số ngày tham gia.
GO
CREATE TABLE THAMGIA
(
    MaCN VARCHAR(10),
    SoCT INT,
    NgayTG DATE,
    SoNgayTG INT,
)
GO
-- THIETKE(MaKTS, SoCT, ThuLao): Một kiến trúc sư có thể thiết kế nhiều công trình, mỗi công trình cũng có thể do nhiều kiến trúc sư cùng thiết kế. Khi một kiến trúc sư thiết kế một công trình sẽ có một thù lao tương ứng (đơn vị tính là triệu).
GO
CREATE TABLE THIETKE
(
    MaKTS VARCHAR(10),
    SoCT INT,
    ThuLao INT,
    FOREIGN KEY (MaKTS) REFERENCES KTS(MaKTS)
)

GO
INSERT INTO KTS
VALUES
    ('KTS01', N'Nguyễn Đăng Khoa', '1989', N'Nam', N'ĐH Kiến Trúc', N'16 Lê Lợi, P6, Đà Lạt'),
    ('KTS02', N'Lê Hồng Thắm', '1992', N'Nữ', N'ĐH Mở TP HCM', N'87 Bùi Thị Xuân, P2, Đà Lạt'),
    ('KTS03', N'Trần Anh Tú', '1983', N'Nam', N'ĐH Yersin ĐL', N'122 Phù Đổng Thiên Vương, P8, Đà Lạt'),
    ('KTS04', N'Lê Văn Thanh', '1978', N'Nam', N'ĐH Kiến Trúc', N'07 Nguyễn Siêu, p7, Đà Lạt');
GO

SELECT *
FROM KTS;

GO
INSERT INTO CHUTHAU
VALUES
    ('CT01', N'Công ty xây dựng số 6', '098123123', N'3 Lê Đại Hành, P1'),
    ('CT02', N'Công ty BĐS Mai Minh', '012345678', N'97 Trần Anh Tông, p8'),
    ('CT03', N'Công ty Thái Lâm', '036417263', N'421 Nguyên Tử Lực, P8');
GO

SELECT *
FROM CHUTHAU;

GO
INSERT INTO CHUNHAN
VALUES
    ('CN01', N'Lê Tám', '097632123', N'01 Hoang Diệu, p3, Đà Lạt'),
    ('CN02', N'Trần Huy Lâm', '097457618', N'55 Võ Trường Toản, P8, Cần Thơ'),
    ('CN03', N'Lương Minh An', '038966063', N'01 Phù Đổng Thiên Vương, P8, Đà Lạt');
GO

SELECT *
FROM CHUNHAN;

GO
INSERT INTO CONGNHAN
VALUES
    ('CN01', N'Nguyễn Văn An', '1985', '2005', N'Thợ sắt'),
    ('CN02', N'Nguyễn Bình', '1978', '1998', N'Thợ xây'),
    ('CN03', N'Trần Cẩm', '1974', '1994', N'Giám sát'),
    ('CN04', N'Lê Thống', '1989', '2009', N'Thợ xây chính'),
    ('CN05', N'Dương Anh', '1977', '1997', N'Thợ xây chính'),
    ('CN06', N'Lê Anh Tuấn', '1983', '2008', N'Thợ hàn'),
    ('CN07', N'Trân Đông', '1989', '2007', N'Thợ điện'),
    ('CN08', N'Lê An', '1990', '2009', N'Thợ hàn và điện');
GO

SELECT *
FROM CONGNHAN;

GO
INSERT INTO CONGTRINH
VALUES
    ('1', N'Nhà tư nhân cấp 3', N'01 Hoang Diệu, p3, Đà Lạt', N'Đà Lạt', '5600', 'CT03', '1/1/2020'),
    ('2', N'Nhà tư nhân cấp 4', N'55 Võ Trường Toản, P8, Cần Thơ', N'Cần Thơ', '520', 'CT01', '25/7/2020'),
    ('3', N'Nhà trọ', N'01 Phù Đổng Thiên Vương, P8, Đà Lạt', N'Đà Lạt', '4000', 'CT02', '13/12/2020'),
    ('4', N'Nhà riêng', N'22 Lê Duẩn, Phú Nhuận, TP HCM', N'TP HCM', '2200', 'CT01', '17/3/2021'),
    ('5', N'Khách sạn quốc tế', N'45/2 Đồng Tâm, Cần Thơ', N'Cần Thơ', '11700', 'CT02', '4/4/2021'),
    ('6', N'Nhà riêng', N'27 Nam Kỳ Khởi Nghĩa, Đà Lạt', N'Đà Lạt', '4500', 'CT02', '16/4/2021');
GO

SELECT *
FROM CONGTRINH;

GO
INSERT INTO THAMGIA
VALUES
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
GO

SELECT *
FROM THAMGIA;

GO
INSERT INTO THIETKE
VALUES
    ('KTS01', '1', '85'),
    ('KTS02', '2', '25'),
    ('KTS03', '5', '120'),
    ('KTS01', '5', '95'),
    ('KTS02', '4', '35');
GO

SELECT *
FROM THIETKE;

-- DROP TABLE THIETKE;
-- DROP TABLE KTS;
-- DROP TABLE CHUNHAN;
-- DROP TABLE CONGNHAN;
-- DROP TABLE CONGTRINH;
