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
        public DateTime? NgaySinh { set; get; }
        public string GioiTinh { set; get; }
        public string DiaChi { set; get; }
        public string SDT { set; get; }
       

        public NhanVien() { }

        public NhanVien(DataRow data)
        {
            this.MaNV = Int32.Parse(data["MaNV"].ToString());
            this.TenNV = data["TenNV"].ToString();
            this.NgaySinh =DateTime.Parse(data["NgaySinh"].ToString());
            this.GioiTinh = data["GioiTinh"].ToString();
            this.DiaChi = data["DiaChi"].ToString();
            this.SDT = data["SDT"].ToString();
           
        }
    }
}
