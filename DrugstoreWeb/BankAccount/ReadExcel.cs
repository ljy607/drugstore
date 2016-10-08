//读文件源代码；
using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.OleDb;
using System.IO;

namespace BankAccount
{
    class ReadExcel
    {
        private string FileName;
        private string FilsPath;
        /// <summary>
        /// 构造函数文件所在路径
        /// </summary>
        /// <param name="Path">文件路径（Execl文件为完整的路径）</param>
        public ReadExcel(string Path)//构造
        {
            FileName = Path;
            //FilsPath = Files;
        }

        /// <summary>
        /// 构造函数:文件所在路径
        /// </summary>
        /// <param name="Path">文件路径（为Csv文件所在的文件夹路径）</param>
        /// <param name="Files">读Csv文件时的文件名</param>
        public ReadExcel(string Path, string Files)//构造
        {
            FileName = Path;
            FilsPath = Files;
        }

        OleDbConnection OleCon = new OleDbConnection();
        OleDbCommand OleCmd = new OleDbCommand();
        OleDbDataAdapter OleDa = new OleDbDataAdapter();

        #region 读取Execl文件返回DataSet

        /// <summary>
        /// 读取Execl文件返回DataSet
        /// </summary>
        /// <returns>返回结果集</returns>
        public DataSet Execl()
        {
            DataSet Myds = new DataSet();
            DataTable dt = null;
            OleCon.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + FileName + ";Extended Properties=Excel 8.0;";
            OleCon.Open();
            dt = OleCon.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
            if (dt != null)
            {
                string[] sheetName = new string[dt.Rows.Count];
                int i = 0;
                foreach (DataRow row in dt.Rows)
                {
                    sheetName[i] = row["TABLE_NAME"].ToString();
                    i++;
                }

                OleCmd.CommandText = "select * from [" + sheetName[0] + "]";
                OleCmd.Connection = OleCon;
                OleDa.SelectCommand = OleCmd;
                try
                {
                    OleDa.Fill(Myds, "Execl");
                    return Myds;
                }
                catch
                {
                    return Myds;
                }
                finally
                {
                    OleCon.Close();
                    OleCmd.Dispose();
                    OleDa.Dispose();
                    OleCon.Dispose();
                }
            }
            return Myds;
        }

        #endregion

        #region 读取Csv文件返回DataSet
        /// <summary>
        /// 读取Csv文件返回DataSet
        /// </summary>
        /// <returns>Csv内容</returns>
        public DataSet Csv()
        {
            DataSet CsvData = new DataSet();
            OleCon.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + FileName + ";Extended Properties='Text;FMT=Delimited;HDR=YES;'";
            OleCon.Open();
            OleCmd.Connection = OleCon;
            OleCmd.CommandText = "select * From " + FilsPath;
            OleDa.SelectCommand = OleCmd;
            try
            {
                OleDa.Fill(CsvData, "Csv");
                return CsvData;
            }
            catch
            {
                return CsvData;
            }
            finally
            {
                OleCon.Close();
                OleCmd.Dispose();
                OleDa.Dispose();
                OleCon.Dispose();
            }
        }
        #endregion

        #region 使用StreamReader将CVS文件转化为一个DataTable

        public static DataTable CSVToDataTable(string fn)
        {
            FileStream stream = File.Open(
                fn,
                FileMode.Open);
            var reader = new StreamReader(
                stream,
                Encoding.GetEncoding("GB2312"));
            string line = "";
            var dt = new DataTable("table");
            while ((line = reader.ReadLine()) != null)
            {
                string[] values = line.Split(',');
                int count = dt.Columns.Count;
                int addNum = values.Length - count;
                if (addNum > 0)
                {
                    AddColumn(
                        dt,
                        addNum);
                }
                DataRow row = dt.NewRow();
                for (int num = 0;
                    num < values.Length;
                    num++)
                {
                    row[num] = values[num];
                }
                dt.Rows.Add(row);
            }
            reader.Close();
            stream.Close();
            return dt;
        }

        public static void AddColumn(DataTable dt, int addNum)
        {
            int count = dt.Columns.Count;
            for (int num = count - 1;
                num < count + addNum;
                num++)
            {
                int colIndex = num + 1;
                var col = new DataColumn(
                    colIndex.ToString(),
                    typeof(string));
                dt.Columns.Add(col);
            }
        }

        #endregion
    }
}

