-- Nguyễn Văn Hoàng_12101005

use QuanLyNhaDat
set dateformat DMY

-- Câu 3. Tạo view có tên vw_Cau2 cho biết danh sách những ngôi nhà đáp ứng theo yêu cầu của các khách hàng gồm các thông tin như: Mã KH, Loại nhà, GiaTu, GiaDen. (1đ)
go
create view vw_Cau2
as
    select KHACHHANG.MaKH, KHACHHANG.MaLN, LOAINHA.MoTa, GiaTu, GiaDen
    from KHACHHANG
        inner join LOAINHA on KHACHHANG.MaLN = LOAINHA.MaLN
go

select *
from vw_Cau2

-- Câu 4. Viết hàm có tên fn_Cau4 lấy ra danh sách nhà phù hợp với yêu cầu về loại nhà, giá nhà của khách hàng nào đó (Mã khách hàng là tham số đầu vào). (2đ)
go
create function fn_Cau4(@MaKH varchar(10))
returns table
as
    return (select
    NHA.*, LOAINHA.MoTa
from dbo.KHACHHANG
    inner join dbo.LOAINHA
    on KHACHHANG.MaLN = LOAINHA.MaLN
    inner join dbo.NHA
    on NHA.MaLN = LOAINHA.MaLN
where (NHA.SoTien between KHACHHANG.GiaTu and KHACHHANG.GiaDen)
    and (KHACHHANG.MaKH = @MaKH)
)
go

select *
from fn_Cau4('KH01')
select *
from fn_Cau4('KH02')

-- Câu 5. Tạo bảng mới có tên là DSXemNha gồm các thông tin: STT, MaKH, TenKH, SDT, MaNha, Quan, Duong, MaLN, SoPhong, SoTienNha, GiaTu, GiaDen, MaCN. (1đ)
select
    identity(int,1,1) as STT,
    KHACHHANG.MaKH, KHACHHANG.HoTen as TenKH, KHACHHANG.DienThoai, NHA.MaNha, NHA.Quan, NHA.Duong, NHA.MaLN, NHA.SoPhong, NHA.SoTien, KHACHHANG.GiaTu, KHACHHANG.GiaDen, NHA.MaCN
into DSXemNha
from dbo.KHACHHANG
    inner join dbo.NHA
    on KHACHHANG.MaLN = NHA.MaLN

-- Câu 6. Viết thủ tục có tên usp_HopDong thêm vào bảng HopDongThue đối với những khách hàng đã xem nhà và không có nhận xét gì (cột NhanXet của bảng XemNha là null). Các thông tin thêm vào của bảng gồm: MaKH, MaNha, NgayBD, NgayKT, TienCoc, GhiChu. Trong đó, các thông tin: NgayBD là ngày hiện tại của hệ thống (định dạng dd/mm/yy), NgayKT, TienCoc và GhiChu để trống. (2đ)
go
alter proc usp_HopDong
as
begin
    insert into dbo.HopDongThue
        (MaKH, MaNha, NgayBD)
    values
        ((select XEMNHA.MaKH
            from dbo.XEMNHA
            where XEMNHA.NhanXet like ''), (select XEMNHA.MaNha
            from dbo.XEMNHA
            where XEMNHA.NhanXet like ''), GETDATE())
    select *
    from HopDongThue
end
go

exec usp_HopDong