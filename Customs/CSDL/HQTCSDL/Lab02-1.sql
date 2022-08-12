-- QUẢN LÝ SINH VIÊN [Tạo bảng và thêm dữ liệu]

GO
IF DB_ID('QLSINHVIEN') IS NULL
BEGIN
    PRINT N'Đang tạo database'
    CREATE DATABASE QLSINHVIEN
END
GO
USE QLSINHVIEN
SET DATEFORMAT DMY

-- KHOA(MaKhoa, TenKhoa)
GO
CREATE TABLE KHOA
(
    MaKhoa VARCHAR(10) PRIMARY KEY,
    TenKhoa NVARCHAR(30)
)

-- NGANH(MaNganh, TenNganh, MaKhoa)
GO
CREATE TABLE NGANH
(
    MaNganh INT PRIMARY KEY,
    TenNganh NVARCHAR(30),
    MaKhoa VARCHAR(10),
    FOREIGN KEY (MaKhoa) REFERENCES KHOA(MaKhoa)
)

-- LOP(MaLop, TenLop, MaNganh, KhoaHoc, HeDT, NamNhapHoc)
GO
CREATE TABLE LOP
(
    MaLop VARCHAR(10) PRIMARY KEY,
    TenLop NVARCHAR(30),
    MaNganh INT,
    KhoaHoc INT,
    HeDT VARCHAR(10),
    NamNhapHoc INT,
    FOREIGN KEY (MaNganh) REFERENCES NGANH(MaNganh)
)

-- SINHVIEN(MaSV, HoTen, MaLop, GioiTinh, NgaySinh, DiaChi)
GO
CREATE TABLE SINHVIEN
(
    MaSV INT PRIMARY KEY,
    HoTen NVARCHAR(30),
    MaLop VARCHAR(10),
    GioiTinh NVARCHAR(5),
    NgaySinh DATE,
    DiaChi NVARCHAR(30),
    FOREIGN KEY (MaLop) REFERENCES LOP(MaLop)
)

-- HOCPHAN(MaHP, TenHP, SoDVHT, MaNganh, HocKy)
GO
CREATE TABLE HOCPHAN
(
    MaHP INT PRIMARY KEY,
    TenHP NVARCHAR(30),
    SoDVHT INT,
    MaNganh INT,
    HocKy INT,
    FOREIGN KEY (MaNganh) REFERENCES NGANH(MaNganh)
)

-- DIEMHP(MaSV, MaHP, DiemHP)
GO
CREATE TABLE DIEMHP
(
    MaSV INT,
    MaHP INT,
    DiemHP FLOAT,
    FOREIGN KEY (MaSV) REFERENCES SINHVIEN(MaSV),
    FOREIGN KEY (MaHP) REFERENCES HOCPHAN(MaHP),
)

GO
INSERT INTO KHOA
VALUES
    ('CNTT', N'Công Nghệ Thông Tin'),
    ('KT', N'Kế toán'),
    ('SP', N'Sư Phạm');

SELECT *
FROM KHOA

GO
INSERT INTO NGANH
VALUES
    ('140902', N'Sư phạm Toán Tin', 'SP'),
    ('480202', N'Tin học ứng dụng', 'CNTT');

SELECT *
FROM NGANH

GO
INSERT INTO LOP
VALUES
    ('CT11', N'Cao đẳng tin học', '480202', '11', 'TC', '2013'),
    ('CT12', N'Cao đẳng tin học', '480202', '12', 'CÐ', '2013'),
    ('CT13', N'Cao đẳng tin học', '480202', '13', 'CÐ', '2014');

SELECT *
FROM LOP

GO
INSERT INTO SINHVIEN
VALUES
    ('1', N'Phan Thanh', 'CT12', N'Nam', '12/9/1990', N'Tuy Phước'),
    ('2', N'Nguyễn Thị Cẩm Tú', 'CT12', N'Nữ', '12/1/1994', N'Quy Nhơn'),
    ('3', N'Võ Thị Hà', 'CT12', N'Nữ', '12/9/1990', N'An Nhơn'),
    ('4', N'Trần Hoài Nam', 'CT12', N'Nam', '5/4/1994', N'Tây Sơn'),
    ('5', N'Trần Văn Hoàng', 'CT13', N'Nam', '4/8/1995', N'Vĩnh Thạnh'),
    ('6', N'Đào Thị Thảo', 'CT13', N'Nữ', '12/6/1995', N'An Nhơn'),
    ('7', N'Lê Thị Sen', 'CT13', N'Nữ', '12/8/1994', N'Phú Cát'),
    ('8', N'Nguyễn Văn Huy', 'CT11', N'Nam', '4/6/1995', N'Phú Mỹ'),
    ('9', N'Trần Thị Hoa', 'CT11', N'Nữ', '9/8/1994', N'Hoài Nhơn');

SELECT *
FROM SINHVIEN

GO
INSERT INTO HOCPHAN
VALUES
    ('1', N'Toán cao cấp A1', '4', '480202', '1'),
    ('2', N'Tiếng Anh 1', '3', '480202', '1'),
    ('3', N'Vật lý đại cương', '4', '480202', '1'),
    ('4', N'Tiếng anh 2', '7', '480202', '1'),
    ('5', N'Tiếng anh 1', '3', '140902', '2'),
    ('6', N'Xác suất thống kê', '3', '140902', '2');

SELECT *
FROM HOCPHAN

GO
INSERT INTO DIEMHP
VALUES
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

SELECT *
FROM DIEMHP

-- DROP TABLE DIEMHP
-- DROP TABLE HOCPHAN
-- DROP TABLE SINHVIEN
-- DROP TABLE LOP
-- DROP TABLE NGANH
-- DROP TABLE KHOA

-- DROP DATABASE QLSINHVIEN;