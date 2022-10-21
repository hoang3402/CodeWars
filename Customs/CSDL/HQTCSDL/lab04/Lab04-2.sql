use QuanLyBanHang
set DATEFORMAT DMY

--Câu 1. Tạo view có tên vw_CTPNHAP bao gồm các thông tin sau: số phiếu nhập hàng
--, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
go
create view vw_CTPNHAP
as
    select a.SoPN, MaVT, SLNhap, DGNhap, ThanhTien = (SLNhap * DGNhap)
    from PHIEUNHAP a, CTPHIEUNHAP c
    where a.SoPN = c.SoPN
go

select *
from vw_CTPNHAP
go
--Câu 2. Tạo view có tên vw_CTPNHAP_VT bao gồm các thông tin sau: số phiếu
--nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
go
create view vw_CTPNHAP_VT
as
    select a.SoPN, b.MaVT, TenVT, SLNhap, DGNhap, ThanhTien = (SLNhap * DGNhap)
    from PHIEUNHAP a, VATTU b, CTPHIEUNHAP c
    where a.SoPN = c.SoPN and c.MaVT = b.MaVT
go

select *
from vw_CTPNHAP_VT
go
--Câu 3. Tạo view có tên vw_CTPNHAP_VT_PN bao gồm các thông tin sau: số phiếu
--nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã vật tư, tên vật tư, số lượng nhập, đơn
--giá nhập, thành tiền nhập.
go
create view vw_CTPNHAP_VT_PN
as
    select a.SoPN, NgayNhap , SoDH, b.MaVT, TenVT, SLNhap, DGNhap, ThanhTien = (SLNhap * DGNhap)
    from PHIEUNHAP a, VATTU b, CTPHIEUNHAP c
    where a.SoPN = c.SoPN and c.MaVT = b.MaVT
go

select *
from vw_CTPNHAP_VT_PN
--Câu 4. Tạo view có tên vw_CTPHIEUNHAP_VT_PN_DH bao gồm các thông tin
--sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã nhà cung cấp, mã vật
--tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
go
create view vw_CTPHIEUNHAP_VT_PN_DH
as
    select b.SoPN, NgayNhap, c.SoDH, MaNCC, a.MaVT, TenVT, SLNhap, DGNhap, ThanhTien = DGNhap * SLNhap
    from VATTU a, CTPHIEUNHAP d, PHIEUNHAP b, DONDATHANG c
    where a.MaVT = d.MaVT and d.SoPN = b.SoPN and b.SoDH = c.SoDH
go
select *
from vw_CTPHIEUNHAP_VT_PN_DH
go
--Câu 5. Tạo view có tên vw_CTPNHAP_Loc bao gồm các thông tin sau: số phiếu
--nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. 
--Và chỉ liệt kê các chi tiết nhập có số lượng nhập > 5
go
alter view vw_CTNHAP_Loc
as
    select SoPN, MaVT, SLNhap, DGNhap, ThanhTien = DGNhap * SLNhap
    from CTPHIEUNHAP
    where  SLNhap > 5
go
select *
from vw_CTNHAP_Loc
--Câu 6. Tạo view có tên vw_CTPNHAP_VT_loc bao gồm các thông tin sau: 
--số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập,
--thành tiền nhập. Và chỉ liệt kê các chi tiết nhập vật tư có đơn vị tính là Bộ
go
create view vw_CTPNHAP_VT_loc
as
    select SoPN, b.MaVT, TenVT, SLNhap, DGNhap, ThanhTien = DGNhap * SLNhap
    from CTPHIEUNHAP a, VATTU b
    where a.MaVT = b.MaVT and DonViTinh = N'Bộ'
go
select *
from vw_CTPNHAP_VT_loc
--Câu 7. Tạo view có tên vw_CTPXUAT bao gồm các thông tin sau:
--số phiếu xuất hàng, mã vật tư, số lượng xuất, đơn giá xuất, thành tiền xuất
go
create view vw_CTPXUAT
as
    select SoPX, MaVT, SoLuong, DGXuat, ThanhTien = DGXuat * SoLuong
    from CTPHIEUXUAT
go
--Câu 8. Tạo view có tên vw_CTPXUAT_VT bao gồm các thông tin sau:
--số phiếu xuất hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất
go
create view vw_CTPXUAT_VT
as
    select SoPX, a.MaVT, TenVT, SoLuong, DGXuat
    from CTPHIEUXUAT A, VATTU B
    where a.MaVT = b.MaVT
go
--Câu 9. Tạo view có tên vw_CTPXUAT_VT_PX bao gồm các thông tin sau: 
--số phiếu xuất hàng, tên khách hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất
create view vw_CTPXUAT_VT_PX
as
    select c.SoPX, TenKH, a.MaVT, TenVT, SoLuong, DGXuat
    from CTPHIEUXUAT A, VATTU B, PHIEUXUAT c
    where a.MaVT = b.MaVT and a.SoPX = c.SoPX
go

--Câu 10. Viết function tên fn_ThongKeSLDatTheoNhaCungCap, 
--kiểu trả về là table: dùng để lấy tổng số lượng đặt theo từng nhà cung cấp.
go
create function dbo.ThongKeSLDatTheoNhaCungCap()
RETURNS table
as
return
  (select
    NHACUNGCAP.TenNCC as [MaNhaCC]
 , SUM(CTPHIEUNHAP.SLNhap) as [Tổng số lượng đặt]
from dbo.CTPHIEUNHAP
    inner join dbo.PHIEUNHAP
    on CTPHIEUNHAP.SoPN = PHIEUNHAP.SoPN
    inner join dbo.DONDATHANG
    on PHIEUNHAP.SoDH = DONDATHANG.SoDH
    inner join dbo.NHACUNGCAP
    on DONDATHANG.MaNCC = NHACUNGCAP.MaNCC
group by NHACUNGCAP.MaNCC
        ,NHACUNGCAP.TenNCC)
go

select *
from dbo.ThongKeSLDatTheoNhaCungCap()

-- Viết function tên fn_LayThongTinNhaCungCap, kiểu trả về là int và nhận tham số @MaNhaCC: dùng để đếm số hóa đơn của nhà cung cấp.
go
create function fn_LayThongTinNhaCungCap(@MaNhaCC varchar(10))
returns int
as
begin
    declare @result int
    set @result = (select distinct
        COUNT(CTDATHANG.SoDH)
    from dbo.CTDATHANG
        inner join dbo.DONDATHANG
        on CTDATHANG.SoDH = DONDATHANG.SoDH
    where 
    DONDATHANG.MaNCC = @MaNhaCC
    group by DONDATHANG.MaNCC)
    return @result
end
go

select dbo.fn_LayThongTinNhaCungCap('C01')

-- Viết function tên fn_LayThongTinPhieuNhap, kiểu trả về float và nhận tham số @SoPN: dùng để tính tổng số tiền nhập của @SoPN.
go
create function fn_LayThongTinPhieuNhap(@SoPN varchar(10))
returns float
as
begin
    declare @result float
    set @result = (select
        sum(CTPHIEUNHAP.DGNhap * CTPHIEUNHAP.SLNhap)
    from dbo.CTPHIEUNHAP
    where CTPHIEUNHAP.SoPN = @SoPN
    group by CTPHIEUNHAP.SoPN)
    if (@result is null)
        set @result = 0
    return @result
end
go

select dbo.fn_LayThongTinPhieuNhap('N001')
select dbo.fn_LayThongTinPhieuNhap('N002')
select dbo.fn_LayThongTinPhieuNhap('N003')
select dbo.fn_LayThongTinPhieuNhap('N004')

-- Viết function tên fn_LayThongTinPhieuXuat, kiểu trả về int và nhận tham số @year: dùng để đếm số phiếu xuất được lập trong năm @year.
go
create function fn_LayThongTinPhieuXuat(@year int)
returns int
as
begin
    declare @result int
    set @result = (select
        COUNT(*) as [Tổng số phiếu xuất]
    from dbo.PHIEUXUAT
    where YEAR(PHIEUXUAT.NgayXuat) = @year
    )
    if (@result is null)
        set @result = 0
    return @result
end
go

select dbo.fn_LayThongTinPhieuXuat(2007)

-- Viết function tên fn_LayThongTinVatTuTheoPhieuXuat, kiểu trả về table: dùng để đếm số vật tư theo từng phiếu xuất.
go
create function fn_LayThongTinVatTuTheoPhieuXuat()
returns table
as
return (select
    PHIEUXUAT.SoPX,
    COUNT(CTPHIEUXUAT.MaVT) as [Số vật tư]
from dbo.CTPHIEUXUAT
    inner join dbo.PHIEUXUAT
    on CTPHIEUXUAT.SoPX = PHIEUXUAT.SoPX
group by PHIEUXUAT.SoPX
)
go

select *
from dbo.fn_LayThongTinVatTuTheoPhieuXuat()

-- TRIGGER 

-- Tạo trigger khi update hoặc insert dữ liệu của bảng TONKHO, cột SLCuoi được tính theo công thức SLCuoi = SLDau + TongSLN – TongSLX
go
create trigger SLCuoi
on TONKHO
for insert, update
as
    update TONKHO 
    set SLCuoi = SLDau + TongSLNhap - TongSLXuat
go

-- Tạo trigger khi update cột SLNhap của bảng CTPNHAP thì cột TongSLN của bảng TONKHO được cập nhật theo.
go
create trigger SLNhap
on CTPHIEUNHAP
for update
as
    update TONKHO 
    set TongSLNhap += (select SLNhap
from inserted)
go

-- Tạo trigger khi update cột SLXuat của bảng CTPXUAT thì cột TongSLX của bảng TONKHO được cập nhật theo.
go
create trigger SLXuat
on CTPHIEUXUAT
for update
as
    update TONKHO
    set TongSLXuat -= (select SLXuat
from inserted)
go

-- Tạo trigger khi update hoặc insert cột SLNhap của bảng CTPNHAP thì tổng số lượng nhập <= tổng số lượng đặt của bảng CTDONDH.
go
create trigger SLNhap_CTPHIEUNHAP
on CTPHIEUNHAP
for insert, update
as
    declare @TongSLNhap int
    set @TongSLNhap = (select SLNhap
from inserted)
    if (@TongSLNhap > (select SLDat
from CTDATHANG))
    begin
    print N'Lỗi'
    rollback transaction
end
go

-- Tạo trigger khi delete một CTPNHAP thì cột TongSLN của bảng TONKHO được cập nhật tương ứng.
go
create trigger CTPNHAP
on CTPHIEUNHAP
for delete
as
begin
    update TONKHO
    set TongSLNhap -= (select SLNhap
    from inserted)
end
go

-- PROCEDURE 

-- Tạo Stored procedure (SP) cho biết tổng số lượng cuối của vật tư với mã vật tư là tham số vào
create proc TongSLCuoi(@MaVT varchar(10))
as
begin
    select
        TONKHO.SLCuoi
    from dbo.TONKHO
    where TONKHO.MaVT = @MaVT
end

-- Tạo SP cho biết tổng tiền xuất của vật tư với mã vật tư là tham số vào.
go
create proc TongTienXuat(@MaVT varchar(10))
as
begin
    select
        SUM(CTPHIEUXUAT.DGXuat * CTPHIEUXUAT.SLXuat)
    from dbo.CTPHIEUXUAT
    where CTPHIEUXUAT.MaVT = @MaVT
    group by CTPHIEUXUAT.MaVT
end

-- Tạo SP cho biết tổng số lượng đặt theo số đơn hàng với số đơn hàng là tham số vào.
go
create proc TongSLDat(@SoDH varchar(10))
as
begin
    select
        SUM(CTDATHANG.SLDat)
    from dbo.CTDATHANG
    where CTDATHANG.SoDH = @SoDH
    group by CTDATHANG.SoDH
end

-- Tạo SP dùng để thêm một đơn đặt hàng.
go
create proc insertDatHang(@SoDH varchar(10),
    @NgayDH date,
    @MaNCC varchar(10))
as
begin
    insert into CTDATHANG
    values
        (@SoDH, @NgayDH, @MaNCC)
end

-- Tạo SP dùng để thêm một chi tiết đơn đặt hàng.
go
create proc insertCTDatHang(@SoDH varchar(10),
    @MaVT varchar(10),
    @SLDat int)
as
begin
    insert into CTDATHANG
    values
        (@SoDH, @MaVT, @SLDat)
end