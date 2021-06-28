
namespace Nhom1___QuanLySieuThi.GUI
{
    partial class fHoaDonBanHang
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.cb_MaNV = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.dgv_DSHoaDonBan = new System.Windows.Forms.DataGridView();
            this.btnMua = new System.Windows.Forms.Button();
            this.txt_HDB = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.btn_Xoa = new System.Windows.Forms.Button();
            this.btn_Sua = new System.Windows.Forms.Button();
            this.bindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.btn_ChiTiet = new System.Windows.Forms.Button();
            this.txt_TimKiem = new System.Windows.Forms.TextBox();
            this.btn_TimKiem = new System.Windows.Forms.Button();
            this.label10 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.date_NgayBan = new System.Windows.Forms.DateTimePicker();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_DSHoaDonBan)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).BeginInit();
            this.SuspendLayout();
            // 
            // cb_MaNV
            // 
            this.cb_MaNV.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cb_MaNV.FormattingEnabled = true;
            this.cb_MaNV.Location = new System.Drawing.Point(234, 175);
            this.cb_MaNV.Margin = new System.Windows.Forms.Padding(4);
            this.cb_MaNV.Name = "cb_MaNV";
            this.cb_MaNV.Size = new System.Drawing.Size(184, 24);
            this.cb_MaNV.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(76, 182);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(88, 17);
            this.label1.TabIndex = 1;
            this.label1.Text = "Mã nhân viên";
            // 
            // dgv_DSHoaDonBan
            // 
            this.dgv_DSHoaDonBan.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_DSHoaDonBan.Location = new System.Drawing.Point(75, 315);
            this.dgv_DSHoaDonBan.Margin = new System.Windows.Forms.Padding(4);
            this.dgv_DSHoaDonBan.Name = "dgv_DSHoaDonBan";
            this.dgv_DSHoaDonBan.RowHeadersWidth = 51;
            this.dgv_DSHoaDonBan.RowTemplate.Height = 24;
            this.dgv_DSHoaDonBan.Size = new System.Drawing.Size(1159, 356);
            this.dgv_DSHoaDonBan.TabIndex = 6;
            // 
            // btnMua
            // 
            this.btnMua.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnMua.Location = new System.Drawing.Point(933, 65);
            this.btnMua.Margin = new System.Windows.Forms.Padding(4);
            this.btnMua.Name = "btnMua";
            this.btnMua.Size = new System.Drawing.Size(138, 46);
            this.btnMua.TabIndex = 7;
            this.btnMua.Text = "Lên đơn hàng";
            this.btnMua.UseVisualStyleBackColor = true;
            this.btnMua.Click += new System.EventHandler(this.btnMua_Click_1);
            // 
            // txt_HDB
            // 
            this.txt_HDB.AutoSize = true;
            this.txt_HDB.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_HDB.Location = new System.Drawing.Point(230, 86);
            this.txt_HDB.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.txt_HDB.Name = "txt_HDB";
            this.txt_HDB.Size = new System.Drawing.Size(15, 17);
            this.txt_HDB.TabIndex = 14;
            this.txt_HDB.Text = "0";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(71, 86);
            this.label8.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(105, 17);
            this.label8.TabIndex = 15;
            this.label8.Text = "Mã hóa đơn bán";
            // 
            // btn_Xoa
            // 
            this.btn_Xoa.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Xoa.Location = new System.Drawing.Point(1096, 65);
            this.btn_Xoa.Margin = new System.Windows.Forms.Padding(4);
            this.btn_Xoa.Name = "btn_Xoa";
            this.btn_Xoa.Size = new System.Drawing.Size(138, 46);
            this.btn_Xoa.TabIndex = 16;
            this.btn_Xoa.Text = "Xóa đơn hàng";
            this.btn_Xoa.UseVisualStyleBackColor = true;
            this.btn_Xoa.Click += new System.EventHandler(this.btn_Xoa_Click);
            // 
            // btn_Sua
            // 
            this.btn_Sua.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Sua.Location = new System.Drawing.Point(933, 157);
            this.btn_Sua.Margin = new System.Windows.Forms.Padding(4);
            this.btn_Sua.Name = "btn_Sua";
            this.btn_Sua.Size = new System.Drawing.Size(138, 46);
            this.btn_Sua.TabIndex = 17;
            this.btn_Sua.Text = "Sửa đơn hàng";
            this.btn_Sua.UseVisualStyleBackColor = true;
            this.btn_Sua.Click += new System.EventHandler(this.btn_Sua_Click);
            // 
            // btn_ChiTiet
            // 
            this.btn_ChiTiet.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_ChiTiet.Location = new System.Drawing.Point(717, 246);
            this.btn_ChiTiet.Margin = new System.Windows.Forms.Padding(4);
            this.btn_ChiTiet.Name = "btn_ChiTiet";
            this.btn_ChiTiet.Size = new System.Drawing.Size(151, 46);
            this.btn_ChiTiet.TabIndex = 21;
            this.btn_ChiTiet.Text = "Lên đơn chi tiết";
            this.btn_ChiTiet.UseVisualStyleBackColor = true;
            this.btn_ChiTiet.Click += new System.EventHandler(this.btn_ChiTiet_Click);
            // 
            // txt_TimKiem
            // 
            this.txt_TimKiem.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_TimKiem.Location = new System.Drawing.Point(933, 256);
            this.txt_TimKiem.Margin = new System.Windows.Forms.Padding(4);
            this.txt_TimKiem.Name = "txt_TimKiem";
            this.txt_TimKiem.Size = new System.Drawing.Size(138, 24);
            this.txt_TimKiem.TabIndex = 22;
            // 
            // btn_TimKiem
            // 
            this.btn_TimKiem.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_TimKiem.Location = new System.Drawing.Point(1096, 238);
            this.btn_TimKiem.Margin = new System.Windows.Forms.Padding(4);
            this.btn_TimKiem.Name = "btn_TimKiem";
            this.btn_TimKiem.Size = new System.Drawing.Size(138, 46);
            this.btn_TimKiem.TabIndex = 23;
            this.btn_TimKiem.Text = "Tìm kiếm";
            this.btn_TimKiem.UseVisualStyleBackColor = true;
            this.btn_TimKiem.Click += new System.EventHandler(this.btn_TimKiem_Click);
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(504, 9);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(243, 22);
            this.label10.TabIndex = 26;
            this.label10.Text = "Quản Lí Hóa Đơn Bán Hàng";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(455, 90);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(68, 17);
            this.label2.TabIndex = 28;
            this.label2.Text = "Ngày Bán";
            // 
            // date_NgayBan
            // 
            this.date_NgayBan.Location = new System.Drawing.Point(619, 83);
            this.date_NgayBan.Name = "date_NgayBan";
            this.date_NgayBan.Size = new System.Drawing.Size(249, 24);
            this.date_NgayBan.TabIndex = 29;
            // 
            // fHoaDonBanHang
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1251, 749);
            this.Controls.Add(this.date_NgayBan);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.btn_TimKiem);
            this.Controls.Add(this.txt_TimKiem);
            this.Controls.Add(this.btn_ChiTiet);
            this.Controls.Add(this.btn_Sua);
            this.Controls.Add(this.btn_Xoa);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.txt_HDB);
            this.Controls.Add(this.btnMua);
            this.Controls.Add(this.dgv_DSHoaDonBan);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cb_MaNV);
            this.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "fHoaDonBanHang";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "fHoaDonBanHang";
            ((System.ComponentModel.ISupportInitialize)(this.dgv_DSHoaDonBan)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox cb_MaNV;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dgv_DSHoaDonBan;
        private System.Windows.Forms.Button btnMua;
        private System.Windows.Forms.Label txt_HDB;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Button btn_Xoa;
        private System.Windows.Forms.Button btn_Sua;
        private System.Windows.Forms.BindingSource bindingSource1;
        private System.Windows.Forms.Button btn_ChiTiet;
        private System.Windows.Forms.TextBox txt_TimKiem;
        private System.Windows.Forms.Button btn_TimKiem;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DateTimePicker date_NgayBan;
    }
}