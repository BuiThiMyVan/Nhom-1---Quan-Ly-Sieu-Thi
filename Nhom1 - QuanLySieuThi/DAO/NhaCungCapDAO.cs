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
    class NhaCungCapDAO
    {
        private static NhaCungCapDAO instance;

        internal static NhaCungCapDAO Instance
        {
            get { if (instance == null) instance = new NhaCungCapDAO(); return instance; }
            private set { instance = value; }
        }

        public List<NhaCungCap> GetAll()
        {
            List<NhaCungCap> list = new List<NhaCungCap>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_NhaCungCap_GetAll");
            foreach (DataRow item in data.Rows)
            {
                NhaCungCap entry = new NhaCungCap(item);
                list.Add(entry);
            }
            return list;
        }
    }
}
