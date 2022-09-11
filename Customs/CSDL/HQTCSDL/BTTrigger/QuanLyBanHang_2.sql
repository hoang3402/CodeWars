use QuanLyBanHang
set DATEFORMAT DMY

-- Câu 1. Tạo trigger khi update hoặc insert dữ liệu của bảng TONKHO, cột SLCuoi được tính theo công thức SLCuoi = SLDau + TongSLN – TongSLX 
go
create trigger Cau1 
on TONKHO
for update
as
begin
    set SLCuoi
end

-- Câu 2. Tạo trigger khi update cột SLNhap của bảng CTPNHAP thì cột TongSLN của bảng TONKHO được cập nhật theo. 

-- Câu 3. Tạo trigger khi update cột SLXuat của bảng CTPXUAT thì cột TongSLX của bảng TONKHO được cập nhật theo. 

-- Câu 4. Tạo trigger khi update hoặc insert cột SLNhap của bảng CTPNHAP thì tổng số lượng nhập <= tổng số lượng đặt của bảng CTDONDH. 

-- Câu 5. Tạo trigger khi delete một CTPNHAP thì cột TongSLN của bảng TONKHO được cập nhật tương ứng. 