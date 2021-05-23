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





----NVHIEN

CREATE PROCEDURE Proc_HoaDonBan_GetAll
AS
BEGIN
  SELECT *
  FROM HOADONBAN
END
GO

CREATE PROCEDURE Proc_HoaDonBan_Insert
  @maNV int,@ngayBan date,@tenKH NVARCHAR(50),
  @diaChi NVARCHAR(100),
  @sdt NVARCHAR(10)
AS
BEGIN
  INSERT INTO HOADONBAN
    (MaNV, NgayBan)
  VALUES(@maNV, @ngayBan)
  INSERT INTO KHACHHANG
    (TenKH, DiaChi,SDT)
  VALUES(@tenKH, @diaChi,@sdt)
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
  @maHDB int,@maNV int,@ngayBan date,@tenKH NVARCHAR(50),
  @diaChi NVARCHAR(100),
  @sdt NVARCHAR(10)
AS
BEGIN
  UPDATE HOADONBAN
  SET 
  MaNV = @maNV,
  NgayBan = @ngayBan
  WHERE MaHDB = @maHDB

  UPDATE KhachHang
  SET 
  TenKH = @tenKH,
  DiaChi = @diaChi,
  SDT = @sdt
  WHERE MaKH = (select MaKH from HOADONBAN where MaHDB = @maHDB)
  
END
GO

CREATE PROCEDURE Proc_HoaDonBan_Search
  @searchValue NVARCHAR(200)
AS
BEGIN
  SELECT *
  FROM HOADONBAN
  WHERE MaHDB LIKE N'%' + @searchValue + '%'
    OR MaNV LIKE N'%' + @searchValue + '%'
    OR NgayBan LIKE N'%' + @searchValue + '%'
END
GO
----NVHIEN