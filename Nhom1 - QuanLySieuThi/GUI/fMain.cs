﻿using System;
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

        private void MặtHàngtoolStripMenuItem1_Click(object sender, EventArgs e)
        {
            fItem frm = new fItem();
            this.Hide();
            frm.ShowDialog();
            this.Show();
        }
    }
}
