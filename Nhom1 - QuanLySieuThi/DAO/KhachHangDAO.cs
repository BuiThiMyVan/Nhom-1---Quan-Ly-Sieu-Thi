using Nhom1___QuanLySieuThi.Models;
using NHOM1_QLKHO.DatAccessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nhom1___QuanLySieuThi.DAO
{
    class KhachHangDAO
    {
        private static KhachHangDAO instance;

        internal static KhachHangDAO Instance
        {
            get { if (instance == null) instance = new KhachHangDAO(); return instance; }
            private set { instance = value; }
        }
        public List<KhachHang> GetAll()
        {
            List<KhachHang> list = new List<KhachHang>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_KhachHang_GetAll");
            foreach (DataRow item in data.Rows)
            {
                KhachHang entry = new KhachHang(item);
                list.Add(entry);
            }
            return list;
        }
        public bool Insert(string tenKhachHang, string diaChi, string soDienThoai)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_KhachHang_Insert @tenKhachHang , @diaChi , @soDienThoai", new object[] { tenKhachHang, diaChi, soDienThoai});
            return result > 0;
        }
        public bool Update(int maKH, string tenKhachHang, string diaChi, string soDienThoai)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_KhachHang_Update @maKH , @tenKhachHang , @diaChi , @soDienThoai", new object[] { maKH, tenKhachHang, diaChi, soDienThoai });
            return result > 0;
        }
        public bool Delete(int maKH)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_KhachHang_Delete @maKH", new object[] { maKH });

            return result > 0;
        }
        public List<KhachHang> Search(string searchValue)
        {
            List<KhachHang> list = new List<KhachHang>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_KhachHang_Search @searchValue", new object[] { searchValue });
            foreach (DataRow item in data.Rows)
            {
                KhachHang entry = new KhachHang(item);
                list.Add(entry);
            }
            return list;
        }
    }
}
