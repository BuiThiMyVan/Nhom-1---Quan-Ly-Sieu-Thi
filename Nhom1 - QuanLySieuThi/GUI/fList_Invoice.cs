using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Nhom1___QuanLySieuThi.DAO;

namespace Nhom1___QuanLySieuThi.GUI
{
    public partial class fList_Invoice : Form
    {
        BindingSource InvoiceList = new BindingSource();
        BindingSource HoaDonNhapList = new BindingSource();
        public fList_Invoice()
        {
            InitializeComponent();
            LoadData();
        }

        private void LoadData()
        {
            dgvInvoice.DataSource = InvoiceList;
            dgvHoaDonNhap.DataSource = HoaDonNhapList;
            LoadListInvoice();
            LoadListHoaDonNhap();
            EditDataGridViewHeaderInvoice();
            EditDataGridViewHeaderHoaDonNhap();
        }

        private void EditDataGridViewHeaderInvoice()
        {
            dgvInvoice.Columns["MaHDN"].HeaderText = "Mã Hóa Đơn Nhập";
            dgvInvoice.Columns["MaMH"].HeaderText = "Mã Mặt Hàng";
            dgvInvoice.Columns["SoLuong"].HeaderText = "Số Lượng";
            dgvInvoice.Columns["ThanhTien"].HeaderText = "Thành Tiền";
        }

        private void EditDataGridViewHeaderHoaDonNhap()
        {
            dgvHoaDonNhap.Columns["MaHDN"].HeaderText = "Mã Hóa Đơn Nhập";
            dgvHoaDonNhap.Columns["MaNCC"].HeaderText = "Mã Nhà Cung Cấp";
            dgvHoaDonNhap.Columns["NgayNhap"].HeaderText = "Ngày Nhập";
        }

        private void LoadListInvoice()
        {
            InvoiceList.DataSource = ChiTietHoaDonNhapDAO.Instance.GetAll();
        }

        private void LoadListHoaDonNhap()
        {
            HoaDonNhapList.DataSource = HoaDonNhapDAO.Instance.GetAll();
        }

        private void LoadListSearch()
        {
            DateTime NgayNhap;
            DateTime.TryParse(dtNgayNhap.Text, out NgayNhap);
            HoaDonNhapList.DataSource = HoaDonNhapDAO.Instance.GetAll_HoaDonNhap(NgayNhap);
            InvoiceList.DataSource = ChiTietHoaDonNhapDAO.Instance.GetAll_ChiTietHoaDonNhap(NgayNhap);
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            fAdd_Invoice frm = new fAdd_Invoice();
            this.Hide();
            frm.ShowDialog();
            this.Show();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            LoadListSearch();
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadListHoaDonNhap();
            LoadListInvoice();
        }
    }
}
