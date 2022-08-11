-- Câu 1. Tạo cơ sở dữ liệu như trên, xác định kiểu dữ liệu tương ứng với dữ liệu trong thể hiện của các bảng. Xác định khóa chính và khóa ngoại và tạo các ràng buộc về khóa. (3đ). 
CREATE DATABASE NguyenVanHoang_12101005

USE NguyenVanHoang_12101005

SET DATEFORMAT dmy;

CREATE TABLE SANPHAM
(
    MaSP char(6) Primary Key,
    TenSP nvarchar(50),
    DonVi nvarchar(20),
    SLTon int,
    DGNhap int,
    DGBan int
)

CREATE TABLE NHACUNGCAP
(
    MaNCC char(6) Primary Key,
    TenNCC nvarchar(50),
    DiaChi nvarchar(50),
    SDT char(11)
)

CREATE TABLE HOADON
(
    SoHD char(20) Primary Key,
    NgayLap date ,
    MaNCC char(6),
    TongTriGia int,
    FOREIGN KEY (MaNCC) REFERENCES NHACUNGCAP(MaNCC)
)

CREATE TABLE CTHOADON
(
    SoHD char(20),
    MaSp char(6),
    DonGia int,
    SoLuong int,
    FOREIGN KEY (SoHD) REFERENCES HOADON(SoHD),
    FOREIGN KEY (MaSp) REFERENCES SANPHAM(MaSp)
)

-- Câu 2. Thêm dữ liệu vào các bảng, sử dụng câu lệnh Insert into(2đ).

INSERT INTO SANPHAM
VALUES
    ('SP001', N'Xà phòng loại 1', N'hộp', 200, 10000, 15000)
INSERT INTO SANPHAM
VALUES
    ('SP002', N'Dầu gội', N'chai', 500, 30000, 70000)
INSERT INTO SANPHAM
VALUES
    ('SP003', N'Sữa tắm', N'chai', 350, 50000, 100000)
INSERT INTO SANPHAM
VALUES
    ('SP004', N'Kem đánh răng', N'hộp', 500, 35000, 53000)
INSERT INTO SANPHAM
VALUES
    ('SP005', N'Sữa tươi', N'gói', 200, 4000, 7000)
INSERT INTO SANPHAM
VALUES
    ('SP006', N'Mì ăn liền', N'thùng', 150, 50000, 80000)


INSERT INTO NHACUNGCAP
VALUES
    ('NCC01', N'Công ty cổ phần SGB', N'Số 51A Trần Quang Khải, Phường 8', '098123456')
INSERT INTO NHACUNGCAP
VALUES
    ('NCC02', N'Công ty TNHH Ngân Uy Vũ', N'52 Hồ Xuân Hương, Phường 9', '098123321')
INSERT INTO NHACUNGCAP
VALUES
    ('NCC03', N'Công ty cổ phần Cider', N'348 Phan Đình Phùng, Phường 2', '098123234')
INSERT INTO NHACUNGCAP
VALUES
    ('NCC04', N'Công ty TNHH Việt Đức', N'106/04 Lê Lai, Phường 3', '098154243')


INSERT INTO HOADON
VALUES
    ( 'HD1104', '11/4/2020', 'NCC01', 1400000)
INSERT INTO HOADON
VALUES
    ( 'HD1105', '11/5/2020', 'NCC02', 250000)
INSERT INTO HOADON
VALUES
    ( 'HD1106', '15/7/2020', 'NCC04', 400000)
INSERT INTO HOADON
VALUES
    ( 'HD1107', '20/07/2020', 'NCC02', 1000000)
INSERT INTO HOADON
VALUES
    ( 'HD1108', '20/07/2020', 'NCC01', 450000)


INSERT INTO CTHOADON
VALUES
    ('HD1104', 'SP001', 10000, 50)
INSERT INTO CTHOADON
VALUES
    ('HD1104', 'SP002', 30000, 30)
INSERT INTO CTHOADON
VALUES
    ('HD1105', 'SP001', 10000, 25)
INSERT INTO CTHOADON
VALUES
    ('HD1105', 'SP005', 4000, 100)
INSERT INTO CTHOADON
VALUES
    ('HD1106', 'SP003', 50000, 20)
INSERT INTO CTHOADON
VALUES
    ('HD1107', 'SP002', 30000, 15)
INSERT INTO CTHOADON
VALUES
    ('HD1108', 'SP001', 30000, 45)

-- Câu 3: Truy vấn (5đ) 
-- 1. Hãy cho biết thông tin của MaSP,TenSP, DonVi, SLTon, DGNhap, DGBan của những sản phẩm có SLTon nằm trong khoảng 200 đến 350 (1đ) 
SELECT *
FROM SANPHAM
WHERE SLTon BETWEEN 200 AND 350

-- 2. Hãy cho biết có bao nhiêu sản phẩm có đơn vị là “Chai” (1đ) 
SELECT COUNT(MaSP) as N'Số lượng sản phẩm có đơn vị là "Chai"'
FROM SANPHAM
WHERE DonVi = N'Chai'

-- 3. Hãy cho biết có bao nhiêu sản phẩm được bán trong tháng 7, đó là những sản phẩm nào (MaSP, TenSP, NgayBan) trong đó NgayBan chính là ngày lập hóa đơn. (1đ)
SELECT SUM(SoLuong) as N'Số sản phẩm được bán trong tháng 7'
FROM CTHOADON A, HOADON B
WHERE A.SoHD = B.SoHD AND MONTH(NgayLap) = 7

SELECT C.MaSp, TenSp, NgayLap, SUM(SoLuong) as N'Số sản phẩm được bán trong tháng 7'
FROM CTHOADON A, HOADON B, SANPHAM C
WHERE A.SoHD = B.SoHD AND A.MaSp = C.MaSp AND MONTH(NgayLap) = 7
GROUP BY C.MaSp, TenSp, NgayLap

-- 4. Hãy cho biết tổng doanh thu của năm 2020 (1đ)
SELECT SUM(TongTriGia) as N'Tổng doanh thu của năm 2020'
FROM HOADON
WHERE YEAR(NgayLap) = 2020

-- 5. Hãy cho biết có bao nhiêu nhà cung cấp cung cấp sản phẩm có mã là ‘SP001’ (1đ) 
SELECT COUNT(MaNCC) as N'Số nhà cung cấp cung cấp sản phẩm có mã là "SP001"'
FROM (
    SELECT MaNCC
    FROM CTHOADON A, HOADON B
    WHERE A.SoHD = B.SoHD AND MASP = 'SP001'
    GROUP BY MaNCC
    ) as A

SELECT *
FROM SANPHAM
SELECT *
FROM NHACUNGCAP
SELECT *
FROM HOADON
SELECT *
FROM CTHOADON


DROP TABLE CTHOADON
DROP TABLE HOADON
DROP TABLE NHACUNGCAP
DROP TABLE SANPHAM