using Nhom1___QuanLySieuThi.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nhom1___QuanLySieuThi.DAO
{
    class ChiTietHoaDonBanDAO
    {
        private static ChiTietHoaDonBanDAO instance;

        internal static ChiTietHoaDonBanDAO Instance
        {
            get { if (instance == null) instance = new ChiTietHoaDonBanDAO(); return instance; }
            private set { instance = value; }
        }

        public List<ChiTietHoaDonBan> GetAll()
        {
            List<ChiTietHoaDonBan> list = new List<ChiTietHoaDonBan>();
            DataTable data = DataProvider.Instance.ExecuteQuery("Proc_HoaDonBan_GetAll");
            foreach (DataRow item in data.Rows)
            {
                ChiTietHoaDonBan entry = new ChiTietHoaDonBan(item);
                list.Add(entry);
            }
            return list;
        }
        public List<ChiTietHoaDonBan> SLBan(DateTime CanTren, DateTime CanDuoi)
        {
            List<ChiTietHoaDonBan> list = new List<ChiTietHoaDonBan>();
            DataTable data = DataProvider.Instance.ExecuteQuery("Proc_LaySLXuat @CanTren , @CanDuoi", new object[] { CanTren, CanDuoi });
            foreach (DataRow item in data.Rows)
            {
                ChiTietHoaDonBan entry = new ChiTietHoaDonBan(item);
                list.Add(entry);
            }
            return list;
        }
        public ChiTietHoaDonBan GetById(int maHDB)
        {
            ChiTietHoaDonBan hdb = new ChiTietHoaDonBan();
            hdb = (ChiTietHoaDonBan)DataProvider.Instance.ExecuteScalar("Proc_GetChiTietHDB_ById @maHDB", new object[] { maHDB });
            return hdb;
        }
        public bool Insert(ChiTietHoaDonBan hoaDonBan)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("Proc_InsertChiTietHDB @maHDB , @maMH , @sl , @giamGia , @tongTien  ", new object[] { hoaDonBan.MaHDB, hoaDonBan.MaMH , hoaDonBan.SoLuong , hoaDonBan.GiamGia,hoaDonBan.ThanhTien });
            return result > 0;
        }
    }
}
