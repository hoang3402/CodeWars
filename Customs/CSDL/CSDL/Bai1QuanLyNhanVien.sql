GO
CREATE DATABASE Lab1_NguyenVanHoang
GO
USE Lab1_NguyenVanHoang

GO
CREATE TABLE PHONGBAN
(
    MaPhong CHAR(3) PRIMARY KEY,
    TenPhong NVARCHAR(50)
);

GO
SELECT *
FROM PHONGBAN

GO
CREATE TABLE NHANVIEN
(
    MaNV CHAR(10) PRIMARY KEY,
    HoNV NVARCHAR(50),
    TenNV NVARCHAR(50),
    MaPhong CHAR(3),
    GioiTinh NVARCHAR(4),
    Luong INT,
    FOREIGN KEY (MaPhong) REFERENCES PHONGBAN (MaPhong)
);

GO
SELECT *
FROM NHANVIEN

GO
INSERT INTO PHONGBAN
VALUES
    ('KT', N'Kế toán')
INSERT INTO PHONGBAN
VALUES
    ('NS', N'Nhân sự')
INSERT INTO PHONGBAN
VALUES
    ('HC', N'Hành chính')

GO
INSERT INTO NHANVIEN
VALUES
    ('NV001', N'Nguyễn Ngọc', N' Anh', 'KT', N'Nữ', 5000000 )
INSERT INTO NHANVIEN
VALUES
    ('NV002', N'Trần Lan', ' Anh', N'NS', N'Nữ', 7500000 )
INSERT INTO NHANVIEN
VALUES
    ('NV003', N'Nguyễn Văn', N' Hùng', 'NS', N'Nam', 8000000 )
INSERT INTO NHANVIEN
VALUES
    ('NV004', N'Lê Thanh', N' Hải', 'HC', N'Nam', 4500000 )
INSERT INTO NHANVIEN
VALUES
    ('NV005', N'Hoàng Ngọc', N' Thịnh', 'KT', N'Nam', 5500000 )
INSERT INTO NHANVIEN
VALUES
    ('NV006', N'Lê Thị', N' Thuỷ', 'HC', N'Nữ', 6500000 ) 

-- Bài 1: Cho biết họ tên và lương nhân viên. 
GO
SELECT HoNV, TenNV, Luong
FROM NHANVIEN

-- Bài 2: Cho biết họ tên các nhân viên nữ. 
GO
SELECT HoNV, TenNV
FROM NHANVIEN
WHERE GioiTinh = N'Nữ'

-- Bài 3: Cho biết họ tên, lương của các nhân viên nam 
GO
SELECT HoNV, TenNV, Luong
FROM NHANVIEN
WHERE GioiTinh = N'Nam'

-- Bài 4: Cho biết họ tên và lương của các nhân viên từ 5.000.000 trở lên. 
GO
SELECT HoNV, TenNV, Luong
FROM NHANVIEN
WHERE Luong >= 5000000

-- Bài 5: Cho biết họ tên các nhân viên có lương dưới 7.000.000. 
GO
SELECT HoNV, TenNV, Luong
FROM NHANVIEN
WHERE Luong < 7000000

-- Bài 6: Cho biết họ tên các nhân viên nữ có lương 6 triệu trở lên. 
GO
SELECT HoNV, TenNV, Luong
FROM NHANVIEN
WHERE Luong >= 6000000 and GioiTinh = N'Nữ'

-- Bài 7: Cho biết họ tên các nhân viên nữ phòng kế toán. 
GO
SELECT HoNV, TenNV
FROM NHANVIEN
WHERE  GioiTinh = N'Nữ' and MaPhong = 'KT'

-- Bài 8: Cho biết họ tên các nhân viên nam phòng nhân sự có lương lớn hơn 7 triệu 
GO
SELECT HoNV, TenNV
FROM NHANVIEN
WHERE  GioiTinh = N'Nam' and MaPhong = 'NS' and Luong > 7000000

-- Bài 9: Cho biết họ tên các nhân viên phòng hành chính 
GO
SELECT HoNV, TenNV
FROM NHANVIEN
WHERE MaPhong = 'HC'

-- Bài 10: Cho biết họ tên các nhân viên nữ phòng nhân sự 
GO
SELECT HoNV, TenNV
FROM NHANVIEN
WHERE MaPhong = 'NS' and GioiTinh = N'Nữ'

-- Bài 11: Cho biết họ tên các nhân viên nữ phòng kế toán có lương từ 6.000.000 trở lên
GO
SELECT HoNV, TenNV
FROM NHANVIEN
WHERE MaPhong = 'KT' and GioiTinh = N'Nữ' and Luong > 6000000

-- Bài 12: Cho biết số lượng nhân viên Nam 
GO
SELECT COUNT(GioiTinh) AS 'Số lượng nhân viên Nam'
FROM NHANVIEN
WHERE GioiTinh = N'Nam'

-- Bài 13: Cho biết số lượng nhân viên nữ có lương từ 6.000.000 trở lên 
GO
SELECT COUNT(*) AS 'Số lượng nhân viên nữ có lương từ 6.000.000 trở lên'
FROM NHANVIEN
WHERE GioiTinh = N'Nữ' and Luong > 6000000

-- Bài 14: Phòng kế toán có bao nhiêu nhân viên nữ 
GO
SELECT COUNT(*) AS 'Số nhân viên nữ phòng kế toán'
FROM NHANVIEN
WHERE MaPhong = 'KT' and GioiTinh = N'Nữ'

-- Bài 15: Phòng hành chính có bao nhiêu nhân viên nam có lương từ 7.000.000 trở lên 
GO
SELECT COUNT(*) AS 'Nhân viên nam có lương từ 7.000.000 trở lên'
FROM NHANVIEN
WHERE GioiTinh = N'Nam' and MaPhong = 'HC' and Luong >= 7000000

-- Bài 16: Cho biết tổng tiền lương của các nhân viên nam. 
GO
SELECT SUM(Luong) AS 'Tổng tiền lương của các nhân viên nam'
FROM NHANVIEN
WHERE GioiTinh = N'Nam'

-- Bài 17: Cho biết tổng tiền lương của các nhân viên nữ phòng hành chính. 
GO
SELECT SUM(Luong) AS 'Tổng tiền lương của các nhân viên nữ phòng hành chính'
FROM NHANVIEN
WHERE GioiTinh = N'Nữ' and MaPhong = 'HC'

-- Bài 18: Cho biết số lượng nhân viên nam phòng kế toán. 
GO
SELECT COUNT(*) AS 'Số lượng nhân viên nam phòng kế toán'
FROM NHANVIEN
WHERE GioiTinh = N'Nam' and MaPhong = 'KT'