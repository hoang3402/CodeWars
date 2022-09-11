-- QUẢN LÝ CÔNG TRÌNH [Giải quyết các câu hỏi]

use QLCONGTRINH;
set dateformat dmy;

-- Câu 1. Hãy cho biết tên và địa chỉ các công trình do chủ thầu Công ty xây dựng số 6 thi công. 
select TenCT, DiaChiCT
from CONGTRINH
where MaChuThau = 'CT01'

-- Câu 2. Tìm tên và địa chỉ liên lạc của các chủ thầu thi công công trình ở Đà Lạt do kiến trúc sư Nguyễn Đăng Khoa thiết kế.
select CHUTHAU.HoTen, DiaChiThau
from KTS, THIETKE, CONGTRINH, CHUTHAU
where   KTS.MaKTS = THIETKE.MaKTS
    and THIETKE.SoCT = CONGTRINH.SoCT
    and CHUTHAU.MaChuThau = CONGTRINH.MaChuThau
    and KTS.HoTen = N'Nguyễn Đăng Khoa'
    and TinhThanh = N'Đà Lạt'

-- Câu 3. Hãy cho biết nơi tốt nghiệp của các kiến trúc sư đã thiết kế công trình "Khách Sạn Quốc Tế" ở Cần Thơ. 
select KTS.HoTen, NoiTN
from KTS, THIETKE, CONGTRINH
where KTS.MaKTS = THIETKE.MaKTS
    and THIETKE.SoCT = CONGTRINH.SoCT
    and TenCT = N'Khách Sạn Quốc Tế'
    and TinhThanh = N'Cần Thơ'

-- Câu 4. Cho biết họ tên, năm sinh, năm vào nghề của các công nhân có chuyên môn hàn hoặc điện đã tham gia các công trình mà chủ thầu Công ty Thái Lâm đã trúng thầu. 
select *
from CONGNHAN, CHUTHAU, THAMGIA, CONGTRINH
where   CONGNHAN.MaCN = THAMGIA.MaCN
    and THAMGIA.SoCT = CONGTRINH.SoCT
    and CONGTRINH.MaChuThau = CHUTHAU.MaChuThau
    and (ChuyenMon like N'%hàn%' or ChuyenMon like N'%điện%')
    and CHUTHAU.HoTen like N'%Thái Lâm%'

-- Câu 5. Những công nhân nào đã bắt đầu tham gia công trình Khách sạn Quốc Tế ở Cần Thơ trong giai đoạn từ ngày 15/12/2019 đến ngày 31/12/2020, số ngày tương ứng là bao nhiêu. 
select HoTen, NgayTG, SoNgayTG
from CONGNHAN, THAMGIA, CONGTRINH
where   CONGNHAN.MaCN = THAMGIA.MaCN
    and THAMGIA.SoCT = CONGTRINH.SoCT
    and TinhThanh = N'Cần Thơ'
    and TenCT = N'Khách Sạn Quốc Tế'
    and (NgayTG between '2019-12-15' and '2020-12-31')

-- Câu 6. Cho biết tên và địa chỉ của công trình mà công nhân Nguyễn Văn An đã tham gia trong năm 2020. 
select TenCT, DiaChiCT
from CONGNHAN, THAMGIA, CONGTRINH
where   CONGTRINH.SoCT = THAMGIA.SoCT
    and THAMGIA.MaCN = CONGNHAN.MaCN
    and HoTen = N'Nguyễn Văn An'
    and YEAR(NgayTG) = 2020

-- Câu 7. Cho biết họ tên và năm sinh của các kiến trúc sư đã tốt nghiệp ở thành phố Hồ Chí Minh và đã thiết kế ít nhất một công trình có kinh phí đầu tư trên 400 triệu đồng. 
select distinct HoTen, NamSinh
from KTS, THIETKE, CONGTRINH
where   KTS.MaKTS = THIETKE.MaKTS
    and THIETKE.SoCT = CONGTRINH.SoCT
    and NoiTN like N'%TP HCM%'
    and KinhPhi > 400