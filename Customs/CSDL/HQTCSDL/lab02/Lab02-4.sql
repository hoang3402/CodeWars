-- QUẢN LÝ CÔNG TRÌNH [Giải quyết các câu hỏi liên quan đến THỦ TỤC]
use QLSINHVIEN;

set dateformat dmy;

-- 60. Tạo thủ tục hiển thị danh sách gồm MaSV, HoTen, MaLop, DiemHP, MaHP của những sinh viên có DiemHP nhỏ hơn số chỉ định, nếu không có thì hiển thị thông báo không có sinh viên nào.
go
create procedure showDSSV(@SoChiDinh int)
as
begin
    if not exists (select SINHVIEN.MaSV , HoTen , MaLop , DiemHP , MaHP
    from SINHVIEN , DiemHP
    where   (DiemHP.MaSV = SINHVIEN.MaSV)
        and (DiemHP < @SoChiDinh))
        print N'Không có sinh viên nào'
    else 
        select SINHVIEN.MaSV , HoTen , MaLop , DiemHP , MaHP
    from SINHVIEN , DiemHP
    where   (DiemHP.MaSV = SINHVIEN.MaSV)
        and (DiemHP < @SoChiDinh)
end
go
exec dbo.showDSSV @SoChiDinh = 5;

-- 61. Tạo thủ tục hiển thị Hoten sinh viên CHƯA học học phần có mã chỉ định, Kiểm tra Mã học phần chỉ định có trong danh mục không, Nếu không có thì hiển thị thông báo không có học phần này. 
go
create procedure cau61(@MaHPChiDinh int)
as
begin
    if (@MaHPChiDinh in (select distinct MaHP
    from HOCPHAN))
        select distinct HoTen
    from SINHVIEN
    where MaSV not in (select distinct MaSV
    from DIEMHP
    where MaHP = @MaHPChiDinh
    )
    else print N'không có học phần này'
end
go
exec dbo.cau61 @MaHPChiDinh = 65;

exec dbo.cau61 @MaHPChiDinh = 3;

-- 52. Tạo thủ tục hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), GioiTinh (Nam, Nữ),Tuổi của những sinh viên có tuổi trong khoảng chỉ định. Nếu không có thì hiển thị thông báo không có sinh viên nào.
go
create procedure cau52
    (@TuoiChiDinhDuoi int
    ,
    @TuoiChiDinhTren int)
as
begin
    declare @Tuoi int
    if not exists (select MaSV
    from SINHVIEN
    where datediff(year, SINHVIEN.NgaySinh, getdate()) between @TuoiChiDinhDuoi and @TuoiChiDinhTren)
        print N'Không có sinh viên nào';
    else
    select
        MaSV
        , HoTen
        , MaLop
        , format(SINHVIEN.NgaySinh, 'dd/mm/yyyy') as N'Ngày sinh'
        , GioiTinh
    from
        SINHVIEN
    where 
        datediff(year, SINHVIEN.NgaySinh, getdate()) between @TuoiChiDinhDuoi and @TuoiChiDinhTren
end
go

exec dbo.cau52 @TuoiChiDinhDuoi = 25, @TuoiChiDinhTren = 26
exec dbo.cau52 @TuoiChiDinhDuoi = 2, @TuoiChiDinhTren = 10
exec dbo.cau52 @TuoiChiDinhDuoi = 524, @TuoiChiDinhTren = 525

-- 53. Tạo thủ tục cho biết MaKhoa, Tên Khoa, tổng số sinh viên của Khoa chỉ định. Kiểm tra điều kiện Mã khoa có trong bảng danh mục không.
go
alter procedure proc_cau53
    (@MaKhoaChiDinh varchar(10))
as
begin
    if not exists (select MaKhoa
    from KHOA
    where MaKhoa = @MaKhoaChiDinh)
        print N'Mã khoa không tồn tại';
    else
    select
        KHOA.MaKhoa
        , KHOA.TenKhoa
        , COUNT(SINHVIEN.MaSV) as N'Tổng số sinh viên'
    from dbo.SINHVIEN
        inner join dbo.LOP on SINHVIEN.MaLop = LOP.MaLop
        inner join dbo.NGANH on LOP.MaNganh = NGANH.MaNganh
        full outer join dbo.KHOA on NGANH.MaKhoa = KHOA.MaKhoa
    where KHOA.MaKhoa = @MaKhoaChiDinh
    group by KHOA.MaKhoa, KHOA.TenKhoa
end
go

proc_cau53 @MaKhoaChiDinh = 'KT'

-- 54. Tạo thủ tục hiển thị MaLop,TenLop, Tổng số SV mỗi lớp của khoa có mã chỉ định, Kiểm tra điều kiện MaKhoa có trong bảng Danh mục không, Nếu không có thì hiển thị thông báo Không có lớp này.
go
create proc proc_cau54(@MaKhoaChiDinh varchar(10))
as
begin
    if not exists (select *
    from KHOA
    where MaKhoa = @MaKhoaChiDinh)
        print N'Không có mã khoa này'
    else
    select
        LOP.MaLop
    , LOP.TenLop
    , COUNT(SINHVIEN.MaSV) as expr1
    from dbo.SINHVIEN
        inner join dbo.LOP
        on SINHVIEN.MaLop = LOP.MaLop
    group by LOP.MaLop
            ,LOP.TenLop
end
go

exec dbo.proc_cau54 'CNTT'

-- 55. Tạo thủ tục tính điểm trung bình chung từng học kỳ theo từng sinh viên của lớp có mã chỉ định.
go
create procedure proc_cau55(@MaLopChiDinh varchar(10))
as
begin
    select
        SINHVIEN.MaSV,
        HoTen,
        HocKy,
        ROUND(SUM(DiemHP * SoDVHT) / SUM(SoDVHT), 1) as DiemTBC
    from
        SINHVIEN, DiemHP, HOCPHAN
    where
        (DiemHP.MaSV = SINHVIEN.MaSV)
        and (DiemHP.MaHP = HOCPHAN.MaHP)
        and (MaLop = @MaLopChiDinh)
    group by SINHVIEN.MaSV, HoTen, HocKy
end

exec proc_cau55 @MaLopChiDinh = CT12

-- 56. Tạo thủ tục hiển thị danh sách gồm: MaSV, HoTen, MaLop, MaKhoa, NgaySinh (dd/mm/yyyy),GioiTinh (Nam, Nữ) của những sinh viên ở Khoa có mã chỉ định, Nếu không có thì hiển thị thông báo Không có sinh viên nào.
go
create proc proc_cau56(@MaKhoaChiDinh varchar(10))
as
begin
    if not exists(select *
    from NGANH
    where MaKhoa=@MaKhoaChiDinh)
        print N'Khoa này không có trong danh mục'
    else
    begin
        select MaSV,
            HoTen,
            LOP.MaLop,
            GioiTinh,
            convert (char(10),ngaysinh,103) as NgaySinh
        from SINHVIEN, LOP, NGANH
        where (SINHVIEN.MaLop = LOP.MaLop)
            and (LOP.MaNganh = NGANH.MaNganh)
            and (MaKhoa=@MaKhoaChiDinh)
    end
end

exec proc_cau56 @MaKhoaChiDinh = CNTT

-- 57. Tạo thủ tục cho biết Hoten sinh viên KHÔNG có điểm HP < 5 ở lớp có mã chỉ định, Kiểm tra Mã lớp chỉ định có trong danh mục không, Nếu không thì hiển thị thông báo.
go
create proc proc_cau57(@MaLopChiDinh varchar(10))
as
if not exists (select *
from LOP
where MaLop = @MaLopChiDinh)
    print N'Lớp này không có trong danh mục'
else
select MaSV, HoTen
from SINHVIEN
where MaLop = @MaLopChiDinh
    and MaSV not in(select MaSV
    from DIEMHP
    where DiemHP<5)

exec proc_cau57 @MaLopChiDinh = CT12
-- 58. Tạo thủ tục hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), GioiTinh(Nam, Nữ), của những sinh viên học lớp có mã chỉ định. Kiểm tra MaLop chỉ định có tồn tại trong bảng không, nếu không có thì hiển thị thông báo Không có lớp đó.
go
create proc proc_cau58(@MaLopChiDinh varchar(10))
as
begin
    if not exists (select *
    from SINHVIEN
    where MaLop = @MaLopChiDinh)
        print N'Lớp đó không có trong danh mục'
    else 
    begin
        select MaSV, HoTen, MaLop, GioiTinh
        from SINHVIEN
        where MaLop = @MaLopChiDinh
    end
end

exec proc_cau58 @MaLopChiDinh = CT12