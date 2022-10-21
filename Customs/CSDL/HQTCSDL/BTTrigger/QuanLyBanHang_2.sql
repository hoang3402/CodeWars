use QuanLyBanHang
set DATEFORMAT DMY

-- Câu 1. Tạo trigger khi update hoặc insert dữ liệu của bảng TONKHO, cột SLCuoi được tính theo công thức SLCuoi = SLDau + TongSLN – TongSLX 

-- Câu 2. Tạo trigger khi update cột SLNhap của bảng CTPNHAP thì cột TongSLN của bảng TONKHO được cập nhật theo. 

-- Câu 3. Tạo trigger khi update cột SLXuat của bảng CTPXUAT thì cột TongSLX của bảng TONKHO được cập nhật theo. 

-- Câu 4. Tạo trigger khi update hoặc insert cột SLNhap của bảng CTPNHAP thì tổng số lượng nhập <= tổng số lượng đặt của bảng CTDONDH. 

-- Câu 5. Tạo trigger khi delete một CTPNHAP thì cột TongSLN của bảng TONKHO được cập nhật tương ứng. 

-- Viết trigger tự động tạo mã hàng trong bảng MATHANG khi thêm mới một mẫu tin.
go
create trigger generation_MaHang
on MATHANG
for insert
as
begin
    declare @index int
    set @index = (select count(*)
    from MATHANG) + 1
    begin
        update MATHANG1 set MaHang = concat('H', convert(varchar,@i))
            from MATHANG1 a, inserted b
            where (a.TenHang = b.TenHang)
            and (a.SoLuong = b.SoLuong)
            and (a.MaHang is null)
    end
end