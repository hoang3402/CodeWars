-- QUẢN LÝ CÔNG TRÌNH [Giải quyết các câu hỏi liên quan đến FUNCTION]

use QLSINHVIEN;
set dateformat dmy;

-- 53. Viết hàm xếp loại dựa vào điểm như sau: Nếu Diem>=8 thì xếp loại “Giỏi”, Diem từ 7 đến 8 thì xếp loại “Khá”, Diem từ 5 đến 7 thì xếp loại TB, ngược lại thì “Yếu”. 
go
create function XepLoai
(
    @Diem as float
) 
returns nvarchar(4)
as
begin
    return case
        when @Diem >= 8 then N'Giỏi'
        when @Diem >= 7 then N'Khá'
        when @Diem >= 5 then N'TB'
        else N'Yếu'
    end
end
go

select dbo.XepLoai(8)
select dbo.XepLoai(7)
select dbo.XepLoai(6)
select dbo.XepLoai(3)

-- 54. Viết hàm tách tên từ chuỗi họ tên. Sau đó tạo view hiển thị danh sách sinh viên gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), GioiTinh (Nam, Nữ) được sắp xếp theo thứ tự ưu tiên MaLop, Tên sinh viên. 
go
create function TachHoTen
(
    @HoTen as nvarchar(50)
)
returns nvarchar(50)
begin
    declare @RHoTen nvarchar(50)
    set @RHoTen = reverse(@HoTen)
    return reverse((select substring(@RHoTen, 1, charindex(' ', @RHoTen) - 1)))
end
go

select dbo.TachHoTen('Nguyen Van A')
select dbo.TachHoTen('Trần Văn Hoàng')
select dbo.TachHoTen('Lê Thị Sen')
select dbo.TachHoTen('Nguyễn Văn Huy')
select dbo.TachHoTen('Nguyễn Thị Cẩm Tú')

go
create view V_SinhVien
as
    select
        SINHVIEN.MaSV
        , SINHVIEN.HoTen
        , dbo.TachHoTen(SINHVIEN.HoTen) as TenSV
        , SINHVIEN.MaLop
        , SINHVIEN.NgaySinh
        , SINHVIEN.GioiTinh
    from dbo.SINHVIEN
    order by SINHVIEN.MaLop, dbo.TachHoTen(SINHVIEN.HoTen)
go

select *
from V_SinhVien
order by MaLop, TenSV

-- 55. Viết hàm đọc điểm nguyên [INT] ra thành chữ tương ứng. => không đọc số sau dấu phẩy.
go
create function DocDiem
(
    @Diem as int
)
returns nvarchar(20)
as
begin
    declare @myList table 
    (
        Id int,
        Name nvarchar(5)
    )
    insert into @myList
    values
        (0, N'Không'),
        (1, N'Một'),
        (2, N'Hai'),
        (3, N'Ba'),
        (4, N'Bốn'),
        (5, N'Năm'),
        (6, N'Sáu'),
        (7, N'Bảy'),
        (8, N'Tám'),
        (9, N'Chín'),
        (10, N'Mười')
    return (select Name
    from @myList
    where Id = @Diem)
end
go

select dbo.DocDiem(0)
select dbo.DocDiem(1)
select dbo.DocDiem(2)
select dbo.DocDiem(3)
select dbo.DocDiem(4)
select dbo.DocDiem(5)
select dbo.DocDiem(6)
select dbo.DocDiem(7)
select dbo.DocDiem(8)
select dbo.DocDiem(9)
select dbo.DocDiem(10)

-- 56. Viết hàm tính điểm trung bình chung của sinh viên có mã chỉ định ở học kỳ bất kỳ. 
go
create function DiemTB
(
    @MaSV as int,
    @MaHK as nvarchar(10) = 1
)
returns float
begin
    return (select ROUND(SUM(DiemHP * SoDVHT) / SUM(SoDVHT), 1) as DiemTBC
    from SINHVIEN, DiemHP, HOCPHAN
    where   (DiemHP.MaSV = SINHVIEN.MaSV)
        and (DiemHP.MaHP = HOCPHAN.MaHP)
        and (HOCPHAN.HocKy = @MaHK)
        and (SINHVIEN.MaSV = @MaSV)
    group by SINHVIEN.MaSV)
end
go

select dbo.DiemTB(5, default)
select dbo.DiemTB(5, 1)
select dbo.DiemTB(5, 2)

-- 57. Viết hàm tính tổng số đơn vị học trình của các học phần điểm < 5 của sinh viên có mã chỉ định. 
go
create function TongDVHT
(
    @MaSV as int
)
returns int
begin
    return (
    select SUM(SoDVHT) as SoDVHT
    from SINHVIEN, DiemHP, HOCPHAN
    where   (DiemHP.MaSV = SINHVIEN.MaSV)
        and (DiemHP.MaHP = HOCPHAN.MaHP)
        and (DiemHP.DiemHP < 5)
        and (SINHVIEN.MaSV = @MaSV)
    )
end
go

select dbo.TongDVHT(5)

-- 58. Viết hàm đếm số sinh viên có điểm HP. 
go
create function SoSV()
returns int
begin
    -- Vì sinh viên có thể có nhiều điểm HP, nên phải dùng 1 lệnh select để đếm số sinh viên có điểm HP. Nếu chỉ dùng 1 select return thì nó rối :v
    declare @list table (MaSV int)
    insert into @list
    select distinct MaSV
    from DiemHP

    return (select count(*)
    from @list)
end
go

select dbo.SoSV()

-- 59. Viết hàm đếm số học phần có điểm HP. 
go
create function SoHP()
returns int
begin
    -- Giống SoSV()
    declare @list table (MaHP int)
    insert into @list
    select distinct MaHP
    from DiemHP

    return (select count(*)
    from @list)
end
go

select dbo.SoHP()