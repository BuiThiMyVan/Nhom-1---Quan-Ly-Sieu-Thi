USE NHOM1_QUANLYSIEUTHI

-------------------------------------------------KDLONG-----------------------------------------------------------
CREATE PROCEDURE SP_KhachHang_GetAll
AS
BEGIN
  SELECT *
  FROM KhachHang
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