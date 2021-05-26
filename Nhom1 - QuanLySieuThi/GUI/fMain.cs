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
    public partial class fMain : Form
    {
        public fMain()
        {
            InitializeComponent();
        }

        private void nhậpHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fList_Invoice frm = new fList_Invoice();
            this.Hide();
            frm.ShowDialog();
            this.Show();
        }

        private void kháchHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fKhachHang f = new fKhachHang();
            this.Hide();
            f.ShowDialog();
            this.Show();
        }

        private void nhânViênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
        }

        private void mặtHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fItem frm = new fItem();
            this.Hide();
            frm.ShowDialog();
            this.Show();
        }

        private void thốngKêHàngHóaLưuLượngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fQuanLyHang fQuanLyHang = new fQuanLyHang();
            fQuanLyHang.Show();
            this.Hide();
        }

        private void bánHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fHoaDonBanHang frm = new fHoaDonBanHang();
            this.Hide();
            frm.ShowDialog();
            this.Show();
        }
    }
}
