USE [master]
GO
/****** Object:  Database [NHOM1_QUANLYSIEUTHI]    Script Date: 29/06/2021 9:38:00 SA ******/
CREATE DATABASE [NHOM1_QUANLYSIEUTHI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NHOM1_QUANLYSIEUTHI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\NHOM1_QUANLYSIEUTHI.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NHOM1_QUANLYSIEUTHI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\NHOM1_QUANLYSIEUTHI_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NHOM1_QUANLYSIEUTHI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET ARITHABORT OFF 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET  MULTI_USER 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [NHOM1_QUANLYSIEUTHI]
GO
/****** Object:  StoredProcedure [dbo].[HoaDonNhapVuaThem]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[HoaDonNhapVuaThem]
AS
BEGIN
select top 1
	MaHDN
from HOADONNHAP as HDN
order by MaHDN desc
END

GO
/****** Object:  StoredProcedure [dbo].[Proc_GetAllNV]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[Proc_GetAllNV]
as
begin 
select * from NHANVIEN 
end

GO
/****** Object:  StoredProcedure [dbo].[Proc_GetChiTietHDB_ById]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----NVHIEN
Create Proc [dbo].[Proc_GetChiTietHDB_ById]
@maHDB int
AS
BEGIN
  select * from CHITIETHOADONBAN where MaHDB = @maHDB
END

GO
/****** Object:  StoredProcedure [dbo].[Proc_GetHDB_ById]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----NVHIEN
Create Proc [dbo].[Proc_GetHDB_ById]
@maHDB int
AS
BEGIN
  select * from HOADONBAN where MaHDB = @maHDB
END

GO
/****** Object:  StoredProcedure [dbo].[Proc_GetMaMHByTenMH]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Proc_GetMaMHByTenMH]
@tenMH nvarchar(MAX)
as begin 
	select MaMH from MATHANG where TenMH = @tenMH
end


GO
/****** Object:  StoredProcedure [dbo].[Proc_GetMHByMaHDB]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[Proc_GetMHByMaHDB]
@maHDB int
as begin 
select * from MATHANG where MaMH = (select MaMH from CHITIETHOADONBAN where MaHDB = @maHDB)
end

GO
/****** Object:  StoredProcedure [dbo].[Proc_GetNVByMaHDB]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[Proc_GetNVByMaHDB]
@maHDB int
as
begin 

select * from NHANVIEN where MaNV = (select MaNV from HOADONBAN where MaHDB = @maHDB)
end

GO
/****** Object:  StoredProcedure [dbo].[Proc_GiaBanByMaMH]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Proc_GiaBanByMaMH]
@maMH int
as 
begin
	select DonGiaBan from MATHANG where MaMH = @maMH
end

GO
/****** Object:  StoredProcedure [dbo].[Proc_HoaDonBan_Delete]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Proc_HoaDonBan_Delete]
  @maHDB INT
AS
BEGIN
  UPDATE CHITIETHOADONBAN
  SET MaHDB = NULL
  WHERE MaHDB = @maHDB

  DELETE HOADONBAN
  WHERE MaHDB = @maHDB
END

GO
/****** Object:  StoredProcedure [dbo].[Proc_HoaDonBan_GetAll]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------------/KDLONG---------------------------------------------





----NVHIEN

CREATE PROCEDURE [dbo].[Proc_HoaDonBan_GetAll]
AS
BEGIN
  SELECT *
  FROM HOADONBAN
END

GO
/****** Object:  StoredProcedure [dbo].[Proc_HoaDonBan_Insert]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Proc_HoaDonBan_Insert]
  @maNV int,
  @ngayBan date
AS
BEGIN
  INSERT INTO HOADONBAN
    (MaNV, NgayBan)
  VALUES(@maNV, @ngayBan)
END

GO
/****** Object:  StoredProcedure [dbo].[Proc_HoaDonBan_Search]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_HoaDonBan_Search]
  @searchValue NVARCHAR(200)
AS
BEGIN
  SELECT *
  FROM HOADONBAN
  WHERE MaHDB = @searchValue
END

GO
/****** Object:  StoredProcedure [dbo].[Proc_HoaDonBan_Update]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Proc_HoaDonBan_Update]
  @maHDB int,@maNV int,@ngayBan date
AS
BEGIN
  UPDATE HOADONBAN
  SET 
  MaNV = @maNV,
  NgayBan = @ngayBan
  WHERE MaHDB = @maHDB
  
END

GO
/****** Object:  StoredProcedure [dbo].[Proc_InsertChiTietHDB]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[Proc_InsertChiTietHDB]
@maHDB int ,@maMH int, @sl int, @giamGia float, @tongTien float
as 
begin
	Insert into CHITIETHOADONBAN(MaHDB,MaMH,SoLuong,GiamGia,ThanhTien)
	Values (@maHDB,@maMH,@sl,@giamGia,@tongTien)

	Update MATHANG
  set SoLuong = SoLuong + @sl
  where MaMH = @MaMH
end

GO
/****** Object:  StoredProcedure [dbo].[Proc_LaySLNhap]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----Proc_GiaBanByMaMH '1'

--dat----
Create Proc [dbo].[Proc_LaySLNhap]
 @CanTren date,
 @CanDuoi date
as
begin
	select CHITIETHOADONNHAP.MaHDN,CHITIETHOADONNHAP.MaMH,CHITIETHOADONNHAP.SoLuong,CHITIETHOADONNHAP.ThanhTien
	from CHITIETHOADONNHAP,HOADONNHAP where CHITIETHOADONNHAP.MaHDN = HOADONNHAP.MaHDN and NgayNhap between  @CanDuoi and @CanTren

end

GO
/****** Object:  StoredProcedure [dbo].[Proc_LaySLTon]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Proc_LaySLTon]
as
begin
	select * from MATHANG where SoLuong >0
end

GO
/****** Object:  StoredProcedure [dbo].[Proc_LaySLXuat]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Proc [dbo].[Proc_LaySLXuat]
 @CanTren date,
 @CanDuoi date
as
begin
	select CHITIETHOADONBAN.MaHDB,CHITIETHOADONBAN.MaMH,CHITIETHOADONBAN.SoLuong,CHITIETHOADONBAN.GiamGia,CHITIETHOADONBAN.ThanhTien
	from CHITIETHOADONBAN,HOADONBAN where CHITIETHOADONBAN.MaHDB = HOADONBAN.MaHDB and NgayBan between @CanDuoi and @CanTren

end

GO
/****** Object:  StoredProcedure [dbo].[QLST_Login]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[QLST_Login]
@username nvarchar(50), @pass nvarchar(50)
AS
BEGIN
	SELECT * FROM dbo.TAIKHOAN WHERE TenDN = @username AND MK = @pass
END

GO
/****** Object:  StoredProcedure [dbo].[SP_ChiTietHoaDonNhap_GetAll]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----------------------Thiep Invoice------------------------
CREATE PROCEDURE [dbo].[SP_ChiTietHoaDonNhap_GetAll]
AS
BEGIN
  SELECT *
  FROM CHITIETHOADONNHAP
END

GO
/****** Object:  StoredProcedure [dbo].[SP_ChiTietHoaDonNhap_Insert]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ChiTietHoaDonNhap_Insert]
  @MaHDN INT,
  @MaMH INT,
  @SoLuong INT,
  @ThanhTien FLOAT
AS
BEGIN
  INSERT INTO CHITIETHOADONNHAP
    (MaHDN, MaMH, SoLuong, ThanhTien)
  VALUES(@MaHDN, @MaMH, @SoLuong, @ThanhTien)

  Update MATHANG
  set SoLuong = SoLuong + @SoLuong
  where MaMH = @MaMH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_ChiTietHoaDonNhap_Search]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ChiTietHoaDonNhap_Search]
 @NgayNhap DATE
AS
BEGIN
  SELECT CTHDN.*
  FROM CHITIETHOADONNHAP AS CTHDN, HOADONNHAP AS HDN
  WHERE NgayNhap = @NgayNhap AND HDN.MaHDN = CTHDN.MaHDN
END

GO
/****** Object:  StoredProcedure [dbo].[SP_HoaDonNhap_GetAll]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_HoaDonNhap_GetAll]
AS
BEGIN
  SELECT *
  FROM HOADONNHAP
END

GO
/****** Object:  StoredProcedure [dbo].[SP_HoaDonNhap_Insert]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_HoaDonNhap_Insert]
  @MaNCC INT,
  @NgayNhap DATE
AS
BEGIN
  INSERT INTO HOADONNHAP
    (MaNCC, NgayNhap)
  VALUES(@MaNCC, @NgayNhap)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_HoaDonNhap_Search]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_HoaDonNhap_Search]
 @NgayNhap DATE
AS
BEGIN
  SELECT HDN.*
  FROM HOADONNHAP AS HDN
  WHERE NgayNhap = @NgayNhap
END

GO
/****** Object:  StoredProcedure [dbo].[SP_KhachHang_Delete]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_KhachHang_Delete]
  @maKH INT
AS
BEGIN
  UPDATE HOADONBAN
  SET MaKH = NULL
  WHERE MaKH = @maKH

  DELETE KHACHHANG
  WHERE MaKH = @maKH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_KhachHang_GetAll]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------KDLONG-----------------------------------------------------------
CREATE PROCEDURE [dbo].[SP_KhachHang_GetAll]
AS
BEGIN
  SELECT *
  FROM KHACHHANG
END

GO
/****** Object:  StoredProcedure [dbo].[SP_KhachHang_Insert]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_KhachHang_Insert]
  @tenKhachHang NVARCHAR(50),
  @diaChi NVARCHAR(100),
  @soDienThoai NVARCHAR(10)
AS
BEGIN
  INSERT INTO KHACHHANG
    (TenKH, DiaChi, SDT)
  VALUES(@tenKhachHang, @diaChi, @soDienThoai)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_KhachHang_Search]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_KhachHang_Search]
  @searchValue NVARCHAR(200)
AS
BEGIN
  SELECT *
  FROM KhachHang
  WHERE MaKH LIKE N'%' + @searchValue + '%'
    OR TenKH LIKE N'%' + @searchValue + '%'
    OR DiaChi LIKE N'%' + @searchValue + '%'
    OR SDT LIKE N'%' + @searchValue + '%'
END

GO
/****** Object:  StoredProcedure [dbo].[SP_KhachHang_Update]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_KhachHang_Update]
  @maKH INT,
  @tenKhachHang NVARCHAR(50),
  @diaChi NVARCHAR(100),
  @soDienThoai NVARCHAR(10)
AS
BEGIN
  UPDATE KhachHang
  SET 
  TenKH = @tenKhachHang,
  DiaChi = @diaChi,
  SDT = @soDienThoai
  WHERE MaKH = @maKH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_LoaiHang_GetAll]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_LoaiHang_GetAll]
AS
BEGIN
  SELECT *
  FROM LOAIHANG
END

GO
/****** Object:  StoredProcedure [dbo].[SP_LoaiHang_Search]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_LoaiHang_Search]
	@maMH INT
AS
BEGIN
	SELECT lh.MaLH, lh.TenLH
	FROM MATHANG mh, LOAIHANG lh
	WHERE mh.MaMH = @maMH and mh.MaLH = lh.MaLH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_MatHang_Delete]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_MatHang_Delete]
  @MaMH INT
AS
BEGIN
  UPDATE CHITIETHOADONBAN
  SET MaMH = NULL
  WHERE MaMH = @MaMH
  UPDATE CHITIETHOADONNHAP
  SET MaMH = NULL
  WHERE MaMH = @MaMH
end


GO
/****** Object:  StoredProcedure [dbo].[SP_MatHang_GetAll]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_MatHang_GetAll]
AS
BEGIN
  SELECT *
  FROM MATHANG
END

GO
/****** Object:  StoredProcedure [dbo].[SP_MatHang_Insert]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_MatHang_Insert]
  @TenMH NVARCHAR(MAX),
  @SoLuong INT,
  @DonViTinh NVARCHAR(10),
  @DonGiaNhap FLOAT,
  @DonGiaBan FLOAT,
  @MaLH INT
AS
BEGIN
  INSERT INTO MATHANG
    (TenMH, SoLuong, DonViTinh, DonGiaNhap, DonGiaBan, MaLH)
  VALUES(@TenMH, @SoLuong, @DonViTinh, @DonGiaNhap, @DonGiaBan, @MaLH)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_MatHang_Search]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_MatHang_Search]
  @searchValue NVARCHAR(200)
AS
BEGIN
  SELECT *
  FROM MATHANG
  WHERE MaMH LIKE N'%' + @searchValue + '%'
    OR  TenMH LIKE N'%' + @searchValue + '%'
    OR  SoLuong LIKE N'%' + @searchValue + '%'
    OR  DonViTinh LIKE N'%' + @searchValue + '%'
    OR  DonGiaNhap LIKE N'%' + @searchValue + '%'
	OR  DonGiaBan LIKE N'%' + @searchValue + '%'
    OR  MaLH LIKE N'%' + @searchValue + '%'
END

GO
/****** Object:  StoredProcedure [dbo].[SP_MatHang_Update]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MatHang_Update]
  @MaMH INT,
  @TenMH NVARCHAR(MAX),
  @SoLuong INT,
  @DonViTinh NVARCHAR(10),
  @DonGiaNhap FLOAT,
  @DonGiaBan FLOAT,
  @MaLH INT
AS
BEGIN
  UPDATE MATHANG
  SET TenMH = @TenMH,
	  SoLuong = @SoLuong,
	  DonViTinh = @DonViTinh,
	  DonGiaNhap = @DonGiaNhap,
	  DonGiaBan = @DonGiaBan,
	  MaLH =@MaLH
  WHERE MaMH = @MaMH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_NhaCungCap_GetAll]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_NhaCungCap_GetAll]
AS
BEGIN
  SELECT *
  FROM NHACUNGCAP
END

GO
/****** Object:  StoredProcedure [dbo].[SP_NhanVien_Delete]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_NhanVien_Delete]
  @maNV INT
AS
BEGIN
  UPDATE HOADONBAN
  SET MaNV = NULL
  WHERE MaNV = @maNV

  DELETE NHANVIEN
  WHERE MaNV = @maNV
END

GO
/****** Object:  StoredProcedure [dbo].[SP_NhanVien_Insert]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_NhanVien_Insert]
  @tenNhanVien NVARCHAR(50),
  @ngaySinh DATE,
  @gioiTinh NVARCHAR(3),
  @diaChi NVARCHAR(100),
  @soDienThoai VARCHAR(10)
AS
BEGIN
  INSERT INTO NHANVIEN
    (TenNV, NgaySinh, GioiTinh, DiaChi, SDT)
  VALUES(@tenNhanVien, @ngaySinh, @gioiTinh, @diaChi, @soDienThoai)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_NhanVien_Search]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_NhanVien_Search]
  @searchValue NVARCHAR(200)
AS
BEGIN
  SELECT *
  FROM NHANVIEN
  WHERE MaNV LIKE N'%' + @searchValue + '%'
    OR TenNV LIKE N'%' + @searchValue + '%'
	OR NgaySinh LIKE N'%' + @searchValue + '%'
    OR GioiTinh LIKE N'%' + @searchValue + '%'
    OR DiaChi LIKE N'%' + @searchValue + '%'
	OR SDT LIKE N'%' + @searchValue + '%'
END

GO
/****** Object:  StoredProcedure [dbo].[SP_NhanVien_Update]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_NhanVien_Update]
  @maNV INT,
  @tenNhanVien NVARCHAR(50),
  @ngaySinh DATE,
  @gioiTinh NVARCHAR(3),
  @diaChi NVARCHAR(100),
  @soDienThoai VARCHAR(10)
AS
BEGIN
  UPDATE NHANVIEN
  SET 
  TenNV = @tenNhanVien,
  NgaySinh = @ngaySinh,
  GioiTinh = @gioiTinh,
  DiaChi=@diaChi,
  SDT=@soDienThoai
  WHERE MaNV = @maNV
END

GO
/****** Object:  Table [dbo].[CHITIETHOADONBAN]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETHOADONBAN](
	[MaHDB] [int] NOT NULL,
	[MaMH] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[GiamGia] [float] NULL,
	[ThanhTien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CHITIETHOADONNHAP]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETHOADONNHAP](
	[MaHDN] [int] NOT NULL,
	[MaMH] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[ThanhTien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDN] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HOADONBAN]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADONBAN](
	[MaHDB] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [int] NULL,
	[NgayBan] [date] NULL,
	[MaKH] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HOADONNHAP]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADONNHAP](
	[MaHDN] [int] IDENTITY(1,1) NOT NULL,
	[MaNCC] [int] NULL,
	[NgayNhap] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SDT] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOAIHANG]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIHANG](
	[MaLH] [int] IDENTITY(1,1) NOT NULL,
	[TenLH] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MATHANG]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MATHANG](
	[MaMH] [int] IDENTITY(1,1) NOT NULL,
	[TenMH] [nvarchar](max) NULL,
	[SoLuong] [int] NULL,
	[DonViTinh] [nvarchar](10) NULL,
	[DonGiaNhap] [float] NULL,
	[DonGiaBan] [float] NULL,
	[MaLH] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHACUNGCAP](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](max) NULL,
	[SDT] [nvarchar](12) NULL,
	[DiaChi] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SDT] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 29/06/2021 9:38:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[TenDN] [nvarchar](50) NOT NULL,
	[MK] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TenDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[CHITIETHOADONBAN] ([MaHDB], [MaMH], [SoLuong], [GiamGia], [ThanhTien]) VALUES (2, 6, 23, 0, 1978000)
INSERT [dbo].[CHITIETHOADONBAN] ([MaHDB], [MaMH], [SoLuong], [GiamGia], [ThanhTien]) VALUES (3, 6, 20, 0, 3000000)
INSERT [dbo].[CHITIETHOADONBAN] ([MaHDB], [MaMH], [SoLuong], [GiamGia], [ThanhTien]) VALUES (4, 5, 21, 0, 1978000)
INSERT [dbo].[CHITIETHOADONBAN] ([MaHDB], [MaMH], [SoLuong], [GiamGia], [ThanhTien]) VALUES (5, 7, 22, 0, 3000000)
INSERT [dbo].[CHITIETHOADONBAN] ([MaHDB], [MaMH], [SoLuong], [GiamGia], [ThanhTien]) VALUES (6, 8, 23, 0, 1978000)
INSERT [dbo].[CHITIETHOADONBAN] ([MaHDB], [MaMH], [SoLuong], [GiamGia], [ThanhTien]) VALUES (7, 9, 24, 0, 3000000)
INSERT [dbo].[CHITIETHOADONBAN] ([MaHDB], [MaMH], [SoLuong], [GiamGia], [ThanhTien]) VALUES (8, 8, 25, 0, 1978000)
INSERT [dbo].[CHITIETHOADONBAN] ([MaHDB], [MaMH], [SoLuong], [GiamGia], [ThanhTien]) VALUES (9, 10, 26, 0, 3000000)
INSERT [dbo].[CHITIETHOADONBAN] ([MaHDB], [MaMH], [SoLuong], [GiamGia], [ThanhTien]) VALUES (11, 11, 34, 0, 833000)
INSERT [dbo].[CHITIETHOADONNHAP] ([MaHDN], [MaMH], [SoLuong], [ThanhTien]) VALUES (1, 1, 30, 1080000)
INSERT [dbo].[CHITIETHOADONNHAP] ([MaHDN], [MaMH], [SoLuong], [ThanhTien]) VALUES (2, 1, 60, 2160000)
INSERT [dbo].[CHITIETHOADONNHAP] ([MaHDN], [MaMH], [SoLuong], [ThanhTien]) VALUES (3, 1, 120, 4320000)
INSERT [dbo].[CHITIETHOADONNHAP] ([MaHDN], [MaMH], [SoLuong], [ThanhTien]) VALUES (4, 2, 30, 2000000)
INSERT [dbo].[CHITIETHOADONNHAP] ([MaHDN], [MaMH], [SoLuong], [ThanhTien]) VALUES (5, 2, 60, 4500000)
INSERT [dbo].[CHITIETHOADONNHAP] ([MaHDN], [MaMH], [SoLuong], [ThanhTien]) VALUES (6, 2, 120, 1080000)
INSERT [dbo].[CHITIETHOADONNHAP] ([MaHDN], [MaMH], [SoLuong], [ThanhTien]) VALUES (7, 3, 30, 2000000)
INSERT [dbo].[CHITIETHOADONNHAP] ([MaHDN], [MaMH], [SoLuong], [ThanhTien]) VALUES (8, 3, 60, 4500000)
INSERT [dbo].[CHITIETHOADONNHAP] ([MaHDN], [MaMH], [SoLuong], [ThanhTien]) VALUES (9, 4, 120, 2160000)
INSERT [dbo].[CHITIETHOADONNHAP] ([MaHDN], [MaMH], [SoLuong], [ThanhTien]) VALUES (10, 4, 30, 2160000)
INSERT [dbo].[CHITIETHOADONNHAP] ([MaHDN], [MaMH], [SoLuong], [ThanhTien]) VALUES (11, 4, 60, 2000000)
INSERT [dbo].[CHITIETHOADONNHAP] ([MaHDN], [MaMH], [SoLuong], [ThanhTien]) VALUES (12, 5, 120, 4500000)
INSERT [dbo].[CHITIETHOADONNHAP] ([MaHDN], [MaMH], [SoLuong], [ThanhTien]) VALUES (13, 1, 240, 8640000)
SET IDENTITY_INSERT [dbo].[HOADONBAN] ON 

INSERT [dbo].[HOADONBAN] ([MaHDB], [MaNV], [NgayBan], [MaKH]) VALUES (2, 3, CAST(0xAF420B00 AS Date), NULL)
INSERT [dbo].[HOADONBAN] ([MaHDB], [MaNV], [NgayBan], [MaKH]) VALUES (3, 3, CAST(0x8A420B00 AS Date), NULL)
INSERT [dbo].[HOADONBAN] ([MaHDB], [MaNV], [NgayBan], [MaKH]) VALUES (4, 1, CAST(0x65420B00 AS Date), NULL)
INSERT [dbo].[HOADONBAN] ([MaHDB], [MaNV], [NgayBan], [MaKH]) VALUES (5, 1, CAST(0x66420B00 AS Date), NULL)
INSERT [dbo].[HOADONBAN] ([MaHDB], [MaNV], [NgayBan], [MaKH]) VALUES (6, 2, CAST(0x79420B00 AS Date), NULL)
INSERT [dbo].[HOADONBAN] ([MaHDB], [MaNV], [NgayBan], [MaKH]) VALUES (7, 2, CAST(0x7A420B00 AS Date), NULL)
INSERT [dbo].[HOADONBAN] ([MaHDB], [MaNV], [NgayBan], [MaKH]) VALUES (8, 4, CAST(0x28420B00 AS Date), NULL)
INSERT [dbo].[HOADONBAN] ([MaHDB], [MaNV], [NgayBan], [MaKH]) VALUES (9, 4, CAST(0x44420B00 AS Date), NULL)
INSERT [dbo].[HOADONBAN] ([MaHDB], [MaNV], [NgayBan], [MaKH]) VALUES (10, 4, CAST(0x45420B00 AS Date), NULL)
INSERT [dbo].[HOADONBAN] ([MaHDB], [MaNV], [NgayBan], [MaKH]) VALUES (11, 3, CAST(0xAF420B00 AS Date), NULL)
SET IDENTITY_INSERT [dbo].[HOADONBAN] OFF
SET IDENTITY_INSERT [dbo].[HOADONNHAP] ON 

INSERT [dbo].[HOADONNHAP] ([MaHDN], [MaNCC], [NgayNhap]) VALUES (1, 1, CAST(0xAF420B00 AS Date))
INSERT [dbo].[HOADONNHAP] ([MaHDN], [MaNCC], [NgayNhap]) VALUES (2, 1, CAST(0xAF420B00 AS Date))
INSERT [dbo].[HOADONNHAP] ([MaHDN], [MaNCC], [NgayNhap]) VALUES (3, 1, CAST(0xAF420B00 AS Date))
INSERT [dbo].[HOADONNHAP] ([MaHDN], [MaNCC], [NgayNhap]) VALUES (4, 2, CAST(0xAF420B00 AS Date))
INSERT [dbo].[HOADONNHAP] ([MaHDN], [MaNCC], [NgayNhap]) VALUES (5, 2, CAST(0x84420B00 AS Date))
INSERT [dbo].[HOADONNHAP] ([MaHDN], [MaNCC], [NgayNhap]) VALUES (6, 2, CAST(0x86420B00 AS Date))
INSERT [dbo].[HOADONNHAP] ([MaHDN], [MaNCC], [NgayNhap]) VALUES (7, 3, CAST(0x81420B00 AS Date))
INSERT [dbo].[HOADONNHAP] ([MaHDN], [MaNCC], [NgayNhap]) VALUES (8, 3, CAST(0x62420B00 AS Date))
INSERT [dbo].[HOADONNHAP] ([MaHDN], [MaNCC], [NgayNhap]) VALUES (9, 3, CAST(0x5B420B00 AS Date))
INSERT [dbo].[HOADONNHAP] ([MaHDN], [MaNCC], [NgayNhap]) VALUES (10, 4, CAST(0x12420B00 AS Date))
INSERT [dbo].[HOADONNHAP] ([MaHDN], [MaNCC], [NgayNhap]) VALUES (11, 4, CAST(0x0C420B00 AS Date))
INSERT [dbo].[HOADONNHAP] ([MaHDN], [MaNCC], [NgayNhap]) VALUES (12, 4, CAST(0xF0410B00 AS Date))
INSERT [dbo].[HOADONNHAP] ([MaHDN], [MaNCC], [NgayNhap]) VALUES (13, 1, CAST(0xB1420B00 AS Date))
SET IDENTITY_INSERT [dbo].[HOADONNHAP] OFF
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (1, N'Nguyễn Thiên	Nam', N'Số 04 Hải Thượng Lãn Ông, TP.Phan Thiết, tỉnh Bình Thuận', N'0369521456')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (2, N'Phan Trần Bảo Tuấn', N'Số 16C Tôn Đức Thắng, phường Mỹ Bình, TP. Long Xuyên, tỉnh An Giang', N'0988585568')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (3, N'Trần Duy	Bảo', N'Số 1 Phạm Văn Đồng, phường Phước Trung, TP. Bà Rịa, tỉnh Bà Rịa – Vũng Tàu', N'0916175566')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (4, N'Nguyễn Minh Hội', N'Số 04 đường Phan Đình Phùng, phường 3, TP.Bạc Liêu, tỉnh Bạc Liêu', N'0987898882')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (5, N'Bùi Trần Thiên Hoan', N'Số 82  đường Hùng Vương, TP. Bắc Giang, tỉnh Bắc Giang', N'0912040325')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (6, N'Huỳnh Lê	Khang', N'Tổ 1A, phường Phùng Chí Kiên, TX.Bắc Kạn, tỉnh Bắc Kạn', N'0989965118')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (7, N'Phan Minh Anh Khoa', N'Số 10  đường Phù Đổng Thiên Vươn, phường Suối Hoa, TP.Bắc Ninh, tỉnh Bắc Ninh', N'0904352749')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (8, N'Điệp Văn	Lâm', N'Số 7 đường Cách Mạng Tháng 8, phường 3, TP. Bến Tre, tỉnh Bến Tre', N'0902210733')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (9, N'Hồ Ngọc Linh', N'Số 01 Trần Phú, TP.Quy Nhơn, tỉnh Bình Định', N'0934447788')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (10, N'Đặng Hải Long', N'6/1 TX.Đồng Xoài, tỉnh Bình Phước', N'0968686291')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (11, N'Hoàng Cao Lộc', N'Tổ 4 Phường Đức Xuân, Thị xã Bắc Kạn, Tỉnh Bắc Kạn', N'0983266986')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (12, N'Nguyễn Thị Kim Nga', N'Số 08, Nguyễn Tất Thành, TP Bạc Liêu, Tỉnh Bạc Liêu', N'0912177345')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (13, N'Phan Bảo	Luân', N'Số 46, Nguyễn Gia Thiều, TP Bắc Ninh, Tỉnh Bắc Ninh', N'0903220098')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (14, N'Võ Nguyễn Hạnh Uyên', N'140 Đường Hùng Vương, Thành phố Bến Tre, Tỉnh Bến Tre', N'0976785816')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (15, N'Nguyễn Thị Mỹ Dung', N'01 Lê Lợi, Thành phố Quy Nhơn, Tỉnh Bình Định', N'0983109724')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (16, N'Huỳnh Thị Lâm Đa', N'559 Đại Lộ Bình Dương, TX Thủ Dầu Một, Tỉnh Bình Dương', N'0983899956')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (17, N'Phan Văn	Hùng', N'QL 14, Phường Tân Bình, TX Đồng Xoài, Tỉnh Bình Phước', N'0984652666')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (18, N'Huỳnh Thị Dạ	Thu', N'16 Nguyễn Tất Thành, TP Phan Thiết, Tỉnh Bình Thuận', N'0942554498')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (19, N'Lê Hoàng Khánh', N'222A, Phan Ngọc Hiển, Thành Phố Cà Mau, Tỉnh Cà Mau', N'0388403008')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (20, N'Lê Hữu Tường', N'053 Đường Hoàng Đình Giong, TX Cao Bằng, Tỉnh Cao Bằng', N'0904629579')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (21, N'Đặng Văn Quý', N'Tổ 55, phường Đồng Tâm, TP.Yên Bái, tỉnh Yên Bái', N'0985861886')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (22, N'Nguyễn Văn Bắc', N'Đường Mê Linh, phường Khai Quang, TP.Vĩnh Yên, tỉnh Vĩnh Phúc', N'0904629579')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (23, N'Nguyễn Văn Tuấn', N'Số 88 Hoàng Thái Hiếu, Phường 1, TP.Vĩnh Long, tỉnh Vĩnh Long', N'0983054815')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (24, N'Hồ Văn Công Minh', N'Số 52A  đường Lê Lợi, phường 1, TP.Trà Vinh, tỉnh Trà Vinh', N'0902207799')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (25, N'Vũ Minh Đức', N'Số 16 Lê Lợi, TP.Huế, tỉnh Thừa Thiên Huế', N'0988464946')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (26, N'Nguyễn Hoàng Giang', N'Số 35 Đại lộ Lê Lợi, phường Lam Sơn, TP.Thanh Hóa, tỉnh Thanh Hóa', N'0983463800')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (27, N'Phạm Thiên Phong', N'Số 18 đường Nha Trang, TP. Thái Nguyên, tỉnh Thái Nguyên.', N'0904148645')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (28, N'Đặng Thanh Tùng', N'Số 76 phố Lý Thường Kiệt, TP.Thái Bình, tỉnh Thái Bình', N'0975778066')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (29, N'Lê Ngọc Ánh', N'160 đường Trần Hưng Đạo, TX.Tuyên Quang, tỉnh Tuyên Quang', N'0966491916')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (30, N'Nguyễn Thị Oanh', N'86 Lê Thánh Tôn, phường Bến Nghé, Quận 1, TP.Hồ Chí Minh', N'0985505131')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (31, N'Nguyễn Xuân Thương', N'43 Hai Bà Trưng, Quận Hoàn Kiếm, Thành phố Hà Nội', N'0989383751')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (32, N'Phạm Huy Hoàng', N'131 Nam Kỳ Khởi Nghĩa, Quận 1, Thành phố Hồ Chí Minh', N'0983512050')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (33, N'Vũ Anh Tuấn', N'Đường Lê Hồng Phong, Quận Hải An, Thành phố Hải Phòng', N'0932200679')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (34, N'Phạm Anh Minh', N'Số 38, Bạch Đằng, Quận Hải Châu, Thành phố Đà Nẵng', N'0987987352')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (36, N'Dương Kim Cương', N'Đường Hạc Thành, Thành phố Thanh Hoá, Tỉnh Thanh Hóa', N'0904313086')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (37, N'Vũ Trung Kiên', N'Số 7, Đường Trần Hưng Đạo, TP Lạng Sơn, Tỉnh Lạng Sơn', N'0968686291')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (38, N'Cao Ngọc Minh', N'04 Đường Tôn Đức Thắng, TP Long Xuyên, Tỉnh An Giang', N'0918207369')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (39, N'Trần Hữu Phúc', N'Số 9 Phạm Văn Đồng, Thị xã BRVT, Tỉnh Bà Rịa-Vũng Tàu', N'0987246616')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (40, N'Phạm Thị Hồng', N'Số 01, Hoàng Văn Thụ, TP Bắc Giang, Tỉnh Bắc Giang', N'0975576199')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (41, N'Nguyễn Văn Tùng Lâm', N'Số 04 Lê Duẩn, Thành phố Buôn Ma Thuột, Tỉnh Đắk Lắk', N'0986525976')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (42, N'Nguyễn Thị Ánh', N'Đường Lê Duẩn, Thị Xã Gia Nghĩa, Tỉnh Đăk Nông', N'0984148589')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (43, N'Dương Ngọc Đạt', N'Số 13, Tổ 28, Thành phố Điện Biên Phủ, Tỉnh Điện Biên', N'0982928483')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (44, N'Nguyễn Mạnh Hiếu', N'Số 40, Đường CMT8, Thành phố Biên Hoà, Tỉnh Đồng Nai', N'0982437738')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (45, N'Hồ Trung Kiên', N'Số 1, Đường Lê Qúy Đôn, TP Cao Lãnh, Tỉnh Đồng Tháp', N'0974624689')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (46, N'Hoàng Quý Phương', N'173 Lý Thái Tổ, Thành phố Pleiku, Tỉnh Gia Lai', N'0974384863')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (47, N'Nguyễn Khắc Sơn', N'331 Đường Trần Phú, TP Hà Giang, Tỉnh Hà Giang', N'0944586093')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (48, N'Nguyễn Văn Tuấn', N'Số 161 Trường Chinh, Thành phố Phủ Lý, Tỉnh Hà Nam', N'0974456408')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (49, N'Phạm Ngọc Hiển', N'Số 94, Đường Phan Đình Phùng, TP Hà Tĩnh, Tỉnh Hà Tĩnh', N'0376647587')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (50, N'Hoàng Anh Minh', N'Số 7, Đường Đức Minh, TP Hải Dương, Tỉnh Hải Dương', N'0369521456')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (51, N'Đinh Thị Hồng Nhung', N'Khu hành chính 406, Đường Trần Hưng Đạo, TP Vị Thanh', N'0912327394')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (52, N'Nguyễn Công Tuấn', N'105 Đường Trần Hưng Đạo, TP Hoà Bình, Tỉnh Hòa Bình', N'0975134976')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (53, N'Nguyễn Quang Tiệp', N'Số 310, Nguyễn Văn Linh, TP Hưng Yên, Tỉnh Hưng Yên', N'0916396069')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (54, N'Phạm Phương Anh', N'01 Phan Bội Châu, Phường Xương Huân, Thành phố Nha Trang, Tỉnh Khánh Hòa', N'0975384385')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (55, N'Mai Văn An', N'8 Nguyễn Công Trứ, Thành phố Rạch Gía, Tỉnh Kiên Giang', N'0979233769')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (56, N'Phạm Đức Bắc', N'Số 204 Trần Phú, Thành phố Kon Tum, Tỉnh Kon Tum', N'0983608995')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (57, N'Nguyễn Văn Cường', N'Phường Tân phong, Thị xã Lai Châu, Tỉnh Lai Châu', N'0983636969')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (58, N'Lê Hữu Dũng', N'27 Trần Phú, Phường 4, Thành phố Đà Lạt, Tỉnh Lâm Đồng', N'0988209884')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (59, N'Nguyễn Huy Dương', N'12A Đường Hoàng Thái Hiếu, TP Vĩnh Long, Tỉnh Vĩnh Long', N'0934475383')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (60, N'Nguyễn Văn Đua', N'Tổ 19, Phường Bắc Cường, TP Lào Cai, Tỉnh Lào Cai', N'0966525050')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (61, N'Hoàng Minh Đức', N'Số 116 Trương Định, Thành phố Tân An, Tỉnh Long An', N'0982901587')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (62, N'Nguyễn Giang', N'Số 126 Nguyễn Đức Thuận, TP Nam Định, Tỉnh Nam Định', N'0986982165')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (63, N'Vũ Trường Giang', N'Số 105A Nguyễn Thị Minh Khai, TP Vinh, Tỉnh Nghệ An', N'0913583824')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (64, N'Nguyễn Vinh Hải', N'Đường Trương Hán Siêu, TP Ninh Bình, Tỉnh Ninh Bình', N'0944077406')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (65, N'Cao Thái Hiệp', N'161 Đường Thống Nhất, TP Phan Rang-Tháp Chàm', N'0914162689')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (66, N'Trịnh Huy Hoàng', N'Đường Nguyễn Tất Thành, TP Việt Trì, Tỉnh Phú Thọ', N'0369788679')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (67, N'Bùi Tuấn Kiên', N'Đường Trần Quang Khải, TP Đồng Hới, Tỉnh Quảng Bình', N'0978178764')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (68, N'Nguyễn Thị Mến', N'Số 04 Nguyễn Chí Thanh, TP Tam Kỳ, Tỉnh Quảng Nam', N'0123666555')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (69, N'Nguyễn Văn Minh', N'Số 01 Đường 30/4, Thành phố Sóc Trăng, Tỉnh Sóc Trăng', N'0905682529')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (70, N'Đỗ Văn Nam', N'Số 61, Đường Tô Hiệu, Tổ 6, TP Sơn La, Tỉnh Sơn La', N'0982725726')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (71, N'Tạ Ngọc Nguyên', N'Số 401 Đường 30/4, Thị xã Tây Ninh, Tỉnh Tây Ninh', N'0937303282')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (72, N'Nguyễn  Văn Ninh', N'Số 08 Hai Bà Trưng, Thành phố Thái Bình, Tỉnh Thái Bình', N'0974131489')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (73, N'Đinh Ngọc Phú', N'364/1 Đường Bắc Kạn, TP Thái Nguyên, Tỉnh Thái Nguyên', N'0984084034')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (74, N'Nguyễn Cao Phú', N'15 Tôn Đức Thắng, Thành phố Huế, Tỉnh Thừa Thiên-Huế', N'0977557349')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (75, N'Trịnh Văn Phụng', N'30 Lê Lợi, Phường 1, Thành phố Mỹ Tho, Tỉnh Tiền Giang', N'0349616718')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (76, N'Nguyễn Bá Quang', N'Số 171 Đường Phạm Hồng Thái, TP Trà Vinh, Tỉnh Trà Vinh', N'0369521456')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (77, N'Nguyễn Bá Quân', N'Đường 17/8, Thành phố Tuyên Quang, Tỉnh Tuyên Quang', N'0372389777')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (78, N'Đào Như Quỳnh', N'Đường Lý Thái Tổ, Thành phố Vĩnh Yên, Tỉnh Vĩnh Phúc', N'0373433886')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (79, N'Nguyễn Thế Tài', N'Số 965 Đường Yên Ninh, TP Yên Bái, Tỉnh Yên Bái', N'0988753023')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (80, N'Phùng Thế Thìn', N'Số 58 Lê Duẩn, Thành phố Tuy Hòa, Tỉnh Phú Yên', N'0356077115')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (81, N'Phạm Đức Thuận', N'Đường Phạm Văn Đồng, TP Quảng Ngãi, Tỉnh Quảng Ngãi', N'0972907579')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (82, N'Bùi Văn Tới', N'447 Nguyễn Văn Cừ, TP Hạ Long, Tỉnh Quảng Ninh', N'0904054732')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (83, N'Vũ Đức Trọng', N'Số 45 Lê Lợi, Thành phố Đông Hà, Tỉnh Quảng Trị', N'0358102387')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (85, N'Trần Anh Tuấn', N'Số 52 đường Mã Mây, Phường Hàng Buồm, Quận Hoàn Kiếm, Thành phố Hà Nội', N'0983043195')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (86, N'Bùi Nhật Tú', N'Số 20, liền kề 9, khu đô thị mới Kim Chung Di Trạch, Xã Kim Chung, Huyện Hoài Đức, Thành phố Hà Nội', N'0976388281')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (87, N'Hoàng Minh Tứ', N'Tầng 2, Số 9, Ngõ 4, phố Duy Tân, Phường Dịch Vọng Hậu, Quận Cầu Giấy, Thành phố Hà Nội', N'0356077128')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (88, N'Lưu Tuấn Anh', N'58 Ngụy Như Kon Tum, Phường Nhân Chính, Quận Thanh Xuân, Thành phố Hà Nội', N'0976096113')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (89, N'Nguyễn Quang Anh', N'Sô 23B, ngõ 152 Đường Nguyễn Đình Hoàn, Phường Nghĩa Đô, Quận Cầu Giấy, Thành phố Hà Nội', N'0912992158')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (90, N'Nguyễn Trọng Quang Anh', N'18 Hàng Bông, Phường Hàng Gai, Quận Hoàn Kiếm, Thành phố Hà Nội', N'0979389891')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (91, N'Nguyễn Tuấn Anh', N'Số 116, Đường Bùi Xương Trạch, Phường Khương Đình, Quận Thanh Xuân, Thành phố Hà Nội', N'0979680065')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (92, N'Phạm Mai Anh', N'Số nhà 79 ngõ 213 Đường Giáp Nhất, Phường Nhân Chính, Quận Thanh Xuân, Thành phố Hà Nội', N'0976764388')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (93, N'Trịnh Việt Anh', N'Số 25, ngách 56, ngõ 79 Cầu Giấy, Phường Yên Hoà, Quận Cầu Giấy, Thành phố Hà Nội', N'0353344585')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (94, N'Nguyễn Ngọc Ánh', N'Tầng 7, tòa nhà Sannam, số 78 Duy Tân, Phường Dịch Vọng Hậu, Quận Cầu Giấy, Thành phố Hà Nội', N'0975808375')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (95, N'Nguyễn Thị Ngọc Ánh', N'Số 3 ngõ 115 Nguyễn Văn Trỗi, Phường Phương Liệt, Quận Thanh Xuân, Thành phố Hà Nội', N'0397565952')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (97, N'Bùi Đức Cảnh', N'Số 20 đường Bờ Sông, Phường Phú Đô, Quận Nam Từ Liêm, Thành phố Hà Nội', N'0914421796')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (98, N'Trần Huy Chí', N'Thôn Kim Động, Thị Trấn Kim Bài, Huyện Thanh Oai, Thành phố Hà Nội', N'0976054844')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (99, N'Lã Xuân Chuyên', N'Số nhà 19A, ngõ 269 Lạc Long Quân, Phường Nghĩa Đô, Quận Cầu Giấy, Thành phố Hà Nội', N'0986109656')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (100, N'Vũ Thành Công', N'Số 502 đường Võ Chí Công, Phường Xuân La, Quận Tây Hồ, Thành phố Hà Nội', N'0975861551')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (102, N'Nguyễn Thiên	Nam', N'Số 04 Hải Thượng Lãn Ông, TP.Phan Thiết, tỉnh Bình Thuận', N'0369521456')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (103, N'Nguyễn Ngọc Ánh', N'Tầng 7, tòa nhà Sannam, số 78 Duy Tân, Phường Dịch Vọng Hậu, Quận Cầu Giấy, Thành phố Hà Nội', N'0975808375')
GO
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
SET IDENTITY_INSERT [dbo].[LOAIHANG] ON 

INSERT [dbo].[LOAIHANG] ([MaLH], [TenLH]) VALUES (1, N'Rau củ quả')
INSERT [dbo].[LOAIHANG] ([MaLH], [TenLH]) VALUES (2, N'Hàng đông lạnh, tươi sống, hải sản')
INSERT [dbo].[LOAIHANG] ([MaLH], [TenLH]) VALUES (3, N'Bánh kẹo thực phẩm')
INSERT [dbo].[LOAIHANG] ([MaLH], [TenLH]) VALUES (4, N'Hóa phẩm và chất tẩy rửa')
INSERT [dbo].[LOAIHANG] ([MaLH], [TenLH]) VALUES (5, N'Mỹ phẩm')
INSERT [dbo].[LOAIHANG] ([MaLH], [TenLH]) VALUES (6, N'Mẹ và bé')
INSERT [dbo].[LOAIHANG] ([MaLH], [TenLH]) VALUES (7, N'Sữa tươi, chua, kem')
INSERT [dbo].[LOAIHANG] ([MaLH], [TenLH]) VALUES (8, N'Đồ uống')
INSERT [dbo].[LOAIHANG] ([MaLH], [TenLH]) VALUES (9, N'Hàng tiêu dùng thiết yếu')
INSERT [dbo].[LOAIHANG] ([MaLH], [TenLH]) VALUES (10, N'Giấy - khăn ướt - băng vệ sinh')
INSERT [dbo].[LOAIHANG] ([MaLH], [TenLH]) VALUES (11, N'Gia dụng')
INSERT [dbo].[LOAIHANG] ([MaLH], [TenLH]) VALUES (12, N'Văn phòng phẩm')
INSERT [dbo].[LOAIHANG] ([MaLH], [TenLH]) VALUES (13, N'Đồ chơi')
INSERT [dbo].[LOAIHANG] ([MaLH], [TenLH]) VALUES (14, N'Bông vải sợi - chăm sóc sức khỏe')
INSERT [dbo].[LOAIHANG] ([MaLH], [TenLH]) VALUES (15, N'Rượu')
SET IDENTITY_INSERT [dbo].[LOAIHANG] OFF
SET IDENTITY_INSERT [dbo].[MATHANG] ON 

INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (1, N'Dầu ăn Kiddy', 480, N'Chai', 36000, 72000, 9)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (2, N'Dầu ăn Neptune 400ml', 100, N'Chai', 15000, 30000, 9)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (3, N'Dầu ăn Simply 1l', 120, N'Chai', 43000, 86000, 9)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (4, N'Dầu ăn Mezan 1l', 200, N'Chai', 31000, 62000, 9)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (5, N'Dầu ăn Cái Lân 1l', 300, N'Chai', 28000, 56000, 9)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (6, N'Dầu ăn Neptune 1l', 53, N'Chai', 41500, 86000, 9)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (7, N'Dầu ăn Simply 2l', 180, N'Chai', 90000, 200000, 9)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (8, N'Dầu ăn Mezan 2l', 30, N'Chai', 84500, 182000, 9)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (9, N'Dầu ăn Neptune 5l', 35, N'Chai', 205000, 310000, 9)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (10, N'Bột mì Mezan 500g', 181, N'Gói', 8000, 12000, 9)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (11, N'Bột mì Mezan 1kg', 215, N'Gói', 13500, 24500, 9)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (12, N'Vedan 1kg', 181, N'Bịch', 50000, 120000, 5)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (13, N'Vedan 400g', 197, N'Bịch', 13500, 27000, 9)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (14, N'Vedan cánh bé', 201, N'Bịch', 84500, 205000, 9)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (15, N'SRM Nivea Tẩy Trang', 44, N'Lọ', 34000, 72000, 5)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (16, N'SRM Nivea Sạch Nhờn', 56, N'Lọ', 34000, 72000, 5)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (17, N'SRM Nivea Trắng Da Mới', 46, N'Lọ', 34000, 72000, 5)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (18, N'SRM Nivea Trắng Da', 44, N'Lọ', 30000, 62000, 5)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (19, N'SRM Nivea Sáng Da Nám 100g', 84, N'Lọ', 60000, 134000, 5)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (20, N'Kem Nivea Xanh', 74, N'Hộp', 28000, 59000, 5)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (21, N'Kem Soft', 104, N'Hộp', 42000, 86000, 5)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (22, N'Khẩu trang Eros size L', 101, N'Hộp', 25000, 60000, 14)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (23, N'Khăn mặt Kiba', 111, N'Cái', 21000, 44000, 14)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (24, N'Khăn tắm bông tơ', 202, N'Cái', 125000, 220000, 14)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (25, N'Dầu ăn Kiddy', 30, N'Chai', 36000, 72000, 9)
INSERT [dbo].[MATHANG] ([MaMH], [TenMH], [SoLuong], [DonViTinh], [DonGiaNhap], [DonGiaBan], [MaLH]) VALUES (26, N'Dầu ăn Kiddy', 240, N'Chai', 36000, 72000, 9)
SET IDENTITY_INSERT [dbo].[MATHANG] OFF
SET IDENTITY_INSERT [dbo].[NHACUNGCAP] ON 

INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES (1, N'Nhà phân phối cung cấp Bình dân', N'0902 246 699', N'Số 9 Cốm Vòng, Dịch Vọng Hậu, HN')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES (2, N'Nhà phân phối cung cấp Dương Nội', N'0912 561 552', N'352 Giải Phóng, Thanh Xuân, HN')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES (3, N'Nhà phân phối cung cấp Đa Lộc', N'0973 470 475', N'Dương Nội, Hà Đông, HN')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES (4, N'Nhà phân phối cung cấp Ngọc Linh', N'0989355310', N'74 Dương Nội, Hà Đông, HN')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES (5, N'Công ty Cổ Phần hàng Việt cao cấp', N'0906 522 468', N'Tổ dân phố Đoàn Kết,P.  Dương Nội, Q. Hà Đông, HN')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES (6, N'Nhà phân phối cung cấp Hóa Mỹ phẩm', N'0985 474 386', N'Số 14/192 Hạ Đình, Thanh Xuân, HN')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES (7, N'Nhà phân phối cung cấp thực phẩm bánh kẹo Minh Khôi', N'0974 564 533', N'Số 108 A – D2, Ngõ 215 Tô Hiệu, HN')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES (8, N'Cty PP Tiên Tiến - Sữa Enfa', N'0435501946', N'45/35 Khương Hạ, Phường Khương Đình, HN (trong nhà máy PROSIMEX)  ')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES (9, N'CTy Đông Dương - Váng sữa monte, xúc xích', N'0964 751 198', N'Kiều Mai - Từ Liêm - Hà Nội')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES (10, N'Cty TNHH XNK TM Việt Linh - Sữa Fami', N'0918449386', N'360 Bùi Xương Trạch, Thanh Xuân, Hà Nội')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES (11, N'Nhà phân phối cung cấp Minh Duẩn - Sữa tắm', N'0432484361', N'P101 toà nhà SeaProdex- Số 20 láng hạ')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES (12, N'Nhà phân phối cung cấp Hạ Long: Xúc xích đồ hộp, váng sữa', N'0473021136', N'Phòng 202, Tòa nhà CT36, 326 Lê Trọng Tấn, Q.Thanh Xuân, HN')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES (13, N'Nhà phân phối cung cấp Sữa Kun - Ngọc Việt', N'0984152513', N'Số 56A1, KĐT mới Đại Kim – Hoàng Mai, HN')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES (14, N'Sữa TH True Milk', N'0905 988 668', N'Số 369B Nguyễn Trãi, Thanh Xuân, Hà Nội')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES (15, N'Nhà phân phối cung cấp Hà Phương', N'0437592825', N'24-C5 , KĐT Nam Thăng Long, Phú Thượng, Tây Hồ, Hà Nội.')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES (16, N'Nhà phân phối cung cấp Pesico - Chuyên nước khoáng', N'0432 171 903', N'78 Đại An - Văn Quán - Hà Đông')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES (17, N'Nhà phân phối cung cấp Rượu vodka Công ty TNHH Beluga Viet Nam', N'0918 631 388', N'Số 38 - Phố Thắng Lợi - Phường Quỳnh Lôi - Hai Bà Trưng - Hà Nội')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES (18, N'Nhà phân phối cung cấp Mai Phú Quý - Chuyên các loại giấy', N'0946 622 796', N'TDP Thắng Lợi - Dương Nội - Hà Đông - Hà Nội.')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES (19, N'Nhà phân phối cung cấp nước giải khát Việt Đức', N'0934579123', N'Số nhà 78 Đại An - P. Văn Quán - Hà Đông')
SET IDENTITY_INSERT [dbo].[NHACUNGCAP] OFF
SET IDENTITY_INSERT [dbo].[NHANVIEN] ON 

INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT]) VALUES (1, N'Đặng Xuân Tuấn', CAST(0x9F160B00 AS Date), N'Nam', N'Hà Nội', N'0694589632')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT]) VALUES (2, N'Phạm Đức Thuận', CAST(0xB01C0B00 AS Date), N'Nam', N'Hà Nội', N'0369789632')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT]) VALUES (3, N'Phạm Mai Anh', CAST(0x18210B00 AS Date), N'Nữ', N'Hà Nội', N'0694589632')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT]) VALUES (4, N'Đào Như Quỳnh', CAST(0x301F0B00 AS Date), N'Nữ', N'Hà Nội', N'0694589632')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT]) VALUES (6, N'Đặng Xuân Tuấn', CAST(0x9F160B00 AS Date), N'Nữ', N'Hà Nội', N'0694589632')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT]) VALUES (7, N'Đặng Xuân Tuấn', CAST(0x9F160B00 AS Date), N'Nữ', N'Hà Đông', N'0694589632')
SET IDENTITY_INSERT [dbo].[NHANVIEN] OFF
INSERT [dbo].[TAIKHOAN] ([TenDN], [MK]) VALUES (N'admin1', N'123')
INSERT [dbo].[TAIKHOAN] ([TenDN], [MK]) VALUES (N'admin2', N'456')
INSERT [dbo].[TAIKHOAN] ([TenDN], [MK]) VALUES (N'admin3', N'789')
ALTER TABLE [dbo].[CHITIETHOADONBAN]  WITH CHECK ADD FOREIGN KEY([MaHDB])
REFERENCES [dbo].[HOADONBAN] ([MaHDB])
GO
ALTER TABLE [dbo].[CHITIETHOADONBAN]  WITH CHECK ADD FOREIGN KEY([MaMH])
REFERENCES [dbo].[MATHANG] ([MaMH])
GO
ALTER TABLE [dbo].[CHITIETHOADONNHAP]  WITH CHECK ADD FOREIGN KEY([MaHDN])
REFERENCES [dbo].[HOADONNHAP] ([MaHDN])
GO
ALTER TABLE [dbo].[CHITIETHOADONNHAP]  WITH CHECK ADD FOREIGN KEY([MaMH])
REFERENCES [dbo].[MATHANG] ([MaMH])
GO
ALTER TABLE [dbo].[HOADONBAN]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[HOADONBAN]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[HOADONNHAP]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NHACUNGCAP] ([MaNCC])
GO
ALTER TABLE [dbo].[MATHANG]  WITH CHECK ADD FOREIGN KEY([MaLH])
REFERENCES [dbo].[LOAIHANG] ([MaLH])
GO
USE [master]
GO
ALTER DATABASE [NHOM1_QUANLYSIEUTHI] SET  READ_WRITE 
GO
