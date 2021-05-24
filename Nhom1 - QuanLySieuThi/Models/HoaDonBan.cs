using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nhom1___QuanLySieuThi.Models
{
    class HoaDonBan
    {
        public int MaHDB { set; get; }
        public int MaNV { set; get; }
        public DateTime? NgayBan { set; get; }
        public int? MaKH { set; get; }

        public HoaDonBan() { }

        public HoaDonBan(DataRow data)
        {
            this.MaHDB = Int32.Parse(data["MaHDB"].ToString());
            this.MaNV = Int32.Parse(data["MaNV"].ToString());
            this.NgayBan = NgayBan == null ? (DateTime?)null : DateTime.Parse(data["NgayBan"].ToString());
            this.MaKH = MaKH == null ? (int?)null : Int32.Parse(data["MaKH"].ToString());
        }
    }
}
