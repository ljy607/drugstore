using System;
using System.Collections.Generic;
using System.Collections;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Configuration;


namespace DBAccess
{
    public partial class SqlHelper
    {
        public static readonly string ConnectionStringLocal = ConfigurationManager.AppSettings["ConnectionString"];
        //public static readonly string ConnectionStringWMS = AppConfig.ConnectionString;
        private const string ParamPrefixPattern = @"[?@]";
        private const string ParamPattern = ParamPrefixPattern + @"\w+\b";

        /// <summary>
        /// 将参数添加到DbCommand对象中
        /// </summary>
        /// <param name="cmd"></param>
        /// <param name="values"></param>
        private static void AddParamers(SqlCommand cmd,List<string> values)
        {
            if (values == null || values.Count == 0)
                return;

            List<String> para = new List<string>();

            MatchCollection matches = Regex.Matches(cmd.CommandText, ParamPattern);

            for (int i = 0; i < matches.Count; i++)
            {
                if (para.Contains(matches[i].Value))
                    continue;
                SqlParameter parameter = new SqlParameter();
                para.Add(matches[i].Value);
                parameter.Value = values[i];
                parameter.ParameterName = matches[i].Value;
                cmd.Parameters.Add(parameter);
            }
        }

        public static object ExecuteScalar(SqlCommand cmd)
        {
            return ExecuteScalar(SqlHelper.ConnectionStringLocal, CommandType.Text, cmd);
        }

        public static object ExecuteScalar(string connectionString, CommandType cmdType, SqlCommand cmd)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                cmd.Connection = conn;
                cmd.CommandType = cmdType;

                return cmd.ExecuteScalar();
            }
        }

        public static int ExecuteNonQuery(SqlCommand cmd)
        {
            return ExecuteNonQuery(SqlHelper.ConnectionStringLocal, CommandType.Text, cmd);            
        }

        public static int ExecuteNonQuery(string connectionString, SqlCommand cmd)
        {
            return ExecuteNonQuery(connectionString, CommandType.Text, cmd);
        }

        public static int ExecuteNonQuery(string connectionString, CommandType cmdType, SqlCommand cmd)
        {
            int rowsAffected = -1;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                    {
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                cmd.Connection = conn;
                cmd.CommandType = cmdType;

                 rowsAffected = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                    }
                    catch(Exception ex)
                   {
                    //ErrorLog.GetInstance().Write(ex.Message+"执行："+cmd.CommandText);
                   
                    }
                return rowsAffected;
            }
        }
        
        public static DataSet ExecuteDataSet(string cmdText, List<string> paras)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = cmdText;
            cmd.CommandType = CommandType.Text;

            AddParamers(cmd,paras);

            return ExecuteDataSet(cmd);
        }

        public static DataSet ExecuteDataSet(string connectionString, string cmdText)
        {
            return ExecuteDataSet(connectionString, cmdText, null);
        }

        public static DataSet ExecuteDataSet(string cmdText, SqlParameter[] paras)
        {
            return ExecuteDataSet(SqlHelper.ConnectionStringLocal, cmdText, paras);
        }

        public static DataSet ExecuteDataSet(string connectionString, string cmdText, SqlParameter[] paras)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = cmdText;
                cmd.CommandType = CommandType.Text;
                if (paras != null && paras.Length > 0)
                    cmd.Parameters.AddRange(paras);

                SqlDataAdapter sqlDA = new SqlDataAdapter();
                sqlDA.SelectCommand = cmd;
                DataSet dataSet = new DataSet();
                sqlDA.Fill(dataSet, "Anonymous");

                return dataSet;
            }
        }
        
        public static DataSet ExecuteDataSetPWDB(string connectionString, string cmdText, SqlParameter[] paras)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = cmdText;
                cmd.CommandType = CommandType.Text;
                if (paras != null && paras.Length > 0)
                    cmd.Parameters.AddRange(paras);

                SqlDataAdapter sqlDA = new SqlDataAdapter();
                sqlDA.SelectCommand = cmd;
                DataSet dataSet = new DataSet();
                sqlDA.Fill(dataSet, "Anonymous");

                return dataSet;
            }
        }

        public static void ClearTable(string tableName)
        {
            string sql = "DELETE FROM " + tableName;
            ExecuteNonQuery(sql);
        }

        #region 公用方法

        public static int GetMaxID(string FieldName, string TableName)
        {
            string strsql = "select max(" + FieldName + ")+1 from " + TableName;
            object obj = GetSingle(strsql);
            if (obj == null)
            {
                return 1;
            }
            else
            {
                return int.Parse(obj.ToString());
            }
        }
        public static bool Exists(string strSql, params SqlParameter[] cmdParms)
        {
            object obj = GetSingle(strSql, cmdParms);
            int cmdresult;
            if ((Object.Equals(obj, null)) || (Object.Equals(obj, System.DBNull.Value)))
            {
                cmdresult = 0;
            }
            else
            {
                cmdresult = int.Parse(obj.ToString());
            }
            if (cmdresult == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        #endregion

        #region  执行简单SQL语句

        /// <summary>
        /// 执行SQL语句，返回影响的记录数
        /// </summary>
        /// <param name="SQLString">SQL语句</param>
        /// <returns>影响的记录数</returns>
        public static int ExecuteSql(string SQLString)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionStringLocal))
            {
                using (SqlCommand cmd = new SqlCommand(SQLString, connection))
                {
                    try
                    {
                        connection.Open();
                        int rows = cmd.ExecuteNonQuery();
                        return rows;
                    }
                    catch (System.Data.SqlClient.SqlException E)
                    {
                        connection.Close();
                        throw new Exception(E.Message);
                    }
                }
            }
        }

        /// <summary>
        /// 执行多条SQL语句，实现数据库事务。
        /// </summary>
        /// <param name="SQLStringList">多条SQL语句</param>		
        public static void ExecuteSqlTran(IList<string> SQLStringList)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionStringLocal))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                SqlTransaction tx = conn.BeginTransaction();
                cmd.Transaction = tx;
                try
                {
                    for (int n = 0; n < SQLStringList.Count; n++)
                    {
                        string strsql = SQLStringList[n];
                        if (strsql.Trim().Length > 1)
                        {
                            cmd.CommandText = strsql;
                            cmd.ExecuteNonQuery();
                        }
                    }
                    tx.Commit();
                }
                catch (System.Data.SqlClient.SqlException E)
                {
                    tx.Rollback();
                    throw new Exception(E.Message);
                }
            }
        }
        /// <summary>
        /// 执行带一个存储过程参数的的SQL语句。
        /// </summary>
        /// <param name="SQLString">SQL语句</param>
        /// <param name="content">参数内容,比如一个字段是格式复杂的文章，有特殊符号，可以通过这个方式添加</param>
        /// <returns>影响的记录数</returns>
        public static int ExecuteSql(string SQLString, string content)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionStringLocal))
            {
                SqlCommand cmd = new SqlCommand(SQLString, connection);
                System.Data.SqlClient.SqlParameter myParameter = new System.Data.SqlClient.SqlParameter("@content", SqlDbType.NText);
                myParameter.Value = content;
                cmd.Parameters.Add(myParameter);
                try
                {
                    connection.Open();
                    int rows = cmd.ExecuteNonQuery();
                    return rows;
                }
                catch (System.Data.SqlClient.SqlException E)
                {
                    throw new Exception(E.Message);
                }
                finally
                {
                    cmd.Dispose();
                    connection.Close();
                }
            }
        }
        /// <summary>
        /// 向数据库里插入图像格式的字段(和上面情况类似的另一种实例)
        /// </summary>
        /// <param name="strSQL">SQL语句</param>
        /// <param name="fs">图像字节,数据库的字段类型为image的情况</param>
        /// <returns>影响的记录数</returns>
        public static int ExecuteSqlInsertImg(string strSQL, byte[] fs)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionStringLocal))
            {
                SqlCommand cmd = new SqlCommand(strSQL, connection);
                System.Data.SqlClient.SqlParameter myParameter = new System.Data.SqlClient.SqlParameter("@fs", SqlDbType.Image);
                myParameter.Value = fs;
                cmd.Parameters.Add(myParameter);
                try
                {
                    connection.Open();
                    int rows = cmd.ExecuteNonQuery();
                    return rows;
                }
                catch (System.Data.SqlClient.SqlException E)
                {
                    throw new Exception(E.Message);
                }
                finally
                {
                    cmd.Dispose();
                    connection.Close();
                }
            }
        }

        /// <summary>
        /// 执行一条计算查询结果语句，返回查询结果（object）。
        /// </summary>
        /// <param name="SQLString">计算查询结果语句</param>
        /// <returns>查询结果（object）</returns>
        public static object GetSingle(string SQLString)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionStringLocal))
            {
                using (SqlCommand cmd = new SqlCommand(SQLString, connection))
                {
                    try
                    {
                        connection.Open();
                        object obj = cmd.ExecuteScalar();
                        if ((Object.Equals(obj, null)) || (Object.Equals(obj, System.DBNull.Value)))
                        {
                            return null;
                        }
                        else
                        {
                            return obj;
                        }
                    }
                    catch (System.Data.SqlClient.SqlException e)
                    {
                        connection.Close();
                        throw new Exception(e.Message);
                    }
                }
            }
        }
        /// <summary>
        /// 执行查询语句，返回SqlDataReader
        /// </summary>
        /// <param name="strSQL">查询语句</param>
        /// <returns>SqlDataReader</returns>
        public static SqlDataReader ExecuteReader(string strSQL)
        {
            SqlConnection connection = new SqlConnection(ConnectionStringLocal);
            SqlCommand cmd = new SqlCommand(strSQL, connection);
            try
            {
                connection.Open();
                SqlDataReader myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                return myReader;
            }
            catch (System.Data.SqlClient.SqlException e)
            {
                throw new Exception(e.Message);
            }

        }
        /// <summary>
        /// 执行查询语句，返回DataSet
        /// </summary>
        /// <param name="SQLString">查询语句</param>
        /// <returns>DataSet</returns>
        public static DataSet Query(string SQLString)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionStringLocal))
            {
                DataSet ds = new DataSet();
                try
                {
                    connection.Open();
                    SqlDataAdapter command = new SqlDataAdapter(SQLString, connection);
                    command.Fill(ds, "ds");
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    throw new Exception(ex.Message);
                }
                return ds;
            }
        }


        #endregion

        #region 执行带参数的SQL语句

        /// <summary>
        /// 执行SQL语句，返回影响的记录数
        /// </summary>
        /// <param name="SQLString">SQL语句</param>
        /// <returns>影响的记录数</returns>
        public static int ExecuteSql(string SQLString, params SqlParameter[] cmdParms)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionStringLocal))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    try
                    {
                        PrepareCommand(cmd, connection, null, SQLString, cmdParms);
                        int rows = cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                        return rows;
                    }
                    catch (System.Data.SqlClient.SqlException E)
                    {
                        throw new Exception(E.Message);
                    }
                }
            }
        }


        /// <summary>
        /// 执行多条SQL语句，实现数据库事务。
        /// </summary>
        /// <param name="SQLStringList">SQL语句的哈希表（key为sql语句，value是该语句的SqlParameter[]）</param>
        public static void ExecuteSqlTran(Hashtable SQLStringList)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionStringLocal))
            {
                conn.Open();
                using (SqlTransaction trans = conn.BeginTransaction())
                {
                    SqlCommand cmd = new SqlCommand();
                    try
                    {
                        //循环
                        foreach (DictionaryEntry myDE in SQLStringList)
                        {
                            string cmdText = myDE.Key.ToString();
                            SqlParameter[] cmdParms = (SqlParameter[])myDE.Value;
                            PrepareCommand(cmd, conn, trans, cmdText, cmdParms);
                            int val = cmd.ExecuteNonQuery();
                            cmd.Parameters.Clear();
                        }
                        trans.Commit();
                    }
                    catch
                    {
                        trans.Rollback();
                        throw;
                    }
                }
            }
        }


        /// <summary>
        /// 执行一条计算查询结果语句，返回查询结果（object）。
        /// </summary>
        /// <param name="SQLString">计算查询结果语句</param>
        /// <returns>查询结果（object）</returns>
        public static object GetSingle(string SQLString, params SqlParameter[] cmdParms)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionStringLocal))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    try
                    {
                        PrepareCommand(cmd, connection, null, SQLString, cmdParms);
                        object obj = cmd.ExecuteScalar();
                        cmd.Parameters.Clear();
                        if ((Object.Equals(obj, null)) || (Object.Equals(obj, System.DBNull.Value)))
                        {
                            return null;
                        }
                        else
                        {
                            return obj;
                        }
                    }
                    catch (System.Data.SqlClient.SqlException e)
                    {
                        throw new Exception(e.Message);
                    }
                }
            }
        }

        /// <summary>
        /// 执行查询语句，返回SqlDataReader
        /// </summary>
        /// <param name="strSQL">查询语句</param>
        /// <returns>SqlDataReader</returns>
        public static SqlDataReader ExecuteReader(string SQLString, params SqlParameter[] cmdParms)
        {
            SqlConnection connection = new SqlConnection(ConnectionStringLocal);
            SqlCommand cmd = new SqlCommand();
            try
            {
                PrepareCommand(cmd, connection, null, SQLString, cmdParms);
                SqlDataReader myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                cmd.Parameters.Clear();
                return myReader;
            }
            catch (System.Data.SqlClient.SqlException e)
            {
                throw new Exception(e.Message);
            }

        }

        /// <summary>
        /// 执行查询语句，返回DataSet
        /// </summary>
        /// <param name="SQLString">查询语句</param>
        /// <returns>DataSet</returns>
        public static DataSet Query(string SQLString, params SqlParameter[] cmdParms)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionStringLocal))
            {
                SqlCommand cmd = new SqlCommand();
                PrepareCommand(cmd, connection, null, SQLString, cmdParms);
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    try
                    {
                        da.Fill(ds, "ds");
                        cmd.Parameters.Clear();
                    }
                    catch (System.Data.SqlClient.SqlException ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    return ds;
                }
            }
        }


        private static void PrepareCommand(SqlCommand cmd, SqlConnection conn, SqlTransaction trans, string cmdText, SqlParameter[] cmdParms)
        {
            if (conn.State != ConnectionState.Open)
                conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = cmdText;
            if (trans != null)
                cmd.Transaction = trans;
            cmd.CommandType = CommandType.Text;//cmdType;
            if (cmdParms != null)
            {
                foreach (SqlParameter parm in cmdParms)
                    cmd.Parameters.Add(parm);
            }
        }

        #endregion

        #region 存储过程操作

        /// <summary>
        /// 执行存储过程
        /// </summary>
        /// <param name="storedProcName">存储过程名</param>
        /// <param name="parameters">存储过程参数</param>
        /// <returns>SqlDataReader</returns>
        public static SqlDataReader RunProcedure(string storedProcName, IDataParameter[] parameters)
        {
            SqlConnection connection = new SqlConnection(ConnectionStringLocal);
            try
            {
                SqlDataReader returnReader;
                connection.Open();
                SqlCommand command = BuildQueryCommand(connection, storedProcName, parameters);
                command.CommandType = CommandType.StoredProcedure;
                returnReader = command.ExecuteReader(CommandBehavior.CloseConnection);
                return returnReader;
            }
            catch (System.Data.SqlClient.SqlException e)
            {
                connection.Close();
                throw new Exception(e.Message);
            }
        }

        /// <summary>
        /// 执行存储过程
        /// </summary>
        /// <param name="storedProcName">存储过程名</param>
        /// <param name="parameters">存储过程参数</param>
        /// <returns>SqlDataReader</returns>
        public static SqlDataReader RunProcedure(string storedProcName, SqlParameter[] parameters)
        {
            SqlConnection connection = new SqlConnection(ConnectionStringLocal);
            try
            {
                SqlDataReader returnReader;
                connection.Open();
                SqlCommand command = BuildQueryCommand(connection, storedProcName, parameters);
                command.CommandType = CommandType.StoredProcedure;
                returnReader = command.ExecuteReader(CommandBehavior.CloseConnection);
                return returnReader;
            }
            catch (System.Data.SqlClient.SqlException e)
            {
                connection.Close();
                throw new Exception(e.Message);
            }
        }

        /// <summary>
        /// 执行存储过程
        /// </summary>
        /// <param name="storedProcName">存储过程名</param>
        /// <returns>SqlDataReader</returns>
        public static SqlDataReader RunProcedure(string storedProcName)
        {
            SqlConnection connection = new SqlConnection(ConnectionStringLocal);
            try
            {
                SqlDataReader returnReader;
                connection.Open();
                SqlCommand command = new SqlCommand(storedProcName, connection);
                command.CommandType = CommandType.StoredProcedure;
                returnReader = command.ExecuteReader(CommandBehavior.CloseConnection);
                return returnReader;
            }
            catch (System.Data.SqlClient.SqlException e)
            {
                connection.Close();
                throw new Exception(e.Message);
            }
        }

        /// <summary>
        /// 执行存储过程
        /// </summary>
        /// <param name="storedProcName">存储过程名</param>
        /// <param name="parameters">存储过程参数</param>
        /// <param name="tableName">DataSet结果中的表名</param>
        /// <returns>DataSet</returns>
        public static DataSet RunProcedure(string storedProcName, IDataParameter[] parameters, string tableName)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionStringLocal))
            {
                DataSet dataSet = new DataSet();
                connection.Open();
                SqlDataAdapter sqlDA = new SqlDataAdapter();
                sqlDA.SelectCommand = BuildQueryCommand(connection, storedProcName, parameters);
                sqlDA.Fill(dataSet, tableName);
                return dataSet;
            }
        }

        /// <summary>
        /// 执行存储过程
        /// </summary>
        /// <param name="storedProcName">存储过程名</param>
        /// <param name="tableName">DataSet结果中的表名</param>
        /// <returns>DataSet</returns>
        public static DataSet RunProcedure(string storedProcName, string tableName)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionStringLocal))
            {
                DataSet dataSet = new DataSet();
                connection.Open();
                SqlDataAdapter sqlDA = new SqlDataAdapter();
                sqlDA.SelectCommand = new SqlCommand(storedProcName, connection);
                sqlDA.Fill(dataSet, tableName);
                return dataSet;
            }
        }

        #region 分页存储过程
        /// <summary>
        /// 执行存储过程
        /// </summary>
        /// <param name="rowsTotal">总记录数</param>
        /// <param name="pagecount">总页数</param>
        /// <param name="storedProcName">存储过程名</param>
        /// <param name="parameters">存储过程参数</param>
        /// <returns>SqlDataReader</returns>
        private static SqlDataReader RunProcedure(out int rowsTotal, out int pagecount, string storedProcName, IDataParameter[] parameters)
        {
            SqlConnection connection = new SqlConnection(ConnectionStringLocal);
            try
            {
                SqlDataReader returnReader;
                connection.Open();
                SqlCommand command = BuildQueryCommand(connection, storedProcName, parameters);
                command.Parameters.Add(new SqlParameter("RecordCount", SqlDbType.Int, 4, ParameterDirection.Output, false, 0, 0, String.Empty, DataRowVersion.Default, null));
                command.Parameters.Add(new SqlParameter("PageCount", SqlDbType.Int, 4, ParameterDirection.Output, false, 0, 0, String.Empty, DataRowVersion.Default, null));
                returnReader = command.ExecuteReader(CommandBehavior.CloseConnection);
                returnReader.NextResult();
                rowsTotal = (int)command.Parameters["RecordCount"].Value;
                pagecount = (int)command.Parameters["PageCount"].Value;
                return returnReader;
            }
            catch (System.Data.SqlClient.SqlException e)
            {
                connection.Close();
                throw new Exception(e.Message);
            }
        }



        /// <summary></summary>
        /// <param name="tbname">表名</param>
        /// <param name="rowsTotal">关闭连接是才能读取得到 总记录数</param>
        /// <param name="pagecount">关闭连接是才能读取得到 总页数</param>
        /// <param name="FieldKey">用于定位记录的主键(惟一键)字段,只能是单个字段</param>
        /// <param name="PageCurrent">当前（页码）页面</param>
        /// <param name="PageSize">每页的大小(记录数)</param>
        /// <param name="FieldShow">以逗号分隔的要显示的字段列表,如果不指定,则显示所有字段</param>
        /// <param name="FieldOrder">以逗号分隔的排序字段列表,可以指定在字段后面指定DESC/ASC 用于指定排序顺序</param>
        /// <param name="Where">查询条件</param>
        /// <param name="procedureName">分页存储过程名称</param>
        /// <returns></returns>
        public static SqlDataReader RunProcedureReadonly(out int rowsTotal, out int pagecount, string tbname, string FieldKey, int PageCurrent, int PageSize, string FieldShow, string FieldOrder, string Where, string procedureName)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@tbname", SqlDbType.VarChar, 50),
					new SqlParameter("@FieldKey", SqlDbType.VarChar, 50),
					new SqlParameter("@PageCurrent", SqlDbType.Int),
					new SqlParameter("@PageSize", SqlDbType.Int),
					new SqlParameter("@FieldShow", SqlDbType.NVarChar,1000),
					new SqlParameter("@FieldOrder", SqlDbType.NVarChar,1000),
					new SqlParameter("@Where", SqlDbType.VarChar,1000)
					};
            parameters[0].Value = tbname;
            parameters[1].Value = FieldKey;
            parameters[2].Value = PageCurrent;
            parameters[3].Value = PageSize;
            parameters[4].Value = FieldShow;
            parameters[5].Value = FieldOrder;
            parameters[6].Value = Where;
            return RunProcedure(out rowsTotal, out pagecount, procedureName, parameters);
        }


        /// <summary>
        /// 执行存储过程
        /// </summary>
        /// <param name="rowsTotal">总记录数</param>
        /// <param name="pagecount">总页数</param>
        /// <param name="storedProcName">存储过程名</param>
        /// <param name="parameters">存储过程参数</param>
        /// <param name="tableName">DataSet结果中的表名</param>
        /// <returns>DataSet</returns>
        private static DataSet RunProcedure(ref int rowsTotal, ref int pagecount, string storedProcName, IDataParameter[] parameters, string tableName)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionStringLocal))
            {
                DataSet dataSet = new DataSet();
                connection.Open();
                SqlCommand command = BuildQueryCommand(connection, storedProcName, parameters);
                command.Parameters.Add(new SqlParameter("RecordCount", SqlDbType.Int, 4, ParameterDirection.Output, false, 0, 0, String.Empty, DataRowVersion.Default, null));
                command.Parameters.Add(new SqlParameter("PageCount", SqlDbType.Int, 4, ParameterDirection.Output, false, 0, 0, String.Empty, DataRowVersion.Default, null));
                SqlDataAdapter sqlDA = new SqlDataAdapter(command);
                sqlDA.Fill(dataSet, tableName);
                rowsTotal = (int)command.Parameters["RecordCount"].Value;
                pagecount = (int)command.Parameters["PageCount"].Value;
                return dataSet;
            }
        }

        /// <summary></summary>
        /// <param name="rowsTotal">总记录数</param>
        /// <param name="rowsTotal">总页数</param>
        /// <param name="tbname">表名</param>
        /// <param name="FieldKey">用于定位记录的主键(惟一键)字段,只能是单个字段</param>
        /// <param name="PageCurrent">当前（页码）页面</param>
        /// <param name="PageSize">每页的大小(记录数)</param>
        /// <param name="FieldShow">以逗号分隔的要显示的字段列表,如果不指定,则显示所有字段</param>
        /// <param name="FieldOrder">以逗号分隔的排序字段列表,可以指定在字段后面指定DESC/ASC 用于指定排序顺序</param>
        /// <param name="Where">查询条件</param>
        /// <param name="procedureName">分页存储过程名称</param>
        /// <returns></returns>
        public static DataSet RunProcedure(ref int rowsTotal, ref int pagecount, string tbname, string FieldKey, int PageCurrent, int PageSize, string FieldShow, string FieldOrder, string Where, string procedureName)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@tbname", SqlDbType.VarChar, 50),
					new SqlParameter("@FieldKey", SqlDbType.VarChar, 50),
					new SqlParameter("@PageCurrent", SqlDbType.Int),
					new SqlParameter("@PageSize", SqlDbType.Int),
					new SqlParameter("@FieldShow", SqlDbType.NVarChar,1000),
					new SqlParameter("@FieldOrder", SqlDbType.NVarChar,1000),
					new SqlParameter("@Where", SqlDbType.VarChar,1000)
					};
            parameters[0].Value = tbname;
            parameters[1].Value = FieldKey;
            parameters[2].Value = PageCurrent;
            parameters[3].Value = PageSize;
            parameters[4].Value = FieldShow;
            parameters[5].Value = FieldOrder;
            parameters[6].Value = Where;
            return RunProcedure(ref rowsTotal, ref pagecount, procedureName, parameters, tbname);
        }
        #endregion

        /// <summary>
        /// 构建 SqlCommand 对象(用来返回一个结果集，而不是一个整数值)
        /// </summary>
        /// <param name="connection">数据库连接</param>
        /// <param name="storedProcName">存储过程名</param>
        /// <param name="parameters">存储过程参数</param>
        /// <returns>SqlCommand</returns>
        private static SqlCommand BuildQueryCommand(SqlConnection connection, string storedProcName, IDataParameter[] parameters)
        {
            SqlCommand command = new SqlCommand(storedProcName, connection);
            command.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter parameter in parameters)
            {
                command.Parameters.Add(parameter);
            }
            return command;
        }


        /// <summary>
        /// 执行存储过程，返回影响的行数		
        /// </summary>
        /// <param name="storedProcName">存储过程名</param>
        /// <param name="parameters">存储过程参数</param>
        /// <param name="rowsAffected">影响的行数</param>
        /// <returns></returns>
        public static int RunProcedure(string storedProcName, IDataParameter[] parameters, out int rowsAffected)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionStringLocal))
            {
                int result;
                connection.Open();
                SqlCommand command = BuildIntCommand(connection, storedProcName, parameters);
                rowsAffected = command.ExecuteNonQuery();
                result = (int)command.Parameters["ReturnValue"].Value;
                return result;
            }
        }

        /// <summary>
        /// 创建 SqlCommand 对象实例(用来返回一个整数值)	
        /// </summary>
        /// <param name="storedProcName">存储过程名</param>
        /// <param name="parameters">存储过程参数</param>
        /// <returns>SqlCommand 对象实例</returns>
        private static SqlCommand BuildIntCommand(SqlConnection connection, string storedProcName, IDataParameter[] parameters)
        {
            SqlCommand command = BuildQueryCommand(connection, storedProcName, parameters);
            command.Parameters.Add(new SqlParameter("ReturnValue",
                SqlDbType.Int, 4, ParameterDirection.ReturnValue,
                false, 0, 0, string.Empty, DataRowVersion.Default, null));
            return command;
        }
        #endregion


        #region  ExecuteScalar

        /// <summary>
        /// 执行查询
        /// </summary>
        /// <param name="cmdText">sql语句</param>
        /// <param name="values">参数值</param>
        /// <returns>结果集第一行第一列</returns>
        public static object ExecuteScalar(string cmdText)
        {
            return ExecuteScalar(cmdText, new object[] { });
        }

        /// <summary>
        /// 执行查询
        /// </summary>
        /// <param name="cmdText">sql语句</param>
        /// <param name="values">参数值</param>
        /// <returns>结果集第一行第一列</returns>
        public static object ExecuteScalar(string cmdText, object[] values)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = cmdText;
            return ExecuteScalar(cmd, values, null);
        }

        /// <summary>
        /// 执行查询
        /// </summary>
        /// <param name="cmd">Sql执行对象</param>
        /// <param name="values">参数值</param>
        /// <param name="dbTypes">参数类型</param>
        /// <returns>结果集第一行第一列</returns>
        public static object ExecuteScalar(SqlCommand cmd, object[] values, DbType[] dbTypes)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionStringLocal))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.Text;
                AddParamers(cmd.CommandText, values, dbTypes, cmd);
                return cmd.ExecuteScalar();
            }
        }

        #endregion

        #region ExecuteNonQuery

        public static int ExecuteNonQuery(SqlCommand cmd, out int sysno)
        {
            return ExecuteNonQuery(SqlHelper.ConnectionStringLocal, CommandType.Text, cmd, out sysno);
        }

        public static int ExecuteNonQuery(string connectionString, SqlCommand cmd, out int sysno)
        {
            return ExecuteNonQuery(connectionString, CommandType.Text, cmd, out sysno);
        }

        public static int ExecuteNonQuery(string connectionString, CommandType cmdType, SqlCommand cmd, out int sysno)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {

                if (conn.State != ConnectionState.Open)
                    conn.Open();

                cmd.Connection = conn;
                cmd.CommandType = cmdType;

                int rowsAffected = cmd.ExecuteNonQuery();

                //必须符合下面的条件
                if (cmd.Parameters.Contains("@SysNo") && cmd.Parameters["@SysNo"].Direction == ParameterDirection.Output)
                    sysno = (int)cmd.Parameters["@SysNo"].Value;
                else
                {
                    throw new Exception("SqlHelper: Does not contain SysNo or ParameterDirection is Not Output");
                }

                cmd.Parameters.Clear();
                return rowsAffected;
            }
        }


        /// <summary>
        /// 执行查询
        /// </summary>
        /// <param name="cmdText">sql语句</param>
        /// <param name="values">参数值</param>
        /// <returns>所影响的条数</returns>
        public static int ExecuteNonQuery(string cmdText)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = cmdText;
            return ExecuteNonQuery(cmd, new object[] { }, null);
        }

        /// <summary>
        /// 执行查询
        /// </summary>
        /// <param name="cmdText">sql语句</param>
        /// <param name="values">参数值</param>
        /// <returns>所影响的条数</returns>
        public static int ExecuteNonQuery(string cmdText, object[] values)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = cmdText;
            return ExecuteNonQuery(cmd, values, null);
        }

        /// <summary>
        /// 执行查询
        /// </summary>
        /// <param name="cmdText">sql语句</param>
        /// <param name="values">参数值</param>
        /// <returns>所影响的条数</returns>
        public static int ExecuteNonQuery(string cmdText, List<ParameterInfo> list)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = cmdText;
            return ExecuteNonQuery(cmd, list);
        }

        /// <summary>
        /// 执行查询
        /// </summary>
        /// <param name="cmdText">sql语句</param>
        /// <param name="values">参数值</param>
        /// <param name="dbTypes">参数类型</param>
        /// <returns>所影响的条数</returns>
        public static int ExecuteNonQuery(string cmdText, object[] values, DbType[] dbTypes)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = cmdText;
            return ExecuteNonQuery(cmd, values, dbTypes);
        }

        /// <summary>
        /// 执行查询
        /// </summary>
        /// <param name="cmd">sql执行对象</param>
        /// <param name="values">参数值</param>
        /// <param name="dbTypes">参数类型</param>
        /// <returns>所影响的条数</returns>
        public static int ExecuteNonQuery(SqlCommand cmd, object[] values, DbType[] dbTypes)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionStringLocal))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.Text;
                AddParamers(cmd.CommandText, values, dbTypes, cmd);
                int rowsAffected = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                return rowsAffected;
            }
        }

        /// <summary>
        /// 执行查询
        /// </summary>
        /// <param name="cmd">sql执行对象</param>
        /// <param name="values">参数值</param>
        /// <param name="dbTypes">参数类型</param>
        /// <returns>所影响的条数</returns>
        public static int ExecuteNonQuery(SqlCommand cmd, List<ParameterInfo> list)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionStringLocal))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.Text;
                AddParamers(list, cmd);
                int rowsAffected = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                return rowsAffected;
            }
        }

        #endregion

        #region ExecuteDataTable

        /// <summary>
        /// 执行查询
        /// </summary>
        /// <param name="cmdText">sql语句</param>
        /// <param name="values">参数值</param>
        /// <returns>DataTable</returns>
        public DataTable ExecuteDataTable(string cmdText, object[] values)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = cmdText;

            return ExecuteDataTable(cmd, values, null);
        }

        /// <summary>
        /// 执行查询
        /// </summary>
        /// <param name="cmdText">sql语句</param>
        /// <param name="values">参数值</param>
        /// <param name="dbTypes">参数类型</param>
        /// <returns>DataTable</returns>
        public DataTable ExecuteDataTable(string cmdText, object[] values, DbType[] dbTypes)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = cmdText;
            return ExecuteDataTable(cmd, values, dbTypes);
        }

        /// <summary>
        /// 执行查询
        /// </summary>
        /// <param name="cmd">sql执行对象</param>
        /// <param name="values">参数值</param>
        /// <param name="dbTypes">参数类型</param>
        /// <returns>DataTable</returns>
        public DataTable ExecuteDataTable(SqlCommand cmd, object[] values, DbType[] dbTypes)
        {
            try
            {

                DbDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                AddParamers(cmd.CommandText, values, dbTypes, cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                da.Dispose();
                return dt;
            }
            catch
            {
                throw;
            }
            finally
            {
                if (cmd.Transaction == null)
                    cmd.Connection.Close();
            }
        }

        #endregion

        #region ExecuteDataSet



        /// <summary>
        /// 执行查询
        /// </summary>
        /// <param name="cmdText">sql语句</param>
        /// <param name="values">参数值</param>
        /// <returns>DataSet</returns>
        public static DataSet ExecuteDataSet(string cmdText)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = cmdText;
            return ExecuteDataSet(cmd, null, null);
        }

        
        #region 分页
        /// <summary>
        /// 分页获取数据
        /// </summary>
        /// <param name="sColumns">所要检索的数据列</param>
        /// <param name="sTables">表名</param>
        /// <param name="sFilters">过滤条件</param>
        /// <param name="sOrders">排序字段</param>
        /// <param name="sGroups">分组</param>
        /// <param name="iStartRowIndex">开始索引</param>
        /// <param name="iPageSize">每页条数</param>
        /// <param name="sGroupSumColumns">按分组获取合计值对应合计列，需要注意的是显示“合计”列需要为Nvarchar列，不是就需要转换</param>
        /// <param name="oValues">参数值</param>
        /// <returns></returns>
        public static DataSet ExecuteDataSetByPager(string sColumns, string sTables, string sFilters, string sOrders, string sGroups, int iStartRowIndex, int iPageSize, string sGroupSumColumns = "", object[] oValues = null)
        {
            if (!string.IsNullOrEmpty(sGroups))
                sGroups = " GROUP BY " + sGroups;

            string sql =
                string.Format(
                    @" SELECT * FROM 
                            (SELECT {0} ,ROW_NUMBER() OVER(ORDER BY {1}) AS NUM FROM {2} WHERE 1 = 1 {3} {4}) 
                        AS data WHERE NUM > {5} AND NUM <= {6} ORDER BY NUM ;",
                    sColumns, sOrders, sTables, sFilters, sGroups, iStartRowIndex, iStartRowIndex + iPageSize);

            string totalSql = string.Format(" SELECT COUNT(1) AS SumCount FROM {0} WHERE 1 = 1 {1} {2};", sTables, sFilters, sGroups);

            if (!string.IsNullOrEmpty(sGroupSumColumns))
            {
                totalSql = string.Format(" SELECT {0},SUM(1) AS SumCount FROM {1} WHERE 1 = 1 {2} {3};", sGroupSumColumns, sTables, sFilters, sGroups);
            }

            SqlCommand cmd = new SqlCommand();
            AddParamers(sql, oValues, cmd);
            cmd.CommandText = sql + totalSql;
            DataSet ds = ExecuteDataSet(cmd);

            return ds;
        }

        #endregion

        /// <summary>
        /// 执行查询
        /// </summary>
        /// <param name="cmdText">sql语句</param>
        /// <param name="values">参数值</param>
        /// <returns>DataSet</returns>
        public static DataSet ExecuteDataSet(string cmdText, object[] values)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = cmdText;
            return ExecuteDataSet(cmd, values, null);
        }



        /// <summary>
        /// 执行查询
        /// </summary>
        /// <param name="cmdText">sql语句</param>
        /// <param name="values">参数值</param>
        /// <param name="dbTypes">参数类型</param>
        /// <returns>DataSet</returns>
        public static DataSet ExecuteDataSet(string cmdText, object[] values, DbType[] dbTypes)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = cmdText;
            return ExecuteDataSet(cmd, values, dbTypes);
        }

        /// <summary>
        /// 执行查询
        /// </summary>
        /// <param name="cmd">sql执行对象</param>
        /// <param name="values">参数值</param>
        /// <param name="dbTypes">参数类型</param>
        /// <returns>DataSet</returns>
        public static DataSet ExecuteDataSet(SqlCommand cmd)
        {
            using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocal))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                cmd.Connection = conn;

                SqlDataAdapter sqlDA = new SqlDataAdapter();
                sqlDA.SelectCommand = cmd;
                DataSet dataSet = new DataSet();
                sqlDA.Fill(dataSet, "Anonymous");

                return dataSet;
            }
        }

        /// <summary>
        /// 执行查询
        /// </summary>
        /// <param name="cmd">sql执行对象</param>
        /// <param name="values">参数值</param>
        /// <param name="dbTypes">参数类型</param>
        /// <returns>DataSet</returns>
        public static DataSet ExecuteDataSet(SqlCommand cmd, object[] values, DbType[] dbTypes)
        {
            using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocal))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                cmd.Connection = conn;

                SqlDataAdapter sqlDA = new SqlDataAdapter();
                sqlDA.SelectCommand = cmd;
                AddParamers(cmd.CommandText, values, dbTypes, cmd);
                DataSet dataSet = new DataSet();
                sqlDA.Fill(dataSet, "Anonymous");

                return dataSet;
            }
        }

        /// <summary>
        /// 执行查询
        /// </summary>
        /// <param name="cmdText">sql语句</param>
        /// <param name="paramters">参数值</param>
        /// <returns>DataSet</returns>
        public static DataSet ExecuteDataSet(string cmdText, List<ParameterInfo> paramters)
        {
            using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocal))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = cmdText;
                cmd.Connection = conn;

                SqlDataAdapter sqlDA = new SqlDataAdapter();
                sqlDA.SelectCommand = cmd;
                AddParamers(paramters, cmd);
                DataSet dataSet = new DataSet();
                sqlDA.Fill(dataSet, "Anonymous");

                return dataSet;
            }
        }
        /// <summary>
        /// 执行查询
        /// </summary>
        /// <param name="cmdText">sql语句</param>
        /// <param name="paramters">参数值</param>
        /// <returns>DataSet</returns>
        public static DataSet GetDataSet(string cmdText)
        {
            using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocal))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = cmdText;
                cmd.Connection = conn;
               
                SqlDataAdapter sqlDA = new SqlDataAdapter();
                sqlDA.SelectCommand = cmd;
                
                DataSet dataSet = new DataSet();
                sqlDA.Fill(dataSet, "Anonymous");

                return dataSet;
            }
        }
        #endregion

        #region 格式化参数

        /// <summary>
        /// 将参数添加到DbCommand对象中
        /// </summary>
        /// <param name="parameters"></param>
        /// <param name="cmd"></param>
        private static void AddParamers(List<ParameterInfo> parameters, SqlCommand cmd)
        {
            if (parameters == null || parameters.Count == 0)
                return;

            List<String> para = new List<string>();

            for (int i = 0; i < parameters.Count; i++)
            {
                if (para.Contains(parameters[i].Name))
                    continue;
                para.Add(parameters[i].Name);
                SqlParameter parameter = new SqlParameter();
                parameter.Value = parameters[i].Value;
                parameter.DbType = parameters[i].DbType;
                parameter.ParameterName = parameters[i].Name;
                if (parameters[i].Size != 0)
                {
                    parameter.Size = parameters[i].Size;
                }
                cmd.Parameters.Add(parameter);
            }
        }


        /// <summary>
        /// 将参数添加到DbCommand对象中
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="values"></param>
        /// <param name="cmd"></param>
        private static void AddParamers(string sql, object[] values, SqlCommand cmd)
        {
            AddParamers(sql, values, null, cmd);
        }

        /// <summary>
        /// 将参数添加到DbCommand对象中
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="values"></param>
        /// <param name="dbType"></param>
        /// <param name="cmd"></param>
        private static void AddParamers(string sql, object[] values, DbType dbType, DbCommand cmd)
        {
            if (values == null || values.Length == 0)
                return;

            List<String> para = new List<string>();

            MatchCollection matches = Regex.Matches(sql, ParamPattern);

            for (int i = 0; i < matches.Count; i++)
            {
                if (para.Contains(matches[i].Value))
                    continue;
                para.Add(matches[i].Value);

                SqlParameter parameter = new SqlParameter();
                parameter.Value = values[i];
                parameter.DbType = dbType;
                parameter.ParameterName = matches[i].Value;
                cmd.Parameters.Add(parameter);
            }
        }

        /// <summary>
        /// 将参数添加到DbCommand对象中
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="values"></param>
        /// <param name="dbType"></param>
        /// <param name="cmd"></param>
        private static void AddParamers(string sql, object[] values, DbType[] dbType, SqlCommand cmd)
        {
            if (values == null || values.Length == 0)
                return;

            List<String> para = new List<string>();

            MatchCollection matches = Regex.Matches(sql, ParamPattern);

            for (int i = 0; i < matches.Count; i++)
            {
                if (para.Contains(matches[i].Value))
                    continue;
                SqlParameter parameter = new SqlParameter();
                para.Add(matches[i].Value);
                parameter.Value = values[i];
                if (dbType != null)
                    parameter.DbType = dbType[i];
                parameter.ParameterName = matches[i].Value;
                cmd.Parameters.Add(parameter);
            }
        }

        /// <summary>
        /// 将参数添加到DbCommand对象中
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="values"></param>
        /// <param name="dbType"></param>
        /// <param name="cmd"></param>
        public static int LXB_ExcuteSQL(string[] strparas, object[] values, string[] strdbType, SqlCommand cmd)
        {
            int iret = -1;
            //SqlParameter paramProductSaleType = new SqlParameter("@ProductSaleType", SqlDbType.Int, 4);

            //if (oParam.SysNo != AppConst.IntNull)
            //    paramSysNo.Value = oParam.SysNo;
           
            if (strparas.Length!=strdbType.Length||strparas.Length!=values.Length)
            {
                throw new Exception("strparas,values,strdbType个数不相等！！！");
            }
            for (int i = 0; i < strparas.Length; i++)
            {
                 
                SqlParameter parameter = new SqlParameter();
                parameter.ParameterName = "@" + strparas[i];
                parameter.Value = GetValueByName(strdbType[i],values[i]);

                parameter.DbType = GetDbTypeByName(strdbType[i]);
              
                cmd.Parameters.Add(parameter);
            }
            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionStringLocal))
                {

                    if (conn.State != ConnectionState.Open)
                        conn.Open();
                    cmd.Connection = conn;

                     

                    iret = cmd.ExecuteNonQuery();
                }
              
            }
            catch (System.Exception e)
            {
                string strMsg = cmd.CommandText;
                if (cmd != null && cmd.Parameters != null && cmd.Parameters.Count > 0)
                {
                    strMsg += "(";
                    foreach (DbParameter pm in cmd.Parameters)
                    {
                        strMsg += pm.ParameterName + " : " + Convert.ToString(pm.Value) + ",";
                    }
                    strMsg = strMsg.TrimEnd(',') + ")";
                }
                throw new Exception("执行【" + strMsg + "】出错：" + e.Message);

            }
            finally
            {
              //  cmd.Connection.Close();
                cmd.Dispose();

            }
            return iret;
        }
        /// <summary>
        /// 将参数添加到DbCommand对象中
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="values"></param>
        /// <param name="dbType"></param>
        /// <param name="cmd"></param>
        public static void LXB_ExcuteSQL(string[] strparas, object[] values, string[] strdbType, SqlCommand cmd,string keyname,out int sysno)
        {
            //SqlParameter paramProductSaleType = new SqlParameter("@ProductSaleType", SqlDbType.Int, 4);

            //if (oParam.SysNo != AppConst.IntNull)
            //    paramSysNo.Value = oParam.SysNo;
            sysno = -1;
            if (strparas.Length != strdbType.Length || strparas.Length != values.Length)
            {
                throw new Exception("strparas,values,strdbType个数不相等！！！");
            }
            for (int i = 0; i < strparas.Length; i++)
            {

                SqlParameter parameter = new SqlParameter();
                parameter.ParameterName = "@" + strparas[i];
                parameter.Value = GetValueByName(strdbType[i], values[i]);

                parameter.DbType = GetDbTypeByName(strdbType[i]);
                if (strparas[i].Trim().ToUpper() == keyname.Trim().ToUpper())
                {
                    parameter.Direction = ParameterDirection.Output;
                }
                cmd.Parameters.Add(parameter);
            }
            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionStringLocal))
                {

                    if (conn.State != ConnectionState.Open)
                        conn.Open();
                    cmd.Connection = conn;
                 

                    cmd.ExecuteNonQuery();
                    //必须符合下面的条件
                    if (cmd.Parameters.Contains("@" + keyname) && cmd.Parameters["@" + keyname].Direction == ParameterDirection.Output)
                        sysno = (int)cmd.Parameters["@" + keyname].Value;
                    else
                    {
                        throw new Exception("SqlHelper: Does not contain " + keyname + " or ParameterDirection is Not Output");
                    }
                }
            }
            catch (System.Exception e)
            {
                string strMsg = cmd.CommandText;
                if (cmd != null && cmd.Parameters != null && cmd.Parameters.Count > 0)
                {
                    strMsg += "(";
                    foreach (DbParameter pm in cmd.Parameters)
                    {
                        strMsg += pm.ParameterName + " : " + Convert.ToString(pm.Value) + ",";
                    }
                    strMsg = strMsg.TrimEnd(',') + ")";
                }
                throw new Exception( "执行【" + strMsg + "】出错：" + e.Message);

            }
            finally
            {
              //  cmd.Connection.Close();
                cmd.Dispose();

            }
        }
        public static System.Data.DbType GetDbTypeByName(string strTypename)
        {

            switch (strTypename.ToLower())
            {
                case "int":

                    return DbType.Int32;
                case "number":

                    return DbType.Decimal;
                case "decimal":

                    return DbType.Decimal;
                case "string":

                    return DbType.String;
                case "datetime":

                    return DbType.DateTime;
                case "xml":

                    return DbType.Xml;
                case "bit":

                    return DbType.Boolean;
                default:

                    return DbType.String;

            }
        }

        public static object GetValueByName(string strTypename, object objval)
        {
            object objRet = DBNull.Value;
            switch (strTypename.ToLower())
            {
                case "int":
                    objRet=TrimIntNull(objval)!=AppConst.IntNull?objval:DBNull.Value;
                    break;        
                case "number":
                    objRet = TrimIntNull(objval) != AppConst.IntNull ? objval : DBNull.Value;
                    break;  
                case "decimal":
                    objRet = TrimDecimalNull(objval) != AppConst.DecimalNull ? objval : DBNull.Value;
                    break;  
                case "string":

                    objRet = TrimNull(objval) != AppConst.StringNull ? objval : DBNull.Value;
                    break;  
                case "datetime":

                    objRet = TrimDateNull(objval) != AppConst.DateTimeNull ? objval : DBNull.Value;
                    break;  
                case "xml":

                    objRet = TrimNull(objval) != AppConst.StringNull ? objval : DBNull.Value;
                    break;  
                default:
                                        objRet = objval;
                                        break;


            }
            return objRet;
        }
        #endregion

        public static bool TrimBoolNull(object obj)
        {
            if (obj is System.DBNull)
            {
                return false;
            }
            else
            {
                return Convert.ToBoolean(obj);
            }
        }

        public static string TrimNull(Object obj)
        {
            if (obj is System.DBNull || obj == null)
            {
                return AppConst.StringNull;
            }
            else
            {
                return obj.ToString().Trim();
            }
        }

        public static int TrimIntNull(Object obj)
        {
            if (obj is System.DBNull)
            {
                return AppConst.IntNull;
            }
            else
            {
                return Int32.Parse(obj.ToString());
            }
        }

        public static decimal TrimDecimalNull(Object obj)
        {
            if (obj is System.DBNull)
            {
                return AppConst.DecimalNull;
            }
            else
            {
                return decimal.Parse(obj.ToString());
            }
        }

        public static DateTime TrimDateNull(Object obj)
        {
            if (obj is System.DBNull)
            {
                return AppConst.DateTimeNull;
            }
            else
            {
                return DateTime.Parse(obj.ToString());
            }
        }

    }
}