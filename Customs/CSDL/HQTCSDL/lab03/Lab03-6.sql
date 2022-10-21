-- HÀM

-- Viết hàm trả về tổng tiền lương trung bình của một phòng ban tùy ý (truyền vào MaPB) 
go
create function LuongTBCuaPhongBan(@MaPB varchar(10))
returns int
as
begin
    declare @result int

    set @result = (select
        AVG(NHANVIEN.Luong)
    from dbo.NHANVIEN
    where NHANVIEN.MaPhong = @MaPB
    group by NHANVIEN.MaPhong)

    if (@result is null)
        set @result = 0

    return @result
end

-- Viết hàm trả về tổng lương nhận được của nhân viên theo dự án (truyền vào MaNV và MaDA)
go
create function TongLuongCuaNVTheoDuAn(@MaNV varchar(10), @MaDA varchar(10))
returns int
as
begin
    declare @result int

    set @result = (select
        SUM(NHANVIEN.Luong)
    from dbo.PHANCONG
        inner join dbo.NHANVIEN
        on PHANCONG.MaNV = NHANVIEN.MaNV
    where NHANVIEN.MaNV = 3
        and PHANCONG.MaDA = 2
    group by PHANCONG.MaDA
    )

    if (@result is null)
        set @result = 0

    return @result
end

-- Viết hàm trả về tổng tiền lương trung bình của các phòng ban
go
create function LuongTBCuaCacPhongBan()
returns int
as
begin
    declare @result int

    set @result = (select
        AVG(a.LuongCacPhong)
    from (select
            AVG(NHANVIEN.Luong) as LuongCacPhong
        from dbo.NHANVIEN
        group by NHANVIEN.MaPhong) as a)

    if (@result is null)
        set @result = 0

    return @result
end

-- Viết hàm trả về tổng tiền thưởng cho nhân viên dựa vào tổng số giờ tham gia dự án(Time_Total) như sau:
-- a. Nếu Time_Total >= 30 và <= 60 thì tổng tiền thưởng = 500 ($)
-- b. Nếu Time_Total > 60 và = 100 và = 150 thì tổng tiền thưởng = 1600 ($) 
go
create function TongTienThuong(@MaNV varchar(10), @MaDA varchar(10))
returns int
as
begin
    declare @Time_Total int, @result int

    set @Time_Total = (select
        SUM(PHANCONG.ThoiGian)
    from dbo.PHANCONG
    where PHANCONG.MaDA = @MaDA
        and PHANCONG.MaNV = @MaNV
    group by PHANCONG.MaNV
        ,PHANCONG.MaDA)

    if (@Time_Total >= 30 and @Time_Total <= 60)
        set @result = 500

    if (@Time_Total > 60 and @Time_Total <= 150)
        set @result = 1600

    return @result
end

-- Viết hàm trả ra tổng số dự án theo mỗi phòng ban.
go
create function TongDuAnCuaPhongBan(@MaPB varchar(10))
returns int
as
begin
    declare @result int

    set @result = (select
        COUNT(*) as expr1
    from dbo.DEAN
        inner join dbo.PHONGBAN
        on DEAN.MaPhong = PHONGBAN.MaPhong
    where PHONGBAN.MaPhong = @MaPB
    group by PHONGBAN.MaPhong)

    if (@result is null)
        set @result = 0

    return @result
end

-- THỦ TỤC

-- Tạo thủ tục IN_PROC_DEAN cho phép thêm dữ liệu vào bảng đề án với các tham số vào là các field của bảng DEAN
go
create proc IN_PROC_DEAN(@IN_MaDA varchar(10),
    @IN_TenDA nvarchar(30),
    @IN_DiaDiemDA nvarchar(30),
    @IN_MaPhong varchar(10))
as
begin
    insert into DeAn
    values
        (@IN_MaDA, @IN_TenDA, @IN_DiaDiemDA, @IN_MaPhong)
    print N'Xong'
end

-- Tạo thủ tục SE_PRO_DEAN cho phép xem các đề án có địa điểm đề án được truyền vào khi gọi thủ tục
go
create proc SE_PRO_DEAN(@DiaDiemDA nvarchar(30))
as
begin
    select
        DEAN.*
    from dbo.DEAN
    where DEAN.DiaDiemDA = @DiaDiemDA
    print N'Xong'
end

-- Tạo thủ tục UP_PROC_DEAN cho phép cập nhật lại địa điểm đề án là Bà Rịa Vũng Tàu cho các đề án có địa điểm Vung Tau với 2 tham số truyền vào là diadiem_old, diadiem_new.
go
create proc UP_PROC_DEAN(@diadiem_old nvarchar(30),
    @diadiem_new nvarchar(30))
as
begin
    update dbo.DEAN
    set DiaDiemDA = @diadiem_new
    where DiaDiemDA = @diadiem_old

    print N'Xong'
end

-- Tạo thủ tục DEL_PROC_DEAN cho phép xóa các đề án đã thêm vào thông qua thủ tục IN_PROC_DEAN. Tham số truyền vào là MaDA.
go
create proc DEL_PROC_DEAN(@MaDA varchar(10))
as
begin
    delete from dbo.DEAN
    where MaDA = @MaDA
    print N'Xong'
end

-- Tạo thủ tục có tham số vào là MaNV, tham số ra (OUTPUT) là tổng số giờ (tổng thời gian) làm việc của nhân viên của tất cả các dự án.
go
create proc proc_TongSoGioLam(@MaNV varchar(10))
as
begin
    select
        MAX(PHANCONG.ThoiGian) as expr1
    from dbo.PHANCONG
    where PHANCONG.MaNV = @MaNV
    group by PHANCONG.MaNV
    print N'Xong'
end

-- Viết thủ tục có tên INSERT_DEAN để thêm dữ liệu vào bảng DEAN thỏa mãn các ràng buộc sau:
-- kiểm tra MADEAN cần chèn có rỗng không hoặc có trùng với các mã đề án khác đã có trong bảng đề án không. Nếu có hãy thông báo lỗi “Bị trùng mã đề án hoặc mã đề án rỗng, chọn mã đề án khác!!!”.
go
create proc IN_PROC_DEAN(@IN_MaDA varchar(10),
    @IN_TenDA nvarchar(30),
    @IN_DiaDiemDA nvarchar(30),
    @IN_MaPhong varchar(10))
as
begin
    if (@IN_MaDA is null)
    begin
        print N'Mã đề án rỗng (null)'
        return
    end

    if exists (select
        DEAN.MaDA
    from dbo.DEAN
    where MaDA = @IN_MaDA)
    begin
        print N'Bị trùng mã đề án hoặc mã đề án rỗng, chọn mã đề án khác!!!'
        return
    end

    insert into DeAn
    values
        (@IN_MaDA, @IN_TenDA, @IN_DiaDiemDA, @IN_MaPhong)
    print N'Xong'
end
