
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
            this.btnBack = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dtgNhap)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dtgXuat)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(248, 88);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(46, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Từ ngày";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(653, 87);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(53, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Đến ngày";
            // 
            // dtCanDuoi
            // 
            this.dtCanDuoi.Location = new System.Drawing.Point(325, 81);
            this.dtCanDuoi.Name = "dtCanDuoi";
            this.dtCanDuoi.Size = new System.Drawing.Size(200, 20);
            this.dtCanDuoi.TabIndex = 2;
            // 
            // dtCanTren
            // 
            this.dtCanTren.Location = new System.Drawing.Point(732, 81);
            this.dtCanTren.Name = "dtCanTren";
            this.dtCanTren.Size = new System.Drawing.Size(200, 20);
            this.dtCanTren.TabIndex = 3;
            // 
            // dtgNhap
            // 
            this.dtgNhap.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgNhap.Location = new System.Drawing.Point(33, 252);
            this.dtgNhap.Name = "dtgNhap";
            this.dtgNhap.Size = new System.Drawing.Size(523, 286);
            this.dtgNhap.TabIndex = 4;
            // 
            // dtgXuat
            // 
            this.dtgXuat.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgXuat.Location = new System.Drawing.Point(613, 252);
            this.dtgXuat.Name = "dtgXuat";
            this.dtgXuat.Size = new System.Drawing.Size(514, 286);
            this.dtgXuat.TabIndex = 5;
            // 
            // btnXacNhan
            // 
            this.btnXacNhan.Location = new System.Drawing.Point(536, 136);
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
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(181, 204);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(170, 18);
            this.label3.TabIndex = 7;
            this.label3.Text = "Danh sách hàng nhập";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(822, 204);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(161, 18);
            this.label4.TabIndex = 8;
            this.label4.Text = "Danh sách hàng bán";
            // 
            // btnBack
            // 
            this.btnBack.Location = new System.Drawing.Point(13, 13);
            this.btnBack.Name = "btnBack";
            this.btnBack.Size = new System.Drawing.Size(75, 23);
            this.btnBack.TabIndex = 9;
            this.btnBack.Text = "Trở về";
            this.btnBack.UseVisualStyleBackColor = true;
            this.btnBack.Click += new System.EventHandler(this.btnBack_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(438, 37);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(284, 24);
            this.label5.TabIndex = 10;
            this.label5.Text = "Thống kê số lượng nhập xuất";
            // 
            // fThongKeSLNhapXuat
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1147, 706);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.btnBack);
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
        private System.Windows.Forms.Button btnBack;
        private System.Windows.Forms.Label label5;
    }
}