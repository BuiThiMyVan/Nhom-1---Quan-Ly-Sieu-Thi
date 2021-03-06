USE NHOM1_QUANLYSIEUTHI
GO

CREATE PROC QLST_Login
@username nvarchar(50), @pass nvarchar(50)
AS
BEGIN
	SELECT * FROM dbo.TAIKHOAN WHERE TenDN = @username AND MK = @pass
END
GO

-----------------------Thiep Invoice------------------------
CREATE PROCEDURE SP_ChiTietHoaDonNhap_GetAll
AS
BEGIN
  SELECT *
  FROM CHITIETHOADONNHAP
END
GO

CREATE PROCEDURE SP_LoaiHang_GetAll
AS
BEGIN
  SELECT *
  FROM LOAIHANG
END
GO

CREATE PROCEDURE SP_ChiTietHoaDonNhap_Search
 @NgayNhap DATE
AS
BEGIN
  SELECT CTHDN.*
  FROM CHITIETHOADONNHAP AS CTHDN, HOADONNHAP AS HDN
  WHERE NgayNhap = @NgayNhap AND HDN.MaHDN = CTHDN.MaHDN
END
GO

CREATE PROCEDURE SP_HoaDonNhap_Search
 @NgayNhap DATE
AS
BEGIN
  SELECT HDN.*
  FROM HOADONNHAP AS HDN
  WHERE NgayNhap = @NgayNhap
END
GO

CREATE PROCEDURE SP_NhaCungCap_GetAll
AS
BEGIN
  SELECT *
  FROM NHACUNGCAP
END
GO

CREATE PROCEDURE SP_MatHang_GetAll
AS
BEGIN
  SELECT *
  FROM MATHANG
END
GO

CREATE PROCEDURE SP_HoaDonNhap_GetAll
AS
BEGIN
  SELECT *
  FROM HOADONNHAP
END
GO

CREATE PROCEDURE SP_HoaDonNhap_Insert
  @MaNCC INT,
  @NgayNhap DATE
AS
BEGIN
  INSERT INTO HOADONNHAP
    (MaNCC, NgayNhap)
  VALUES(@MaNCC, @NgayNhap)
END
GO

CREATE PROCEDURE SP_ChiTietHoaDonNhap_Insert
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

CREATE PROCEDURE HoaDonNhapVuaThem
AS
BEGIN
select top 1
	MaHDN
from HOADONNHAP as HDN
order by MaHDN desc
END
GO

CREATE PROCEDURE SP_MatHang_Insert
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

CREATE PROCEDURE SP_MatHang_Delete
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

go

CREATE PROCEDURE SP_MatHang_Update
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

CREATE PROCEDURE SP_MatHang_Search
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

CREATE PROCEDURE SP_LoaiHang_Search
	@maMH INT
AS
BEGIN
	SELECT lh.MaLH, lh.TenLH
	FROM MATHANG mh, LOAIHANG lh
	WHERE mh.MaMH = @maMH and mh.MaLH = lh.MaLH
END
GO
-------------------------------------------------KDLONG-----------------------------------------------------------
CREATE PROCEDURE SP_KhachHang_GetAll
AS
BEGIN
  SELECT *
  FROM KHACHHANG
END
GO

CREATE PROCEDURE SP_KhachHang_Insert
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

CREATE PROCEDURE SP_KhachHang_Delete
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

CREATE PROCEDURE SP_KhachHang_Update
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

CREATE PROCEDURE SP_KhachHang_Search
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
-------------------------------------------------------/KDLONG---------------------------------------------





----NVHIEN

CREATE PROCEDURE Proc_HoaDonBan_GetAll
AS
BEGIN
  SELECT *
  FROM HOADONBAN
END
GO

CREATE PROCEDURE Proc_HoaDonBan_Insert
  @maNV int,
  @ngayBan date
AS
BEGIN
  INSERT INTO HOADONBAN
    (MaNV, NgayBan)
  VALUES(@maNV, @ngayBan)
END
GO

CREATE PROCEDURE Proc_HoaDonBan_Delete
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

CREATE PROCEDURE Proc_HoaDonBan_Update
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

CREATE PROCEDURE Proc_HoaDonBan_Search
  @searchValue NVARCHAR(200)
AS
BEGIN
  SELECT *
  FROM HOADONBAN
  WHERE MaHDB = @searchValue
END
GO

----NVHIEN
Create Proc Proc_GetHDB_ById
@maHDB int
AS
BEGIN
  select * from HOADONBAN where MaHDB = @maHDB
END
GO

----NVHIEN
Create Proc Proc_GetChiTietHDB_ById
@maHDB int
AS
BEGIN
  select * from CHITIETHOADONBAN where MaHDB = @maHDB
END
GO

Create Proc Proc_GetAllNV
as
begin 
select * from NHANVIEN 
end
go

Create Proc Proc_GetNVByMaHDB
@maHDB int
as
begin 

select * from NHANVIEN where MaNV = (select MaNV from HOADONBAN where MaHDB = @maHDB)
end
go

Create Proc Proc_GetMHByMaHDB
@maHDB int
as begin 
select * from MATHANG where MaMH = (select MaMH from CHITIETHOADONBAN where MaHDB = @maHDB)
end
go

Create Proc Proc_InsertChiTietHDB
@maHDB int ,@maMH int, @sl int, @giamGia float, @tongTien float
as 
begin
	Insert into CHITIETHOADONBAN(MaHDB,MaMH,SoLuong,GiamGia,ThanhTien)
	Values (@maHDB,@maMH,@sl,@giamGia,@tongTien)

	Update MATHANG
  set SoLuong = SoLuong + @sl
  where MaMH = @MaMH
end
go
Create Proc Proc_GetMaMHByTenMH
@tenMH nvarchar(MAX)
as begin 
	select MaMH from MATHANG where TenMH = @tenMH
end

go
Create Proc Proc_GiaBanByMaMH
@maMH int
as 
begin
	select DonGiaBan from MATHANG where MaMH = @maMH
end
go
----Proc_GiaBanByMaMH '1'

--dat----
Create Proc Proc_LaySLNhap
 @CanTren date,
 @CanDuoi date
as
begin
	select CHITIETHOADONNHAP.MaHDN,CHITIETHOADONNHAP.MaMH,CHITIETHOADONNHAP.SoLuong,CHITIETHOADONNHAP.ThanhTien
	from CHITIETHOADONNHAP,HOADONNHAP where CHITIETHOADONNHAP.MaHDN = HOADONNHAP.MaHDN and NgayNhap between  @CanDuoi and @CanTren

end
go


Create Proc Proc_LaySLXuat
 @CanTren date,
 @CanDuoi date
as
begin
	select CHITIETHOADONBAN.MaHDB,CHITIETHOADONBAN.MaMH,CHITIETHOADONBAN.SoLuong,CHITIETHOADONBAN.GiamGia,CHITIETHOADONBAN.ThanhTien
	from CHITIETHOADONBAN,HOADONBAN where CHITIETHOADONBAN.MaHDB = HOADONBAN.MaHDB and NgayBan between @CanDuoi and @CanTren

end
go
Create Proc Proc_LaySLTon
as
begin
	select * from MATHANG where SoLuong >0
end
go

-----------------------quynh-nhanvien-------------------------------

CREATE PROCEDURE SP_NhanVien_Insert
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

CREATE PROCEDURE SP_NhanVien_Delete
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

CREATE PROCEDURE SP_NhanVien_Update
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

CREATE PROCEDURE SP_NhanVien_Search
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