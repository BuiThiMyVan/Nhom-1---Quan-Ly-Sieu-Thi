using Nhom1___QuanLySieuThi.DAO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Nhom1___QuanLySieuThi.GUI
{
    public partial class fQuanLyHang : Form
    {
        BindingSource ItemList = new BindingSource();
        public fQuanLyHang()
        {
            InitializeComponent();
            LoadData();
            EditDataGridViewHeader();
        }

       

        private void LoadData()
        {
            dtHangTon.DataSource = ItemList;
            ItemList.DataSource = MatHangDAO.Instance.HangTon();
          
        }

        private void EditDataGridViewHeader()
        {
            dtHangTon.Columns["MaMH"].HeaderText = "Mã Mặt Hàng";
            dtHangTon.Columns["TenMH"].HeaderText = "Tên Mặt Hàng";
            dtHangTon.Columns["SoLuong"].HeaderText = "Số Lượng";
            dtHangTon.Columns["DonViTinh"].HeaderText = "Đơn Vị Tính";
            dtHangTon.Columns["DonGiaNhap"].HeaderText = "Đơn Giá Nhập";
            dtHangTon.Columns["DonGiaBan"].HeaderText = "Đơn Giá Bán";
            dtHangTon.Columns["MaLH"].HeaderText = "Mã Loại Hàng";
        }

        private void btnThongKe_Click(object sender, EventArgs e)
        {
            fThongKeSLNhapXuat frm = new fThongKeSLNhapXuat();
            this.Hide();
            frm.ShowDialog();
            this.Show();
        }
    }
}
