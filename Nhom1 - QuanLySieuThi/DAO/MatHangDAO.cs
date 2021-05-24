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
    class MatHangDAO
    {
        private static MatHangDAO instance;

        internal static MatHangDAO Instance
        {
            get { if (instance == null) instance = new MatHangDAO(); return instance; }
            private set { instance = value; }
        }

        public List<MatHang> GetAll()
        {
            List<MatHang> list = new List<MatHang>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_MatHang_GetAll");
            foreach (DataRow item in data.Rows)
            {
                MatHang entry = new MatHang(item);
                list.Add(entry);
            }
            return list;
        }

        public int GetMaMH(string tenMH)
        {
            return int.Parse(DataProvider.Instance.ExecuteScalar("Proc_GetMaMHByTenMH @tenMH", new object[] { tenMH }).ToString());
        }

        public float GetGiaBanByMaMH(int maMH)
        {
            return float.Parse(DataProvider.Instance.ExecuteScalar("Proc_GiaBanByMaMH @maMH", new object[] { maMH }).ToString());

        }
        public bool Insert(string TenMH, int SoLuong, string DonViTinh, float DonGiaNhap, float DonGiaBan, int MaLH)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_MatHang_Insert @TenMH , @SoLuong , @DonViTinh , @DonGiaNhap , @DonGiaBan , @MaLH", new object[] { TenMH, SoLuong, DonViTinh, DonGiaNhap, DonGiaBan, MaLH });
            return result > 0;
        }

        public bool Update(int MaMH, string TenMH, int SoLuong, string DonViTinh, float DonGiaNhap, float DonGiaBan, int MaLH)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_MatHang_Update @MaMH , @TenMH , @SoLuong , @DonViTinh , @DonGiaNhap , @DonGiaBan , @MaLH", new object[] { MaMH, TenMH, SoLuong, DonViTinh, DonGiaNhap, DonGiaBan, MaLH });
            return result > 0;
        }

        public bool Delete(int MaMH)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_MatHang_Delete @MaMH", new object[] { MaMH });

            return result > 0;
        }
        public List<MatHang> Search(string searchValue)
        {
            List<MatHang> list = new List<MatHang>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_MatHang_Search @searchValue", new object[] { searchValue });
            foreach (DataRow item in data.Rows)
            {
                MatHang entry = new MatHang(item);
                list.Add(entry);
            }
            return list;
        }

    }
}
