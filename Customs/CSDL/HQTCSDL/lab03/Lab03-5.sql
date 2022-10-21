-- VIEWS

use QLDEAN;
set dateformat DMY

-- Viết truy vấn liệt kê tên các nhân viên cùng với các dự án mà nhân viên đó tham gia. Run và kiểm tra kết quả.
select distinct
    NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as N'Họ tên',
    DEAN.TenDA
from dbo.PHANCONG
    inner join dbo.NHANVIEN
    on PHANCONG.MaNV = NHANVIEN.MaNV
    inner join dbo.DEAN
    on PHANCONG.MaDA = DEAN.MaDA

-- Tạo một View có tên NV_DA với nội dung truy vấn là câu 1. Mở cửa sổ Object Explorer, xem view vừa tạo lưu ở đâu?. Xem kết quả dữ liệu từ View vừa tạo (SELECT * FROM NV_DA) và so sánh với kết quả ở câu 1; có khác nhau không?. Tại sao?
-- Kết quả của view vừa tạo giống với kết quả ở câu 1. tại vì: VIEW là một bảng ảo trong cơ sở dữ liệu có nội dung được định nghĩa thông qua một câu lệnh SQL nào đó, vì thế mỗi khi ta gọi VIEW nó sẽ thực hiện nội dung câu lệnh SQL mà ta cài đặt cho nó.

-- Thêm một dòng tùy ý vào bảng PHANCONG, sau đó thực hiện lệnh SELECT * FROM NV_DA, kết quả có thay đổi so với câu 2 không?. Tại sao?

-- không vì nội dung 2 bảng là khác nhau và bảng phân công chỉ liên kết khoá ngoại với bảng nhân viên (MaNV) nên cho dù thêm hay xoá thì bảng nhân viên cũng không thay đổi nội dung.

-- Thực hiện lệnh: 
-- UPDATE NV_DA SET TENDA = N‘Quản lý các dự án CNTT thông tin’
-- WHERE TENDA=N’Resort nghỉ dưỡng’ Câu lệnh có thực hiện được không?. Tại sao? Thực hiện câu lệnh: SELECT * FROM NV_DA và SELECT * FROM DEAN để xem sự thay đổi dữ liệu
-- Viết truy vấn hiển thị HoTen của nhân viên, tên dự án nhân viên đó tham gia cùng với tổng tiền lương của nhân viên theo dự án (tiền lương = số giờ * LUONG). Sắp xếp tiền lương tăng dần. Sau đó, thực hiện các yêu cầu sau: 
select
    NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as [Họ tên],
    DEAN.TenDA,
    NHANVIEN.Luong * PHANCONG.ThoiGian as [tiền lương]
from dbo.PHANCONG
    inner join dbo.NHANVIEN
    on PHANCONG.MaNV = NHANVIEN.MaNV
    inner join dbo.DEAN
    on PHANCONG.MaDA = DEAN.MaDA
order by [tiền lương]

-- Tạo một View5a dựa trên query này. Bạn sẽ gặp lỗi, tại sao?
-- Tại vì trong view không thể dùng order by

-- Hãy hiệu chỉnh để có thể tạo được View5b dựa trên query trên.
go
create view view_5a
as
    select top 100 percent
        NHANVIEN.HoNV + ' ' + NHANVIEN.TenLot + ' ' + NHANVIEN.TenNV as N'Họ tên',
        DEAN.TenDA,
        NHANVIEN.Luong * PHANCONG.ThoiGian as [tiền lương]
    from dbo.PHANCONG
        inner join dbo.NHANVIEN
        on PHANCONG.MaNV = NHANVIEN.MaNV
        inner join dbo.DEAN
        on PHANCONG.MaDA = DEAN.MaDA
    order by [tiền lương]
go

select *
from dbo.view_5a

-- Tạo View63 gồm các thông tin của bảng DEAN nhưng chỉ lấy các dự án có địa điểm ở Tp.HCM.
go
create view view_63
as
    select
        DEAN.*
    from dbo.DEAN
    where DEAN.DiaDiemDA like 'Tp HCM'
go

select *
from dbo.view_63