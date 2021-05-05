using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nhom1___QuanLySieuThi.Models
{
    class LoaiHang
    {
        public int MaLH { set; get; }
        public string TenLH { set; get; }

        public LoaiHang() { }

        public LoaiHang(DataRow data)
        {
            this.MaLH = Int32.Parse(data["MaLH"].ToString());
            this.TenLH = data["TenLH"].ToString();
        }
    }
}
