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
    public partial class fChiTietHoaDonBan : Form
    {
        private int _maHDB;
        public fChiTietHoaDonBan(int maHDB)
        {
            _maHDB = maHDB;
            InitializeComponent();
            AddCombobox();
            hdb.Text = _maHDB.ToString();
        }
        private void btn_QuayLai_Click(object sender, EventArgs e)
        {
            this.Hide();
            new fHoaDonBanHang().Show();
        }
        public bool Check()
        {
            if (string.IsNullOrEmpty(txt_GiamGia.Text.Trim())
                || string.IsNullOrEmpty(txt_SL.Text.Trim())
                || string.IsNullOrEmpty(cb_MH.SelectedItem.ToString().Trim())
                ) return false;
            return true;
        }

        private void AddCombobox()
        {
            var listMH = MatHangDAO.Instance.GetAll();
            foreach (var item in listMH)
            {
                cb_MH.Items.Add(item.TenMH);
            }
        }
        private void btn_ThanhToan_Click(object sender, EventArgs e)
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
                    ChiTietHoaDonBan hoaDon = new ChiTietHoaDonBan();
                    hoaDon.SoLuong = int.Parse(txt_SL.Text);
                    hoaDon.GiamGia = float.Parse(txt_GiamGia.Text);
                    hoaDon.MaMH = MatHangDAO.Instance.GetMaMH(cb_MH.SelectedItem.ToString());
                    hoaDon.ThanhTien = MatHangDAO.Instance.GetGiaBanByMaMH(hoaDon.MaMH) * hoaDon.SoLuong * (1 - hoaDon.GiamGia);
                    hoaDon.MaHDB = int.Parse(hdb.Text);
                    tongTien.Text = hoaDon.ThanhTien.ToString();


                    // Lấy dữ liệu nhập: khi đã nhập đủ
                    if (ChiTietHoaDonBanDAO.Instance.Insert(hoaDon))
                    {
                        MessageBox.Show("Lên đơn Thành Công ");
                    }
                    else
                    {
                        MessageBox.Show("Lỗi Trong quá trình thêm");
                    }
                }
            }
            catch (Exception err)
            {
                MessageBox.Show("Có lỗi xảy ra" + err.ToString());
            }
        }
    }
}
