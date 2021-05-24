using Nhom1___QuanLySieuThi.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nhom1___QuanLySieuThi.DAO
{
    class HoaDonBanHangDAO
    {
        private static HoaDonBanHangDAO instance;

        internal static HoaDonBanHangDAO Instance
        {
            get { if (instance == null) instance = new HoaDonBanHangDAO(); return instance; }
            private set { instance = value; }
        }

        public List<HoaDonBan> GetAll()
        {
            List<HoaDonBan> list = new List<HoaDonBan>();
            DataTable data = DataProvider.Instance.ExecuteQuery("Proc_HoaDonBan_GetAll");
            foreach (DataRow item in data.Rows)
            {
                HoaDonBan entry = new HoaDonBan(item);
                list.Add(entry);
            }
            return list;
        }
        public bool Insert(HoaDonBan hoaDonBan)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("Proc_HoaDonBan_Insert @maNV , @ngayBan ", new object[] { hoaDonBan.MaNV,hoaDonBan.NgayBan});
            return result > 0;
        }
        public bool Update(HoaDonBan hoaDonBan)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("Proc_HoaDonBan_Update @maHDB , @maNV , @ngayBan ", new object[] {hoaDonBan.MaHDB, hoaDonBan.MaNV, hoaDonBan.NgayBan });
            return result > 0;
        }
        public bool Delete(int maHDB)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("Proc_HoaDonBan_Delete @maHDB", new object[] { maHDB });
            return result > 0;
        }
        public List<HoaDonBan> Search(string searchValue)
        {
            List<HoaDonBan> list = new List<HoaDonBan>();
            DataTable data = DataProvider.Instance.ExecuteQuery("Proc_HoaDonBan_Search @searchValue", new object[] { searchValue });
            foreach (DataRow item in data.Rows)
            {
                HoaDonBan entry = new HoaDonBan(item);
                list.Add(entry);
            }
            return list;
        }
    }
}
