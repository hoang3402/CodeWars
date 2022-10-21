-- TRUY VẤN LỒNG + GOM NHÓM

use QLDEAN;
set dateformat DMY

-- Cho biết danh sách các đề án (MaDA) có: nhân công với họ (HoNV) là 'Lê' hoặc có người trưởng phòng chủ trì đề án với họ (HoNV) là 'Lê'.
select distinct
    DEAN.MaDA,
    DEAN.TenDA
from dbo.NHANVIEN NHANVIEN_1
    , dbo.PHANCONG
    inner join dbo.NHANVIEN
    on PHANCONG.MaNV = NHANVIEN.MaNV
    inner join dbo.DEAN
    on PHANCONG.MaDA = DEAN.MaDA
where (NHANVIEN.HoNV like N'Lê'
    or NHANVIEN_1.HoNV like N'Lê')
    and NHANVIEN.MaNQL like NHANVIEN_1.MaNV

-- Danh sách những nhân viên (HoNV, TenLot, TenNV) có trên 2 thân nhân.
select
    NHANVIEN.HoNV,
    NHANVIEN.TenLot,
    NHANVIEN.TenNV,
    COUNT(THANNHAN.TenTN) as expr1
from dbo.THANNHAN
    inner join dbo.NHANVIEN
    on THANNHAN.MaNV = NHANVIEN.MaNV
group by NHANVIEN.HoNV
        ,NHANVIEN.TenLot
        ,NHANVIEN.TenNV
having COUNT(THANNHAN.TenTN) > 2

-- Danh sách những nhân viên (HONV, TENLOT, TENNV) không có thân nhân nào (dùng NOT IN, LEFT JOIN, NOT EXISTS)
select
    NHANVIEN.HoNV,
    NHANVIEN.TenLot,
    NHANVIEN.TenNV
from dbo.THANNHAN
    full outer join dbo.NHANVIEN
    on THANNHAN.MaNV = NHANVIEN.MaNV
group by NHANVIEN.HoNV
        ,NHANVIEN.TenLot
        ,NHANVIEN.TenNV
having COUNT(THANNHAN.TenTN) = 0

-- Danh sách những trưởng phòng (HONV, TENLOT, TENNV) có tối thiểu một thân nhân.
select distinct
    NHANVIEN.HoNV,
    NHANVIEN.TenLot,
    NHANVIEN.TenNV
from dbo.NHANVIEN
    inner join dbo.PHONGBAN
    on NHANVIEN.MaPhong = PHONGBAN.MaPhong
    inner join dbo.THANNHAN
    on THANNHAN.MaNV = NHANVIEN.MaNV
where NHANVIEN.MaNV = PHONGBAN.TruongPhong
group by NHANVIEN.HoNV
        ,NHANVIEN.TenLot
        ,NHANVIEN.TenNV
having COUNT(THANNHAN.TenTN) >= 1

-- Tìm họ (HONV) của những trưởng phòng chưa có gia đình.
select distinct
    NHANVIEN.HoNV
from dbo.NHANVIEN
    inner join dbo.PHONGBAN
    on NHANVIEN.MaPhong = PHONGBAN.MaPhong
    inner join dbo.THANNHAN
    on THANNHAN.MaNV = NHANVIEN.MaNV
where NHANVIEN.MaNV = PHONGBAN.TruongPhong
group by NHANVIEN.HoNV
having COUNT(THANNHAN.TenTN) = 0

-- Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình của phòng "Nhân sự"
select
    NHANVIEN.HoNV,
    NHANVIEN.TenLot,
    NHANVIEN.TenNV
from dbo.NHANVIEN
    inner join dbo.PHONGBAN
    on NHANVIEN.MaPhong = PHONGBAN.MaPhong
where NHANVIEN.Luong > (select
        AVG(NHANVIEN.Luong) as LuongTB
    from dbo.NHANVIEN)
    and PHONGBAN.TenPhong like N'Nhân sự'
group by NHANVIEN.HoNV
        ,NHANVIEN.TenLot
        ,NHANVIEN.TenNV

-- Cho biết tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất.
select
    PHONGBAN.TenPhong,
    NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as N'Họ tên'
from dbo.NHANVIEN
    inner join dbo.PHONGBAN
    on NHANVIEN.MaPhong = PHONGBAN.MaPhong
        and NHANVIEN.MaNV = PHONGBAN.TruongPhong
where PHONGBAN.MaPhong = (select
    MAX(TimMax.SLNhanVien) as expr1
from (select
        COUNT(*) as SLNhanVien
    from dbo.NHANVIEN
    group by NHANVIEN.MaPhong) TimMax)

-- Cho biết danh sách các mã đề án mà nhân viên có mã là 60 chưa làm.
select
    DEAN.MaDA,
    DEAN.TenDA
from dbo.DEAN
where DEAN.MaDA not in (select distinct
    DEAN.MaDA
from dbo.DEAN
    inner join dbo.PHANCONG
    on DEAN.MaDA = PHANCONG.MaDA
where PHANCONG.MaNV like 60)

-- Danh sách nhân viên gồm MaNv, HovaTen (được nối từ các cột HONV, TENLOT, TENNV) và địa chỉ (DCHI) của những nhân viên làm việc cho một đề án ở 'TP HCM' nhưng phòng ban mà họ trực thuộc lại không tọa lạc ở thành phố 'TP HCM'.
select distinct
    NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as N'Họ tên',
    NHANVIEN.DiaChi
from dbo.PHANCONG
    inner join dbo.DEAN
    on PHANCONG.MaDA = DEAN.MaDA
    inner join dbo.NHANVIEN
    on PHANCONG.MaNV = NHANVIEN.MaNV
    inner join dbo.PHONGBAN
    on DEAN.MaPhong = PHONGBAN.MaPhong
        and NHANVIEN.MaPhong = PHONGBAN.MaPhong
    inner join dbo.DIADIEM_PHONG
    on DIADIEM_PHONG.MaPhong = PHONGBAN.MaPhong
where DEAN.DiaDiemDA like N'TP HCM'
    and DIADIEM_PHONG.DiaDiem not like N'TP HCM'

-- Tổng quát câu 16, tìm họ tên và địa chỉ của các nhân viên làm việc cho một đề án ở một thành phố nhưng phòng ban mà họ trực thuộc lại không toạ lạc ở thành phố đó.
select distinct
    NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as N'Họ tên',
    NHANVIEN.DiaChi
from dbo.PHANCONG
    inner join dbo.DEAN
    on PHANCONG.MaDA = DEAN.MaDA
    inner join dbo.NHANVIEN
    on PHANCONG.MaNV = NHANVIEN.MaNV
    inner join dbo.PHONGBAN
    on DEAN.MaPhong = PHONGBAN.MaPhong
        and NHANVIEN.MaPhong = PHONGBAN.MaPhong
    inner join dbo.DIADIEM_PHONG
    on DIADIEM_PHONG.MaPhong = PHONGBAN.MaPhong
where DIADIEM_PHONG.DiaDiem not like DEAN.DiaDiemDA

