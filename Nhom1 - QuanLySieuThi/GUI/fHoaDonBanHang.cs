using Nhom1___QuanLySieuThi.DAO;
using Nhom1___QuanLySieuThi.Models;
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
            AddCombobox();
        }
        private void BindingDataToForm()
        {
            txt_HDB.DataBindings.Add(new Binding("Text", dgv_DSHoaDonBan.DataSource, "MaHDB", true, DataSourceUpdateMode.Never));
            cb_MaNV.DataBindings.Add(new Binding("Text", dgv_DSHoaDonBan.DataSource, "MaNV", true, DataSourceUpdateMode.Never));
            date_NgayBan.DataBindings.Add(new Binding("Text", dgv_DSHoaDonBan.DataSource, "NgayBan", true, DataSourceUpdateMode.Never));
        }
        private void LoadData()
        {
            dgv_DSHoaDonBan.DataSource = DSHoaDonBan;
            LoadListHDB();
            EditDataGridViewHeader();
        }


        private void EditDataGridViewHeader()
        {
            dgv_DSHoaDonBan.Columns[0].Width = (int)(dgv_DSHoaDonBan.Width * 0.2);
            dgv_DSHoaDonBan.Columns[1].Width = (int)(dgv_DSHoaDonBan.Width * 0.2);
            dgv_DSHoaDonBan.Columns[2].Width = (int)(dgv_DSHoaDonBan.Width * 0.4);
            dgv_DSHoaDonBan.Columns[3].Width = (int)(dgv_DSHoaDonBan.Width * 0.2);

            dgv_DSHoaDonBan.Columns["MaHDB"].HeaderText = "Mã hóa đơn bán";
            dgv_DSHoaDonBan.Columns["MaNV"].HeaderText = "Mã nhân viên";
            dgv_DSHoaDonBan.Columns["NgayBan"].HeaderText = "Ngày bán";
            dgv_DSHoaDonBan.Columns["MaKH"].HeaderText = "Mã khách hàng";
        }

        private void LoadListHDB()
        {
            DSHoaDonBan.DataSource = HoaDonBanHangDAO.Instance.GetAll();
        }

        private void AddComboboxEmployee()
        {
            var listNV = NhanVienDAO.Instance.GetAll();
            foreach (var item in listNV)
            {
                cb_MaNV.Items.Add(item.MaNV);
            }
        }
        private void AddCombobox()
        {
            AddComboboxEmployee();
        }

        /// <summary>
        /// Kiểm tra bỏ chống thông tin 
        /// </summary>
        /// <returns></returns>
        public bool Check()
        {
            if (string.IsNullOrEmpty(cb_MaNV.SelectedItem.ToString().Trim())
                || string.IsNullOrEmpty(date_NgayBan.Value.ToString().Trim())
                ) return false;
            return true;
        }
        private void btn_Sua_Click(object sender, EventArgs e)
        {
            try
            {
                HoaDonBan hoaDon = new HoaDonBan();
                hoaDon.MaNV = int.Parse(cb_MaNV.SelectedItem.ToString());
                hoaDon.NgayBan = date_NgayBan.Value;
                hoaDon.MaHDB = int.Parse(txt_HDB.Text);
                // Lấy dữ liệu nhập: khi đã nhập đủ
                if (HoaDonBanHangDAO.Instance.Update(hoaDon))
                {
                    MessageBox.Show("Sửa Thành Công ");
                    LoadListHDB();
                }
                else
                {
                    MessageBox.Show("Lỗi Trong quá trình sửa");
                    LoadListHDB();
                }
                
            }
            catch (Exception err)
            {
                MessageBox.Show("Có lỗi xảy ra" + err.ToString());
            }
        }
        private void btn_Xoa_Click(object sender, EventArgs e)
        {
            try
            {
                int maHDB = int.Parse(txt_HDB.Text);
                try
                {
                    HoaDonBanHangDAO.Instance.Delete(maHDB);
                    MessageBox.Show("Xóa thành công");
                    LoadListHDB();
                }
                catch (Exception err)
                {
                    MessageBox.Show("Có lỗi xảy ra" + err.ToString());
                    LoadListHDB();
                }
            }
            catch (Exception err)
            {

                MessageBox.Show("Có lỗi xảy ra" + err.ToString());
            }
        }
        

        private void btnMua_Click_1(object sender, EventArgs e)
        {
            try
            {
                /// check  chống
                if (!Check())
                {
                    MessageBox.Show("Dữ liệu Nhập không được bỏ trống , Vui lòng kiểm tra lại\n");
                }
                else
                {
                    HoaDonBan hoaDon = new HoaDonBan();
                    hoaDon.MaNV = int.Parse(cb_MaNV.SelectedItem.ToString());
                    hoaDon.NgayBan = date_NgayBan.Value;

                    // Lấy dữ liệu nhập: khi đã nhập đủ
                    if (HoaDonBanHangDAO.Instance.Insert(hoaDon))
                    {
                        MessageBox.Show("Lên đơn Thành Công ");
                        LoadListHDB();
                    }
                    else
                    {
                        MessageBox.Show("Lỗi Trong quá trình thêm");
                        LoadListHDB();
                    }
                }
            }
            catch (Exception err)
            {
                MessageBox.Show("Có lỗi xảy ra" + err.ToString());
            }
        }
        private void btn_ChiTiet_Click(object sender, EventArgs e)
        {
            if (txt_HDB.Text == "0")
            {
                MessageBox.Show("Bạn chưa chọn đơn hàng, vui lòng chọn đơn hàng");
            }
            else
            { 
                new fChiTietHoaDonBan(int.Parse(txt_HDB.Text)).Show();
            }
        }

        private void btn_TimKiem_Click(object sender, EventArgs e)
        {
            try
            {
                string str = txt_TimKiem.Text.Trim();
                if (str == "")
                {
                    MessageBox.Show("Chưa nhập thông tin tìm kiếm");
                    return;
                }
                DSHoaDonBan.DataSource = HoaDonBanHangDAO.Instance.Search(str);
            }
            catch (Exception err)
            {
                MessageBox.Show("Có lỗi xảy ra" + err.ToString());
            }
        }
    }
}
