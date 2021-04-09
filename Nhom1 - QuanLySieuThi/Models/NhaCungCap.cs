using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nhom1___QuanLySieuThi.Models
{
    class NhaCungCap
    {
        public int MaNCC { set; get; }
        public string TenNCC { set; get; }

        public NhaCungCap() { }

        public NhaCungCap(DataRow data)
        {
            this.MaNCC = Int32.Parse(data["MaNCC"].ToString());
            this.TenNCC = data["TenNCC"].ToString();
        }
    }
}
