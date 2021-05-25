
namespace Nhom1___QuanLySieuThi.GUI
{
    partial class fThongKeSLNhapXuat
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
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.dtCanDuoi = new System.Windows.Forms.DateTimePicker();
            this.dtCanTren = new System.Windows.Forms.DateTimePicker();
            this.dtgNhap = new System.Windows.Forms.DataGridView();
            this.dtgXuat = new System.Windows.Forms.DataGridView();
            this.btnXacNhan = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dtgNhap)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dtgXuat)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(183, 61);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(35, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "label1";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(584, 61);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(35, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "label2";
            // 
            // dtCanDuoi
            // 
            this.dtCanDuoi.Location = new System.Drawing.Point(235, 61);
            this.dtCanDuoi.Name = "dtCanDuoi";
            this.dtCanDuoi.Size = new System.Drawing.Size(200, 20);
            this.dtCanDuoi.TabIndex = 2;
            // 
            // dtCanTren
            // 
            this.dtCanTren.Location = new System.Drawing.Point(642, 61);
            this.dtCanTren.Name = "dtCanTren";
            this.dtCanTren.Size = new System.Drawing.Size(200, 20);
            this.dtCanTren.TabIndex = 3;
            // 
            // dtgNhap
            // 
            this.dtgNhap.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgNhap.Location = new System.Drawing.Point(45, 227);
            this.dtgNhap.Name = "dtgNhap";
            this.dtgNhap.Size = new System.Drawing.Size(417, 286);
            this.dtgNhap.TabIndex = 4;
            // 
            // dtgXuat
            // 
            this.dtgXuat.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgXuat.Location = new System.Drawing.Point(519, 227);
            this.dtgXuat.Name = "dtgXuat";
            this.dtgXuat.Size = new System.Drawing.Size(404, 286);
            this.dtgXuat.TabIndex = 5;
            // 
            // btnXacNhan
            // 
            this.btnXacNhan.Location = new System.Drawing.Point(459, 89);
            this.btnXacNhan.Name = "btnXacNhan";
            this.btnXacNhan.Size = new System.Drawing.Size(75, 23);
            this.btnXacNhan.TabIndex = 6;
            this.btnXacNhan.Text = "Xác nhận";
            this.btnXacNhan.UseVisualStyleBackColor = true;
            this.btnXacNhan.Click += new System.EventHandler(this.btnXacNhan_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(147, 179);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(113, 13);
            this.label3.TabIndex = 7;
            this.label3.Text = "Danh sách hàng nhập";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(653, 179);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(107, 13);
            this.label4.TabIndex = 8;
            this.label4.Text = "Danh sách hàng bán";
            // 
            // fThongKeSLNhapXuat
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(935, 637);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.btnXacNhan);
            this.Controls.Add(this.dtgXuat);
            this.Controls.Add(this.dtgNhap);
            this.Controls.Add(this.dtCanTren);
            this.Controls.Add(this.dtCanDuoi);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "fThongKeSLNhapXuat";
            this.Text = "fThongKeSLNhapXuat";
            ((System.ComponentModel.ISupportInitialize)(this.dtgNhap)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dtgXuat)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DateTimePicker dtCanDuoi;
        private System.Windows.Forms.DateTimePicker dtCanTren;
        private System.Windows.Forms.DataGridView dtgNhap;
        private System.Windows.Forms.DataGridView dtgXuat;
        private System.Windows.Forms.Button btnXacNhan;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
    }
}