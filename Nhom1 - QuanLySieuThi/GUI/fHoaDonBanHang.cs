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
    public partial class fHoaDonBanHang : Form
    {
        BindingSource DSHoaDonBan = new BindingSource();
        public fHoaDonBanHang()
        {
            InitializeComponent();
            LoadData();
            BindingDataToForm();
        }

        //private void BindingDataToForm()
        //{

        //    txt_HDB.DataBindings.Add(new Binding("Text", dgv_DSHoaDonBan.DataSource, "MaHDB", true, DataSourceUpdateMode.Never));
        //    txt_TenKH.DataBindings.Add(new Binding("Text", dgv_DSHoaDonBan.DataSource, "DiaChi", true, DataSourceUpdateMode.Never));
        //    txtSDT.DataBindings.Add(new Binding("Text", dgv_DSHoaDonBan.DataSource, "SDT", true, DataSourceUpdateMode.Never));
        //}

        //private void LoadData()
        //{
        //    dgv_DSHoaDonBan.DataSource = khachHangList;
        //    LoadListKhachHang();
        //    EditDataGridViewHeader();
        //}


        //private void EditDataGridViewHeader()
        //{
        //    dgv_DSHoaDonBan.Columns["MaKH"].HeaderText = "Mã khách hàng";
        //    dgv_DSHoaDonBan.Columns["TenKH"].HeaderText = "Tên khách hàng";
        //    dgv_DSHoaDonBan.Columns["DiaChi"].HeaderText = "Địa chỉ";
        //    dgv_DSHoaDonBan.Columns["SDT"].HeaderText = "Số điện thoại";
        //}

        //private void LoadListKhachHang()
        //{
        //    khachHangList.DataSource = KhachHangDAO.Instance.GetAll();
        //}


        //private void btnAdd_Click(object sender, EventArgs e)
        //{
        //    string tenKH = txtTenKH.Text;
        //    string diaChi = txtDiaChi.Text;
        //    string sdt = txtSDT.Text;

        //    try
        //    {
        //        if (tenKH == "" || diaChi == "" || sdt == "")
        //        {
        //            MessageBox.Show("Vui lòng điền đầy đủ thông tin");
        //            return;
        //        }
        //        else
        //        {
        //            KhachHangDAO.Instance.Insert(tenKH, diaChi, sdt);
        //            MessageBox.Show("Thêm thành công");
        //            LoadListKhachHang();
        //        }
        //    }
        //    catch (Exception err)
        //    {
        //        MessageBox.Show("Có lỗi xảy ra" + err.ToString());
        //    }
        //}

        //private void btnDelete_Click(object sender, EventArgs e)
        //{
        //    int row = dgv_DSHoaDonBan.CurrentCell.RowIndex;
        //    int maKH;
        //    Int32.TryParse(dgv_DSHoaDonBan.Rows[row].Cells[0].Value.ToString().Trim(), out maKH);
        //    try
        //    {
        //        if (MessageBox.Show("Bạn có thật sự muốn xoá khách hàng này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
        //        {
        //            KhachHangDAO.Instance.Delete(maKH);
        //            MessageBox.Show("Xóa thành công!");
        //            LoadListKhachHang();
        //        }

        //    }
        //    catch (Exception err)
        //    {
        //        MessageBox.Show("Có lỗi xảy ra" + err.ToString());
        //        LoadListKhachHang();
        //    }

        //}



        //private void btnSearch_Click_1(object sender, EventArgs e)
        //{
        //    string search = txtTimKiem.Text.Trim();
        //    if (search.Equals(""))
        //    {
        //        MessageBox.Show("Mời bạn nhập thông tin tìm kiếm!");
        //        return;
        //    }
        //    else
        //    {
        //        khachHangList.DataSource = KhachHangDAO.Instance.Search(search);
        //    }
        //}

        //private void btnEdit_Click_1(object sender, EventArgs e)
        //{
        //    int row = dgv_DSHoaDonBan.CurrentCell.RowIndex;
        //    int maKH;
        //    Int32.TryParse(dgv_DSHoaDonBan.Rows[row].Cells[0].Value.ToString().Trim(), out maKH);

        //    string tenKH = txtTenKH.Text;
        //    string diaChi = txtDiaChi.Text;
        //    string sdt = txtSDT.Text;

        //    try
        //    {
        //        if (tenKH == "" || diaChi == "" || sdt == "")
        //        {

        //            MessageBox.Show("Vui lòng điền đầy đủ thông tin");
        //            return;
        //        }
        //        else
        //        {
        //            KhachHangDAO.Instance.Update(maKH, tenKH, diaChi, sdt);
        //            MessageBox.Show("Sửa thành công!");
        //            LoadListKhachHang();
        //        }


        //    }
        //    catch (Exception err)
        //    {
        //        MessageBox.Show("Có lỗi xảy ra" + err.ToString());
        //        LoadListKhachHang();
        //    }
        //}


    }
}
