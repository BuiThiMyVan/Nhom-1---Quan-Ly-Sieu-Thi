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
    }
}
