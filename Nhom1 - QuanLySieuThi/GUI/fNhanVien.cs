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
    public partial class fNhanVien : Form
    {
        BindingSource NhanVienList = new BindingSource();

        public fNhanVien()
        {
            InitializeComponent();
            LoadFirstTime();
        }
        private void LoadFirstTime()
        {
            dgvNhanVien.DataSource = NhanVienList;
            LoadListNhanVien();
        
            EditDataGridView();
            BindingDataToFrom();
        }
        private void LoadListNhanVien()
        {
            NhanVienList.DataSource = NhanVienDAO.Instance.GetAll();
        }
        private void EditDataGridView()
        {
            dgvNhanVien.Columns["MaNV"].HeaderText = "ID nhân viên";
            dgvNhanVien.Columns["tenNV"].HeaderText = "Tên nhân viên";    
            dgvNhanVien.Columns["NgaySinh"].HeaderText = "Ngày sinh";
            dgvNhanVien.Columns["GioiTinh"].HeaderText = "Giới tính";
            dgvNhanVien.Columns["DiaChi"].HeaderText = "Địa chỉ";
            dgvNhanVien.Columns["SDT"].HeaderText = "Số Điện Thoại";
        }
        private void BindingDataToFrom()
        {
            lbID.DataBindings.Add(new Binding("Text", dgvNhanVien.DataSource, "MaNV", true, DataSourceUpdateMode.Never));
            txtTenNV.DataBindings.Add(new Binding("Text", dgvNhanVien.DataSource, "TenNV", true, DataSourceUpdateMode.Never));
            dtpNgaySinh.DataBindings.Add(new Binding("Text", dgvNhanVien.DataSource, "NgaySinh", true, DataSourceUpdateMode.Never));
            
            var fmaleBinding = new Binding("Checked", dgvNhanVien.DataSource, "GioiTinh", true, DataSourceUpdateMode.Never);
            fmaleBinding.Format += (s, args) => args.Value = ((string)args.Value) == "Nữ";
            fmaleBinding.Parse += (s, args) => args.Value = (bool)args.Value ? "Nữ" : "Nam";
            rdbNu.DataBindings.Add(fmaleBinding);
            rdbNu.CheckedChanged += (s, args) => rdbNam.Checked = !rdbNu.Checked;
            txtDiaChi.DataBindings.Add(new Binding("Text", dgvNhanVien.DataSource, "DiaChi", true, DataSourceUpdateMode.Never));
            txtSDT.DataBindings.Add(new Binding("Text", dgvNhanVien.DataSource, "SDT", true, DataSourceUpdateMode.Never));
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            string tenNhanVien = txtTenNV.Text;
           
            string gioiTinh = rdbNam.Checked ? "Nam" : "Nữ";
            DateTime ngaySinh;
            DateTime.TryParse(dtpNgaySinh.Text, out ngaySinh);
            string diaChi = txtDiaChi.Text;
            string soDienThoai = txtSDT.Text;



            try
            {
                if (tenNhanVien == "" || diaChi=="" || soDienThoai=="" || ngaySinh == null)
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin");
                    return;
                }
                NhanVienDAO.Instance.Insert(tenNhanVien, ngaySinh, gioiTinh, diaChi, soDienThoai);
                MessageBox.Show("Thêm thành công");
                LoadListNhanVien();
            }
            catch (Exception err)
            {
                MessageBox.Show("Có lỗi xảy ra" + err.ToString());
                LoadListNhanVien();
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            int idNhanVien;
            Int32.TryParse(lbID.Text.Trim(), out idNhanVien);
            string tenNhanVien = txtTenNV.Text.Trim();
            DateTime ngaySinh;
            DateTime.TryParse(dtpNgaySinh.Text, out ngaySinh);
            string gioiTinh = rdbNam.Checked ? "Nam" : "Nữ";
            string diaChi = txtDiaChi.Text.Trim();
            string SDT = txtSDT.Text.Trim();
            try
            {
                if (tenNhanVien == "" || ngaySinh == null|| gioiTinh==""||diaChi==""||SDT==""|| idNhanVien == -1)
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin");
                    return;
               }
                NhanVienDAO.Instance.Update(idNhanVien, tenNhanVien, ngaySinh, gioiTinh, diaChi, SDT);
                MessageBox.Show("Sửa thành công");
                LoadListNhanVien();
            }
            catch (Exception err)
            {
                MessageBox.Show("Có lỗi xảy ra" + err.ToString());
               LoadListNhanVien();
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            int idNhanVien;
            Int32.TryParse(lbID.Text.Trim(), out idNhanVien);
            try
            {
                NhanVienDAO.Instance.Delete(idNhanVien);
                MessageBox.Show("Xóa thành công");
                LoadListNhanVien();
            }
            catch (Exception err)
            {
                MessageBox.Show("Có lỗi xảy ra" + err.ToString());
                LoadListNhanVien();
            }
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            string search = txtTimKiem.Text.Trim();
            if (search.Equals(""))
            {
                MessageBox.Show("Mời bạn nhập thông tin tìm kiếm!");
                return;
            }
            else
            {
                NhanVienList.DataSource = NhanVienDAO.Instance.Search(search);
            }
        }
    }
}
