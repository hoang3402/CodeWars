create database QuanLyPhongMay
on primary (
NAME = N'Data 1',
FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Data 1.mdf',
SIZE = 10240 KB,
MAXSIZE = 102400 KB,
FILEGROWTH = 10240 KB
),
(
NAME = N'Data 2',
FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Data 2.ndf',
SIZE = 10240 KB,
MAXSIZE = 102400 KB,
FILEGROWTH = 10240 KB
)
LOG on (
NAME = N'Log 1',
FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Log 1.ldf',
SIZE = 30720 KB,
MAXSIZE = 2097152 KB,
FILEGROWTH = 30720 KB
),
(
NAME = N'Log 2',
FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Log 2.ndf',
SIZE = 30720 KB,
MAXSIZE = 2048000 KB,
FILEGROWTH = 30720 KB
)
go

alter database QuanLyPhongMay
set
ANSI_NULL_DEFAULT off,
ANSI_NULLS off,
ANSI_PADDING off,
ANSI_WARNINGS off,
ARITHABORT off,
AUTO_CLOSE off,
AUTO_CREATE_STATISTICS on,
AUTO_SHRINK off,
AUTO_UPDATE_STATISTICS on,
AUTO_UPDATE_STATISTICS_ASYNC off,
COMPATIBILITY_LEVEL = 150,
CONCAT_NULL_YIELDS_NULL off,
CURSOR_CLOSE_ON_COMMIT off,
CURSOR_DEFAULT GLOBAL,
DATE_CORRELATION_OPTIMIZATION off,
DB_CHAINING off,
HONOR_BROKER_PRIORITY off,
MULTI_USER,
NESTED_TRIGGERS = on,
NUMERIC_ROUNDABORT off,
PAGE_VERIFY CHECKSUM,
PARAMETERIZATION SIMPLE,
QUOTED_IDENTIFIER off,
READ_COMMITTED_SNAPSHOT off,
RECOVERY full,
RECURSIVE_TRIGGERS off,
TRANSFORM_NOISE_WORDS = off,
TRUSTWORTHY off
with rollback IMMEDIATE
go

alter database QuanLyPhongMay
collate SQL_Latin1_General_CP1_CI_AS
go

alter database QuanLyPhongMay
set DISABLE_BROKER
go

alter database QuanLyPhongMay
set ALLOW_SNAPSHOT_ISOLATION off
go

alter database QuanLyPhongMay
set FILESTREAM (NON_TRANSACTED_ACCESS = off)
go

alter database QuanLyPhongMay
set QUERY_STORE = off
go

use QuanLyPhongMay
go

alter database SCOPED configuration set MAXDOP = 0;
go

alter database SCOPED configuration for SECONDARY set MAXDOP = primary;
go

alter database SCOPED configuration set LEGACY_CARDINALITY_ESTIMATION = off;
go

alter database SCOPED configuration for SECONDARY set LEGACY_CARDINALITY_ESTIMATION = primary;
go

alter database SCOPED configuration set PARAMETER_SNIFFING = on;
go

alter database SCOPED configuration for SECONDARY set PARAMETER_SNIFFING = primary;
go

alter database SCOPED configuration set QUERY_OPTIMIZER_HOTFIXES = off;
go

alter database SCOPED configuration for SECONDARY set QUERY_OPTIMIZER_HOTFIXES = primary;
go

alter authorization on DATABASE::QuanLyPhongMay to sa
go

create table QuanLyPhongMay.dbo.PhongMay
(
    MaPhong varchar(20)   not null primary key,
    GhiChu  nvarchar(100) null
)
go

create table QuanLyPhongMay.dbo.MayTinh
(
    MaMay   varchar(20)   not null primary key,
    GhiChu  nvarchar(100) null,
    MaPhong varchar(20)   null,
    foreign key (MaPhong) references dbo.PhongMay (MaPhong)
)
go

create table QuanLyPhongMay.dbo.MonHoc
(
    MaMon  varchar(20)   not null primary key,
    TenMon nvarchar(100) null,
    SoGio  int           null,
)
go

create table QuanLyPhongMay.dbo.DangKy
(
    MaMon   varchar(20) not null primary key,
    MaPhong varchar(20) null,
    NgayDK  datetime    null
)
go

-- 3.2 Phân quyền

grant alter any database to PhongKT
grant create table to PhongKT

grant select all database to AnLV
grant all on PhongMay to AnLV
with grant option

grant alter any database to bk
grant create table to bk
grant backup database to bk

create table QuanLyPhongMay.dbo.PhongBan
(
    MaPhong   varchar(20)   not null primary key,
    TenPhong  nvarchar(100) null,
    DienThoai int           null
)
go

create table QuanLyPhongMay.dbo.NhanVien
(
    MaNv     varchar(20)   not null primary key,
    TenNv    nvarchar(100) null,
    GioiTinh nvarchar(3)   null,
    NgaySinh date          null,
    DiaChi   nvarchar(200) null,
    MaPhong  varchar(20)   null,
    foreign key (MaPhong) references dbo.PhongBan (MaPhong)
) 
go

