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
    public partial class fItem : Form
    {
        BindingSource ItemList = new BindingSource();
        public fItem()
        {
            InitializeComponent();
            LoadData();
            BindingDataToForm();
        }

        private void BindingDataToForm()
        {
            txtTenMH.DataBindings.Add(new Binding("Text", dgvItem.DataSource, "TenMH", true, DataSourceUpdateMode.Never));
            txtSoLuong.DataBindings.Add(new Binding("Text", dgvItem.DataSource, "SoLuong", true, DataSourceUpdateMode.Never));
            txtDonViTinh.DataBindings.Add(new Binding("Text", dgvItem.DataSource, "DonViTinh", true, DataSourceUpdateMode.Never));
            txtDonGiaNhap.DataBindings.Add(new Binding("Text", dgvItem.DataSource, "DonGiaNhap", true, DataSourceUpdateMode.Never));
            txtDonGiaBan.DataBindings.Add(new Binding("Text", dgvItem.DataSource, "DonGiaBan", true, DataSourceUpdateMode.Never));
            cbMaLH.DataBindings.Add(new Binding("Text", dgvItem.DataSource, "MaLH", true, DataSourceUpdateMode.Never));
        }

        private void LoadData()
        {
            dgvItem.DataSource = ItemList;
            LoadListItem();
            LoadcomboboxMaLH();
            EditDataGridViewHeader();
        }

        private void EditDataGridViewHeader()
        {
            dgvItem.Columns["MaMH"].HeaderText = "Mã Mặt Hàng";
            dgvItem.Columns["TenMH"].HeaderText = "Tên Mặt Hàng";
            dgvItem.Columns["SoLuong"].HeaderText = "Số Lượng";
            dgvItem.Columns["DonViTinh"].HeaderText = "Đơn Vị Tính";
            dgvItem.Columns["DonGiaNhap"].HeaderText = "Đơn Giá Nhập";
            dgvItem.Columns["DonGiaBan"].HeaderText = "Đơn Giá Bán";
            dgvItem.Columns["MaLH"].HeaderText = "Mã Loại Hàng";
        }

        private void LoadcomboboxMaLH()
        {
            cbMaLH.DataSource = LoaiHangDAO.Instance.GetAll();
            cbMaLH.DisplayMember = "TenLH";
            cbMaLH.ValueMember = "MaLH";
        }

        private void LoadListItem()
        {
            ItemList.DataSource = MatHangDAO.Instance.GetAll();
        }

        private void btnLamTrong_Click(object sender, EventArgs e)
        {
            txtTenMH.Text = "";
            txtSoLuong.Text = "";
            txtDonViTinh.Text = "";
            txtDonGiaNhap.Text = "";
            txtDonGiaBan.Text = "";
           
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadListItem();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            string TenMH= txtTenMH.Text;
            int SoLuong = -1;
            Int32.TryParse(txtSoLuong.Text, out SoLuong);
            string DonViTinh = txtDonViTinh.Text;
            float DonGiaNhap = -1;
            float.TryParse(txtDonGiaNhap.Text, out DonGiaNhap);
            float DonGiaBan = -1;
            float.TryParse(txtDonGiaBan.Text, out DonGiaBan);
            int MaLH;
            Int32.TryParse(cbMaLH.SelectedValue.ToString(), out MaLH);

            try
            {
                if (TenMH == "" || SoLuong == -1 || DonViTinh == "" || DonGiaNhap == -1 || DonGiaBan == -1 || MaLH == -1)
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin");
                    return;
                }
                else if (MessageBox.Show("Bạn có thật sự muốn thêm mặt hàng này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    MatHangDAO.Instance.Insert(TenMH, SoLuong, DonViTinh, DonGiaNhap, DonGiaBan, MaLH);
                    MessageBox.Show("Thêm thành công");
                    LoadData();
                }
            }
            catch (Exception err)
            {
                MessageBox.Show("Có lỗi xảy ra" + err.ToString());
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            int row = dgvItem.CurrentCell.RowIndex;
            int MaMH;
            Int32.TryParse(dgvItem.Rows[row].Cells[0].Value.ToString().Trim(), out MaMH);
            string TenMH = txtTenMH.Text;
            int SoLuong = -1;
            Int32.TryParse(txtSoLuong.Text, out SoLuong);
            string DonViTinh = txtDonViTinh.Text;
            float DonGiaNhap = -1;
            float.TryParse(txtDonGiaNhap.Text, out DonGiaNhap);
            float DonGiaBan = -1;
            float.TryParse(txtDonGiaBan.Text, out DonGiaBan);
            int MaLH;
            Int32.TryParse(cbMaLH.SelectedValue.ToString(), out MaLH);

            try
            {
                if (MaMH == -1 || TenMH == "" || SoLuong == -1 || DonViTinh == "" || DonGiaNhap == -1 || DonGiaBan == -1 || MaLH == -1)
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin");
                    return;
                }
                else if (MessageBox.Show("Bạn có thật sự muốn sửa mặt hàng này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    MatHangDAO.Instance.Update(MaMH, TenMH, SoLuong, DonViTinh, DonGiaNhap, DonGiaBan, MaLH);
                    MessageBox.Show("Cập nhật thành công");
                    LoadData();
                }

            }
            catch (Exception err)
            {
                MessageBox.Show("Có lỗi xảy ra" + err.ToString());
                LoadData();
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            int row = dgvItem.CurrentCell.RowIndex;
            int MaMH;
            Int32.TryParse(dgvItem.Rows[row].Cells[0].Value.ToString().Trim(), out MaMH);
            try
            {
                if (MessageBox.Show("Bạn có thật sự muốn xoá mặt hàng này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    MatHangDAO.Instance.Delete(MaMH);
                    MessageBox.Show("Xóa thành công!");
                    LoadData();
                }

            }
            catch (Exception err)
            {
                MessageBox.Show("Có lỗi xảy ra" + err.ToString());
                LoadData();
            }
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            string search = txtTimKiem.Text.Trim();
            if (search.Equals(""))
            {
                MessageBox.Show("Mời bạn nhập thông tin tìm kiếm!");
                return;
            }
            else
            {
                ItemList.DataSource = MatHangDAO.Instance.Search(search);
            }
        }
    }
}
