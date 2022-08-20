-- QUẢN LÝ SINH VIÊN [Giải quyết các câu hỏi]

use QLSINHVIEN
set DATEFORMAT DMY

-- 1. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), GioiTinh (Nam, Nữ), NamSinh của những sinh viên có họ không bắt đầu bằng chữ N,L,T. 
select
    MaSV
 , HoTen
 , MaLop
 , NgaySinh
 , GioiTinh
from SINHVIEN
where (HoTen not like 'N%')
    and (HoTen not like 'L%')
    and (HoTen not like 'T%')

-- 2. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), GioiTinh (Nam, Nữ), NamSinh của những sinh viên nam học lớp CT11. 
select
    MaSV
 , HoTen
 , MaLop
 , NgaySinh
 , GioiTinh
from SINHVIEN
where (MaLop = 'CT11')
    and (GioiTinh = 'Nam')

-- 3. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), GioiTinh (Nam, Nữ) của những sinh viên học lớp CT11,CT12,CT13. 
select
    MaSV
 , HoTen
 , MaLop
 , NgaySinh
 , GioiTinh
from SINHVIEN
where MaLop in ('CT11', 'CT12', 'CT13')

-- 4. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), GioiTinh (Nam, Nữ), Tuổi của những sinh viên có tuổi từ 19-21. 
select
    MaSV
 , HoTen
 , MaLop
 , NgaySinh
 , GioiTinh
from SINHVIEN
where (DATEDIFF(YEAR, NgaySinh, GETDATE()) >= 19)
    and (DATEDIFF(YEAR, NgaySinh, GETDATE()) <= 21)

-- 5. Hiển thị danh sách gồm MaSV, HoTên, MaLop, DiemHP, MaHP của những sinh viên có điểm HP>=5. 
select
    SINHVIEN.MaSV
 , HoTen
 , MaLop
 , DiemHP
 , MaHP
from SINHVIEN
    , DiemHP
where (DiemHP.MaSV = SINHVIEN.MaSV)
    and (DiemHP >= 5)

-- 6. Hiển thị danh sách MaSV, HoTen , MaLop, MaHP, DiemHP được sắp xếp theo ưu tiên Mã lớp, Họ tên tăng dần. 
select
    SINHVIEN.MaSV
 , HoTen
 , MaLop
 , DiemHP
 , MaHP
from SINHVIEN
    , DiemHP
where (DiemHP.MaSV = SINHVIEN.MaSV)
order by MaLop, HoTen asc

-- 7. Hiển thị danh sách gồm MaSV, HoTen, MaLop, DiemHP, MaHP của những sinh viên có điểm HP từ 5 đến 7 ở học kỳ I. 
select
    SINHVIEN.MaSV
 , HoTen
 , MaLop
 , DiemHP
 , DiemHP.MaHP
from SINHVIEN
    , DiemHP
    , HOCPHAN
where (DiemHP.MaSV = SINHVIEN.MaSV)
    and (DiemHP.MaHP = HOCPHAN.MaHP)
    and (HocKy = 1)
    and (DiemHP between 5 and 7)

-- 8. Hiển thị danh sách sinh viên gồm MaSV, HoTen, MaLop, TenLop, MaKhoa của Khoa có mã CNTT. 
select
    SINHVIEN.MaSV
 , HoTen
 , LOP.MaLop
 , TenLop
 , KHOA.MaKhoa
from SINHVIEN
    , LOP
    , NGANH
    , KHOA
where (SINHVIEN.MaLop = LOP.MaLop)
    and (LOP.MaNganh = NGANH.MaNganh)
    and (NGANH.MaKhoa = KHOA.MaKhoa)
    and (KHOA.MaKhoa = 'CNTT')

-- 9. Cho biết MaLop, TenLop, tổng số sinh viên của mỗi lớp.
select
    LOP.MaLop
 , LOP.TenLop
 , COUNT(*) as SoSinhVien
from LOP
    , SINHVIEN
where (LOP.MaLop = SINHVIEN.MaLop)
group by LOP.MaLop
        ,LOP.TenLop

-- 10. Cho biết điểm trung bình chung của mỗi sinh viên, xuất ra bảng mới có tên DIEMTBC, biết rằng công thức tính DiemTBC như sau: DiemTBC = tổng (DiemHP * SoDvht) / tổng (SoDvht)
select
    SINHVIEN.MaSV
 , HoTen
 , ROUND(SUM(DiemHP * SoDVHT) / SUM(SoDVHT), 1) as DiemTBC
from SINHVIEN
    , DiemHP
    , HOCPHAN
where (DiemHP.MaSV = SINHVIEN.MaSV)
    and (DiemHP.MaHP = HOCPHAN.MaHP)
group by SINHVIEN.MaSV
        ,HoTen

-- 11. Cho biết điểm trung bình chung của mỗi sinh viên ở mỗi học kỳ.
select
    SINHVIEN.MaSV
 , HoTen
 , HocKy
 , ROUND(SUM(DiemHP * SoDVHT) / SUM(SoDVHT), 1) as DiemTBC
from SINHVIEN
    , DiemHP
    , HOCPHAN
where (DiemHP.MaSV = SINHVIEN.MaSV)
    and (DiemHP.MaHP = HOCPHAN.MaHP)
group by SINHVIEN.MaSV
        ,HoTen
        ,HocKy

-- 12. Cho biết MaLop, TenLop, số lượng nam nữ theo từng lớp. 
select
    LOP.MaLop
 , TenLop
 , GioiTinh
 , COUNT(GioiTinh)
from SINHVIEN
    , LOP
where (SINHVIEN.MaLop = LOP.MaLop)
group by LOP.MaLop
        ,TenLop
        ,GioiTinh

-- 13. Cho biết điểm trung bình chung của mỗi sinh viên ở học kỳ 1. DiemTBC = tổng (DiemHP * SoDvht) / tổng (SoDvht) 
select
    SINHVIEN.MaSV
 , HoTen
 , ROUND(SUM(DiemHP * SoDVHT) / SUM(SoDVHT), 1) as DiemTBC
from SINHVIEN
    , DiemHP
    , HOCPHAN
where (DiemHP.MaSV = SINHVIEN.MaSV)
    and (DiemHP.MaHP = HOCPHAN.MaHP)
    and (HocKy = 1)
group by SINHVIEN.MaSV
        ,HoTen

-- 14. Cho biết MaSV, HoTen, Số các học phần thiếu điểm (DiemHP < 5) của mỗi sinh viên. 
select
    SINHVIEN.MaSV
 , HoTen
 , COUNT(DiemHP) as 'So hoc phan thieu diem'
from SINHVIEN
    , DIEMHP
where (DiemHP.MaSV = SINHVIEN.MaSV)
    and (DiemHP < 5)
group by SINHVIEN.MaSV
        ,HoTen

-- 15. Đếm số sinh viên có điểm HP < 5 của mỗi học phần. 
select
    MaHP
 , COUNT(DiemHP) as 'So sinh vien thieu diem'
from DiemHP
where DiemHP < 5
group by MaHP

-- 16. Tính tổng số đơn vị học trình có điểm HP < 5 của mỗi sinh viên 
select
    SINHVIEN.MaSV
 , HoTen
 , SUM(SoDVHT) as 'tong so don vi hoc phan thieu diem'
from SINHVIEN
    , DIEMHP
    , HOCPHAN
where (DiemHP.MaSV = SINHVIEN.MaSV)
    and (HOCPHAN.MaHP = DIEMHP.MaHP)
    and (DiemHP < 5)
group by SINHVIEN.MaSV
        ,HoTen

-- 17. Cho biết MaLop, TenLop có tổng số sinh viên > 10. 
select
    LOP.MaLop
 , TenLop
 , COUNT(SINHVIEN.MaSV) as N'tổng số sinh viên'
from SINHVIEN
    , LOP
where SINHVIEN.MaLop = LOP.MaLop
group by LOP.MaLop
        ,TenLop
having COUNT(SINHVIEN.MaSV) > 10

-- 18. Cho biết HoTen sinh viên có điểm Trung bình chung các học phần < 3 
select
    SINHVIEN.MaSV
 , HoTen
 , ROUND(SUM(DiemHP * SoDVHT) / SUM(SoDVHT), 1) as DiemTBC
from SINHVIEN
    , DiemHP
    , HOCPHAN
where (DiemHP.MaSV = SINHVIEN.MaSV)
    and (DiemHP.MaHP = HOCPHAN.MaHP)
group by SINHVIEN.MaSV
        ,HoTen
having ROUND(SUM(DiemHP * SoDVHT) / SUM(SoDVHT), 1) < 3

-- 19. Cho biết HoTen sinh viên có ít nhất 2 học phần có điểm < 5. 
select
    HoTen
from SINHVIEN
    , DIEMHP
where (SINHVIEN.MaSV = DIEMHP.MaSV)
    and (DiemHP < 5)
group by HoTen
having COUNT(MaHP) >= 2

-- 20. Cho biết HoTen sinh viên học TẤT CẢ các học phần ở ngành 140902. 
select distinct
    HoTen
from SINHVIEN
    , DIEMHP
    , HOCPHAN
where (SINHVIEN.MaSV = DIEMHP.MaSV)
    and (DIEMHP.MaHP = HOCPHAN.MaHP)
    and (MaNganh like '140902')

-- 21. Cho biết HoTen sinh viên học ít nhất 3 học phần mã ‘001’, ‘002’, ‘003’. 
select
    HoTen
from SINHVIEN
    , DIEMHP
where SINHVIEN.MaSV = DIEMHP.MaSV
    and (MaHP in ('001', '002', '003'))
group by HoTen
having COUNT(MaHP) >= 3

-- 22. Cho biết MaSV, HoTen sinh viên có điểm TBC cao nhất ở học kỳ 1. 
select
    SINHVIEN.MaSV
 , HoTen
from SINHVIEN
    , DIEMHP
    , HOCPHAN
where (DIEMHP.MaSV = SINHVIEN.MaSV)
    and (DIEMHP.MaHP = HOCPHAN.MaHP)
group by SINHVIEN.MaSV
        ,HoTen
having ROUND(SUM(DiemHP * SoDVHT) / SUM(SoDVHT), 1) >= all (select
    ROUND(SUM(DiemHP * SoDVHT) / SUM(SoDVHT), 1) as DiemTBC
from SINHVIEN
      , DIEMHP
      , HOCPHAN
where (DIEMHP.MaSV = SINHVIEN.MaSV)
    and (DIEMHP.MaHP = HOCPHAN.MaHP)
    and (HocKy = 1)
group by SINHVIEN.MaSV)

-- 23. Cho biết MaSV, HoTen sinh viên có số học phần [điểmHP < 5] nhiều nhất. 
select distinct
    SINHVIEN.MaSV
 , HoTen
from SINHVIEN
    , DIEMHP
where (DIEMHP.MaSV = SINHVIEN.MaSV)
    and (DiemHP < 5)
group by SINHVIEN.MaSV
        ,HoTen
having (COUNT(MaHP) >= all (select
    COUNT(MaHP)
from SINHVIEN
      , DIEMHP
where (DIEMHP.MaSV = SINHVIEN.MaSV)
    and (DiemHP < 5)
group by SINHVIEN.MaSV)
)

-- 24. Cho biết MaHP, TenHP có số sinh viên điểm HP < 5 nhiều nhất. 
select distinct
    HOCPHAN.MaHP
 , HOCPHAN.TenHP
from dbo.DIEMHP
    inner join dbo.HOCPHAN
    on DIEMHP.MaHP = HOCPHAN.MaHP
where DIEMHP.DiemHP < 5
group by HOCPHAN.MaHP
        ,HOCPHAN.TenHP
having COUNT(DIEMHP.DiemHP) <= all (select
    COUNT(DIEMHP.DiemHP) as expr1
from dbo.DIEMHP
    inner join dbo.HOCPHAN
    on DIEMHP.MaHP = HOCPHAN.MaHP
where DIEMHP.DiemHP < 5
group by DIEMHP.MaHP)

-- 25. Cho biết Họ tên sinh viên KHÔNG học học phần nào. 
select
    HoTen
from SINHVIEN
where MaSV not in (select
    SINHVIEN.MaSV
from SINHVIEN
      , DIEMHP
      , HOCPHAN
where (DIEMHP.MaSV = SINHVIEN.MaSV)
    and (DIEMHP.MaHP = HOCPHAN.MaHP)
group by SINHVIEN.MaSV)

-- 26. Cho biết Họ tên sinh viên CHƯA học học phần có mã ‘001’. 
select
    HoTen
from SINHVIEN
where MaSV not in (select
    SINHVIEN.MaSV
from SINHVIEN
      , DIEMHP
      , HOCPHAN
where (DIEMHP.MaSV = SINHVIEN.MaSV)
    and (DIEMHP.MaHP = HOCPHAN.MaHP)
    and (HOCPHAN.MaHP = '001')
group by SINHVIEN.MaSV)

-- 27. Cho biết Tên học phần KHÔNG có sinh viên điểm HP < 5 
select
    TenHP
from HOCPHAN
where TenHP not in (select distinct
    TenHP
from SINHVIEN
      , DIEMHP
      , HOCPHAN
where (DIEMHP.MaSV = SINHVIEN.MaSV)
    and (DIEMHP.MaHP = HOCPHAN.MaHP)
    and (DiemHP < 5))

-- 28. Cho biết Họ tên sinh viên KHÔNG có học phần điểm HP < 5 
select
    HoTen
from SINHVIEN
where HoTen not in (select distinct
    HoTen
from SINHVIEN
      , DIEMHP
      , HOCPHAN
where (DIEMHP.MaSV = SINHVIEN.MaSV)
    and (DIEMHP.MaHP = HOCPHAN.MaHP)
    and (DiemHP < 5))

-- 29. Cho biết Tên lớp có sinh viên tên Hoa. 
select distinct
    TenLop
from LOP
    , SINHVIEN
where (LOP.MaLop = SINHVIEN.MaLop)
    and (HoTen like N'%Hoa')

-- 30. Cho biết HoTen sinh viên có điểm học phần ‘001’ là < 5 
select distinct
    HoTen
from SINHVIEN
    , DIEMHP
    , HOCPHAN
where (DIEMHP.MaSV = SINHVIEN.MaSV)
    and (DIEMHP.MaHP = HOCPHAN.MaHP)
    and (HOCPHAN.MaHP = 1)
    and (DiemHP < 5)

-- 31. Cho biết danh sách các học phần có số đơn vị học trình lớn hơn hoặc bằng số đơn vị học trình của học phần mã 001. 
select
    TenHP
from HOCPHAN
where SoDVHT >= all (select
    SoDVHT
from HOCPHAN
where MaHP = 1)

-- 32. Cho biết HoTen sinh viên có DiemHP cao nhất. 
select
    SINHVIEN.HoTen
from SINHVIEN
    , DIEMHP
where SINHVIEN.MaSV = DIEMHP.MaSV
group by SINHVIEN.HoTen
        ,DiemHP
having DiemHP >= all (select
    DiemHP
from DIEMHP)

-- 33. Cho biết HoTen sinh viên có tuổi cao nhất. 
select
    HoTen
 , DATEDIFF(YEAR, NgaySinh, GETDATE())
from SINHVIEN
group by HoTen
        ,NgaySinh
having DATEDIFF(YEAR, NgaySinh, GETDATE()) >= all (select
    DATEDIFF(YEAR, NgaySinh, GETDATE())
from SINHVIEN)

-- 34. Cho biết MaSV, HoTen sinh viên có điểm học phần mã ‘001’ cao nhất.
select
    a.MaSV
 , HoTen
from SINHVIEN a
    , DIEMHP b
where (a.MaSV = b.MaSV)
    and (b.MaHP = '001')
    and (b.DiemHP >= all (select
        DIEMHP
    from DIEMHP
    where (MaHP = 1))
)

-- 35. Cho biết MaSV, MaHP có điểm HP lớn hơn bất kỳ các điểm HP của sinh viên mã ‘001’ 
select distinct
    SINHVIEN.MaSV
 , HOCPHAN.MaHP
 , DIEMHP.DiemHP
from dbo.DIEMHP
    inner join dbo.SINHVIEN
    on DIEMHP.MaSV = SINHVIEN.MaSV
    inner join dbo.HOCPHAN
    on DIEMHP.MaHP = HOCPHAN.MaHP
where DIEMHP.DiemHP >= all (select
        DIEMHP.DiemHP
    from dbo.DIEMHP
    where DIEMHP.MaSV = 1)
    and DIEMHP.MaSV = 1

-- 36. Cho biết sinh viên có điểm học phần nào đó [lớn hơn gấp rưỡi] ( > 1.5 ) điểm trung bình chung của sinh viên đó. 
-- DiemHP > 1.5 * DTB
select distinct
    SINHVIEN.MaSV
 , SINHVIEN.HoTen
from dbo.SINHVIEN
    inner join dbo.DIEMHP
    on SINHVIEN.MaSV = DIEMHP.MaSV
where DIEMHP.DiemHP >= all (select
    ROUND(SUM(DIEMHP.DiemHP * HOCPHAN.SoDVHT) / SUM(HOCPHAN.SoDVHT), 1) * 1.5 as [DTB*3/2]
from dbo.SINHVIEN
    inner join dbo.DIEMHP
    on SINHVIEN.MaSV = DIEMHP.MaSV
    inner join dbo.HOCPHAN
    on DIEMHP.MaHP = HOCPHAN.MaHP
group by DIEMHP.MaSV)
group by SINHVIEN.MaSV
        ,SINHVIEN.HoTen

-- 37. Cho biết MaSV, HoTen sinh viên đã ít nhất một lần học học phần nào đó.
select distinct
    SINHVIEN.MaSV 
   , SINHVIEN.HoTen
from dbo.DIEMHP
    inner join dbo.SINHVIEN
    on DIEMHP.MaSV = SINHVIEN.MaSV

-- 38. Cho biết MaSV, HoTen sinh viên đã không học học phần nào.
select distinct
    SINHVIEN.MaSV
 , SINHVIEN.HoTen
from dbo.SINHVIEN
where SINHVIEN.MaSV not in (select distinct
    SINHVIEN.MaSV
from dbo.DIEMHP
    inner join dbo.SINHVIEN
    on DIEMHP.MaSV = SINHVIEN.MaSV)

-- 39. Cho biết MaLop,TenLop đã không có sinh viên nào học. lặp câu 41
select distinct
    LOP.MaLop
 , LOP.TenLop
from dbo.SINHVIEN
    inner join dbo.LOP
    on SINHVIEN.MaLop = LOP.MaLop
group by LOP.MaLop
        ,LOP.TenLop
having COUNT(LOP.MaLop) = 0

-- 40. Cho biết MaSV đã học ít nhất một trong 2 học phần có mã là ‘001’, ‘002’. lặp câu 42
select distinct
    SINHVIEN.MaSV
from dbo.DIEMHP
    inner join dbo.SINHVIEN
    on DIEMHP.MaSV = SINHVIEN.MaSV
    inner join dbo.HOCPHAN
    on DIEMHP.MaHP = HOCPHAN.MaHP
where HOCPHAN.MaHP = 1
    or HOCPHAN.MaHP = 2

-- 41. Cho biết MaSV chưa học học phần nào. lặp câu 39
select distinct
    SINHVIEN.MaSV
 , SINHVIEN.HoTen
from dbo.SINHVIEN
where SINHVIEN.MaSV not in (select distinct
    SINHVIEN.MaSV
from dbo.DIEMHP
    inner join dbo.SINHVIEN
    on DIEMHP.MaSV = SINHVIEN.MaSV)

-- 42. Cho biết Mã sinh viên học ít nhất hai học phần có mã ‘001’ và ‘002’. lặp câu 40
select distinct
    SINHVIEN.MaSV
from dbo.DIEMHP
    inner join dbo.SINHVIEN
    on DIEMHP.MaSV = SINHVIEN.MaSV
    inner join dbo.HOCPHAN
    on DIEMHP.MaHP = HOCPHAN.MaHP
where HOCPHAN.MaHP = 1
    or HOCPHAN.MaHP = 2

-- 43. Bổ sung một dòng dữ liệu cho bảng DMKHOA bộ giá trị sau: (‘KT’, ‘Kế toán’). 
insert into dbo.KHOA
    (MaKhoa, TenKhoa)
values
    ('KT', 'Kế toán')

-- 44. Bổ sung một sinh viên cho bảng SINHVIEN (dữ liệu nào bất kỳ).
insert into dbo.SINHVIEN
    (MaSV, HoTen, MaLop, GioiTinh, NgaySinh, DiaChi)
values
    (10, N'Dương Du Lanh', 'CT11', N'Nữ', '22-7-1997', N'Phú Thọ')

-- 45. Bổ sung điểm học phần cho bảng DIEMHP (dữ liệu bất kỳ)
insert into DIEMHP
values
    ('10', '2', '8.3')

-- 46. Xóa những sinh viên có DTBC <3 (sinh viên buộc thôi học) 
delete from dbo.SINHVIEN
where MaSV in (select
    SINHVIEN.MaSV
from dbo.DIEMHP
    inner join dbo.SINHVIEN
    on DIEMHP.MaSV = SINHVIEN.MaSV
    inner join dbo.HOCPHAN
    on DIEMHP.MaHP = HOCPHAN.MaHP
group by SINHVIEN.MaSV
having ROUND(SUM(DIEMHP.DiemHP * HOCPHAN.SoDVHT) / SUM(HOCPHAN.SoDVHT), 1) < 3)

-- 47. Xóa những sinh viên không học học phần nào. 
delete from dbo.SINHVIEN
where MaSV in (select distinct
    SINHVIEN.MaSV
from dbo.SINHVIEN
where SINHVIEN.MaSV not in (select distinct
    SINHVIEN.MaSV
from dbo.DIEMHP
    inner join dbo.SINHVIEN
    on DIEMHP.MaSV = SINHVIEN.MaSV))

-- 48. Xóa khỏi bảng DMLOP những lớp không có sinh viên nào
delete from dbo.LOP
where MaLop in (select distinct
    LOP.MaLop
from dbo.SINHVIEN
    inner join dbo.LOP
    on SINHVIEN.MaLop = LOP.MaLop
group by LOP.MaLop
        ,LOP.TenLop
having COUNT(LOP.MaLop) = 0)

-- 49. Thêm cột XepLoai, Cập nhật dữ liệu cột XepLoai theo yêu cầu sau: 
--     Nếu DiemTBC >= 8 thì xếp loại Giỏi, ngược lại 
--     Nếu DiemTBC >= 7 thì xếp loại Khá, ngược lại 
--     Nếu DiemTBC >= 5 thì xếp loại Trung bình, Ngược lại là Yếu 
alter table dbo.SINHVIEN 
    add XepLoai NVARCHAR(10)

update dbo.SINHVIEN
set XepLoai = N'Trung bình'
where MaSV in (select
    SINHVIEN.MaSV
from dbo.DIEMHP
    inner join dbo.SINHVIEN
    on DIEMHP.MaSV = SINHVIEN.MaSV
    inner join dbo.HOCPHAN
    on DIEMHP.MaHP = HOCPHAN.MaHP
group by SINHVIEN.MaSV
having ROUND(SUM(DIEMHP.DiemHP * HOCPHAN.SoDVHT) / SUM(HOCPHAN.SoDVHT), 1) >= 5)

update dbo.SINHVIEN
set XepLoai = N'Khá'
where MaSV in (select
    SINHVIEN.MaSV
from dbo.DIEMHP
    inner join dbo.SINHVIEN
    on DIEMHP.MaSV = SINHVIEN.MaSV
    inner join dbo.HOCPHAN
    on DIEMHP.MaHP = HOCPHAN.MaHP
group by SINHVIEN.MaSV
having ROUND(SUM(DIEMHP.DiemHP * HOCPHAN.SoDVHT) / SUM(HOCPHAN.SoDVHT), 1) >= 7)

update dbo.SINHVIEN
set XepLoai = N'Giỏi'
where MaSV in (select
    SINHVIEN.MaSV
from dbo.DIEMHP
    inner join dbo.SINHVIEN
    on DIEMHP.MaSV = SINHVIEN.MaSV
    inner join dbo.HOCPHAN
    on DIEMHP.MaHP = HOCPHAN.MaHP
group by SINHVIEN.MaSV
having ROUND(SUM(DIEMHP.DiemHP * HOCPHAN.SoDVHT) / SUM(HOCPHAN.SoDVHT), 1) >= 8)

update dbo.SINHVIEN
set XepLoai = N'Yếu'
where MaSV in (select
    SINHVIEN.MaSV
from dbo.DIEMHP
    inner join dbo.SINHVIEN
    on DIEMHP.MaSV = SINHVIEN.MaSV
    inner join dbo.HOCPHAN
    on DIEMHP.MaHP = HOCPHAN.MaHP
group by SINHVIEN.MaSV
having ROUND(SUM(DIEMHP.DiemHP * HOCPHAN.SoDVHT) / SUM(HOCPHAN.SoDVHT), 1) < 5)

-- 50. Thêm cột XetLenLop, Cập nhập dữ liệu cho cột với yêu cầu sau: 
--     Nếu DiemTBC >= 5 thì được lên lớp, ngược lại 
--     Nếu DiemTBC >= 3 thì tạm ngừng tiến độ học tập 
--     Ngược lại Buộc thôi học. 
alter table dbo.SINHVIEN 
    add XetLenLop NVARCHAR(30)

update dbo.SINHVIEN
set XetLenLop = N'Buộc thôi học'
where MaSV in (select
    SINHVIEN.MaSV
from dbo.DIEMHP
    inner join dbo.SINHVIEN
    on DIEMHP.MaSV = SINHVIEN.MaSV
    inner join dbo.HOCPHAN
    on DIEMHP.MaHP = HOCPHAN.MaHP
group by SINHVIEN.MaSV
having ROUND(SUM(DIEMHP.DiemHP * HOCPHAN.SoDVHT) / SUM(HOCPHAN.SoDVHT), 1) < 3)

update dbo.SINHVIEN
set XetLenLop = N'Tạm ngừng tiến độ học tập'
where MaSV in (select
    SINHVIEN.MaSV
from dbo.DIEMHP
    inner join dbo.SINHVIEN
    on DIEMHP.MaSV = SINHVIEN.MaSV
    inner join dbo.HOCPHAN
    on DIEMHP.MaHP = HOCPHAN.MaHP
group by SINHVIEN.MaSV
having ROUND(SUM(DIEMHP.DiemHP * HOCPHAN.SoDVHT) / SUM(HOCPHAN.SoDVHT), 1) >= 3)

update dbo.SINHVIEN
set XetLenLop = N'Được lên lớp'
where MaSV in (select
    SINHVIEN.MaSV
from dbo.DIEMHP
    inner join dbo.SINHVIEN
    on DIEMHP.MaSV = SINHVIEN.MaSV
    inner join dbo.HOCPHAN
    on DIEMHP.MaHP = HOCPHAN.MaHP
group by SINHVIEN.MaSV
having ROUND(SUM(DIEMHP.DiemHP * HOCPHAN.SoDVHT) / SUM(HOCPHAN.SoDVHT), 1) >= 5)

-- 51.
-- a. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), GioiTinh (Nam, Nữ), NamSinh của tất cả sinh viên.
select
    SINHVIEN.MaSV
 , SINHVIEN.HoTen
 , SINHVIEN.MaLop
 , SINHVIEN.NgaySinh
 , SINHVIEN.GioiTinh
 , YEAR(SINHVIEN.NgaySinh) as NamSinh
from dbo.SINHVIEN

-- b. Tạo một VIEW có tên là DSSV01 với nội dung truy vấn (câu a) ở trên. Mở cửa sổ Object Explorer, xem VIEW vừa tạo lưu ở đâu? Xem kết quả dữ liệu từ VIEW vừa tạo (SELECT * FROM DSSV01) và so sánh với kết quả ở câu a; có khác nhau không? Tại sao? 
go
create view DSSV01
as
    select
        SINHVIEN.MaSV
 , SINHVIEN.HoTen
 , SINHVIEN.MaLop
 , SINHVIEN.NgaySinh
 , SINHVIEN.GioiTinh
 , YEAR(SINHVIEN.NgaySinh) as NamSinh
    from dbo.SINHVIEN
go
-- View được lưu ở QLSINHVIEN/Views
-- Kết quả của view giống với kết quả câu a
-- Mỗi lần người dùng truy vấn một View. Bộ máy của CSDL sẽ sử dụng câu lệnh SQL của View để tạo lại dữ liệu, do vậy dữ liệu của View luôn được cập nhật.

select *
from DSSV01

-- 52. Thêm mới một sinh viên vào bảng sinh viên, sau đó dùng lệnh SELECT * FROM sinhVien, kết quả có thay đổi so với câu 51b hay không? Tại sao?
insert into dbo.SINHVIEN
    (MaSV, HoTen, MaLop, GioiTinh, NgaySinh, DiaChi)
values
    (11, N'Nguyễn Ngọc Lan', 'CT13', N'Nữ', '2003-7-22', N'Lâm Đồng') 

-- Không có sự thay đổi giữa dữ liệu của [SELECT * FROM sinhVien] với [SELECT * FROM DSSV01]
-- Vì mỗi lần người dùng truy vấn một View. Bộ máy của CSDL sẽ sử dụng câu lệnh SQL của View để tạo lại dữ liệu, do vậy dữ liệu của View luôn được cập nhật.
