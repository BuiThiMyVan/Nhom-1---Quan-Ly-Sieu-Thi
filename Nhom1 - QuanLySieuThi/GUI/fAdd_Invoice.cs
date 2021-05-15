using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using Nhom1___QuanLySieuThi.DAO;
using Nhom1___QuanLySieuThi.Models;

namespace Nhom1___QuanLySieuThi.GUI
{
    public partial class fAdd_Invoice : Form
    {
        SqlConnection connection;
        string str = "Data Source=.\\SQLEXPRESS;Initial Catalog=NHOM1_QUANLYSIEUTHI;Integrated Security=True";

        public fAdd_Invoice()
        {
            InitializeComponent();
            LoadData();
        }

        private void LoadData()
        {
            LoadComboboxTenMatHang();
            LoadComboboxNhaCungCap();
        }

        private void LoadComboboxTenMatHang()
        {
            cbIdMatHang.DataSource = MatHangDAO.Instance.GetAll();
            cbIdMatHang.DisplayMember = "TenMH";
            cbIdMatHang.ValueMember = "MaMH";
        }

        private void LoadComboboxNhaCungCap()
        {
            cbIdNCC.DataSource = NhaCungCapDAO.Instance.GetAll();
            cbIdNCC.DisplayMember = "TenNCC";
            cbIdNCC.ValueMember = "MaNCC";
        }

        private void cbIdMatHang_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtSoLuong.DataBindings.Clear();
            txtSoLuong.DataBindings.Add("Text", cbIdMatHang.DataSource, "SoLuong");
            txtDonGiaNhap.DataBindings.Clear();
            txtDonGiaNhap.DataBindings.Add("Text", cbIdMatHang.DataSource, "DonGiaNhap");
        }

        private void btnXacNhan_Click(object sender, EventArgs e)
        {
            int MaNCC;
            Int32.TryParse(cbIdNCC.SelectedValue.ToString(), out MaNCC);
            DateTime NgayNhap;
            DateTime.TryParse(dtNgayNhap.Text, out NgayNhap);
            int MaMH;
            Int32.TryParse(cbIdMatHang.SelectedValue.ToString(), out MaMH);
            int SoLuong;
            Int32.TryParse(txtSoLuong.Text, out SoLuong);
            float ThanhTien;
            float DonGiaNhap;
            float.TryParse(txtDonGiaNhap.Text, out DonGiaNhap);
            ThanhTien = SoLuong * DonGiaNhap;
            
            try
            {
                if (MessageBox.Show("Bạn có thật sự muốn ghi nhận kết quả hóa đơn nhập này không?", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    HoaDonNhapDAO.Instance.Insert(MaNCC, NgayNhap);

                    connection = new SqlConnection(str);
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("HoaDonNhapVuaThem", connection);
                    cmd.CommandType = CommandType.Text;
                    int MaHDN = (int)cmd.ExecuteScalar();

                    ChiTietHoaDonNhapDAO.Instance.Insert(MaHDN, MaMH, SoLuong, ThanhTien);
                    MessageBox.Show("Ghi nhận thành công!");

                    fList_Invoice frm = new fList_Invoice();
                    this.Hide();
                    frm.ShowDialog();
                    this.Show();
                }
            }
            catch (Exception err)
            {
                MessageBox.Show("Có lỗi xảy ra" + err.ToString());
            }
        }
    }

   
}

