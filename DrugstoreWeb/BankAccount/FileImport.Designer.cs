namespace BankAccount
{
    partial class FileImport
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
            this.btn_ChooseFile = new System.Windows.Forms.Button();
            this.txtFilePath = new System.Windows.Forms.TextBox();
            this.btn_Import = new System.Windows.Forms.Button();
            this.dgvBankData = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.cbx_Account = new System.Windows.Forms.ComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvBankData)).BeginInit();
            this.SuspendLayout();
            // 
            // btn_ChooseFile
            // 
            this.btn_ChooseFile.Location = new System.Drawing.Point(807, 13);
            this.btn_ChooseFile.Name = "btn_ChooseFile";
            this.btn_ChooseFile.Size = new System.Drawing.Size(67, 21);
            this.btn_ChooseFile.TabIndex = 0;
            this.btn_ChooseFile.Text = "选择文件";
            this.btn_ChooseFile.UseVisualStyleBackColor = true;
            this.btn_ChooseFile.Click += new System.EventHandler(this.btn_ChooseFile_Click);
            // 
            // txtFilePath
            // 
            this.txtFilePath.Enabled = false;
            this.txtFilePath.Location = new System.Drawing.Point(371, 13);
            this.txtFilePath.Name = "txtFilePath";
            this.txtFilePath.Size = new System.Drawing.Size(430, 21);
            this.txtFilePath.TabIndex = 1;
            // 
            // btn_Import
            // 
            this.btn_Import.Location = new System.Drawing.Point(883, 13);
            this.btn_Import.Name = "btn_Import";
            this.btn_Import.Size = new System.Drawing.Size(75, 21);
            this.btn_Import.TabIndex = 2;
            this.btn_Import.Text = "导入";
            this.btn_Import.UseVisualStyleBackColor = true;
            this.btn_Import.Click += new System.EventHandler(this.btn_Import_Click);
            // 
            // dgvBankData
            // 
            this.dgvBankData.AllowUserToAddRows = false;
            this.dgvBankData.AllowUserToDeleteRows = false;
            this.dgvBankData.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvBankData.Location = new System.Drawing.Point(7, 47);
            this.dgvBankData.Name = "dgvBankData";
            this.dgvBankData.ReadOnly = true;
            this.dgvBankData.RowTemplate.Height = 23;
            this.dgvBankData.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvBankData.Size = new System.Drawing.Size(599, 475);
            this.dgvBankData.TabIndex = 3;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(7, 13);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(41, 12);
            this.label1.TabIndex = 4;
            this.label1.Text = "账户：";
            // 
            // cbx_Account
            // 
            this.cbx_Account.FormattingEnabled = true;
            this.cbx_Account.Location = new System.Drawing.Point(42, 13);
            this.cbx_Account.Name = "cbx_Account";
            this.cbx_Account.Size = new System.Drawing.Size(323, 20);
            this.cbx_Account.TabIndex = 5;
            this.cbx_Account.SelectedIndexChanged += new System.EventHandler(this.cbx_Account_SelectedIndexChanged);
            // 
            // FileImport
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.ClientSize = new System.Drawing.Size(1236, 708);
            this.Controls.Add(this.cbx_Account);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dgvBankData);
            this.Controls.Add(this.btn_Import);
            this.Controls.Add(this.txtFilePath);
            this.Controls.Add(this.btn_ChooseFile);
            this.Name = "FileImport";
            this.Text = "数据导入";
            this.Resize += new System.EventHandler(this.FileImport_Resize);
            ((System.ComponentModel.ISupportInitialize)(this.dgvBankData)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btn_ChooseFile;
        private System.Windows.Forms.TextBox txtFilePath;
        private System.Windows.Forms.Button btn_Import;
        private System.Windows.Forms.DataGridView dgvBankData;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cbx_Account;
    }
}