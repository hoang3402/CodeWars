-- QUẢN LÝ CÔNG TRÌNH [Giải quyết các câu hỏi liên quan đến THỦ TỤC]
use QLSINHVIEN;

set dateformat dmy;

-- 66. Tạo một Trigger không cho phép xoá nhiều hơn 2 lớp trong bảng LOP
go
create trigger Cau66
on LOP
for delete
as 
begin
    if ((select COUNT (*)
    from DELETED) > 2)
    begin
        print N'Bạn không thể xoá nhiều hơn 2 lớp!'
        rollback transaction
    end
end

-- 67. Tạo một Trigger sao cho khi xóa một sinh viên mới từ bảng SINHVIEN thì SiSo của lớp tương ứng trong bảng LOP tự động giảm xuống 1.
go
create trigger tg_CheckSiSo
on SINHVIEN
for delete
as
begin
    declare @ss int, @lop varchar(6)
    set @lop = (select MaLop
    from deleted)
    select @ss = Siso
    from Lop
    where Malop = @lop
    set @ss = @ss - 1
    update Lop set Siso = @ss where Malop = @lop
end

-- 68. Tạo một Trigger kiểm tra điều kiện cho cột Điểm là <=10
go
create trigger tg_CheckDiem
on DIEMHP
for update
as
begin
    if (
        (select DiemHP
        from inserted) <= 10 or
        (select DiemHP
        from deleted) <= 10
    )
    begin
        print N'Điểm hợp lệ!'
    end
    else
    begin
        print N'Điểm không hợp lệ!'
        rollback transaction
    end
end

-- 69. Tạo Trigger bẫy lỗi cho khoá ngoại của bảng SINHVIEN khi chỉnh sửa.
go
create trigger LOP_UPDATE
on SINHVIEN
for update
as
if update (MaLop)
begin
    if not exists (select *
    from LOP , INSERTED
    where LOP.MaLop=INSERTED.MaLop)
    begin
        print N'Mã lớp không có trong danh sách!'
        rollback transaction
    end
end

-- 70. Tạo ra Trigger sao cho khi cập nhật MaLop một sinh viên trong bảng SINHVIEN thì SiSo của lớp tương ứng trong bảng LOP tự động thay đổi.
go
create trigger Trg_SINHVIEN_UPDATE
on SINHVIEN
for update
as
if update(MaLop)
begin
    if not exists(select *
    from LOP , INSERTED
    where LOP.MaLop=INSERTED.MaLop)
    rollback transaction
else
begin
        update LOP
    set LOP.Siso=LOP.Siso-1
    from DELETED
    where LOP.MaLop=DELETED.MaLop
        update LOP
    set LOP.Siso=LOP.Siso+1
    from INSERTED
    where LOP.MaLop=INSERTED.MaLop
    end
end
-- 71. Hãy tạo ra Trigger sao cho khi sửa MaLop những sinh viên trong bảng SINHVIEN thì SiSo của lớp tương ứng trong bảng LOP tự động thay đổi.
go
create trigger trg_SINHVIEN_update_Siso
on SINHVIEN
for update
as
if update(MaLop)
begin
    if not exists(select *
    from LOP , INSERTED
    where LOP.MaLop=INSERTED.MaLop)
    rollback transaction
else
    begin
        update LOP
        set Siso = Siso - (select COUNT(DELETED.Masv)
        from DELETED)
        where MaLop in (select MaLop
        from DELETED)
        update LOP
        set Siso = Siso + (select COUNT(INSERTED.Masv)
        from INSERTED)
        where MaLop in (select MaLop
        from INSERTED)
    end
end

declare @temp int, @diachi nvarchar(30)
declare contro cursor for select *
from SINHVIEN
set @temp = 0
open contro
    fetch next from contro into @diachi
    while @@fetch_status = 0
    begin
    if (@diachi like N'Lâm Đồng')
        set @temp = @temp + 1
end
    print N'Số SV ở Lâm Đồng = ' + convert(nvarchar, @temp)
close contro
deallocate contro

select count(*) from SINHVIEN