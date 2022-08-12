-- QUẢN LÝ CÔNG TRÌNH [Giải quyết các câu hỏi]

USE QLCONGTRINH;
SET dateformat dmy;

-- Câu 1. Hãy cho biết tên và địa chỉ các công trình do chủ thầu Công ty xây dựng số 6 thi công. 
SELECT TenCT, DiaChiCT
FROM CONGTRINH
WHERE MaChuThau = 'CT01'

-- Câu 2. Tìm tên và địa chỉ liên lạc của các chủ thầu thi công công trình ở Đà Lạt do kiến trúc sư Nguyễn Đăng Khoa thiết kế.
SELECT CHUTHAU.HoTen, DiaChiThau
FROM KTS, THIETKE, CONGTRINH, CHUTHAU
WHERE   KTS.MaKTS = THIETKE.MaKTS
    AND THIETKE.SoCT = CONGTRINH.SoCT
    AND CHUTHAU.MaChuThau = CONGTRINH.MaChuThau
    AND KTS.HoTen = N'Nguyễn Đăng Khoa'
    AND TinhThanh = N'Đà Lạt'

-- Câu 3. Hãy cho biết nơi tốt nghiệp của các kiến trúc sư đã thiết kế công trình "Khách Sạn Quốc Tế" ở Cần Thơ. 
SELECT KTS.HoTen, NoiTN
FROM KTS, THIETKE, CONGTRINH
WHERE KTS.MaKTS = THIETKE.MaKTS
    AND THIETKE.SoCT = CONGTRINH.SoCT
    AND TenCT = N'Khách Sạn Quốc Tế'
    AND TinhThanh = N'Cần Thơ'

-- Câu 4. Cho biết họ tên, năm sinh, năm vào nghề của các công nhân có chuyên môn hàn hoặc điện đã tham gia các công trình mà chủ thầu Công ty Thái Lâm đã trúng thầu. 
SELECT *
FROM CONGNHAN, CHUTHAU, THAMGIA, CONGTRINH
WHERE   CONGNHAN.MaCN = THAMGIA.MaCN
    AND THAMGIA.SoCT = CONGTRINH.SoCT
    AND CONGTRINH.MaChuThau = CHUTHAU.MaChuThau
    AND CHUTHAU.MaChuThau = 'CT03'
    AND (ChuyenMon LIKE N'%hàn%' OR ChuyenMon LIKE N'%điện%')

-- Câu 5. Những công nhân nào đã bắt đầu tham gia công trình Khách sạn Quốc Tế ở Cần Thơ trong giai đoạn từ ngày 15/12/2019 đến ngày 31/12/2020, số ngày tương ứng là bao nhiêu. 
SELECT HoTen, NgayTG, SoNgayTG
FROM CONGNHAN, THAMGIA, CONGTRINH
WHERE   CONGNHAN.MaCN = THAMGIA.MaCN
    AND THAMGIA.SoCT = CONGTRINH.SoCT
    AND TinhThanh = N'Cần Thơ'
    AND TenCT = N'Khách Sạn Quốc Tế'
    AND NgayTG BETWEEN '2019-12-15' AND '2020-12-31'

-- Câu 6. Cho biết tên và địa chỉ của công trình mà công nhân Nguyễn Văn An đã tham gia trong năm 2020. 
SELECT TenCT, DiaChiCT
FROM CONGNHAN, THAMGIA, CONGTRINH
WHERE   CONGTRINH.SoCT = THAMGIA.SoCT
    AND THAMGIA.MaCN = CONGNHAN.MaCN
    AND HoTen = N'Nguyễn Văn An'
    AND NgayTG LIKE '2020%'

-- Câu 7. Cho biết họ tên và năm sinh của các kiến trúc sư đã tốt nghiệp ở thành phố Hồ Chí Minh và đã thiết kế ít nhất một công trình có kinh phí đầu tư trên 400 triệu đồng. 
SELECT DISTINCT HoTen, NamSinh
FROM KTS, THIETKE, CONGTRINH
WHERE   KTS.MaKTS = THIETKE.MaKTS
    AND THIETKE.SoCT = CONGTRINH.SoCT
    AND NoiTN LIKE N'%TP HCM%'
    AND KinhPhi >= 400