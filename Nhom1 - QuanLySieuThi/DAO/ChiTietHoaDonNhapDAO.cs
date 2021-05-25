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
    class ChiTietHoaDonNhapDAO
    {
        private static ChiTietHoaDonNhapDAO instance;

        internal static ChiTietHoaDonNhapDAO Instance
        {
            get { if (instance == null) instance = new ChiTietHoaDonNhapDAO(); return instance; }
            private set { instance = value; }
        }

        public List<ChiTietHoaDonNhap> GetAll()
        {
            List<ChiTietHoaDonNhap> list = new List<ChiTietHoaDonNhap>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_ChiTietHoaDonNhap_GetAll");
            foreach (DataRow item in data.Rows)
            {
                ChiTietHoaDonNhap entry = new ChiTietHoaDonNhap(item);
                list.Add(entry);
            }
            return list;
        }
       
        public List<ChiTietHoaDonNhap> SLNhap(DateTime CanTren, DateTime CanDuoi)
        {
            List<ChiTietHoaDonNhap> list = new List<ChiTietHoaDonNhap>();
            DataTable data = DataProvider.Instance.ExecuteQuery("Proc_LaySLNhap @CanTren , @CanDuoi", new object[] { CanTren, CanDuoi });
            foreach (DataRow item in data.Rows)
            {
                ChiTietHoaDonNhap entry = new ChiTietHoaDonNhap(item);
                list.Add(entry);
            }
            return list;
        }
        public List<ChiTietHoaDonNhap> GetAll_ChiTietHoaDonNhap(DateTime NgayNhap)
        {
            List<ChiTietHoaDonNhap> list = new List<ChiTietHoaDonNhap>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_ChiTietHoaDonNhap_Search @NgayNhap", new object[] { NgayNhap});
            foreach (DataRow item in data.Rows)
            {
                ChiTietHoaDonNhap entry = new ChiTietHoaDonNhap(item);
                list.Add(entry);
            }
            return list;
        }

        public bool Insert(int MaHDN, int MaMH, int SoLuong, float ThanhTien)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_ChiTietHoaDonNhap_Insert @MaHDN , @MaMH , @SoLuong , @ThanhTien", new object[] { MaHDN, MaMH, SoLuong, ThanhTien });
            return result > 0;
        }
    }
}
