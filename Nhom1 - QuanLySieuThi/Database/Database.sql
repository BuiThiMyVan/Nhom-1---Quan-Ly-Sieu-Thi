CREATE DATABASE NHOM1_QUANLYSIEUTHI
GO
USE NHOM1_QUANLYSIEUTHI

CREATE TABLE KHACHHANG (
	MaKH INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	TenKH NVARCHAR(50) NULL,
	DiaChi NVARCHAR(100) NULL,
	SDT VARCHAR(10) NULL
)

CREATE TABLE LOAIHANG (
	MaLH INT IDENTITY NOT NULL PRIMARY KEY,
	TenLH NVARCHAR(MAX) NOT NULL
)

CREATE TABLE MATHANG (
	MaMH INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	TenMH NVARCHAR(MAX) NULL,
	SoLuong INT NULL,
	DonViTinh NVARCHAR(10) NULL,
	DonGiaNhap FLOAT NULL,
	DonGiaBan FLOAT NULL,
	MaLH INT NULL,
	FOREIGN KEY(MaLH) REFERENCES LOAIHANG(MaLH)
)

CREATE TABLE NHANVIEN (
	MaNV INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	TenNV NVARCHAR(50) NULL,
	NgaySinh DATE NULL,
	GioiTinh INT NULL,
	DiaChi NVARCHAR(100) NULL,
	SDT VARCHAR(10) NULL
)

CREATE TABLE HOADONBAN (
	MaHDB INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	MaNV INT NULL,
	NgayBan DATE NULL,
	MaKH INT NULL,
	FOREIGN KEY(MaNV) REFERENCES NHANVIEN(MaNV),
	FOREIGN KEY(MaKH) REFERENCES KHACHHANG(MaKH)
)

CREATE TABLE CHITIETHOADONBAN (
	MaHDB INT NOT NULL,
	MaMH INT NOT NULL,
	SoLuong INT NULL,
	GiamGia FLOAT NULL,
	ThanhTien FLOAT NULL,
	PRIMARY KEY(MaHDB,MaMH),
	FOREIGN KEY(MaHDB) REFERENCES HOADONBAN(MaHDB),
	FOREIGN KEY(MaMH) REFERENCES MATHANG(MaMH)
)

CREATE TABLE NHACUNGCAP (
	MaNCC INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	TenNCC NVARCHAR(MAX) NULL,
	SDT NVARCHAR(12) NULL,
	DiaChi NVARCHAR(MAX) NULL
)

CREATE TABLE HOADONNHAP (
	MaHDN INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	MaNCC INT NULL,
	NgayNhap DATE,
	FOREIGN KEY(MaNCC) REFERENCES NHACUNGCAP(MaNCC)
)

CREATE TABLE CHITIETHOADONNHAP (
	MaHDN INT NOT NULL,
	MaMH INT NOT NULL,
	SoLuong INT NULL,
	ThanhTien FLOAT NULL,
	PRIMARY KEY(MaHDN,MaMH),
	FOREIGN KEY(MaHDN) REFERENCES HOADONNHAP(MaHDN),
	FOREIGN KEY(MaMH) REFERENCES MATHANG(MaMH)
)