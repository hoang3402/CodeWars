use QLTHUVIEN
set DATEFORMAT DMY

-- Hàm tạo index RB2
go
create function generation_index(@year int)
returns varchar(6)
as
begin
    declare @index int, @result varchar(10)
    set @index = (select
        COUNT(BanDoc.MaThe)
    from BanDoc
    where concat('20', convert(varchar, SUBSTRING(BanDoc.MaThe, 0, 3))) = @year
    group by SUBSTRING(BanDoc.MaThe, 0, 3)) + 1

    if (@index is null)
        set @index = 1

    set @result = '000000'
    set @result = stuff(@result, len(@result) - len(@index) + 1, len(@index), @index)
    set @result = stuff(@result, 1, 2, SUBSTRING(convert(varchar, @year), 3, 2))

    return @result
end
go

select dbo.generation_index(2005)
select dbo.generation_index(2006)
select dbo.generation_index(2000)
select dbo.generation_index(2007)

-- RB3
go
create function generation_MaSach(@MaTL varchar(10))
returns varchar(6)
as
begin
    declare @index int, @result varchar(10)
    set @index = (select
        COUNT(*)
    from Sach
    where SUBSTRING(Sach.MaSach, 1, 2) = @MaTL
    group by SUBSTRING(Sach.MaSach, 1, 2)) + 1

    if (@index is null) 
        set @index = 1

    set @result = '0000'
    set @result = stuff(@result, 4-len(@index) + 1, len(@index), @index)

    return concat(@MaTL, @result)
end
go

select dbo.generation_MaSach('TH')

-- RB4
go
create trigger Check_SLSach
on Sach
for insert
as
begin
    declare @SLSachMuon int, @SLSachTra int
    set @SLSachMuon = (select
        COUNT(MuonSach.MaThe)
    from MuonSach
    where MaThe = (select MaThe
    from inserted)
    )
    if (@SLSachMuon > 3) 
        begin
        set @SLSachTra = (select
            COUNT(MuonSach.NgayTra)
        from dbo.MuonSach
        where MaThe = (select MaThe
        from inserted)
        )
        if (@SLSachMuon - @SLSachTra > 3)
        begin
            print N'Mỗi độc giả không được giữ quá 3 quyển sách!'
            rollback transaction
        end
    end
end

-- RB5
go
create trigger Check_MuonSach
on MuonSach
for insert
as
begin
    declare @MaTheMuon varchar(10), @MaSachMuon varchar(10), @Check int
    set @MaTheMuon = (select MaThe
    from inserted)
    set @MaSachMuon = (select MaSach
    from inserted)

    set @check = (select COUNT(*)
    from MuonSach
    where (@MaTheMuon = MaThe)
        and (@MaSachMuon = MaSach)
        and (NgayTra is null))

    if (@check >= 1)
    begin
        print N'Bạn đang nợ quyển sách này!'
        rollback transaction
    end
end

-- câu 4 / RB6
go
create proc proc_CapNhatSach
    (
    @x varchar(10),
    @ThaoTac int
)
as
begin
    if (@ThaoTac = 2)
    begin
        update Sach
        set Soluong = SoLuong + 1
        where (MaSach = @x)
    end
    else
    begin
        update Sach
        set Soluong = SoLuong - 1
        where (MaSach = @x)
    end
end

select *
from Sach
exec dbo.proc_CapNhatSach @x = 'TH0003', @ThaoTac = 1
select *
from Sach
exec dbo.proc_CapNhatSach @x = 'TH0003', @ThaoTac = 2

