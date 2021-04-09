using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nhom1___QuanLySieuThi.Models
{
    class HoaDonNhap
    {
        public int MaHDN { set; get; }
        public int MaNCC { set; get; }
        public DateTime NgayNhap { set; get; }
        
        public HoaDonNhap() { }

        public HoaDonNhap(DataRow data)
        {
            this.MaHDN = Int32.Parse(data["MaHDN"].ToString());
            this.MaNCC = Int32.Parse(data["MaNCC"].ToString());
            this.NgayNhap = DateTime.Parse(data["NgayNhap"].ToString());
        }
    }
}
