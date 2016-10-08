using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace DBAccess
{
    public class ParameterInfo
    {
        #region 构造
        /// <summary>
        /// 构造
        /// </summary>
        public ParameterInfo()
        {
        }

        /// <summary>
        /// 构造
        /// </summary>
        /// <param name="name">参数名称</param>
        public ParameterInfo(string name)
        {
            this._name = name;
        }

        /// <summary>
        /// 构造
        /// </summary>
        /// <param name="name">参数名称</param>
        /// <param name="dbType">参数类型</param>
        public ParameterInfo(string name, DbType dbType)
            : this(name)
        {
            this._type = dbType;
        }

        /// <summary>
        /// 构造
        /// </summary>
        /// <param name="name">参数名称</param>
        /// <param name="dbType">参数类型</param>
        /// <param name="value">参数值</param>
        public ParameterInfo(string name, DbType dbType, object value)
            : this(name, dbType)
        {
            this.Value = value;
        }

        public ParameterInfo(string name, DbType dbType, object value, string sourceName)
            : this(name, dbType, value)
        {
            this.SourceName = sourceName;
        }
        /// <summary>
        /// 构造
        /// </summary>
        /// <param name="name">参数名称</param>
        /// <param name="dbType">参数类型</param>
        /// <param name="value">参数值</param>
        /// <param name="direction"></param>
        public ParameterInfo(string name, DbType dbType, object value, ParameterDirection direction)
            : this(name, dbType, value)
        {
            this.Direction = direction;
        }

        #endregion

        #region 属性
        private string _name;
        /// <summary>
        /// 获取或设置参数名称
        /// </summary>
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        private DbType _type;
        /// <summary>
        /// 获取或设置参数的数据类型
        /// </summary>
        public DbType DbType
        {
            get { return _type; }
            set { _type = value; }
        }


        private ParameterDirection _direction = ParameterDirection.Input;
        /// <summary>
        /// 获取或设置参数的类型(输入,输出)
        /// </summary>
        public ParameterDirection Direction
        {
            get { return _direction; }
            set { _direction = value; }
        }

        private object _value;
        /// <summary>
        /// 获取或设置值
        /// </summary>
        public object Value
        {
            get { return _value; }
            set { _value = value; }
        }
        private string _sourceName;
        /// <summary>
        /// 获取或设置数据源名称
        /// </summary>
        public string SourceName
        {
            get { return _sourceName; }
            set { _sourceName = value; }
        }

        private int _size = 0;
        /// <summary>
        /// 获取或设置数据列长度
        /// </summary>
        public int Size
        {
            get { return _size; }
            set { _size = value; }
        }
        #endregion

    }
}
