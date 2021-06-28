using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nhom1___QuanLySieuThi.DAO
{
    class TaiKhoanDAO
    {
        private static TaiKhoanDAO instance;

        public static TaiKhoanDAO Instance
        {
            get { if (instance == null) instance = new TaiKhoanDAO(); return instance; }
            private set { instance = value; }
        }

        private TaiKhoanDAO() { }

        public bool Login(string userName, string pass)
        {
            string query = "QLST_Login @username , @pass";

            DataTable result = DataProvider.Instance.ExecuteQuery(query, new object[] { userName, pass });

            return result.Rows.Count > 0;
        }
    }
}
