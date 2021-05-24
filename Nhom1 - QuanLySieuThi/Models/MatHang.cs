using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nhom1___QuanLySieuThi.Models
{
    class MatHang
    {
        public int MaMH { set; get; }
        public string TenMH { set; get; }
        public int SoLuong { set; get; }
        public string DonViTinh { set; get; }
        public float? DonGiaNhap { set; get; }
        public float? DonGiaBan { set; get; }
        public int? MaLH { set; get; }

        public MatHang() { }

        public MatHang(DataRow data)
        {
            this.MaMH = Int32.Parse(data["MaMH"].ToString());
            this.TenMH = data["TenMH"].ToString();
            this.SoLuong = Int32.Parse(data["SoLuong"].ToString());
            this.DonViTinh = data["DonViTinh"].ToString();
            this.DonGiaNhap = DonGiaNhap == null ? (float?)null : float.Parse(data["DonGiaNhap"].ToString());
            this.DonGiaBan = DonGiaBan == null ? (float?)0 : float.Parse(data["DonGiaBan"].ToString()); 
            this.MaLH = MaLH == null ? (int?)null : Int32.Parse(data["MaLH"].ToString());
        }
    }
}
