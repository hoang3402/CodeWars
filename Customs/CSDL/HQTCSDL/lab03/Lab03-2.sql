-- QUẢN LÝ ĐỀ ÁN [Giải quyết các câu hỏi]

use QLDEAN;
set dateformat DMY

-- Tìm các nhân viên làm việc ở phòng số 5
select
    NHANVIEN.*
from dbo.NHANVIEN
where NHANVIEN.MaPhong = 5

-- Tìm các nhân viên có mức lương trên 25000
select
    NHANVIEN.*
from dbo.NHANVIEN
where NHANVIEN.Luong > 25000

-- Tìm các nhân viên có mức lương trên 65,000 ở phòng 1 hoặc các nhân viên có mức lương trên 70,000 ở phòng 2
select
    NHANVIEN.*
from dbo.NHANVIEN
where (Luong > 65000 and MaPhong = 1) or (Luong > 70000 and MaPhong = 2)

-- Cho biết họ tên đầy đủ của các nhân viên ở TP HCM
select
    NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as N'Họ tên'
from dbo.NHANVIEN
where NHANVIEN.DiaChi like N'%Tp HCM'

-- Cho biết họ tên đầy đủ của các nhân viên có họ bắt đầu bằng ký tự 'N'
select
    NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as N'Họ tên'
from dbo.NHANVIEN
where NHANVIEN.HoNV like N'N%'

-- Cho biết ngày sinh và địa chỉ của nhân viên Lê Quỳnh Như
select
    NHANVIEN.NgaySinh,
    NHANVIEN.DiaChi
from dbo.NHANVIEN
where NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV like N'Lê Quỳnh Như'

-- Cho biết các nhân viên có năm sinh trong khoảng 1955 đến 1975
select
    *
from dbo.NHANVIEN
where YEAR(NHANVIEN.NgaySinh) between 1955 and 1975

-- Cho biết các nhân viên và năm sinh của nhân viên
select
    NHANVIEN.MaNV,
    NHANVIEN.HoNV,
    NHANVIEN.TenLot,
    NHANVIEN.TenNV,
    YEAR(NHANVIEN.NgaySinh)
from dbo.NHANVIEN

-- Cho biết các nhân viên và tuổi của nhân viên
select
    NHANVIEN.MaNV,
    NHANVIEN.HoNV,
    NHANVIEN.TenLot,
    NHANVIEN.TenNV,
    YEAR(GETDATE()) - YEAR(NHANVIEN.NgaySinh) as N'Tuổi'
from dbo.NHANVIEN

-- Với mỗi phòng ban, cho biết tên phòng ban và địa điểm phòng Tìm tên những người trưởng phòng của từng phòng ban
select
    PHONGBAN.MaPhong,
    PHONGBAN.TenPhong,
    DIADIEM_PHONG.DiaDiem,
    NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as N'Họ tên'
from dbo.DIADIEM_PHONG
    inner join dbo.PHONGBAN
    on DIADIEM_PHONG.MaPhong = PHONGBAN.MaPhong
    inner join dbo.NHANVIEN
    on NHANVIEN.MaPhong = PHONGBAN.MaPhong
where PHONGBAN.TruongPhong = NHANVIEN.MaNV

-- Tìm tên và địa chỉ của tất cả các nhân viên của phòng "Điều hành".
select
    NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as N'Họ tên',
    NHANVIEN.DiaChi
from dbo.NHANVIEN
    inner join dbo.PHONGBAN
    on NHANVIEN.MaPhong = PHONGBAN.MaPhong
where PHONGBAN.TenPhong like N'Điều hành'

-- Với mỗi đề án ở Nha Trang, cho biết tên đề án, tên phòng ban, họ tên và ngày nhận chức của trưởng phòng của phòng ban chủ trì đề án đó.
select
    DEAN.TenDA
 , PHONGBAN.TenPhong
 , NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as N'Họ tên'
 , NHANVIEN.DiaChi
 , PHONGBAN.NgayNhanChuc
from dbo.NHANVIEN
    inner join dbo.PHONGBAN
    on NHANVIEN.MaPhong = PHONGBAN.MaPhong
    inner join dbo.DEAN
    on DEAN.MaPhong = PHONGBAN.MaPhong
where DEAN.DiaDiemDA like 'Nha Trang'
    and PHONGBAN.TruongPhong = NHANVIEN.MaNV

-- Tìm tên những nữ nhân viên và tên người thân của họ
select
    NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as N'Họ tên'
 , THANNHAN.TenTN
from dbo.THANNHAN
    inner join dbo.NHANVIEN
    on THANNHAN.MaNV = NHANVIEN.MaNV
where NHANVIEN.Phai like N'Nữ'

-- Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên người quản lý trực tiếp của nhân viên đó
select
    NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as N'Họ tên nhân viên'
 , NHANVIEN_1.HoNV + ' ' + NHANVIEN_1.TenLot + ' ' + NHANVIEN_1.TenNV as N'Họ tên quản lý'
from dbo.NHANVIEN
    inner join dbo.NHANVIEN NHANVIEN_1
    on NHANVIEN.MaNQL = NHANVIEN_1.MaNV

-- Với mỗi nhân viên, cho biết họ tên của nhân viên đó, họ tên người trưởng phòng và họ tên người quản lý trực tiếp của nhân viên đó.
select distinct
    NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as N'Họ tên nhân viên',
    NHANVIEN_1.HoNV + ' ' + NHANVIEN_1.TenLot + ' ' + NHANVIEN_1.TenNV as N'Họ tên trưởng phòng',
    NHANVIEN_2.HoNV + ' ' + NHANVIEN_2.TenLot + ' ' + NHANVIEN_2.TenNV as N'Họ tên quản lý'
from dbo.NHANVIEN NHANVIEN_1
    inner join dbo.PHONGBAN
    on NHANVIEN_1.MaPhong = PHONGBAN.MaPhong
        and PHONGBAN.TruongPhong = NHANVIEN_1.MaNV
    inner join dbo.NHANVIEN
    on NHANVIEN.MaPhong = PHONGBAN.MaPhong
    inner join dbo.NHANVIEN NHANVIEN_2
    on NHANVIEN.MaNQL = NHANVIEN_2.MaNV

-- Tên những nhân viên phòng số 5 có tham gia vào đề án "Xây dựng nhà máy chế biến thủy sản" và tên người quản lý trực tiếp.
select
    NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as N'Họ tên nhân viên',
    NHANVIEN_1.HoNV + ' ' + NHANVIEN_1.TenLot + ' ' + NHANVIEN_1.TenNV as N'Họ tên quản lý'
from dbo.PHANCONG
    inner join dbo.NHANVIEN
    on PHANCONG.MaNV = NHANVIEN.MaNV
    inner join dbo.DEAN
    on PHANCONG.MaDA = DEAN.MaDA
    inner join dbo.NHANVIEN NHANVIEN_1
    on NHANVIEN.MaNQL = NHANVIEN_1.MaNV
where NHANVIEN.MaPhong = 5
    and DEAN.TenDA like N'Xây dựng nhà máy chế biến thủy sản'

-- Cho biết tên các đề án mà nhân viên Trần Anh Tuấn đã tham gia.
select
    NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as N'Họ tên nhân viên',
    DEAN.TenDA
from dbo.PHANCONG
    inner join dbo.NHANVIEN
    on PHANCONG.MaNV = NHANVIEN.MaNV
    inner join dbo.DEAN
    on PHANCONG.MaDA = DEAN.MaDA
where NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV like N'Trần Anh Tuấn'

-- Cho biết số lượng đề án của công ty
select
    COUNT(DEAN.MaDA) as N'Số lượng đề án'
from dbo.DEAN

-- Cho biết số lượng đề án do phòng 'Nghiên Cứu' chủ trì 
select
    COUNT(DEAN.MaDA) as N'Số lượng đề án'
from dbo.DEAN
    inner join dbo.PHONGBAN
    on DEAN.MaPhong = PHONGBAN.MaPhong
where TenPhong like N'Nghiên Cứu'

-- Cho biết lương trung bình của các nữ nhân viên
select
    SUM(NHANVIEN.Luong)/COUNT(MaNV) as N'Lương trung bình'
from dbo.NHANVIEN
where NHANVIEN.Phai like N'Nữ'

-- Cho biết số thân nhân của nhân viên ‘Nguyễn Thanh Tùng'
select
    NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as 'Tên nhân viên',
    COUNT(THANNHAN.TenTN) as N'Số lượng thân nhân'
from dbo.THANNHAN
    inner join dbo.NHANVIEN
    on THANNHAN.MaNV = NHANVIEN.MaNV
where NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV like N'Nguyễn Thanh Tùng'
group by NHANVIEN.HoNV
        ,NHANVIEN.TenLot
        ,NHANVIEN.TenNV

-- Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của tất cả các nhân viên tham dự đề án đó
select
    DEAN.TenDA,
    SUM(PHANCONG.ThoiGian) as N'Tổng số giờ làm việc'
from dbo.PHANCONG
    inner join dbo.DEAN
    on PHANCONG.MaDA = DEAN.MaDA
group by DEAN.TenDA

-- Với mỗi đề án, cho biết có bao nhiêu nhân viên tham gia đề án đó
select
    DEAN.TenDA,
    COUNT(PHANCONG.MaNV) as N'Số nhân viên tham gia'
from dbo.PHANCONG
    inner join dbo.DEAN
    on PHANCONG.MaDA = DEAN.MaDA
group by DEAN.TenDA

-- Với mỗi nhân viên, cho biết họ và tên nhân viên và số lượng thân nhân của nhân viên đó.
select
    NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as 'Tên nhân viên',
    COUNT(THANNHAN.TenTN) as N'Số lượng thân nhân'
from dbo.THANNHAN
    inner join dbo.NHANVIEN
    on THANNHAN.MaNV = NHANVIEN.MaNV
group by NHANVIEN.HoNV
        ,NHANVIEN.TenLot
        ,NHANVIEN.TenNV

-- Với mỗi nhân viên, cho biết họ tên của nhân viên và số lượng đề án mà nhân viên đó đã tham gia.
select
    NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as N'Họ tên',
    COUNT(PHANCONG.MaDA) as N'Số lượng đề án tham gia'
from dbo.PHANCONG
    inner join dbo.NHANVIEN
    on PHANCONG.MaNV = NHANVIEN.MaNV
group by NHANVIEN.HoNV
        ,NHANVIEN.TenLot
        ,NHANVIEN.TenNV

-- Với mỗi nhân viên, cho biết số lượng nhân viên mà nhân viên đó quản lý trực tiếp.
select
    NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as N'Họ tên',
    COUNT(NHANVIEN_2.MaNV) as N''
from dbo.NHANVIEN
    , dbo.NHANVIEN NHANVIEN_1
    , dbo.NHANVIEN NHANVIEN_2
where NHANVIEN.MaNQL like NHANVIEN_1.MaNV
    and NHANVIEN_1.MaNV like NHANVIEN_2.MaNQL
group by NHANVIEN.HoNV
        ,NHANVIEN.TenLot
        ,NHANVIEN.TenNV

-- Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của những nhân viên làm việc cho phòng ban đó.
select
    NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as N'Họ tên',
    COUNT(NHANVIEN_1.MaNV) as expr1
from dbo.NHANVIEN
    , dbo.NHANVIEN NHANVIEN_1
where NHANVIEN.MaNV like NHANVIEN_1.MaNQL
group by NHANVIEN.HoNV
        ,NHANVIEN.TenLot
        ,NHANVIEN.TenNV

-- Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên phòng ban và số lượng nhân viên của phòng ban đó.
select
    PHONGBAN.TenPhong,
    COUNT(NHANVIEN.MaNV) as N'Số lượng nhân viên'
from dbo.NHANVIEN
    inner join dbo.PHONGBAN
    on NHANVIEN.MaPhong = PHONGBAN.MaPhong
group by PHONGBAN.TenPhong
having AVG(NHANVIEN.Luong) > 30000

-- Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì
select
    PHONGBAN.TenPhong,
    COUNT(DEAN.MaDA) as N'Số lượng đề án'
from dbo.DEAN
    inner join dbo.PHONGBAN
    on DEAN.MaPhong = PHONGBAN.MaPhong
group by PHONGBAN.TenPhong

-- Với mỗi phòng ban, cho biết tên phòng ban, họ tên người trưởng phòng và số lượng đề án mà phòng ban đó chủ trì
select
    PHONGBAN.TenPhong,
    NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as N'Họ tên',
    COUNT(DEAN.MaDA) as N'Số lượng đề án'
from dbo.DEAN
    inner join dbo.PHONGBAN
    on DEAN.MaPhong = PHONGBAN.MaPhong
    inner join dbo.NHANVIEN
    on NHANVIEN.MaPhong = PHONGBAN.MaPhong
where PHONGBAN.TruongPhong = NHANVIEN.MaNV
group by PHONGBAN.TenPhong
        ,NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV
        ,NHANVIEN.HoNV
        ,NHANVIEN.TenLot
        ,NHANVIEN.TenNV

-- Với mỗi phòng ban có mức lương trung bình lớn hơn 50,000, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì.
select
    PHONGBAN.TenPhong,
    COUNT(DEAN.MaDA) as N'Số lượng đề án'
from dbo.DEAN
    inner join dbo.PHONGBAN
    on DEAN.MaPhong = PHONGBAN.MaPhong
    inner join dbo.NHANVIEN
    on NHANVIEN.MaPhong = PHONGBAN.MaPhong
        and PHONGBAN.TruongPhong = NHANVIEN.MaNV
group by PHONGBAN.TenPhong
        ,NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV
        ,NHANVIEN.HoNV
        ,NHANVIEN.TenLot
        ,NHANVIEN.TenNV
having AVG(NHANVIEN.Luong) > 50000

-- Cho biết số đề án diễn ra tại từng địa điểm
select
    DIADIEM_PHONG.DiaDiem,
    COUNT(DEAN.MaDA) as N'Số đề án'
from dbo.DEAN
    inner join dbo.PHONGBAN
    on DEAN.MaPhong = PHONGBAN.MaPhong
    inner join dbo.DIADIEM_PHONG
    on DIADIEM_PHONG.MaPhong = PHONGBAN.MaPhong
group by DIADIEM_PHONG.DiaDiem

-- Với mỗi đề án, cho biết tên đề án và số lượng công việc của đề án này.
select
    DEAN.TenDA,
    COUNT(PHANCONG.MaNV) as N'Số lượng công việc'
from dbo.PHANCONG
    inner join dbo.DEAN
    on PHANCONG.MaDA = DEAN.MaDA
group by DEAN.TenDA

-- Với mỗi công việc trong đề án có mã đề án là 20, cho biết số lượng nhân viên được phân công.
select
    COUNT(PHANCONG.MaNV) as N'Số lượng nhân viên được phân công'
from dbo.PHANCONG
where PHANCONG.MaDA = 20