GO
CREATE DATABASE Lab1_NguyenVanHoang

GO
USE Lab1_NguyenVanHoang

GO
CREATE TABLE BOPHAN
(
    MaBP VARCHAR(10) PRIMARY KEY,
    TenBP NVARCHAR(50)
)

GO
CREATE TABLE CHUCVU
(
    MaCV VARCHAR(10) PRIMARY KEY,
    TenCV NVARCHAR(50)
)

GO
SET DATEFORMAT dmy

GO
CREATE TABLE NHANVIEN
(
    MaNV VARCHAR(10) PRIMARY KEY,
    HoNV NVARCHAR(50),
    TenNV NVARCHAR(50),
    Luong INT,
    Phai NVARCHAR(3),
    NgaySinh DATE,
    MaCV VARCHAR(10),
    MaBP VARCHAR(10),
    FOREIGN KEY (MaCV) REFERENCES CHUCVU(MaCV),
    FOREIGN KEY (MaBP) REFERENCES BOPHAN(MaBP)
)

GO
INSERT INTO BOPHAN
VALUES
    ('KT', N'Kế toán')
INSERT INTO BOPHAN
VALUES
    ('TQ', N'Thủ quỹ')
INSERT INTO BOPHAN
VALUES
    ('NS', N'Nhân sự')

GO
INSERT INTO CHUCVU
VALUES
    ('PT', N'Phụ tá cho lập trình viên')
INSERT INTO CHUCVU
VALUES
    ('TP', N'Trưởng phòng')
INSERT INTO CHUCVU
VALUES
    ('LTV', N'Lập trình viên')
INSERT INTO CHUCVU
VALUES
    ('PTV', N'Phân tích viên hệ thống')
INSERT INTO CHUCVU
VALUES
    ('LTVCC', N'Lập trình viên cao cấp')
INSERT INTO CHUCVU
VALUES
    ('PTVCC', N'Phân tích viên hệ thống cao cấp')

GO
INSERT INTO NHANVIEN
VALUES
    ('NV01', N'Từ Thổn', N'Thức', 54000, N'Nam', '27/07/1980', 'TP', 'KT')
INSERT INTO NHANVIEN
VALUES
    ('NV02', N'Trần Văn', N'Tẻo', 32000, N'Nam', '28/11/1974', 'PTV', 'TQ')
INSERT INTO NHANVIEN
VALUES
    ('NV03', N'Lê Lưu', N'Luyến', 35500, N'Nữ', '05/03/1975', 'PTVCC', 'TQ')
INSERT INTO NHANVIEN
VALUES
    ('NV04', N'Nguyễn Văn', N'Hậu', 28000, N'Nam', '31/01/1977', 'LTVCC', 'TQ')
INSERT INTO NHANVIEN
VALUES
    ('NV05', N'Trần Thanh', N'Thanh', 51000, N'Nữ', '11/03/1967', 'TP', 'NS')
INSERT INTO NHANVIEN
VALUES
    ('NV06', N'Thái Văn', N'Thoại', 28500, N'Nam', '06/03/1976', 'LTVCC', 'NS')
INSERT INTO NHANVIEN
VALUES
    ('NV07', N'Lý Văn', N'Nghĩa', 30000, N'Nam', '02/10/1969', 'PTVCC', 'NS')
INSERT INTO NHANVIEN
VALUES
    ('NV08', N'Phạm Văn', N'Nhanh', 56000, N'Nam', '05/09/1977', 'TP', 'TQ')
INSERT INTO NHANVIEN
VALUES
    ('NV09', N'Trần Thị', N'Thảo', 27500, N'Nữ', '04/10/1975', 'LTV', 'NS')
INSERT INTO NHANVIEN
VALUES
    ('NV10', N'Nguyễn Thị', N'Thanh', 24000, N'Nữ', '14/06/1976', 'LTV', 'KT')
INSERT INTO NHANVIEN
VALUES
    ('NV11', N'Lê Thanh', N'Nhân', 27000, N'Nam', '01/10/1975', 'PT', 'KT')
INSERT INTO NHANVIEN
VALUES
    ('NV12', N'Lê Đông', N'Quang', 35000, N'Nam', '22/05/1980', 'LTVCC', 'NS')
INSERT INTO NHANVIEN
VALUES
    ('NV13', N'Lâm Nhân', N'Nghĩa', 35000, N'Nam', '04/09/1982', 'LTV', 'KT')
INSERT INTO NHANVIEN
VALUES
    ('NV14', N'Châu Thị', N'Mai', 32000, N'Nữ', '03/03/1977', 'LTV', 'TQ')
INSERT INTO NHANVIEN
VALUES
    ('NV15', N'Lương Khánh', N'Đạt', 27000, N'Nam', '25/03/1978', 'LTV', 'NS')
INSERT INTO NHANVIEN
VALUES
    ('NV16', N'Trần Thiện Thanh', N'Tùng', 28700, N'Nam', '26/06/1979', 'PTV', 'NS')
INSERT INTO NHANVIEN
VALUES
    ('NV17', N'Châu Quốc', N'Toản', 35500, N'Nam', '06/06/1982', 'LTV', 'TQ')
INSERT INTO NHANVIEN
VALUES
    ('NV18', N'Quách Nhân', N'Chương', 22000, N'Nam', '29/05/1980', 'PT', 'KT')
INSERT INTO NHANVIEN
VALUES
    ('NV19', N'Từ Thanh', N'Nhàn', 29800, N'Nam', '15/05/1978', 'LTV', 'KT')
INSERT INTO NHANVIEN
VALUES
    ('NV20', N'Lê Thanh Hải', N'Em', 36000, N'Nam', '29/09/1970', 'LTV', 'TQ')
INSERT INTO NHANVIEN
VALUES
    ('NV21', N'Lương Thanh', N'Bích', 30200, N'Nữ', '29/09/1976', 'LTV', 'KT')

-- Bài 4: Tìm tất cả các nữ nhân viên có lương trên 30000 USD.
SELECT MaNV, HoNV, TenNV, Luong, NgaySinh, TenCV, TenBP
FROM NHANVIEN nv INNER JOIN CHUCVU cv ON cv.MaCV = nv.MaCV INNER JOIN BOPHAN bp ON bp.MaBP = nv.MaBP
WHERE Phai = N'Nữ' and Luong > 30000

-- Bài 5: Liệt kê tất cả các trưởng phòng. 
GO
SELECT COUNT(*) AS 'Số trưởng phòng của công ty'
FROM NHANVIEN
WHERE MaCV = 'TP'

-- Bài 6: Liệt kê tất cả các nam lập trình viên thuộc phòng kế toán.
GO
SELECT MaNV, HoNV, TenNV, Luong, NgaySinh
FROM NHANVIEN
WHERE Phai = N'Nam' and MaCV = 'LTV' and MaBP = 'KT'

-- Bài 7: Tìm những nhân viên có tuổi nhỏ hơn 25.
GO
SELECT MaNV, HoNV, TenNV, Luong, NgaySinh
FROM NHANVIEN
WHERE YEAR(GETDATE()) - YEAR(NgaySinh) < 25  

-- Bài 8: Tìm tất cả các lập trình viên và phụ tá lập trình viên. 
GO
SELECT MaNV, HoNV, TenNV, Luong, NgaySinh
FROM NHANVIEN
WHERE MaCV = 'LTV' or MaCV = 'PT'

-- Bài 9: Liệt kê tất cả các nam nhân viên có tuổi từ 30 – 40. 
GO
SELECT MaNV, HoNV, TenNV, Luong, NgaySinh
FROM NHANVIEN
WHERE YEAR(GETDATE()) - YEAR(NgaySinh) > 30 AND YEAR(GETDATE()) - YEAR(NgaySinh) < 40

-- Bài 10: Liệt kê những lập trình viên của phòng nhân sự. 
GO
SELECT MaNV, HoNV, TenNV, Luong, NgaySinh
FROM NHANVIEN
WHERE MaCV = 'LTV' and MaBP = 'NS'

-- Bài 11: Liệt kê những nhân viên không thuộc bộ phận kế toán.
GO
SELECT MaNV, HoNV, TenNV, Luong, NgaySinh
FROM NHANVIEN
WHERE MaBP != 'KT'

-- Bài 12: Liệt kê tất cả các nữ nhân viên sắp xếp tăng dần theo lương. 
GO
SELECT MaNV, HoNV, TenNV, Luong, NgaySinh
FROM NHANVIEN
WHERE Phai = N'Nữ'
ORDER BY Luong

-- Bài 13: Cho biết lương trung bình của tất cả các nhân viên. 
GO
SELECT AVG(Luong) AS 'Lương trung bình của tất cả các nhân viên'
FROM NHANVIEN

-- Bài 14: Cho biết số lượng các chức vụ. 
GO
SELECT COUNT(MaCV) AS 'Số lượng các chức vụ'
FROM CHUCVU

-- Bài 15: Liệt kê mức lương thấp nhất, lương cao nhất và trung bình lương theo từng phòng
GO
SELECT BOPHAN.TenBP, Min(Luong) AS 'Mức lương thấp nhất', Max(Luong) AS 'Mức lương cao nhất', AVG(Luong) AS 'trung bình lương theo từng phòng'
FROM NHANVIEN, BOPHAN
WHERE NHANVIEN.MaBP = BOPHAN.MaBP
GROUP BY BOPHAN.TenBP

-- Bài 16: Liệt kê các chức vụ có nữ nhiều hơn 3 người. 
GO
SELECT TenCV
FROM NHANVIEN, CHUCVU
WHERE NHANVIEN.MaCV = CHUCVU.MaCV and NHANVIEN.Phai = N'Nữ'
GROUP BY CHUCVU.TenCV
HAVING COUNT(CHUCVU.MaCV) > 3

-- Bài 17: Tăng 10% cho tất cả các nhân viên thuộc bộ phận nhân sự. 
GO
SELECT *
FROM NHANVIEN
UPDATE NHANVIEN 
SET Luong = Luong + Luong * 10/100
WHERE MaBP = 'NS'
SELECT *
FROM NHANVIEN

-- Bài 18: Tìm lương trung bình của các nhân viên sinh vào tháng 6. 
GO
SELECT AVG(Luong) AS 'Lương trung bình của các nhân viên sinh vào tháng 6'
FROM NHANVIEN
WHERE MONTH(NgaySinh) = 6

-- Bài 19: Liệt kê lương cao nhất, thấp nhất và tổng lương theo chức vụ. 
GO
SELECT CHUCVU.TenCV AS 'Chức vụ', MAX(NHANVIEN.Luong) AS 'Lương cao nhất', MIN(NHANVIEN.Luong) AS 'Lương thấp nhất', SUM(NHANVIEN.Luong) AS 'Tổng lương theo chức vụ'
FROM NHANVIEN, CHUCVU
WHERE NHANVIEN.MaCV = CHUCVU.MaCV
GROUP BY CHUCVU.TenCV

-- Bài 20: Liệt kê các phòng có ít hơn 7 nhân viên và in ra số lượng nhân viên tương ứng. 
GO
SELECT BOPHAN.TenBP, COUNT(NHANVIEN.MaNV) AS 'Số lượng nhân viên'
FROM NHANVIEN, BOPHAN
WHERE NHANVIEN.MaBP = BOPHAN.MaBP
GROUP BY BOPHAN.TenBP
HAVING COUNT(NHANVIEN.MaNV) < 7

-- Bài 21: Liệt kê trung bình lương của tất cả các nhân viên thuộc bộ phận Nhân sự và có tuổi nhỏ hơn 36
GO
SELECT AVG(Luong) AS 'Trung bình lương của tất cả các nhân viên thuộc bộ phận Nhân sự và có tuổi nhỏ hơn 36'
FROM NHANVIEN
WHERE MaBP = 'NS' AND YEAR(GETDATE()) - YEAR(NgaySinh) < 36

-- Bài 22: Tìm những nhân viên có lương cao hơn trung bình lương của bộ phận mà họ trực thuộc. 
GO
SELECT NHANVIEN.MaNV, NHANVIEN.HoNV, NHANVIEN.TenNV, NHANVIEN.Luong, NHANVIEN.NgaySinh, BOPHAN.TenBP
FROM NHANVIEN, BOPHAN
WHERE NHANVIEN.MaBP = BOPHAN.MaBP AND NHANVIEN.Luong > (SELECT AVG(Luong)
    FROM NHANVIEN
    WHERE MaBP = BOPHAN.MaBP)

-- Bài 23: Liệt kê tất cả các nam nhân viên có lương cao hơn trung bình lương của nữ nhân viên, in ra mức lương tương ứng.
GO
SELECT NHANVIEN.MaNV, NHANVIEN.HoNV, NHANVIEN.TenNV, NHANVIEN.Luong
FROM NHANVIEN
WHERE NHANVIEN.Phai = N'Nam' AND NHANVIEN.Luong > (SELECT AVG(Luong)
    FROM NHANVIEN
    WHERE Phai = N'Nữ')

-- Bài 24: Liệt kê tất cả các trưởng phòng và các phòng tương ứng. 
GO
SELECT NHANVIEN.MaNV, NHANVIEN.HoNV, NHANVIEN.TenNV, NHANVIEN.Luong, BOPHAN.TenBP
FROM NHANVIEN, BOPHAN
WHERE NHANVIEN.MaBP = BOPHAN.MaBP AND NHANVIEN.MaCV = 'TP'

-- Bài 25: Tăng 9% lương cho tất cả các nhân viên không phải là PTV hoặc PTVCC
GO
SELECT *
FROM NHANVIEN
UPDATE NHANVIEN 
SET Luong = Luong + Luong * 9/100
WHERE MaBP != 'PTV' OR MaBP != 'PTVCC'
SELECT *
FROM NHANVIEN

-- Bài 26: Liệt kê tất cả các nhân viên với tên chức vụ và tên phòng. 
GO
SELECT NHANVIEN.MaNV, NHANVIEN.HoNV, NHANVIEN.TenNV, CHUCVU.TenCV, BOPHAN.TenBP
FROM NHANVIEN, BOPHAN, CHUCVU
WHERE NHANVIEN.MaCV = CHUCVU.MaCV AND NHANVIEN.MaBP = BOPHAN.MaBP

-- Bài 27: Tuyển thêm lập trình viên mới với lương khởi điểm là 20000 vào bộ phận nhân sự, thông tin nhân viên: mã NV: NV23, họ tên: Hồ Thanh Xuân, phái: Nữ, ngày sinh: 18/12/1982. 
INSERT INTO NHANVIEN
VALUES
    ( 'NV23', N'Hồ Thanh', N'Xuân', 20000, N'Nữ', '18/12/1982', 'LTV', 'NS')

-- Bài 28: Tăng 5% cho nhân viên vừa tuyển. 
GO
SELECT *
FROM NHANVIEN
UPDATE NHANVIEN
SET Luong = Luong + Luong * 5/100
WHERE MaNV = 'NV23'
SELECT *
FROM NHANVIEN

-- Bài 29: Tìm trung bình lương của tất cả các chức vụ. Danh sách này phải có cả tên chức vụ và tên phòng. 
GO
SELECT CHUCVU.TenCV, BOPHAN.TenBP, AVG(NHANVIEN.Luong) AS 'Trung bình lương của tất cả các chức vụ'
FROM NHANVIEN, CHUCVU, BOPHAN
WHERE NHANVIEN.MaCV = CHUCVU.MaCV AND NHANVIEN.MaBP = BOPHAN.MaBP
GROUP BY CHUCVU.TenCV, BOPHAN.TenBP

-- Bài 30: Tìm nhân viên có lương cao nhất và không phải trưởng phòng. 
GO
SELECT *
FROM NHANVIEN
WHERE Luong = (SELECT MAX(Luong)
    FROM NHANVIEN
    WHERE MaCV != 'TP') AND MaCV != 'TP'

-- Bài 31: Tìm những phòng có số lượng nhân viên nhiều nhất. 
GO
SELECT BOPHAN.TenBP, COUNT(NHANVIEN.MaNV) AS 'Số lượng nhân viên'
FROM NHANVIEN, BOPHAN
WHERE NHANVIEN.MaBP = BOPHAN.MaBP
GROUP BY BOPHAN.MaBP, BOPHAN.TenBP
ORDER BY COUNT(NHANVIEN.MaNV) DESC

-- Bài 32: Tìm những nhân viên thuộc các phòng có trung bình lương cao nhất. 
GO
SELECT MaNV, HoNV, TenNV, Luong, Phai, TenCV, TenBP
FROM NHANVIEN, BOPHAN, CHUCVU
WHERE NHANVIEN.MaBP = BOPHAN.MaBP AND NHANVIEN.MaCV = CHUCVU.MaCV AND NHANVIEN.MaBP = (SELECT NHANVIEN.MaBP
    FROM NHANVIEN, BOPHAN
    WHERE NHANVIEN.MaBP = BOPHAN.MaBP
    GROUP BY NHANVIEN.MaBP
    HAVING AVG(NHANVIEN.Luong) = (SELECT MAX(Temp.TrungBinh)
    FROM (SELECT AVG(NHANVIEN.Luong) AS TrungBinh
        FROM NHANVIEN, BOPHAN
        WHERE NHANVIEN.MaBP = BOPHAN.MaBP
        GROUP BY NHANVIEN.MaBP) AS Temp))

-- Bài 33: Tìm nhân viên có tuổi lơn nhất, nhỏ nhất theo từng bộ phận. 
GO
SELECT MaNV, HoNV , TenNV, NHANVIEN.MaBP, (YEAR(GETDATE()) - YEAR(NgaySinh)) AS Tuoi
FROM NHANVIEN, (SELECT MAX(Temp.Tuoi) AS TuoiMAX, MaBP
    FROM (SELECT MaBP, (YEAR(GETDATE()) - YEAR(NgaySinh)) AS Tuoi
        FROM NHANVIEN
        WHERE  NHANVIEN.MaBP = NHANVIEN.MaBP
        GROUP BY NHANVIEN.MaBP, NHANVIEN.NgaySinh) AS Temp
    GROUP BY Temp.MaBP) AS Temp,
    (SELECT MIN(Temp1.Tuoi) AS TuoiMIN, MaBP
    FROM (SELECT MaBP, (YEAR(GETDATE()) - YEAR(NgaySinh)) AS Tuoi
        FROM NHANVIEN
        WHERE  NHANVIEN.MaBP = NHANVIEN.MaBP
        GROUP BY NHANVIEN.MaBP, NHANVIEN.NgaySinh) AS Temp1
    GROUP BY Temp1.MaBP) AS Temp1
WHERE NHANVIEN.MaBP = Temp.MaBP
GROUP BY MaNV, HoNV, TenNV, NHANVIEN.MaBP, NHANVIEN.NgaySinh, Temp.TuoiMAX, Temp1.TuoiMIN
HAVING (YEAR(GETDATE()) - YEAR(NgaySinh) = Temp.TuoiMAX) OR (YEAR(GETDATE()) - YEAR(NgaySinh) = Temp1.TuoiMIN)

-- Bài 34: Cho biết trung bình lương của mỗi phòng của tất cả các nhân viên không phải là trưởng phòng và không dưới 30 tuổi.
GO
SELECT BOPHAN.TenBP, AVG(NHANVIEN.Luong) AS 'Trung bình lương của mỗi phòng của tất cả các nhân viên không phải là trưởng phòng và không dưới 30 tuổi'
FROM NHANVIEN, BOPHAN
WHERE NHANVIEN.MaBP = BOPHAN.MaBP AND NHANVIEN.MaCV != 'TP' AND (YEAR(GETDATE()) - YEAR(NgaySinh)) < 30
GROUP BY BOPHAN.MaBP, BOPHAN.TenBP

