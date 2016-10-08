//写入数据库源代码；此方法是源文件内容中的例必须和要导入的表的例数一至，且数据格式一至
using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

namespace BankAccount
{
    /// <summary>
    /// 将数据写入数据库表中去
    /// </summary>
    public class SqlBulkData
    {
        public SqlBulkData()
        {
        }

        #region 将数据写数据库表中去（大容量）例与数据库表例一至
        /// <summary>
        /// 将数据写数据库表中去（大容量）例与数据库表例一至
        /// </summary>
        /// <param name="_Ds">数据源内容</param>
        /// <param name="_TableName">表名</param>
        /// <returns>返回是否成功！</returns>
        public bool BulkData(DataSet _Ds, string _TableName)
        {
           return  BulkData(_Ds.Tables[0], _TableName);
        }
        public bool BulkData(DataTable _Dt, string _TableName)
        {
            SqlConnection SqlCon = new SqlConnection();

            SqlCon.ConnectionString = ConfigurationManager.AppSettings["ConnectionString"];
            SqlCon.Open();
            SqlBulkCopy SqlBulk = new SqlBulkCopy(SqlCon);
            SqlBulk.DestinationTableName = _TableName;
            try
            {
                SqlBulk.WriteToServer(_Dt, DataRowState.Unchanged);
                return true;
            }
            catch
            {
                return false;
            }
            finally
            {
                SqlCon.Close();
                SqlCon.Dispose();
                SqlBulk.Close();
            }
        }

        #endregion
    }
}


