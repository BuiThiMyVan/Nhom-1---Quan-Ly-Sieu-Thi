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

    }
}
