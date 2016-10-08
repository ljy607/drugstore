using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Net.Security;
using System.Net.Sockets;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Text.RegularExpressions;
using System.Collections;
using System.Web;
using System.Web.UI.WebControls;
using System.Runtime.InteropServices;
using System.Web.UI;
using System.Net;


namespace Utils
{
    /// <summary>
    /// Summary description for Util.
    /// </summary>
    public class Util
    {
        public Util()
        {
        }

        private static string[] ChineseNum = { "零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖" };

        public static bool IsDate(string date)
        {
            try
            {
                DateTime.Parse(date);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool IsZipCode(string zip)
        {
            //if(IsNaturalNumber(zip)&&zip.Length==6)
            //    return true;
            //else
            //    return false;
            Regex reg = new Regex(@"^\d{6}$");
            return reg.IsMatch(zip);
        }

        public static bool IsMoney(string money)
        {
            try
            {
                Decimal.Parse(money);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool HasMoreRow(DataSet ds)
        {
            if (ds == null || ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public static bool HasMoreRow(DataTable dt)
        {
            if (dt == null || dt.Rows.Count == 0)
                return false;
            else
                return true;
        }

        public static bool HasMoreRow(IDataReader dt)
        {
            if (dt == null)
                return false;
            else
                return true;
        }

        //整理字符串到安全格式
        public static string SafeFormat(string strInput)
        {
            return strInput.Trim().Replace("'", "''");
        }

        public static string ToSqlString(string paramStr)
        {
            return "'" + SafeFormat(paramStr) + "'";
        }

        public static string ToSqlLikeString(string paramStr)
        {
            return "'%" + SafeFormat(paramStr) + "%'";
        }

        public static string ToSqlLikeStringR(string paramStr)
        {
            return "'" + SafeFormat(paramStr) + "%'";
        }

        /// <summary>
        /// 左右模糊查询 使用SqlParameter时调用此方法
        /// </summary>
        /// <param name="paramStr"></param>
        /// <returns></returns>
        public static string ToSqlLikeStringForParamers(string paramStr)
        {
            return "%" + SafeFormat(paramStr) + "%";
        }

        /// <summary>
        /// 右模糊查询 使用SqlParameter时调用此方法
        /// </summary>
        /// <param name="paramStr"></param>
        /// <returns></returns>
        public static string ToSqlLikeStringRForParamers(string paramStr)
        {
            return SafeFormat(paramStr) + "%";
        }

        /// <summary>
        /// 就是一组数字或文字拼接到SQL文中的IN Clause中去。比如传入一个数组，得到拼接好的(a,b,c,d)之类的
        /// </summary>
        /// <param name="list"></param>
        /// <returns></returns>
        public static string ToSqlInString(ICollection list)
        {
            StringBuilder res = new StringBuilder();

            int i = 0;
            foreach (object o in list)
            {
                if (i != 0)
                    res.Append(',');

                res.Append(o.ToString());
                i++;
            }
            return "(" + res.ToString() + ")";
        }

        /// <summary>
        /// 就是一组字符拼接到SQL文中的IN Clause中去。比如传入一个数组，得到拼接好的('a','b','c','d')之类的
        /// </summary>
        /// <param name="list"></param>
        /// <returns></returns>
        public static string ToSqlInString4Str(ICollection list)
        {
            StringBuilder res = new StringBuilder();

            int i = 0;
            foreach (object o in list)
            {
                if (i != 0)
                    res.Append(',');

                res.AppendFormat("'{0}'", o.ToString());
                i++;
            }
            return "(" + res.ToString() + ")";
        }

        /// <summary>
        /// 传入的参数必须是'yyyy-MM-dd' 格式. 不另外检查
        /// </summary>
        /// <param name="paramDate"></param>
        /// <returns></returns>
        public static string ToSqlEndDate(string paramDate)
        {
            return ToSqlString(paramDate + " 23:59:59");
        }

        /// <summary>
        /// 传入的参数必须是'yyyy-MM-dd' 格式. 不另外检查
        /// </summary>
        /// <param name="paramDate"></param>
        /// <returns></returns>
        public static string ToSqlStartDate(string paramDate)
        {
            return ToSqlString(paramDate + " 00:00:00");
        }

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

        public static string GetMD5(String str)
        {
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(str, "md5").ToLower();
        }

       
        /// <summary>
        /// 随机数MD5验证
        /// </summary>
        /// <param name="pwd">明文</param>
        /// <param name="encrypted">密文</param>
        /// <returns></returns>
        public static bool zen_validate_password(string pwd, string encrypted)
        {
            if (!string.IsNullOrEmpty(pwd) && !string.IsNullOrEmpty(encrypted))
            {
                string[] stack = encrypted.Split(':');
                if (stack.Length != 2) return false;
                if (GetMD5(stack[1] + pwd) == stack[0])
                {
                    return true;
                }
            }
            return false;
        }


        public static string MakeMD5(string str)
        {
            byte[] b = System.Text.Encoding.Default.GetBytes(str);
            b = new System.Security.Cryptography.MD5CryptoServiceProvider().ComputeHash(b);
            string ret = "";
            for (int i = 0; i < b.Length; i++)
            {
                ret += b[i].ToString("x").PadLeft(2, '0');
            }
            return ret;
        }

        // Function to test for Positive Integers.  
        public static bool IsNaturalNumber(String strNumber)
        {
            Regex objNotNaturalPattern = new Regex("[^0-9]");
            Regex objNaturalPattern = new Regex("0*[1-9][0-9]*");
            return !objNotNaturalPattern.IsMatch(strNumber) &&
                   objNaturalPattern.IsMatch(strNumber);
        }

        // Function to test for Positive Integers with zero inclusive  

        public static bool IsWholeNumber(String strNumber)
        {
            Regex objNotWholePattern = new Regex("[^0-9]");
            return !objNotWholePattern.IsMatch(strNumber);
        }

        // Function to Test for Integers both Positive & Negative  

        public static bool IsInteger(String strNumber)
        {
            Regex objNotIntPattern = new Regex("[^0-9-]");
            Regex objIntPattern = new Regex("^-[0-9]+$|^[0-9]+$");
            return !objNotIntPattern.IsMatch(strNumber) && objIntPattern.IsMatch(strNumber);
        }

        // Function to Test for Positive Number both Integer & Real 

        public static bool IsPositiveNumber(String strNumber)
        {
            Regex objNotPositivePattern = new Regex("[^0-9.]");
            Regex objPositivePattern = new Regex("^[.][0-9]+$|[0-9]*[.]*[0-9]+$");
            Regex objTwoDotPattern = new Regex("[0-9]*[.][0-9]*[.][0-9]*");
            return !objNotPositivePattern.IsMatch(strNumber) &&
                   objPositivePattern.IsMatch(strNumber) &&
                   !objTwoDotPattern.IsMatch(strNumber);
        }

        // Function to test whether the string is valid number or not
        public static bool IsNumber(String strNumber)
        {
            Regex objNotNumberPattern = new Regex("[^0-9.-]");
            Regex objTwoDotPattern = new Regex("[0-9]*[.][0-9]*[.][0-9]*");
            Regex objTwoMinusPattern = new Regex("[0-9]*[-][0-9]*[-][0-9]*");
            String strValidRealPattern = "^([-]|[.]|[-.]|[0-9])[0-9]*[.]*[0-9]+$";
            String strValidIntegerPattern = "^([-]|[0-9])[0-9]*$";
            Regex objNumberPattern = new Regex("(" + strValidRealPattern + ")|(" + strValidIntegerPattern + ")");
            return !objNotNumberPattern.IsMatch(strNumber) &&
                   !objTwoDotPattern.IsMatch(strNumber) &&
                   !objTwoMinusPattern.IsMatch(strNumber) &&
                   objNumberPattern.IsMatch(strNumber);
        }

        // Function To test for Alphabets. 
        public static bool IsAlpha(String strToCheck)
        {
            Regex objAlphaPattern = new Regex("[^a-zA-Z]");
            return !objAlphaPattern.IsMatch(strToCheck);
        }

        // Function to Check for AlphaNumeric.
        public static bool IsAlphaNumeric(String strToCheck)
        {
            Regex objAlphaNumericPattern = new Regex("[^a-zA-Z0-9]");
            return !objAlphaNumericPattern.IsMatch(strToCheck);
        }

        public static bool IsEmailAddress(string strEmailAddress)
        {
            Regex objNotEmailAddress = new Regex(@"\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
            return objNotEmailAddress.IsMatch(strEmailAddress);
        }

        // Function Format Money 
        public static decimal ToMoney(string moneyStr)
        {
            return decimal.Round(decimal.Parse(moneyStr), 2);
        }

        public static decimal ToMoney(decimal moneyValue)
        {
            return decimal.Round(moneyValue, 2);
        }

        /// <summary>
        /// 舍去金额的分,直接舍去,非四舍五入
        /// </summary>
        /// <param name="moneyValue"></param>
        /// <returns></returns>
        public static decimal TruncMoney(decimal moneyValue)
        {
            //int tempAmt = Convert.ToInt32(moneyValue*100)%10;
            //moneyValue = (decimal)((moneyValue*100 - tempAmt)/100m);
            //return moneyValue;
            return Math.Floor(moneyValue * 10) / 10;
        }

        /// <summary>
        /// 舍去小数位
        /// </summary>
        /// <param name="dec"></param>
        /// <returns></returns>
        public static int TruncDdecimal(decimal dec)
        {
            return Convert.ToInt32(Math.Floor(dec));
        }

        /// <summary>
        /// 取整进位
        /// </summary>
        /// <param name="dec"></param>
        /// <returns></returns>
        public static int TruncDdecimalCell(decimal dec)
        {
            return Convert.ToInt32(Math.Ceiling(dec));
        }

        /// <summary>
        /// 是否电话号码，区号-电话号码
        /// </summary>
        /// <param name="Phone"></param>
        /// <returns></returns>
        public static bool IsPhoneNumber(string Phone)
        {
            Regex objNotPhoneNumber = new Regex(@"^(0\d{2,3}-\d{7,8})");
            return objNotPhoneNumber.IsMatch(Phone);
        }

        public static bool IsPhoneNumber2(string Phone)
        {
            Regex objNotPhoneNumber2 = new Regex(@"^(\d{7,8})");
            return objNotPhoneNumber2.IsMatch(Phone);
        }


        /// <summary>
        /// 是否是小灵通，区号电话号码
        /// </summary>
        /// <param name="Phone"></param>
        /// <returns></returns>
        public static bool IsPasPhoneNumber(string Phone)
        {
            Regex objNotPhoneNumber = new Regex(@"^(0\d{3}\d{7,8})");
            return objNotPhoneNumber.IsMatch(Phone);
        }

        /// <summary>
        /// 判断是否手机号码
        /// </summary>
        /// <param name="cell"></param>
        /// <returns></returns>
        public static bool IsCellNumber(string cell)
        {
            if (cell.Length != 11)
            {
                return false;
            }
            long number;
            try
            {
                number = Convert.ToInt64(cell);
                if (number < 13000000000)
                    return false;
                else if (number >= 19000000000)
                    return false;
            }
            catch
            {
                return false;
            }
            return true;
        }

        public static bool ValidateServerCertificate(Object sender, X509Certificate certificate, X509Chain chain,
                                                     SslPolicyErrors sslPolicyErrors)
        {
            return true;
        }

        private static bool mailSent = false;

       
        #region ChineseMoney

        private static string getSmallMoney(string moneyValue)
        {
            int intMoney = Convert.ToInt32(moneyValue);
            if (intMoney == 0)
            {
                return "";
            }
            string strMoney = intMoney.ToString();
            int temp;
            StringBuilder strBuf = new StringBuilder(10);
            if (strMoney.Length == 4)
            {
                temp = Convert.ToInt32(strMoney.Substring(0, 1));
                strMoney = strMoney.Substring(1, strMoney.Length - 1);
                strBuf.Append(ChineseNum[temp]);
                if (temp != 0)
                    strBuf.Append("仟");
            }
            if (strMoney.Length == 3)
            {
                temp = Convert.ToInt32(strMoney.Substring(0, 1));
                strMoney = strMoney.Substring(1, strMoney.Length - 1);
                strBuf.Append(ChineseNum[temp]);
                if (temp != 0)
                    strBuf.Append("佰");
            }
            if (strMoney.Length == 2)
            {
                temp = Convert.ToInt32(strMoney.Substring(0, 1));
                strMoney = strMoney.Substring(1, strMoney.Length - 1);
                strBuf.Append(ChineseNum[temp]);
                if (temp != 0)
                    strBuf.Append("拾");
            }
            if (strMoney.Length == 1)
            {
                temp = Convert.ToInt32(strMoney);
                strBuf.Append(ChineseNum[temp]);
            }
            return strBuf.ToString();
        }

        public static string GetChineseMoney(decimal moneyValue)
        {
            if (moneyValue < 0)
            {
                moneyValue *= -1;
            }
            int intMoney = Convert.ToInt32(Util.TruncMoney(moneyValue) * 100);
            string strMoney = intMoney.ToString();
            int moneyLength = strMoney.Length;
            StringBuilder strBuf = new StringBuilder(100);
            if (moneyLength > 14)
            {
                throw new Exception("金额过大，无法转换大写");
            }

            //处理亿部分
            if (moneyLength > 10 && moneyLength <= 14)
            {
                strBuf.Append(getSmallMoney(strMoney.Substring(0, strMoney.Length - 10)));
                strMoney = strMoney.Substring(strMoney.Length - 10, 10);
                strBuf.Append("亿");
            }

            //处理万部分
            if (moneyLength > 6)
            {
                strBuf.Append(getSmallMoney(strMoney.Substring(0, strMoney.Length - 6)));
                strMoney = strMoney.Substring(strMoney.Length - 6, 6);
                strBuf.Append("万");
            }

            //处理元部分
            if (moneyLength > 2)
            {
                strBuf.Append(getSmallMoney(strMoney.Substring(0, strMoney.Length - 2)));
                strMoney = strMoney.Substring(strMoney.Length - 2, 2);
                strBuf.Append("元");
            }

            //处理角、分处理分
            if (Convert.ToInt32(strMoney) == 0)
            {
                strBuf.Append("整");
            }
            else
            {
                int intJiao = Convert.ToInt32(strMoney.Substring(0, 1));
                strBuf.Append(ChineseNum[intJiao]);
                if (intJiao != 0)
                {
                    strBuf.Append("角");
                }
                int intFen = Convert.ToInt32(strMoney.Substring(1, 1));
                if (intFen != 0)
                {
                    strBuf.Append(ChineseNum[intFen]);
                    strBuf.Append("分");
                }
            }
            string temp = strBuf.ToString();
            while (temp.IndexOf("零零") != -1)
            {
                strBuf.Replace("零零", "零");
                temp = strBuf.ToString();
            }

            strBuf.Replace("零亿", "亿");
            strBuf.Replace("零万", "万");
            strBuf.Replace("亿万", "亿");
            return strBuf.ToString();
        }

        /// <summary>
        /// 圆通保价金额转换
        /// </summary>
        /// <param name="moneyValue"></param>
        /// <returns></returns>
        public static MoneyClass GetChineseMoney(int moneyValue)
        {
            MoneyClass moneyClass = new MoneyClass();
            string strMoney = moneyValue.ToString();
            int moneyLength = strMoney.Length;
            StringBuilder strBuf = new StringBuilder(100);
            int temp = 0;
            if (moneyLength > 8) //亿
            {
                throw new Exception("金额过大，无法转换大写");
            }
            //处理万部分
            if (moneyLength > 4)
            {
                moneyClass.Tthousand = getSmallMoney(strMoney.Substring(0, strMoney.Length - 4));
            }

            //处理千部分
            if (moneyLength > 3)
            {
                temp = int.Parse(strMoney.Substring(strMoney.Length - 4, 1));
                moneyClass.Thousand = ChineseNum[temp];

            }

            //处理百部分
            if (moneyLength > 2)
            {
                temp = int.Parse(strMoney.Substring(strMoney.Length - 3, 1));
                moneyClass.Hundred = ChineseNum[temp];
            }

            //处理拾部分
            if (moneyLength > 1)
            {
                temp = int.Parse(strMoney.Substring(strMoney.Length - 2, 1));
                moneyClass.Ten = ChineseNum[temp];
            }

            //处理元部分
            if (moneyLength > 0)
            {
                temp = int.Parse(strMoney.Substring(strMoney.Length - 1, 1));
                moneyClass.Yuan = ChineseNum[temp];
            }
            return moneyClass;
        }

        /// <summary>
        /// 金额类
        /// </summary>
        public class MoneyClass
        {
            /// <summary>
            /// 万
            /// </summary>
            public string Tthousand;

            /// <summary>
            /// 千
            /// </summary>
            public string Thousand;

            /// <summary>
            /// 百
            /// </summary>
            public string Hundred;

            /// <summary>
            /// 拾
            /// </summary>
            public string Ten;

            /// <summary>
            /// 元
            /// </summary>
            public string Yuan;

        }

        #endregion

        public static string RemoveHtmlTag(string str)
        {
            Regex reg = new Regex(@"<\/*[^<>]*>");
            return reg.Replace(str, "");
        }

        /// <summary>
        /// 计算两个日期的时间间隔,返回天数
        /// </summary>
        /// <param name="DateTime1">第一个日期和时间</param>
        /// <param name="DateTime2">第二个日期和时间</param>
        /// <returns></returns>
        public static int DateDiff(DateTime DateTime1, DateTime DateTime2)
        {
            DateTime1 = Convert.ToDateTime(DateTime1.ToString("yyyy-MM-dd"));
            DateTime2 = Convert.ToDateTime(DateTime2.ToString("yyyy-MM-dd"));

            TimeSpan ts1 = new TimeSpan(DateTime1.Ticks);
            TimeSpan ts2 = new TimeSpan(DateTime2.Ticks);
            TimeSpan ts = ts1.Subtract(ts2).Duration();

            return ts.Days;
        }

        /// <summary>
        /// 生成缩略图
        /// </summary>
        /// <param name="originalImagePath">源图路径（物理路径）</param>
        /// <param name="thumbnailPath">缩略图路径（物理路径）</param>
        /// <param name="width">缩略图宽度</param>
        /// <param name="height">缩略图高度</param>
        /// <param name="mode">生成缩略图的方式</param> 
        public static void MakeThumbnail(string originalImagePath, string thumbnailPath, int width, int height,
                                         string mode)
        {
            System.Drawing.Image originalImage = System.Drawing.Image.FromFile(originalImagePath);

            int towidth = width;
            int toheight = height;

            int x = 0;
            int y = 0;
            int ow = originalImage.Width;
            int oh = originalImage.Height;

            switch (mode)
            {
                case "HW": //指定高宽缩放（可能变形） 
                    break;
                case "W": //指定宽，高按比例 
                    toheight = originalImage.Height * width / originalImage.Width;
                    break;
                case "H": //指定高，宽按比例
                    towidth = originalImage.Width * height / originalImage.Height;
                    break;
                case "Cut": //指定高宽裁减（不变形） 
                    if ((double)originalImage.Width / (double)originalImage.Height > (double)towidth / (double)toheight)
                    {
                        oh = originalImage.Height;
                        ow = originalImage.Height * towidth / toheight;
                        y = 0;
                        x = (originalImage.Width - ow) / 2;
                    }
                    else
                    {
                        ow = originalImage.Width;
                        oh = originalImage.Width * height / towidth;
                        x = 0;
                        y = (originalImage.Height - oh) / 2;
                    }
                    break;
                default:
                    break;
            }

            //新建一个bmp图片
            System.Drawing.Image bitmap = new System.Drawing.Bitmap(towidth, toheight);

            //新建一个画板
            System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(bitmap);

            //设置高质量插值法
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;

            //设置高质量,低速度呈现平滑程度
            g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;

            //清空画布并以透明背景色填充
            g.Clear(System.Drawing.Color.Transparent);

            //在指定位置并且按指定大小绘制原图片的指定部分
            g.DrawImage(originalImage, new System.Drawing.Rectangle(0, 0, towidth, toheight),
                        new System.Drawing.Rectangle(x, y, ow, oh),
                        System.Drawing.GraphicsUnit.Pixel);

            try
            {
                //以jpg格式保存缩略图
                bitmap.Save(thumbnailPath, System.Drawing.Imaging.ImageFormat.Jpeg);
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                originalImage.Dispose();
                bitmap.Dispose();
                g.Dispose();
            }
        }

        //通过nslookup程序查询MX记录，获取域名对应的mail服务器
        private static string GetMailServer(string strEmail)
        {
            string strDomain = strEmail.Split('@')[1];
            ProcessStartInfo info = new ProcessStartInfo();
            info.UseShellExecute = false;
            info.RedirectStandardInput = true;
            info.RedirectStandardOutput = true;
            info.FileName = "nslookup";
            info.CreateNoWindow = true;
            info.Arguments = "-type=mx " + strDomain;
            Process ns = Process.Start(info);
            StreamReader sout = ns.StandardOutput;
            Regex reg = new Regex("mail exchanger = (?<mailServer>[^\\s]+)");
            string strResponse = "";
            while ((strResponse = sout.ReadLine()) != null)
            {
                Match amatch = reg.Match(strResponse);
                if (reg.Match(strResponse).Success)
                    return amatch.Groups["mailServer"].Value;
            }
            return null;
        }

        //连接邮件服务器，确认服务器的可用性和用户是否存在
        /// <summary>
        /// return 200 = valid email address
        /// </summary>
        /// <param name="mailAddress"></param>
        /// <returns></returns>
        public static int CheckEmail(string mailAddress)
        {
            Regex reg = new Regex("^[a-zA-Z0-9_-]+@([a-zA-Z0-9-]+\\.){1,}(com|net|edu|miz|biz|cn|cc)$");

            if (!reg.IsMatch(mailAddress))
                return 405; //Email地址形式上就不对

            string mailServer = GetMailServer(mailAddress);
            if (mailServer == null)
            {
                return 404; //邮件服务器探测错误
            }
            TcpClient tcpc = new TcpClient();
            tcpc.NoDelay = true;
            tcpc.ReceiveTimeout = 3000;
            tcpc.SendTimeout = 3000;
            try
            {
                tcpc.Connect(mailServer, 25);
                NetworkStream s = tcpc.GetStream();
                StreamReader sr = new StreamReader(s, Encoding.Default);
                StreamWriter sw = new StreamWriter(s, Encoding.Default);
                string strResponse = "";
                string strTestFrom = "service@baby1one.com.cn";
                sw.WriteLine("helo " + mailServer);
                sw.WriteLine("mail from:<" + mailAddress + ">");
                sw.WriteLine("rcpt to:<" + strTestFrom + ">");
                strResponse = sr.ReadLine();
                if (!strResponse.StartsWith("2")) return 403; //用户名有误
                sw.WriteLine("quit");
                return 200; //Email地址检查无误
            }
            catch
            {
                return 403; //发生错误或邮件服务器不可达
            }
        }

        public static string GetWeekName(int id)
        {
            string name = "";
            switch (id)
            {
                case 1:
                    name = "星期一";
                    break;
                case 2:
                    name = "星期二";
                    break;
                case 3:
                    name = "星期三";
                    break;
                case 4:
                    name = "星期四";
                    break;
                case 5:
                    name = "星期五";
                    break;
                case 6:
                    name = "星期六";
                    break;
                case 7:
                    name = "星期日";
                    break;
            }
            return name;
        }

        public static int GetWeekID(DayOfWeek week)
        {
            int id = 0;
            switch (week)
            {
                case DayOfWeek.Monday:
                    id = 1;
                    break;
                case DayOfWeek.Tuesday:
                    id = 2;
                    break;
                case DayOfWeek.Wednesday:
                    id = 3;
                    break;
                case DayOfWeek.Thursday:
                    id = 4;
                    break;
                case DayOfWeek.Friday:
                    id = 5;
                    break;
                case DayOfWeek.Saturday:
                    id = 6;
                    break;
                case DayOfWeek.Sunday:
                    id = 7;
                    break;
            }
            return id;
        }

        /// <summary>
        /// 计算文件的绝对路径, 在类库中调用，一般是不能使用Server.MapPath的时候
        /// </summary>
        /// <param name="filePath"></param>
        /// <returns></returns>
        public static string GetAbsoluteFilePath(string filePath)
        {
            string file = filePath;
            if (!filePath.Substring(1, 1).Equals(":")
                && !filePath.StartsWith("\\"))
            {
                file = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, filePath);
            }

            return file.Replace("/", "\\");
        }

        /// <summary>
        /// 设置输出显示
        /// </summary>
        /// <param name="lbl">显示信息的lab控件ID</param>
        /// <param name="msg">显示信息</param>
        /// <param name="status">信息类型：小于0为错误信息，大于0为正确信息，-1显示自定义错误信息。-2显示默认错误信息</param>
        public static void Assert(Label lbl, string msg, int status)
        {
            if (status <= 0)
            {
                if (status == -1)
                    lbl.Text = AppConst.ErrorTemplet.Replace("@errorMsg", msg);
                else
                    lbl.Text = AppConst.ErrorTemplet.Replace("@errorMsg", "<br>"); // + AppConst.WebMaster);
            }
            else
            {
                lbl.Text = AppConst.SuccTemplet.Replace("@succMsg", msg);
            }
        }

        public static bool Assert(Label lbl, ArrayList errorList)
        {
            if (errorList.Count == 0)
                return true;
            else
            {
                string errorShow = "";
                for (int i = 1; i <= errorList.Count; i++)
                {
                    if (i != 1)
                        errorShow += "<br>";
                    errorShow += i + "." + errorList[i - 1];
                }
                Assert(lbl, errorShow, -1);
                return false;
            }
        }

        /// <summary>
        /// 返回1，说明发送成功
        /// </summary>
        /// <returns></returns>
        public static int SendSMSMessage(string CellNumber, string SMSContent)
        {
            //通过移通网络短信平台发送
            string command = "MT_REQUEST";
            string spid = "0000";
            string sppassword = "";
            string da = "86" + CellNumber;
            string dc = "15"; //GBK编码
            string sm = "";

            Encoding gb = Encoding.GetEncoding("gbk");
            byte[] bytes = gb.GetBytes(SMSContent);
            for (int i = 0; i < bytes.Length; i++)
            {
                sm += Convert.ToString(bytes[i], 16);
            }

            string url = "http://esms1.etonenet.com/sms/mt?command=" + command + "&spid=" + spid + "&sppassword=" +
                         sppassword + "&da=" + da + "&dc=" + dc + "&sm=" + sm;
            System.Net.WebClient wc = new System.Net.WebClient();
            Stream stream = wc.OpenRead(url);

            StreamReader reader = new StreamReader(stream);
            string result = reader.ReadToEnd();
            stream.Close();
            reader.Close();
            wc.Dispose();
            if (result.IndexOf("mterrcode=000") > 0)
                return 1;
            else
                return 0;
        }

        public static string FilterCompetitorKeyword(string input)
        {
            return
                input.Replace("京东", " xx ").Replace("新蛋", " xx ").Replace("某东", " xx ").Replace("某蛋", " xx ").Replace(
                    "*东", " xx ").Replace("*蛋", " xx ");
        }

        public decimal Round(decimal x, int len)
        {
            return Decimal.Round(x + 0.000001m, len);
        }

        //显示提示页面
        public static string ShowAlertStr(string paramUrl, string paramBackTitle, string paramTitle, string paramContent,
                                          bool paramHaveBtn, string InfoType)
        {
            string _return = "";
            string _strBool = "0";

            if (InfoType == "error")
                paramContent = "<font color=red>" + paramContent + "</font>";

            if (paramHaveBtn) _strBool = "1";
            //_return = "<script language='javascript' type='text/javascript'>parent.document.all.titleFrame.src='SiteMapPath.aspx?url="+paramTitle+"';window.open('../basic/SaveOK.aspx?Url=" + paramUrl.Trim() + "&Content=" + paramContent.Trim() + "&HaveBtn=" + _strBool + "&BackTitle=" + paramBackTitle + "&time=" + DateTime.Now.ToString() + "','_self')</script>";
            _return = "<script language='javascript' type='text/javascript'>window.open('../basic/SaveOK.aspx?Url=" +
                      paramUrl.Trim() + "&Content=" + paramContent.Trim() + "&HaveBtn=" + _strBool + "&BackTitle=" +
                      paramBackTitle + "&time=" + DateTime.Now.ToString() + "','_self')</script>";
            return _return;
        }

        /// <summary>
        /// 判断是否Url地址
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        public static bool IsUrl(string url)
        {
            const string Url = @"^http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?$";
            return Regex.IsMatch(url, Url);
        }

        /// <summary>
        /// 获取IP信息
        /// </summary>
        /// <returns></returns>
        public static string GetIP()
        {
            string result = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (string.IsNullOrEmpty(result))
                result = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];

            if (string.IsNullOrEmpty(result))
                result = HttpContext.Current.Request.UserHostAddress;

            if (string.IsNullOrEmpty(result))
                return "127.0.0.1";

            return result;
        }

        /// <summary>
        /// 判断是否集团ip
        /// </summary>
        /// <returns></returns>
        public static bool IsXiagcIP()
        {
            bool istrue = false;
            try
            {
                string strip = GetIP();
                string[] arrip = System.Configuration.ConfigurationManager.AppSettings["xiagcip"].Split(';');
                foreach (string strip1 in arrip)
                {
                    if (strip.StartsWith(strip1))
                    {
                        istrue = true;
                        break;
                    }
                }
            }
            catch
            {
            }
            return istrue;
        }

        /// <summary>
        /// 显示健身
        /// </summary>
        /// <returns></returns>
        public static string GetClub()
        {
            string str = string.Empty;
            if (IsXiagcIP())
            {
                str =
                    " <a href='http://xiagc.com.cn/club/' target=\"_blank\" style=\"padding-right:50px;\">集团健身预定入口</a>";
            }
            return str;
        }

        public static int DecimalToU_Int32(decimal argument)
        {
            object Int32Value;
            object UInt32Value;

            // Convert the argument to an int value.
            try
            {
                Int32Value = (int)argument;
            }
            catch (Exception ex)
            {
                Int32Value = GetExceptionType(ex);
            }

            // Convert the argument to a uint value.
            try
            {
                UInt32Value = (uint)argument;
            }
            catch (Exception ex)
            {
                UInt32Value = GetExceptionType(ex);
            }

            return Int32.Parse(UInt32Value.ToString());
        }

        private static string GetExceptionType(Exception ex)
        {
            string exceptionType = ex.GetType().ToString();
            return exceptionType.Substring(exceptionType.LastIndexOf('.') + 1);
        }

        public static string TrimString(string s, int len)
        {
            string _s;
            if (s.Length > len)
            {
                _s = s.Substring(0, len - 1) + "...";
            }
            else
            {
                _s = s;
            }

            return _s;
        }

        public static string FormatParagraph(string paragraphs)
        {
            string _paragraph = AppConst.StringNull;
            string[] _paragraphs = paragraphs.Split('\n');
            for (int i = 0; i < _paragraphs.Length; i++)
            {
                _paragraph += "<p>" + _paragraphs[i] + "</p>";
            }

            return _paragraph;
        }

        /// <summary>
        /// decimal >= 0。空返回false
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static bool IsDecimalNoLessThanZero(string str)
        {
            if (str == String.Empty)
                return false;
            try
            {
                decimal tmp = decimal.Parse(str);
                if (tmp >= 0)
                    return true;
                else
                    return false;
            }
            catch
            {
                return false;
            }

        }

        /// <summary>
        /// decimal > 0。空返回false
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static bool IsDecimalGreaterThanZero(string str)
        {
            if (str == String.Empty)
                return false;
            try
            {
                decimal tmp = decimal.Parse(str);
                if (tmp > 0)
                    return true;
                else
                    return false;
            }
            catch
            {
                return false;
            }

        }

        /// <summary>
        ///o和1之间
        /// </summary>
        /// <param name="s"></param>
        /// <returns></returns>
        public static bool IsBetweenZeroAndOne(string s)
        {
            decimal d = 0;

            if (!decimal.TryParse(s, out d))
            {
                return false;
            }

            if (d <= 0)
                return false;

            if (d >= 1)
                return false;

            return true;
        }

        /// <summary>
        /// Int > 0 ，空返回false
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static bool IsIntGreaterThanZero(string str)
        {
            if (str == string.Empty)
                return false;
            try
            {
                int tmp = Convert.ToInt32(str);
                if (tmp > 0)
                    return true;
                else
                    return false;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// Int >= 0。空返回false
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static bool IsIntNoLessThanZero(string str)
        {
            if (str == String.Empty)
                return false;
            try
            {
                int tmp = Convert.ToInt32(str);
                if (tmp >= 0)
                    return true;
                else
                    return false;
            }
            catch
            {
                return false;
            }
        }

        public static string getShowLoginPopFrame()
        {
            string js = "<script type=\"text/javascript\">\n";
            js += "javascript:setPopFrameUrl('PopLogin.aspx?timestamp=" + DateTime.Now.ToString() + "',480,360,'登录');";
            js += "\n";
            js += "</script>";
            return js;
        }

        #region Base64 加解密

        public static string EncodeBase64(string source)
        {
            try
            {
                byte[] bytes_1 = Encoding.UTF8.GetBytes(source);
                return Convert.ToBase64String(bytes_1).Replace("+", " ");
            }
            catch
            {
                return string.Empty;
            }
        }

        public static string DecodeBase64(string result)
        {
            try
            {
                byte[] bytes_2 = Convert.FromBase64String(result.Replace(" ", "+"));
                return Encoding.UTF8.GetString(bytes_2);
            }
            catch
            {
                return string.Empty;
            }
        }

        #endregion

        /// <summary>
        /// 下载
        /// </summary>
        /// <param name="page"></param>
        /// <param name="filePath"></param>
        public static void DownloadExcel(Page page, string filePath)
        {
            filePath = page.Server.MapPath(filePath); //路径
            FileInfo fileInfo = new FileInfo(filePath);

            if (fileInfo.Exists)
            {
                page.Response.Clear();
                page.Response.ClearContent();
                page.Response.ClearHeaders();
                page.Response.AddHeader("Content-Disposition", "attachment;filename=" + fileInfo.Name);
                page.Response.AddHeader("Content-Length", fileInfo.Length.ToString());
                page.Response.AddHeader("Content-Transfer-Encoding", "binary");
                page.Response.ContentType = "application/octet-stream";
                page.Response.ContentEncoding = System.Text.Encoding.GetEncoding("UTF-8");
                page.Response.WriteFile(fileInfo.FullName);
                page.Response.Flush();
                page.Response.End();
            }
            else
            {
                throw new ApplicationException("下载文件失败，没有找到下载文件！请联系管理员！");
            }
        }

        /// <summary>
        /// 消除是否有Sql危险字符
        /// </summary>
        /// <returns>True:存在</returns>
        public static string SafeReplace(string strInput)
        {
            return strInput.Trim().Replace("-", "—").Replace(",", "，").Replace("'", "’");
            ;
        }

            
        /// <summary>
        /// 获得当前绝对路径
        /// </summary>
        /// <param name="strPath">指定的路径</param>
        /// <returns>绝对路径</returns>
        public static string GetMapPath(string strPath)
        {
            if (HttpContext.Current != null)
            {
                return HttpContext.Current.Server.MapPath(strPath);
            }
            else //非web程序引用
            {
                strPath = strPath.Replace("/", "\\");
                if (strPath.StartsWith("\\"))
                {
                    strPath = strPath.Substring(strPath.IndexOf('\\', 1)).TrimStart('\\');
                }
                return System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, strPath);
            }
        }

        public static string GetCustomerName(string name)
        {
            string result = "";
            if (Util.IsNumber(name)) //修改手机号码
            {
                result = name.Substring(0, 3) + "****" + name.Substring(7, name.Length - 7);
            }
            else if (Util.IsEmailAddress(name)) //Email
            {
                result = name.Substring(0, name.IndexOf("@") + 1) + "...";
            }
            return result;
        }

        #region wuzh add

        /// <summary>
        /// 判断跨站提交
        /// </summary>
        /// <returns>True:跨站提交</returns>
        public static bool IsCrossSitePost()
        {
            if (!IsPost())
                return true;

            return IsCrossSitePost(GetUrlReferrer(), GetHost());
        }

        public static string GetHost()
        {
            return HttpContext.Current.Request.Url.Host;
        }

        public static bool IsPost()
        {
            return HttpContext.Current.Request.HttpMethod.Equals("POST");
        }

        public static bool IsCrossSitePost(string urlReferrer, string host)
        {
            if (urlReferrer.Length < 7)
                return true;

            Uri u = new Uri(urlReferrer);
            return u.Host == host;
        }

        public static string GetUrlReferrer()
        {
            string retVal = null;

            try
            {
                retVal = HttpContext.Current.Request.UrlReferrer.ToString();
            }
            catch
            {
            }

            if (retVal == null)
                return "";

            return retVal;
        }

        public static string GetHttpWebResponse(string url, string postData)
        {
            HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(url);
            request.Method = "POST";
            request.ContentType = "application/x-www-form-urlencoded";
            request.ContentLength = postData.Length;
            request.Timeout = 20000;

            HttpWebResponse response = null;

            try
            {
                StreamWriter swRequestWriter = new StreamWriter(request.GetRequestStream());
                swRequestWriter.Write(postData);
                if (swRequestWriter != null)
                    swRequestWriter.Close();

                response = (HttpWebResponse)request.GetResponse();
                using (StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8))
                {
                    return reader.ReadToEnd();
                }
            }
            finally
            {
                if (response != null)
                    response.Close();
            }
        }

        public static bool isNull(string str)
        {
            if (str == null || str.Trim() == string.Empty)
                return true;

            return false;
        }

        public static bool IsDecimal(string text)
        {
            if (isNull(text)) return false;
            return CheckRegEx(text, @"^\d*\.?\d{1,}$");
        }

        public static bool CheckRegEx(string chars, string Reg)
        {
            return new Regex(Reg, RegexOptions.Compiled).Match(chars).Success;
        }

        /// <summary>
        /// 检测是否有Sql危险字符
        /// </summary>
        /// <returns>True:存在</returns>
        public static bool IsSafeSqlString(string str)
        {
            return Regex.IsMatch(str, @"[-|;|,|\/|\(|\)|\[|\]|\}|\{|%|@|\*|!|\']");
        }

        /// <summary>
        /// 检测是否有Sql危险字符
        /// </summary>
        /// <returns>True:存在</returns>
        public static bool IsGeneralSafeSqlString(string str)
        {
            return Regex.IsMatch(str, @"[;|,|\/|\(|\)|\[|\]|\}|\{|\*|!|\']");
        }

        public static bool IsTime(string text)
        {
            if (isNull(text)) return false;
            return Regex.IsMatch(text,
                                 @"^((\d{4}-)(0?[1-9]|1[0-2])-(0?[1-9]|[1-2][0-9]|3[0-1])\s(([0-1]?[0-9])|(2[0-3])):([0-5]?[0-9])(:[0-5]?[0-9])?)$");
        }

        public static bool IsNum(string text)
        {
            if (isNull(text)) return false;
            return Regex.IsMatch(text, @"(?:^[1-9]\d*$)$");
        }

        /// <summary>
        /// 检测是否为有效邮件地址格式
        /// </summary>
        /// <param name="strIn">输入邮件地址</param>
        /// <returns></returns>
        public static bool IsValidEmail(string text)
        {
            if (isNull(text)) return false;
            return Regex.IsMatch(text, @"^[\w\.]+([-]\w+)*@[A-Za-z0-9-_]+[\.][A-Za-z0-9-_]");
        }

        /// <summary>
        /// 建立文件夹
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public static bool CreateDir(string name)
        {
            return MakeSureDirectoryPathExists(name);
        }

        [DllImport("dbgHelp", SetLastError = true)]
        private static extern bool MakeSureDirectoryPathExists(string name);

        /// <summary>
        /// 保存文本
        /// </summary>
        /// <param name="DiskPath">磁盘文件路径</param>
        /// <param name="text">文本</param>
        /// <param name="isOverlay">是否覆盖(True-否追加到结尾,False-覆盖)</param>
        /// <returns></returns>
        public static void StreamWriter(string DiskPath, string text, bool isOverlay)
        {
            using (System.IO.StreamWriter writer = new System.IO.StreamWriter(DiskPath, isOverlay, Encoding.UTF8))
            {
                writer.Write(text);
            }
        }

        public static string RemoveHtml(string content)
        {
            content = Regex.Replace(content, @"<[^>]*>", string.Empty, RegexOptions.IgnoreCase);
            return Regex.Replace(content, "(\\s*&[n|N][b|B][s|S][p|P];\\s*)+", " ");
        }

        /// <summary>
        /// http GET请求url包含参数
        /// </summary>
        /// <returns></returns>
        public static string GetHttpWebResponse(string url)
        {
            HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(url);
            request.Method = "GET";
            request.ContentType = "text/html;charset=UTF-8";
            HttpWebResponse response = null;
            string retString = string.Empty;
            try
            {
                response = (HttpWebResponse)request.GetResponse();
                using (StreamReader myStreamReader = new StreamReader(response.GetResponseStream(), Encoding.UTF8))
                {
                    retString = myStreamReader.ReadToEnd();
                }
            }
            finally
            {
                if (response != null)
                    response.Close();
            }

            return retString;
        }

        #endregion

        #region 字符串截取

        public static string cutString(string str, int len)
        {
            string result = string.Empty;
            int byteLen = System.Text.Encoding.Default.GetByteCount(str);
            int charLen = str.Length;
            int byteCount = 0;
            int pos = 0;
            if (byteLen > len)
            {
                for (int i = 0; i < charLen; i++)
                {
                    if (Convert.ToInt32(str.ToCharArray()[i]) > 255)
                        byteCount += 2;
                    else
                        byteCount += 1;
                    if (byteCount > len)
                    {
                        pos = i;
                        break;
                    }
                    else if (byteCount == len)
                    {
                        pos = i + 1;
                        break;
                    }
                }

                if (pos >= 0)
                    result = str.Substring(0, pos);
            }
            else
                result = str;

            return result;
        }

        #endregion

        #region 分页控件

        public static string DelQuery(string args)
        {
            string query = HttpContext.Current.Request.RawUrl.ToLower();
            if (query.IndexOf("?") != -1)
                query = "?" + Regex.Replace(query, @".*\?", string.Empty, RegexOptions.IgnoreCase);
            else query = string.Empty;
            if (isNull(query)) return "?";
            else
            {
                Match m = new Regex(@"[&|?]?" + args.ToLower() + "=(?:[^&?]*)[&]?", RegexOptions.None).Match(query);
                if (m.Success)
                {
                    string str = m.Groups[0].Value;
                    if (str.IndexOf("?") != -1)
                    {
                        if (query.Length > str.Length) query = query.Replace(str, "?") + "&";
                        else if (query.Length == str.Length) query = query.Replace(str, "?");
                        else query = query.Replace(str, string.Empty) + "&";
                    }
                    else if (str.LastIndexOf("&") > 0) query = query.Replace(str, "&") + "&";
                    else query = query.Replace(str, "&");
                }
                else query += "&";
                return query;
            }
        }

        public static string Control1(int countPage, int extendPage, string pagetag, string anchor)
        {
            if (pagetag == "")
                pagetag = "page";
            int startPage = 1;
            int endPage = 1;
            int curPage = IsNum(HttpContext.Current.Request.QueryString[pagetag])
                              ? int.Parse(HttpContext.Current.Request.QueryString[pagetag])
                              : 1;
            string url = DelQuery(pagetag);
            if (string.IsNullOrEmpty(url))
                url = HttpContext.Current.Request.RawUrl + "?";

            string t1 = "<a href=\"" + url + pagetag + "=1 \">1</a><i>...</i>";
            string t2 = "<i>...</i><a href=\"" + url + pagetag + "=" + countPage + " \">" + countPage + "</a>";

            if (countPage < 1)
                countPage = 1;
            if (extendPage < 3)
                extendPage = 3;

            string t3 = string.Empty;
            string t4 = string.Empty;
            if (curPage == 1) t3 = "<span class=\"pre\">上页</span>";
            else
            {
                t3 = "<a href=\"" + url + pagetag + "=" + (curPage - 1);
                if (anchor != null) t3 += anchor;
                t3 += "\" class=\"pre\">上页</a>";
            }
            if (curPage >= countPage) t4 = "<span class=\"next\">下页</span>";
            else
            {
                t4 = "<a href=\"" + url + pagetag + "=" + (curPage + 1);
                if (anchor != null) t4 += anchor;
                t4 += "\" class=\"next\">下页</a>";
            }

            if (countPage > extendPage)
            {
                if (curPage - (extendPage / 2) > 1)
                {
                    if (curPage + (extendPage / 2) < countPage)
                    {
                        startPage = curPage - (extendPage / 2);
                        endPage = startPage + extendPage - 1;
                    }
                    else
                    {
                        endPage = countPage;
                        startPage = endPage - extendPage + 1;
                        t2 = "";
                    }
                }
                else
                {
                    endPage = extendPage;
                    t1 = "";
                }
            }
            else
            {
                startPage = 1;
                endPage = countPage;
                t1 = "";
                t2 = "";
            }

            StringBuilder s = new StringBuilder("");

            s.Append(t3 + t1);
            for (int i = startPage; i <= endPage; i++)
            {
                if (i == curPage)
                {
                    s.Append("<span>");
                    s.Append(i);
                    s.Append("</span>");
                }
                else
                {
                    s.Append("<a href=\"");
                    s.Append(url);
                    s.Append(pagetag);
                    s.Append("=");
                    s.Append(i);
                    if (anchor != null)
                    {
                        s.Append(anchor);
                    }
                    s.Append("\">");
                    s.Append(i);
                    s.Append("</a>");
                }
            }
            s.Append(t2 + t4);

            return s.ToString();
        }

        #endregion

       

        public static string GetProductNameByJs(string name)
        {
            return name.Replace("'", "").Replace('"', ' ');
        }

        public static string FormatSysNo(int sysNo, int len)
        {
            string sysNoStr = sysNo.ToString();
            string strid = "";
            for (int i = 0; i < (len - sysNoStr.Length - 1); i++)
            {
                strid += "0";
            }
            strid += sysNoStr;
            return strid;
        }

    }
}
