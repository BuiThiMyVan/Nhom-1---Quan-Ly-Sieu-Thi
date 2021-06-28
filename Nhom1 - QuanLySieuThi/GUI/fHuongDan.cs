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
    public partial class fHuongDan : Form
    {
        public fHuongDan()
        {
            InitializeComponent();
        }

        private void btnTruoc_DangNhap_Click(object sender, EventArgs e)
        {
            if (pictureBox1.Visible == true)
            {
                MessageBox.Show("Mời bạn nhấn Sau");
            }
            else if (pictureBox2.Visible == true)
            {
                pictureBox1.Visible = true;
                pictureBox2.Visible = false;

            }
        }

        private void btnSau_DangNhap_Click(object sender, EventArgs e)
        {
            if (pictureBox1.Visible == true)
            {
                pictureBox1.Visible = false;
                pictureBox2.Visible = true;
            }
            else if (pictureBox2.Visible == true)
            {
                MessageBox.Show("Đã hết! Quay lại nhấn Trước");

            }
        }

        private void btnTruoc_MH_Click(object sender, EventArgs e)
        {
            if (pictureBox3.Visible == true)
            {
                MessageBox.Show("Mời bạn nhấn Sau");
            }
            else if (pictureBox4.Visible == true)
            {
                pictureBox3.Visible = true;
                pictureBox4.Visible = false;
                pictureBox5.Visible = false;
                pictureBox6.Visible = false;
                pictureBox7.Visible = false;
                pictureBox8.Visible = false;
                pictureBox9.Visible = false;
                pictureBox10.Visible = false;

            }
            else if (pictureBox5.Visible == true)
            {
                pictureBox3.Visible = false;
                pictureBox4.Visible = true;
                pictureBox5.Visible = false;
                pictureBox6.Visible = false;
                pictureBox7.Visible = false;
                pictureBox8.Visible = false;
                pictureBox9.Visible = false;
                pictureBox10.Visible = false;

            }
            else if (pictureBox6.Visible == true)
            {
                pictureBox3.Visible = false;
                pictureBox4.Visible = false;
                pictureBox5.Visible = true;
                pictureBox6.Visible = false;
                pictureBox7.Visible = false;
                pictureBox8.Visible = false;
                pictureBox9.Visible = false;
                pictureBox10.Visible = false;

            }
            else if (pictureBox7.Visible == true)
            {
                pictureBox3.Visible = false;
                pictureBox4.Visible = false;
                pictureBox5.Visible = false;
                pictureBox6.Visible = true;
                pictureBox7.Visible = false;
                pictureBox8.Visible = false;
                pictureBox9.Visible = false;
                pictureBox10.Visible = false;

            }
            else if (pictureBox8.Visible == true)
            {
                pictureBox3.Visible = false;
                pictureBox4.Visible = false;
                pictureBox5.Visible = false;
                pictureBox6.Visible = false;
                pictureBox7.Visible = true;
                pictureBox8.Visible = false;
                pictureBox9.Visible = false;
                pictureBox10.Visible = false;

            }
            else if (pictureBox9.Visible == true)
            {
                pictureBox3.Visible = false;
                pictureBox4.Visible = false;
                pictureBox5.Visible = false;
                pictureBox6.Visible = false;
                pictureBox7.Visible = false;
                pictureBox8.Visible = true;
                pictureBox9.Visible = false;
                pictureBox10.Visible = false;

            }
            else if (pictureBox10.Visible == true)
            {
                pictureBox3.Visible = false;
                pictureBox4.Visible = false;
                pictureBox5.Visible = false;
                pictureBox6.Visible = false;
                pictureBox7.Visible = false;
                pictureBox8.Visible = false;
                pictureBox9.Visible = true;
                pictureBox10.Visible = false;

            }
        }

        private void btnSau_MH_Click(object sender, EventArgs e)
        {
            if (pictureBox3.Visible == true)
            {
                pictureBox3.Visible = false;
                pictureBox4.Visible = true;
                pictureBox5.Visible = false;
                pictureBox6.Visible = false;
                pictureBox7.Visible = false;
                pictureBox8.Visible = false;
                pictureBox9.Visible = false;
                pictureBox10.Visible = false;
            }
            else if (pictureBox4.Visible == true)
            {
                pictureBox3.Visible = false;
                pictureBox4.Visible = false;
                pictureBox5.Visible = true;
                pictureBox6.Visible = false;
                pictureBox7.Visible = false;
                pictureBox8.Visible = false;
                pictureBox9.Visible = false;
                pictureBox10.Visible = false;

            }
            else if (pictureBox5.Visible == true)
            {
                pictureBox3.Visible = false;
                pictureBox4.Visible = false;
                pictureBox5.Visible = false;
                pictureBox6.Visible = true;
                pictureBox7.Visible = false;
                pictureBox8.Visible = false;
                pictureBox9.Visible = false;
                pictureBox10.Visible = false;

            }
            else if (pictureBox6.Visible == true)
            {
                pictureBox3.Visible = false;
                pictureBox4.Visible = false;
                pictureBox5.Visible = false;
                pictureBox6.Visible = false;
                pictureBox7.Visible = true;
                pictureBox8.Visible = false;
                pictureBox9.Visible = false;
                pictureBox10.Visible = false;

            }
            else if (pictureBox7.Visible == true)
            {
                pictureBox3.Visible = false;
                pictureBox4.Visible = false;
                pictureBox5.Visible = false;
                pictureBox6.Visible = false;
                pictureBox7.Visible = false;
                pictureBox8.Visible = true;
                pictureBox9.Visible = false;
                pictureBox10.Visible = false;

            }
            else if (pictureBox8.Visible == true)
            {
                pictureBox3.Visible = false;
                pictureBox4.Visible = false;
                pictureBox5.Visible = false;
                pictureBox6.Visible = false;
                pictureBox7.Visible = false;
                pictureBox8.Visible = false;
                pictureBox9.Visible = true;
                pictureBox10.Visible = false;

            }
            else if (pictureBox9.Visible == true)
            {
                pictureBox3.Visible = false;
                pictureBox4.Visible = false;
                pictureBox5.Visible = false;
                pictureBox6.Visible = false;
                pictureBox7.Visible = false;
                pictureBox8.Visible = false;
                pictureBox9.Visible = false;
                pictureBox10.Visible = true;

            }
            else if (pictureBox10.Visible == true)
            {
                MessageBox.Show("Đã hết! Quay lại nhấn Trước");
            }
        }

        private void btnTruoc_HDN_Click(object sender, EventArgs e)
        {
            if (pictureBox13.Visible == true)
            {
                MessageBox.Show("Mời bạn nhấn Sau");
            }
            else if (pictureBox14.Visible == true)
            {
                pictureBox13.Visible = true;
                pictureBox14.Visible = false;

            }
        }

        private void btnSau_HDN_Click(object sender, EventArgs e)
        {
            if (pictureBox13.Visible == true)
            {
                pictureBox13.Visible = false;
                pictureBox14.Visible = true;
            }
            else if (pictureBox14.Visible == true)
            {
                MessageBox.Show("Đã hết! Quay lại nhấn Trước");

            }
        }

        private void btnTruoc_BH_Click(object sender, EventArgs e)
        {
            if (pictureBox15.Visible == true)
            {
                MessageBox.Show("Mời bạn nhấn Sau");
            }
            else if (pictureBox16.Visible == true)
            {
                pictureBox15.Visible = true;
                pictureBox16.Visible = false;

            }
        }

        private void btnSau_BH_Click(object sender, EventArgs e)
        {
            if (pictureBox15.Visible == true)
            {
                pictureBox15.Visible = false;
                pictureBox16.Visible = true;
            }
            else if (pictureBox16.Visible == true)
            {
                MessageBox.Show("Đã hết! Quay lại nhấn Trước");

            }
        }

        private void btnTruoc_TK_Click(object sender, EventArgs e)
        {
            if (pictureBox17.Visible == true)
            {
                MessageBox.Show("Mời bạn nhấn Sau");
            }
            else if (pictureBox18.Visible == true)
            {
                pictureBox17.Visible = true;
                pictureBox18.Visible = false;

            }
        }

        private void btnSau_TK_Click(object sender, EventArgs e)
        {
            if (pictureBox17.Visible == true)
            {
                pictureBox17.Visible = false;
                pictureBox18.Visible = true;
            }
            else if (pictureBox18.Visible == true)
            {
                MessageBox.Show("Đã hết! Quay lại nhấn Trước");

            }
        }
    }
}
