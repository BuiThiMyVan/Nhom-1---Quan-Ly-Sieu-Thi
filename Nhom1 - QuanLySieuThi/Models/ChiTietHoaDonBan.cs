using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nhom1___QuanLySieuThi.Models
{
    class ChiTietHoaDonBan
    {
        public int MaHDB { set; get; }
        public int MaMH { set; get; }
        public int SoLuong { set; get; }
        public float DonGia { set; get; }
        public float GiamGia { set; get; }
        public float ThanhTien { set; get; }
        
        public ChiTietHoaDonBan() { }

        public ChiTietHoaDonBan(DataRow data)
        {
            this.MaHDB = Int32.Parse(data["MaHDB"].ToString());
            this.MaMH = Int32.Parse(data["MaMH"].ToString());
            this.SoLuong = Int32.Parse(data["SoLuong"].ToString());
            this.DonGia = float.Parse(data["DonGia"].ToString());
            this.GiamGia = float.Parse(data["GiamGia"].ToString());
            this.ThanhTien = float.Parse(data["ThanhTien"].ToString());
        }
    }
}
