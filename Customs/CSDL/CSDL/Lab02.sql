--lệnh tạo CSDL
CREATE DATABASE Lab02_QLSanXuat
GO

--lệnh sử dụng CSDL
use Lab02_QLSanXuat
--lệnh tạo các bảng
create table ToSanXuat
(
    MaTSX char(4) primary key,
    TenTSX nvarchar(10)
)
GO

create table CongNhan
(
    MaCN char(5) PRIMARY KEY,
    Ho nvarchar(20) NOT NULL,
    Ten nvarchar(10) NOT NULL,
    Phai nvarchar(5),
    NgaySinh date,
    MaTXS char(4) references dbo.ToSanXuat(MaTSX)
)
GO

create table SanPham
(
    MaSP char(5) PRIMARY KEY,
    TenSP nvarchar(50),
    DVT nvarchar(10),
    TienCong int
)
GO

create table ThanhPham
(
    MaCN char(5) references CongNhan(MaCN),
    MaSP char(5) references SanPham(MaSP),
    Ngay date,
    SoLuong INT,
    PRIMARY KEY(MaCN,MaSP,Ngay)
)
GO
--Thêm dữ liệu vào bảng ToSanXuat
INSERT INTO dbo.ToSanXuat
    (
    MaTSX,
    TenTSX
    )
VALUES
    ( 'TS01', -- MaTSX - char(4)
        N'Tổ 1' -- TenTSX - nvarchar(10)
    )
INSERT INTO ToSanXuat
    (MaTSX, TenTSX)
VALUES
    ( 'TS02', -- MaTSX - char(4)
        N'Tổ 2' -- TenTSX - nvarchar(10)
)
--Xem thông tin bảng ToSanXuat
SELECT *
FROM ToSanXuat

--Thêm dữ liệu vào bảng CongNhan
INSERT INTO dbo.CongNhan
    (
    MaCN, Ho, Ten, Phai, NgaySinh, MaTXS
    )
VALUES
    ( 'CN001', -- MaCN - char(5)
        N'Nguyễn Trường', -- Ho - nvarchar(20)
        N'An', -- Ten - nvarchar(10)
        N'Nam', -- Phai - nvarchar(5)
        '05/12/1981', -- NgaySinh - date
        'TS01'         -- MaTXS - char(4)
)
INSERT INTO dbo.CongNhan
    (
    MaCN, Ho, Ten, Phai, NgaySinh, MaTXS
    )
VALUES
    ( 'CN002', -- MaCN - char(5)
        N'Lê Thị Hồng', -- Ho - nvarchar(20)
        N'Gấm', -- Ten - nvarchar(10)
        N'Nữ', -- Phai - nvarchar(5)
        '06/04/1980', -- NgaySinh - date
        'TS01'         -- MaTXS - char(4)
)
INSERT INTO dbo.CongNhan
    (
    MaCN, Ho, Ten, Phai, NgaySinh, MaTXS
    )
VALUES
    ( 'CN003', -- MaCN - char(5)
        N'Nguyễn Công', -- Ho - nvarchar(20)
        N'Thành', -- Ten - nvarchar(10)
        N'Nam', -- Phai - nvarchar(5)
        '05/04/1981', -- NgaySinh - date
        'TS02'         -- MaTXS - char(4)
)
INSERT INTO dbo.CongNhan
    (
    MaCN, Ho, Ten, Phai, NgaySinh, MaTXS
    )
VALUES
    ( 'CN004', -- MaCN - char(5)
        N'Võ Hữu', -- Ho - nvarchar(20)
        N'Hạnh', -- Ten - nvarchar(10)
        N'Nam', -- Phai - nvarchar(5)
        '02/15/1980', -- NgaySinh - date
        'TS02'         -- MaTXS - char(4)
)
INSERT INTO dbo.CongNhan
    (
    MaCN, Ho, Ten, Phai, NgaySinh, MaTXS
    )
VALUES
    ( 'CN005', -- MaCN - char(5)
        N'Lý Thanh', -- Ho - nvarchar(20)
        N'Hân', -- Ten - nvarchar(10)
        N'Nữ', -- Phai - nvarchar(5)
        '12/03/1981', -- NgaySinh - date
        'TS01'         -- MaTXS - char(4)
)
SELECT *
FROM dbo.CongNhan

--Thêm dữ liệu vào bảng SanPham
INSERT INTO dbo.SanPham
    (
    MaSP, TenSP, DVT, TienCong
    )
VALUES
    ( 'SP001', -- MaSP - char(5)
        N'Nồi đất', -- TenSP - nvarchar(50)
        N'Cái', -- DVT - nvarchar(10)
        10000  -- TienCong - int
)
INSERT INTO dbo.SanPham
    (
    MaSP, TenSP, DVT, TienCong
    )
VALUES
    ( 'SP002', -- MaSP - char(5)
        N'Chén', -- TenSP - nvarchar(50)
        N'Cái', -- DVT - nvarchar(10)
        2000  -- TienCong - int
)
INSERT INTO dbo.SanPham
    (
    MaSP, TenSP, DVT, TienCong
    )
VALUES
    ( 'SP003', -- MaSP - char(5)
        N'Bình gốm nhỏ', -- TenSP - nvarchar(50)
        N'Cái', -- DVT - nvarchar(10)
        20000    -- TienCong - int
)
INSERT INTO dbo.SanPham
    (
    MaSP, TenSP, DVT, TienCong
    )
VALUES
    ( 'SP004', -- MaSP - char(5)
        N'Bình gốm lớn', -- TenSP - nvarchar(50)
        N'Cái', -- DVT - nvarchar(10)
        25000    -- TienCong - int
)
SELECT *
FROM dbo.SanPham

--Thêm dữ liệu vào bảng ThanhPham
INSERT INTO dbo.ThanhPham
    (
    MaCN, MaSP, Ngay, SoLuong
    )
VALUES
    ( 'CN001', -- MaCN - char(5)
        'SP001', -- MaSP - char(5)
        '02/01/2007', -- Ngay - date
        10          -- SoLuong - int
)
INSERT INTO dbo.ThanhPham
    (
    MaCN, MaSP, Ngay, SoLuong
    )
VALUES
    ( 'CN002', -- MaCN - char(5)
        'SP001', -- MaSP - char(5)
        '02/01/2007', -- Ngay - date
        5          -- SoLuong - int
)
INSERT INTO dbo.ThanhPham
    (
    MaCN, MaSP, Ngay, SoLuong
    )
VALUES
    ( 'CN003', -- MaCN - char(5)
        'SP002', -- MaSP - char(5)
        '01/10/2007', -- Ngay - date
        50          -- SoLuong - int
)
INSERT INTO dbo.ThanhPham
    (
    MaCN, MaSP, Ngay, SoLuong
    )
VALUES
    ( 'CN004', -- MaCN - char(5)
        'SP003', -- MaSP - char(5)
        '01/12/2007', -- Ngay - date
        10          -- SoLuong - int
)
INSERT INTO dbo.ThanhPham
    (
    MaCN, MaSP, Ngay, SoLuong
    )
VALUES
    ( 'CN005', -- MaCN - char(5)
        'SP002', -- MaSP - char(5)
        '01/12/2007', -- Ngay - date
        100          -- SoLuong - int
)
INSERT INTO dbo.ThanhPham
    (
    MaCN, MaSP, Ngay, SoLuong
    )
VALUES
    ( 'CN002', -- MaCN - char(5)
        'SP004', -- MaSP - char(5)
        '02/13/2007', -- Ngay - date
        10          -- SoLuong - int
)
INSERT INTO dbo.ThanhPham
    (
    MaCN, MaSP, Ngay, SoLuong
    )
VALUES
    ( 'CN001', -- MaCN - char(5)
        'SP003', -- MaSP - char(5)
        '02/14/2007', -- Ngay - date
        15          -- SoLuong - int
)
INSERT INTO dbo.ThanhPham
    (
    MaCN, MaSP, Ngay, SoLuong
    )
VALUES
    ( 'CN003', -- MaCN - char(5)
        'SP001', -- MaSP - char(5)
        '01/15/2007', -- Ngay - date
        20          -- SoLuong - int
)
INSERT INTO dbo.ThanhPham
    (
    MaCN, MaSP, Ngay, SoLuong
    )
VALUES
    ( 'CN003', -- MaCN - char(5)
        'SP004', -- MaSP - char(5)
        '02/14/2007', -- Ngay - date
        15          -- SoLuong - int
)
INSERT INTO dbo.ThanhPham
    (
    MaCN, MaSP, Ngay, SoLuong
    )
VALUES
    ( 'CN004', -- MaCN - char(5)
        'SP002', -- MaSP - char(5)
        '01/30/2007', -- Ngay - date
        100          -- SoLuong - int
)
INSERT INTO dbo.ThanhPham
    (
    MaCN, MaSP, Ngay, SoLuong
    )
VALUES
    ( 'CN005', -- MaCN - char(5)
        'SP003', -- MaSP - char(5)
        '02/01/2007', -- Ngay - date
        50          -- SoLuong - int
)
INSERT INTO dbo.ThanhPham
    (
    MaCN, MaSP, Ngay, SoLuong
    )
VALUES
    ( 'CN001', -- MaCN - char(5)
        'SP001', -- MaSP - char(5)
        '01/20/2007', -- Ngay - date
        30          -- SoLuong - int
)
SELECT *
FROM dbo.ThanhPham


/*Truy vấn dữ liệu*/

--1. Liệt kê các công nhân theo tổ sản xuất: TenTSX, HoTen, NgaySinh, Phai
SELECT b.TenTSX, Ho +' '+ Ten AS HoTen, a.NgaySinh, a.Phai
FROM dbo.CongNhan a, dbo.ToSanXuat b
WHERE a.MaTXS = b.MaTSX
ORDER BY b.TenTSX, a.Ten

--2. Liệt kê các thành phẩm mà công nhân 'Nguyễn Trường An' đã làm được gồm các thông tin: TenSP, Ngay, SoLuong, ThanhTien (sắp xếp theo thứ tự tăng dần của ngày)

SELECT b.TenSP, c.Ngay, c.SoLuong, (c.SoLuong*b.TienCong) AS ThanhTien
FROM dbo.CongNhan a, dbo.SanPham b, dbo.ThanhPham c
WHERE a.MaCN = c.MaCN AND b.MaSP = c.MaSP AND a.Ho = N'Nguyễn Trường' AND a.Ten = N'An'
ORDER BY c.Ngay

--3. Liệt kê các nhân viên không sản xuất sản phẩm Bình gốm lớn.
SELECT *
FROM CongNhan
WHERE MaCN NOT IN (
    SELECT MaCN
FROM ThanhPham
WHERE MaSP = 'SP004'
)
--4. Liệt kê thông tin các công nhân có sản xuất cả 'Nồi đất' và 'Bình gốm nhỏ'
SELECT *
FROM CongNhan
WHERE MaCN IN(                                                        SELECT DISTINCT MaCN
    FROM ThanhPham
    WHERE MaSP = 'SP001'
INTERSECT
    SELECT DISTINCT MaCN
    FROM ThanhPham
    WHERE MaSP = 'SP003')
--5. Thống kê số lượng công nhân theo từng tổ sản xuất

SELECT b.TenTSX, COUNT(a.MaTXS) AS SoNV
FROM dbo.CongNhan a, dbo.ToSanXuat b
WHERE a.MaTXS = b.MaTSX
GROUP BY b.TenTSX

--6. Tổng số lượng thành phẩm theo từng loại mà mỗi nhân viên làm được (Ho, Ten, TenSP, TongSLThanhPham,TongThanhTien

SELECT Ho +' '+Ten AS HoTen, b.TenSP, SUM(c.SoLuong) AS TongSLThanhPham, SUM((c.SoLuong*b.TienCong)) AS TongThanhTien
FROM dbo.CongNhan a, dbo.SanPham b, dbo.ThanhPham c
WHERE a.MaCN = c.MaCN AND b.MaSP = c.MaSP
GROUP BY Ho, Ten, TenSP

--7. Tổng số tiền công đã trả cho công nahan trong tháng 1 2007

SELECT SUM(b.SoLuong*a.TienCong) AS TongTienCong
FROM dbo.SanPham a, dbo.ThanhPham b
WHERE a.MaSP = b.MaSP AND MONTH(b.Ngay) = 1

--8. Cho biết sản phẩm được sản xuất nhiều nhất trong tháng 2 2007
SELECT a.MaSP, a.TenSP, SUM(SoLuong) AS TongSoLuong
FROM SanPham a, ThanhPham b
WHERE a.MaSP = b.MaSP AND MONTH(Ngay) = 2
GROUP BY a.MaSP, a.TenSP
HAVING SUM(SoLuong) >= ALL(Select SUM(SoLuong)
From ThanhPham
WHERE MONTH(Ngay) = 2
GROUP BY MaSP
)
--9. Cho biết công nhân sản xuất được nhiều chén nhất
SELECT b.MaCN, a.MaSP, a.TenSP, a.DVT, SUM(SoLuong) AS TongSoLuong
FROM SanPham a, ThanhPham b
WHERE a.MaSP = b.MaSP AND TenSP = N'Chén'
GROUP BY a.MaSP, a.TenSP, a.DVT, b.MaCN
HAVING SUM(SoLuong) >= ALL(Select MAX(SoLuong)
From ThanhPham)
--10. Tiền công tháng 2/2006 của công nhân có mã số 'CN002'

SELECT c.MaCN, Ho +' '+Ten AS HoTen, SUM(b.SoLuong*a.TienCong) AS TongTienCong
FROM dbo.SanPham a, dbo.ThanhPham b, dbo.CongNhan c
WHERE b.MaCN = c.MaCN and b.MaCN = 'CN002' AND a.MaSP = b.MaSP AND MONTH(b.Ngay) = 2
GROUP BY c.MaCN, c.Ho, c.Ten

SELECT *
FROM ThanhPham

--11. Liệt kê các công nhân có sản xuất từ 3 loại sản phẩm trở lên

SELECT a.MaCN, Ho+' '+Ten AS HoTen, COUNT(b.MaSP) AS SoSanPham
FROM dbo.CongNhan a, dbo.ThanhPham b
WHERE a.MaCN = b.MaCN
GROUP BY a.MaCN, a.Ho, a.Ten
HAVING COUNT(b.MaSP) >= 3

--12. Cập nhật giá tiền công của các loại bình gốm thêm 1000

UPDATE dbo.SanPham
SET TienCong = TienCong + 1000
WHERE TenSP LIKE N'%bình gốm%'

SELECT *
FROM dbo.SanPham

--13. Thêm bộ <'CN006', 'Lê Thị', 'Lan','Nữ','TS02'> vào bảng CongNhan

INSERT INTO dbo.CongNhan
    (
    MaCN, Ho, Ten, Phai, MaTXS
    )
VALUES
    ( 'CN006', -- MaCN - char(5)
        N'Lê Thị', -- Ho - nvarchar(20)
        N'Lan', -- Ten - nvarchar(10)
        N'Nữ', -- Phai - nvarchar(5)
        'TS02'         -- MaTXS - char(4)
)