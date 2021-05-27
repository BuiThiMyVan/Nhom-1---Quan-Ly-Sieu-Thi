using Nhom1___QuanLySieuThi.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nhom1___QuanLySieuThi.DAO
{
    class NhanVienDAO
    {
        private static NhanVienDAO instance;

        internal static NhanVienDAO Instance
        {
            get { if (instance == null) instance = new NhanVienDAO(); return instance; }
            private set { instance = value; }
        }

        public List<NhanVien> GetAll()
        {
            List<NhanVien> list = new List<NhanVien>();
            DataTable data = DataProvider.Instance.ExecuteQuery("Proc_GetAllNV");
            foreach (DataRow item in data.Rows)
            {
                NhanVien entry = new NhanVien(item);
                list.Add(entry);
            }
            return list;
        }
        public bool Insert(string tenNhanVien, DateTime ngaySinh, string gioiTinh, string diaChi, string soDienThoai)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_NhanVien_Insert @tenNhanVien , @ngaySinh , @gioiTinh , @diaChi , @soDienThoai", new object[] { tenNhanVien, ngaySinh, gioiTinh, diaChi, soDienThoai });
            return result > 0;
        }
        public bool Update(int maNV, string tenNhanVien, DateTime ngaySinh, string gioiTinh, string diaChi, string soDienThoai)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_NhanVien_Update @maNV , @tenNhanVien , @ngaySinh , @gioiTinh , @diaChi , @soDienThoai", new object[] { maNV, tenNhanVien, ngaySinh, gioiTinh, diaChi, soDienThoai });
            return result > 0;
        }
        public bool Delete(int maNV)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_NhanVien_Delete @maNV", new object[] { maNV });

            return result > 0;
        }
        public List<NhanVien> Search(string searchValue)
        {
            List<NhanVien> list = new List<NhanVien>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_NhanVien_Search @searchValue", new object[] { searchValue });
            foreach (DataRow item in data.Rows)
            {
                NhanVien entry = new NhanVien(item);
                list.Add(entry);
            }
            return list;
        }
    }
}
