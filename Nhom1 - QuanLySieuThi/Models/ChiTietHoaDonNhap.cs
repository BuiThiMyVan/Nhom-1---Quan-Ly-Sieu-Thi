using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nhom1___QuanLySieuThi.Models
{
    class ChiTietHoaDonNhap
    {
        public int MaHDN { set; get; }
        public int MaMH { set; get; }
        public int SoLuong { set; get; }
        public float DonGia { set; get; }

        public ChiTietHoaDonNhap() { }

        public ChiTietHoaDonNhap(DataRow data)
        {
            this.MaHDN = Int32.Parse(data["MaHDN"].ToString());
            this.MaMH = Int32.Parse(data["MaMH"].ToString());
            this.SoLuong = Int32.Parse(data["SoLuong"].ToString());
            this.DonGia = float.Parse(data["DonGia"].ToString());
        }
    }
}
