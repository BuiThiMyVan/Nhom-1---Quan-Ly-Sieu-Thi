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
    public partial class fList_Invoice : Form
    {
        public fList_Invoice()
        {
            InitializeComponent();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            fAdd_Invoice frm = new fAdd_Invoice();
            this.Hide();
            frm.ShowDialog();
            this.Show();
        }
    }
}
