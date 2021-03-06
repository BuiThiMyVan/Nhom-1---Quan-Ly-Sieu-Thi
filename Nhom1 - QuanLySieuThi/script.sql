USE [master]
GO
/****** Object:  Database [NHOM1_QUANLYSIEUTHI]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[HoaDonNhapVuaThem]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_GetAllNV]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_GetChiTietHDB_ById]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_GetHDB_ById]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_GetMaMHByTenMH]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_GetMHByMaHDB]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_GetNVByMaHDB]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_GiaBanByMaMH]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_HoaDonBan_Delete]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_HoaDonBan_GetAll]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_HoaDonBan_Insert]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_HoaDonBan_Search]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_HoaDonBan_Update]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_InsertChiTietHDB]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_LaySLNhap]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_LaySLTon]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[Proc_LaySLXuat]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[QLST_Login]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ChiTietHoaDonNhap_GetAll]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ChiTietHoaDonNhap_Insert]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ChiTietHoaDonNhap_Search]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_HoaDonNhap_GetAll]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_HoaDonNhap_Insert]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_HoaDonNhap_Search]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_KhachHang_Delete]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_KhachHang_GetAll]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_KhachHang_Insert]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_KhachHang_Search]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_KhachHang_Update]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_LoaiHang_GetAll]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_LoaiHang_Search]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_MatHang_Delete]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_MatHang_GetAll]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_MatHang_Insert]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_MatHang_Search]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_MatHang_Update]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_NhaCungCap_GetAll]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_NhanVien_Delete]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_NhanVien_Insert]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_NhanVien_Search]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_NhanVien_Update]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  Table [dbo].[CHITIETHOADONBAN]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  Table [dbo].[CHITIETHOADONNHAP]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  Table [dbo].[HOADONBAN]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  Table [dbo].[HOADONNHAP]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  Table [dbo].[LOAIHANG]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  Table [dbo].[MATHANG]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 29/06/2021 3:20:11 SA ******/
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
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 29/06/2021 3:20:11 SA ******/
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
