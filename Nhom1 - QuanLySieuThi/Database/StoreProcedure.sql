USE NHOM1_QUANLYSIEUTHI
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
  

  DELETE MATHANG
  WHERE MaMH = @MaMH
END
GO

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
