CREATE DATABASE BT3_NguyenVanHoang

USE BT3_NguyenVanHoang

CREATE TABLE GiaoVien
(
    MaGV CHAR(10) PRIMARY KEY,
    HoGV NVARCHAR(30),
    TenGV NVARCHAR(20),
    DChi NVARCHAR(50),
    HocVi NVARCHAR(20),
)

CREATE TABLE SinhVien
(
    MaSV CHAR(10) PRIMARY KEY,
    HoSV NVARCHAR(30),
    TenSV NVARCHAR(30),
    NgSinh DATE,
    DChi NVARCHAR(50),
    Lop CHAR(10),
)

CREATE TABLE MonHoc
(
    MaMH CHAR(10) PRIMARY KEY,
    TenMH NVARCHAR(30),
    DVHT NVARCHAR(30),
)

CREATE TABLE Hoc
(
    MaSV CHAR(10) REFERENCES SinhVien(MaSV),
    MaMH CHAR(10) REFERENCES MonHoc(MaMH),
    MaGV CHAR(10) REFERENCES GiaoVien(MaGV),
    HK INT,
    NK CHAR(9),
    LanThi INT,
    KQ FLOAT
)

INSERT INTO Giaovien
VALUES
    ( 'GV001', N'Vũ Đức', N'Phúc', N'Cần Thơ', N'Cử nhân'  )
INSERT INTO Giaovien
VALUES
    ( 'GV002', N'Trần Thái', N'An', N'Bạc Liêu', N'Tiến Sĩ'  )
INSERT INTO Giaovien
VALUES
    ( 'GV003', N'Lý Quốc', N'Bình', N'Đồng Tháp', N'Thạc sĩ'  )
INSERT INTO Giaovien
VALUES
    ( 'GV004', N'Vũ Thị Ngọc', N'Trân', N'Đồng Tháp', N'Cử nhân'  )
INSERT INTO Giaovien
VALUES
    ( 'GV005', N' Lê Phú', N'Quí', N'Tiền Giang', N'Thạc sĩ'  )
INSERT INTO Giaovien
VALUES
    ( 'GV006', N'Nguyễn Quốc', N'Cường', N'Cần Thơ', N'Tiến Sĩ'  )
INSERT INTO Giaovien
VALUES
    ( 'GV007', N'Hà Phương', N'Đông', N'Vĩnh Long', N'Thạc sĩ'  )

INSERT INTO Sinhvien
VALUES
    ('SV001', N'Hồ Văn', N'Quang', '5/15/1984', N'Đồng Tháp', 'TH3A')
INSERT INTO Sinhvien
VALUES
    ('SV002', N'Nguyễn Văn', N'Thành', '2/18/1983', N'Vĩnh Long', '28K10')
INSERT INTO Sinhvien
VALUES
    ('SV003', N'Lê Phong', N'Ba', '8/25/1982', N'Tiền Giang', '27K10')
INSERT INTO Sinhvien
VALUES
    ('SV004', N'Hà Thị', N'Tí', '3/29/1984', N'Cà Mau', 'TH3A')
INSERT INTO Sinhvien
VALUES
    ('SV005', N'Trần Ngọc', N'Phụng', '10/8/1983', N'Cần Thơ', '28K10')
INSERT INTO Sinhvien
VALUES
    ('SV006', N'Lê Phong Bích', N'Nguyệt', '7/12/1983', N'Đồng Tháp', 'TH3A')
INSERT INTO Sinhvien
VALUES
    ('SV007', N'Lý Thị Ngọc', N'Điệp', '6/19/1984', N'Trà Vinh', 'TIN06')
INSERT INTO Sinhvien
VALUES
    ('SV008', N'Nguyễn Đức', N'Tài', '1/17/1984', N'Vĩnh Long', 'TIN06')
INSERT INTO Sinhvien
VALUES
    ('SV009', N'Thái Bình', N'An', '9/25/1983', N'Đồng Tháp', '28K10')
INSERT INTO Sinhvien
VALUES
    ('SV010', N'Lê Đức Anh', N'Khoa', '4/18/1985', N'Cà Mau', 'TH4A')
INSERT INTO Sinhvien
VALUES
    ('SV011', N'Trần Thi', N'Cử', '2/17/1986', N'Đồng Tháp', 'TH5A')
INSERT INTO Sinhvien
VALUES
    ('SV012', N'Hồ Thị Út', N'Em', '5/19/1985', N'Tiền Giang', 'TH5A')
INSERT INTO Sinhvien
VALUES
    ('SV013', N'Thái Thị bách', N'Hoa', '4/12/1984', N' Bạc Liêu', 'TIN06')

INSERT INTO Monhoc
VALUES
    ( 'TH301', N'Kỹ thuật lập trình C', 4)
INSERT INTO Monhoc
VALUES
    ( 'TH302', N'Cấu trúc dữ liệu & Giải thuật', 5)
INSERT INTO Monhoc
VALUES
    ( 'TH303', N'Toán rời rạc', 4)
INSERT INTO Monhoc
VALUES
    ( 'TH304', N'Cơ sở dữ liệu', 5)
INSERT INTO Monhoc
VALUES
    ( 'TH305', N'Lập trình hướng đối tượng', 4)
INSERT INTO Monhoc
VALUES
    ( 'TH306', N'Mạng máy tính', 3)
INSERT INTO Monhoc
VALUES
    ( 'TH307', N'Phân tích và Thiết kế hệ thống', 4)
INSERT INTO Monhoc
VALUES
    ( 'TH308', N'Lập trình Internet', 4)
INSERT INTO Monhoc
VALUES
    ( 'TH309', N'Kiến trúc máy tính', 2)
INSERT INTO Monhoc
VALUES
    ( 'TH310', N'Cơ sở dữ liệu nâng cao', 4)

INSERT INTO Hoc
VALUES
    ('SV001', 'TH301', 'GV001', 1, '2005-2006', 1, 6)
INSERT INTO Hoc
VALUES
    ('SV001', 'TH302', 'GV001', 1, '2005-2006', 1, 4)
INSERT INTO Hoc
VALUES
    ('SV001', 'TH302', 'GV001', 1, '2005-2006', 2, 7)
INSERT INTO Hoc
VALUES
    ('SV001', 'TH303', 'GV002', 2, '2006-2007', 1, 8)
INSERT INTO Hoc
VALUES
    ('SV001', 'TH304', 'GV002', 2, '2006-2007', 1, 9.5)
INSERT INTO Hoc
VALUES
    ('SV002', 'TH304', 'GV002', 2, '2006-2007', 1, 10)
INSERT INTO Hoc
VALUES
    ('SV002', 'TH305', 'GV003', 2, '2006-2007', 1, 6.5)
INSERT INTO Hoc
VALUES
    ('SV002', 'TH309', 'GV007', 2, '2006-2007', 1, 8.5)
INSERT INTO Hoc
VALUES
    ('SV003', 'TH304', 'GV002', 2, '2006-2007', 1, 5)
INSERT INTO Hoc
VALUES
    ('SV003', 'TH305', 'GV003', 1, '2005-2006', 1, 6)
INSERT INTO Hoc
VALUES
    ('SV004', 'TH304', 'GV002', 2, '2005-2006', 1, 7)
INSERT INTO Hoc
VALUES
    ('SV004', 'TH305', 'GV003', 1, '2005-2006', 1, 8.5)
INSERT INTO Hoc
VALUES
    ('SV005', 'TH305', 'GV003', 1, '2005-2006', 1, 7.5)
INSERT INTO Hoc
VALUES
    ('SV005', 'TH308', 'GV005', 2, '2006-2007', 1, 6.5)
INSERT INTO Hoc
VALUES
    ('SV006', 'TH307', 'GV004', 2, '2006-2007', 1, 8)
INSERT INTO Hoc
VALUES
    ('SV006', 'TH308', 'GV005', 1, '2006-2007', 1, 9)
INSERT INTO Hoc
VALUES
    ('SV007', 'TH307', 'GV001', 2, '2006-2007', 1, 10)
INSERT INTO Hoc
VALUES
    ('SV007', 'TH308', 'GV006', 1, '2006-2007', 1, 9.5)
INSERT INTO Hoc
VALUES
    ('SV008', 'TH307', 'GV004', 2, '2006-2007', 1, 10)
INSERT INTO Hoc
VALUES
    ('SV008', 'TH309', 'GV007', 2, '2005-2006', 1, 7)
INSERT INTO Hoc
VALUES
    ('SV008', 'TH309', 'GV007', 2, '2005-2006', 2, 8)
INSERT INTO Hoc
VALUES
    ('SV009', 'TH307', 'GV002', 2, '2005-2006', 1, 7)
INSERT INTO Hoc
VALUES
    ('SV009', 'TH309', 'GV001', 2, '2005-2006', 1, 3.5)
INSERT INTO Hoc
VALUES
    ('SV013', 'TH302', 'GV002', 2, '2005-2006', 1, 4.5)
INSERT INTO Hoc
VALUES
    ('SV007', 'TH302', 'GV004', 2, '2006-2007', 1, 3)
INSERT INTO Hoc
VALUES
    ('SV009', 'TH309', 'GV001', 2, '2005-2006', 2, 5)
INSERT INTO Hoc
VALUES
    ('SV013', 'TH302', 'GV002', 2, '2005-2006', 2, 5)

-- In ra mã số, họ tên của các sinh viên có địa chỉ ở Đồng Tháp
SELECT MaSV, HoSV+' '+TenSV as HoTenSV
FROM SinhVien
WHERE Dchi = N'Đồng Tháp'

-- In ra thông tin gồm mã số và tên các môn học có số đơn vị học trình từ 3 trở lên
SELECT MaMH, TenMH
FROM MonHoc
WHERE DVHT >= 3

-- In ra thông tin các sinh viên học các môn do các giáo viên ở Cần Thơ giảng dạy
SELECT b.MaSV, HoSV+' '+TenSV as HoTenSV
FROM Hoc a, SinhVien b
WHERE a.MaSV = b.maSV AND a.MaGV IN (
    SELECT MaGV
    FROM GiaoVien
    WHERE Dchi = N'Cần Thơ'
)
GROUP BY b.MaSV, HoSV+' '+TenSV

-- In ra danh sách các sinh viên thi lần 2 ở năm học 2006-2007
SELECT b.MaSV, HoSV+' '+TenSV as HoTenSV
FROM Hoc a, SinhVien b
WHERE a.MaSV = b.maSV AND a.NK = '2006-2007' AND a.LanThi = 2
-- Cộng thêm 1 điểm cho các sinh viên thi lần 1 ở học kỳ 1, năm học 2006-2007
UPDATE Hoc
SET KQ = KQ + 1
WHERE MaSV IN (
    SELECT MaSV
FROM Hoc
WHERE LanThi = 1 AND HK = 1 AND NK = '2006-2007'
)

-- Tăng số đơn vị học trình của môn TH308 lên 1
UPDATE MonHoc
SET DVHT = DVHT + 1
WHERE MaMH = 'TH308'

-- Thêm môn học mới “TH311”, “Trí tuệ nhân tạo”, 3 đvht vào bảng môn học 
INSERT INTO MonHoc
VALUES
    ('TH311', N'Trí tuệ nhân tạo', 3)

-- In ra thông tin các môn học không được giảng dạy vào học ky 2 năm học 2006-2007 
SELECT MaMH, TenMH
FROM MonHoc
WHERE MaMH NOT IN (
    SELECT MaMH
FROM Hoc
WHERE HK = 2 AND NK = '2006-2007'
)

-- In ra các môn học vừa được học bởi các sinh viên lớp TH3A và lớp TH4A 
SELECT c.MaMH, TenMH
FROM Hoc a, SinhVien b, MonHoc c
WHERE a.MaSV = b.MaSV AND c.MaMH = a.MaMH AND a.MaSV IN (
    SELECT MaSV
    FROM SinhVien
    WHERE Lop = 'TH3A' OR Lop = 'TH4A'
)
GROUP BY c.MaMH, TenMH

-- In ra thông tin các môn học theo từng học kỳ niên khoá (những môn trùng nhau chỉ giữ lại 1). 
SELECT HK, NK, TenMH
FROM Hoc a, SinhVien b, MonHoc
WHERE a.MaSV = b.MaSV AND a.MaMH = MonHoc.MaMH
GROUP BY HK, NK, a.MaMH, TenMH

-- In ra các sinh viên không phải thi lần 2 ở năm học 2006-2007. 
SELECT b.MaSV, HoSV+' '+TenSV as HoTenSV
FROM Hoc a, SinhVien b
WHERE a.MaSV = b.MaSV AND a.LanThi != 2 AND a.NK = '2006-2007'
GROUP BY b.MaSV, HoSV+' '+TenSV

-- In ra thông tin các môn học có tổng số lần học của các sinh viên là nhiều nhất và in ra tổng số lần học tương ứng. 
SELECT a.MaMH, TenMH, SUM(a.LanThi) as TongSoLanHoc
FROM Hoc a, SinhVien b, MonHoc
WHERE a.MaSV = b.MaSV AND a.MaMH = MonHoc.MaMH
GROUP BY a.MaMH, TenMH
ORDER BY TongSoLanHoc DESC

-- In ra các sinh viên có điểm thi lớn nhất theo từng lớp, theo từng môn. 
SELECT b.MaSV, HoSV+' '+TenSV as HoTenSV, b.Lop , c.MaMH, TenMH, MAX(KQ) as DiemThi
FROM Hoc a, SinhVien b, MonHoc c
WHERE a.MaSV = b.MaSV AND a.MaMH = c.MaMH
GROUP BY b.MaSV, HoSV+' '+TenSV, c.MaMH, TenMH, b.Lop
ORDER BY DiemThi DESC

-- In ra trung số lượng môn học của mỗi sinh viên theo từng học kỳ, niên khoá 
SELECT a.MaSV, HoSV+' '+TenSV as HoTenSV, a.HK, a.NK, Count(MaMH) as SoLuongMonHoc
FROM Hoc a, SinhVien b
WHERE a.MaSV = b.MaSV
GROUP BY a.MaSV, HoSV+' '+TenSV,  a.HK, a.NK

-- Cho biết sinh viên nào học nhiều môn nhất ở năm học 2006-2007, in ra số lượng học môn cụ thể
SELECT b.MaSV, HoSV+' '+TenSV as HoTenSV, Count(a.MaMH) as SoLuongMonHoc
FROM Hoc a, SinhVien b
WHERE b.MaSV = a.MaSV AND a.NK = '2006-2007'
GROUP BY b.MaSV, HoSV+' '+TenSV
HAVING Count(a.MaMH) >= ALL
(
    SELECT Count(a2.MaMH)
FROM Hoc a2, SinhVien b2
WHERE b2.MaSV = a2.MaSV AND a2.NK = '2006-2007'
GROUP BY b2.MaSV
)

-- In thông tin của các sinh viên chưa từng học các môn mà giáo viên Vũ Đức Phúc đã giảng dạy. 
SELECT MaSV, HoSV+' '+TenSV as HoTenSV
FROM SinhVien
WHERE MaSV NOT IN (
    SELECT b.MaSV
FROM Hoc a, SinhVien b, MonHoc
WHERE a.MaSV = b.MaSV AND a.MaMH = MonHoc.MaMH AND MonHoc.MaMH NOT IN (
    SELECT MaMH
    FROM Hoc
    WHERE MaGV = 'GV001' -- Là giáo viên Vũ Đức Phúc
)
)
GROUP BY MaSV, HoSV+' '+TenSV

-- In ra thông tin của giáo viên dạy nhiều sinh viên nhất 
SELECT a.MaGV, HoGV +' '+TenGV as HoTenGV, Count(b.MaSV) as SoLuongSinhVien
FROM GiaoVien a, Hoc b
WHERE a.MaGV = b.MaGV
GROUP BY a.MaGV, HoGV +' '+TenGV
HAVING Count(b.MaSV) >= ALL
(
    SELECT Count(b2.MaSV)
FROM GiaoVien a2, Hoc b2
WHERE a2.MaGV = b2.MaGV
GROUP BY a2.MaGV
)

-- In ra thông tin của môn học có nhiều sinh viên không phải thi lại nhiều nhất.
SELECT a.MaMH, TenMH
FROM Hoc a, SinhVien b, MonHoc
WHERE a.MaSV = b.MaSV AND a. MaMH = MonHoc.MaMH
GROUP BY a.MaMH, TenMH
HAVING Count(LanThi) <= ALL (
    SELECT COUNT(LanThi)
FROM Hoc a2, SinhVien b2
WHERE a2.MaSV = b2.maSV
GROUP BY a2.MaMH
)

-- In ra điểm trung bình theo từng học kỳ niên khoá của mỗi sinh viên và cho biết sinh viên có điểm trung bình lớn nhất theo từng học kỳ niên khoá. 
SELECT a.MaSV, TenSV+' '+HoSV, a.HK, a.NK, AVG(KQ) as 'Điểm trung bình'
FROM Hoc a, SinhVien b
WHERE a.MaSV = b.MaSV
GROUP BY a.MaSV, TenSV, HoSV, a.HK, a.NK
ORDER BY AVG(KQ) DESC

SELECT a.MaSV, TenSV+' '+HoSV as TenSV , a.HK, a.NK, AVG(KQ) as 'Điểm trung bình'
FROM Hoc a, SinhVien b
WHERE a.MaSV = b.MaSV
GROUP BY a.MaSV, TenSV, HoSV, a.HK, a.NK
HAVING AVG(KQ) >= ALL
(
    SELECT AVG(KQ)
FROM Hoc a2, SinhVien b2
WHERE a2.MaSV = b2.MaSV
GROUP BY a2.MaSV, a2.NK, a2.HK
)

SELECT *
FROM Hoc
SELECT *
FROM GiaoVien
SELECT *
FROM SinhVien
SELECT *
FROM Monhoc

DROP TABLE Hoc, Monhoc, Sinhvien, Giaovien