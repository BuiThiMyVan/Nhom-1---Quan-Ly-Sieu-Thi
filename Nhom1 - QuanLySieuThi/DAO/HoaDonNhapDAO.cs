using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Nhom1___QuanLySieuThi.Models;
using Nhom1___QuanLySieuThi.DAO;
using System.Data;

namespace Nhom1___QuanLySieuThi.DAO
{
    class HoaDonNhapDAO
    {
        private static HoaDonNhapDAO instance;

        internal static HoaDonNhapDAO Instance
        {
            get { if (instance == null) instance = new HoaDonNhapDAO(); return instance; }
            private set { instance = value; }
        }

        public List<HoaDonNhap> GetAll()
        {
            List<HoaDonNhap> list = new List<HoaDonNhap>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_HoaDonNhap_GetAll");
            foreach (DataRow item in data.Rows)
            {
                HoaDonNhap entry = new HoaDonNhap(item);
                list.Add(entry);
            }
            return list;
        }

        public bool Insert(int MaNCC, DateTime NgayNhap)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_HoaDonNhap_Insert @MaNCC , @NgayNhap", new object[] { MaNCC, NgayNhap });
            return result > 0;
        }
    }
}
