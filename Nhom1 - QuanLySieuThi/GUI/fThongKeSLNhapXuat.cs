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
    public partial class fThongKeSLNhapXuat : Form
    {
        BindingSource ListNhap = new BindingSource();
        BindingSource ListXuat = new BindingSource();
        public fThongKeSLNhapXuat()
        {
            InitializeComponent();
        }



        private void LoadData()
        {
            DateTime CanTren;
            DateTime.TryParse(dtCanTren.Text, out CanTren);
            DateTime CanDuoi;
            DateTime.TryParse(dtCanDuoi.Text, out CanDuoi);
            dtgNhap.DataSource = ListNhap;
            ListNhap.DataSource = ChiTietHoaDonNhapDAO.Instance.SLNhap(CanTren, CanDuoi);

            dtgXuat.DataSource = ListXuat;
            ListNhap.DataSource = ChiTietHoaDonBanDAO.Instance.SLBan(CanTren, CanDuoi);

        }

        private void EditDataGridViewHeader()
        {
            dtgNhap.Columns["MaHDN"].HeaderText = "Mã Hóa Đơn";
            dtgNhap.Columns["MaMH"].HeaderText = "Mã Mặt Hàng";
            dtgNhap.Columns["SoLuong"].HeaderText = "Số Lượng";
            dtgNhap.Columns["ThanhTien"].HeaderText = "Thành Tiền";

            dtgXuat.Columns["MaHDN"].HeaderText = "Mã Hóa Đơn";
            dtgXuat.Columns["MaMH"].HeaderText = "Mã Mặt Hàng";
            dtgXuat.Columns["SoLuong"].HeaderText = "Số Lượng";
            dtgXuat.Columns["ThanhTien"].HeaderText = "Thành Tiền";
        }

        private void btnXacNhan_Click(object sender, EventArgs e)
        {
            LoadData();
            EditDataGridViewHeader();
        }
    }
}
