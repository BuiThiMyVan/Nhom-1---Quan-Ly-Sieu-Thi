using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nhom1___QuanLySieuThi.Models
{
    class KhachHang
    {
        public int MaKH { set; get; }
        public string TenKH { set; get; }
        public string DiaChi { set; get; }
        public string SDT { set; get; }
        
        public KhachHang() { }

        public KhachHang(DataRow data)
        {
            this.MaKH = Int32.Parse(data["MaKH"].ToString());
            this.TenKH = data["TenKH"].ToString();
            this.DiaChi = data["DiaChi"].ToString();
            this.SDT = data["SDT"].ToString();
        }
    }
}
