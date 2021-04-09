using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nhom1___QuanLySieuThi.Models
{
    class NhanVien
    {
        public int MaNV { set; get; }
        public string TenNV { set; get; }
        public int GioiTinh { set; get; }
        public string DiaChi { set; get; }
        public string SDT { set; get; }
        public DateTime NgaySinh { set; get; }

        public NhanVien() { }

        public NhanVien(DataRow data)
        {
            this.MaNV = Int32.Parse(data["MaNV"].ToString());
            this.TenNV = data["TenNV"].ToString();
            this.GioiTinh = Int32.Parse(data["GioiTinh"].ToString());
            this.SDT = data["SDT"].ToString();
            this.NgaySinh = DateTime.Parse(data["NgaySinh"].ToString());
        }
    }
}
