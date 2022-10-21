-- BATCH

use QLDEAN;
set dateformat DMY

-- Viết đoạn batch để in ra tổng số dự án mà nhân viên có MANV = ‘005’ tham gia. Nếu tổng số dự án < 2 thì in ra “Tham gia ít” ngược lại in ra “ Tham gia nhiều”. Lưu ý, MaNV phải được sử dụng như biến, không gán giá trị trực tiếp vào điều kiện của câu truy vấn.
go
begin
    declare @SoDuAnThamGia int, @MaNhanVien varchar(10)
    set @MaNhanVien = '005'
    set @SoDuAnThamGia = (select
        COUNT(*) as expr1
    from dbo.PHANCONG
    where PHANCONG.MaNV = @MaNhanVien
  )
    if (@SoDuAnThamGia < 2)
    print N'Tham gia ít'
  else 
    print N'Tham gia nhiều'
end

-- Thêm một cột Email(varchar(30)) vào bảng NHANVIEN. Viết vòng lặp WHILE để chèn dữ liệu cho cột Email cho các nhân viên theo mẫu sau: ⦁	User_MaNV@mail.com. Ví dụ, nhân viên có mã số 101 được thêm vào dữ liệu : ⦁	User_101@mail.com
alter table dbo.NHANVIEN
add Email varchar(30);

update dbo.NHANVIEN
set Email = 'User_' + convert(varchar, MaNV) + '@mail.com'

select *
from NHANVIEN

-- Viết đoạn batch sử dụng SELECT …CASE để trả về thông tin của nhân viên cùng với độ tuổi của nhân viên. Trong đó, độ tuổi tính như sau: nếu tuổi của nhân viên từ 18 đến 30 là độ tuổi thanh niên, từ 31 đến 45 là trung niên, từ 46 đến 60 là cao niên.
go
select
    NHANVIEN.*,
    case
        when DATEDIFF(YEAR, NHANVIEN.NgaySinh, GETDATE()) between 18 and 30 then N'Thanh niên'
        when DATEDIFF(YEAR, NHANVIEN.NgaySinh, GETDATE()) between 31 and 45 then N'Trung niên'
        when DATEDIFF(YEAR, NHANVIEN.NgaySinh, GETDATE()) between 46 and 60 then N'Cao niên'
    end as N'Tuổi'
from dbo.NHANVIEN

