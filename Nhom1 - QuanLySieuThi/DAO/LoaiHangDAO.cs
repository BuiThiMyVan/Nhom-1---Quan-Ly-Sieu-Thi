using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Nhom1___QuanLySieuThi.Models;
using Nhom1___QuanLySieuThi.DAO;
namespace Nhom1___QuanLySieuThi.DAO
{
    class LoaiHangDAO
    {
        private static LoaiHangDAO instance;

        internal static LoaiHangDAO Instance
        {
            get { if (instance == null) instance = new LoaiHangDAO(); return instance; }
            private set { instance = value; }
        }

        public List<LoaiHang> GetAll()
        {
            List<LoaiHang> list = new List<LoaiHang>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_LoaiHang_GetAll");
            foreach (DataRow item in data.Rows)
            {
                LoaiHang entry = new LoaiHang(item);
                list.Add(entry);
            }
            return list;
        }

        public LoaiHang GetLoaiHangByMa(int mamh)
        {          
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_LoaiHang_Search @maMH", new object[] { mamh });
            LoaiHang loaihang = new LoaiHang(data.Rows[0]);
            return loaihang;
        }
    }
}
