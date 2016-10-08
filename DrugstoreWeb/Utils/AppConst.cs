using System;

namespace Utils
{
    /// <summary>
    /// Summary description for AppConst.
    /// 应用程序常量
    /// </summary>
    public class AppConst
    {

        public AppConst()
        {
        }

        #region 系统中判断未赋值的判断，只可以用于比较判断，不能用于赋值

        /// <summary>
        /// StringNull=""
        /// </summary>
        public const string StringNull = "";

        /// <summary>
        /// 小数位数，金额计算后保留的小数位数
        /// </summary>
        public const int NumberOfDecimalPlaces = 1;

        /// <summary>
        /// IntNull=-999999
        /// </summary>
        public const int IntNull = -999999;
        public const decimal DecimalNull = -999999;

        public static DateTime DateTimeNull = DateTime.Parse("1900-01-01");
        public static DateTime DateTimeGCNull = DateTime.Parse("2000-01-01");//GiftCard专用初始日期

        #endregion
        public const string AllSelectString = "--- 全部 ---";
        public const string AllSelectString_DBC = "--- 全部 ---";
        public const string NotSetString_DBC = "--- 未设置 ---";
        public const string DecimalToInt = "#########0"; //用于point的显示，一般来说currentprice应该没有分。
        public const string DecimalFormat = "#########0.00";
        public const string DecimalFormatLong = "#########0.000";
        public const string DecimalFormatWithGroup = "#,###,###,##0.00";
        public const string DecimalFormatWithCurrency = "￥#########0.00";

        /// <summary>
        /// DateFormat = "yyyy-MM-dd"
        /// </summary>
        public const string DateFormat = "yyyy-MM-dd";

        /// <summary>
        /// DateFormatLong = "yyyy-MM-dd HH:mm:ss"
        /// </summary>
        public const string DateFormatLong = "yyyy-MM-dd HH:mm:ss";

        /// <summary>
        /// IntFormatWithGroup = "#,###,###,##0"
        /// </summary>
        public const string IntFormatWithGroup = "#,###,###,##0";

        /// <summary>
        /// MySql连接字符串
        /// </summary>
        public const string MySqlConnetString = "Server=172.168.7.228;Database=mas;Uid=gift;Pwd=gift8147;CharSet=gb2312;";

        /// <summary>
        /// 
        /// </summary>
        public const string SMS_WebName = "";

        public const string WebSite = "www.anport-e.com";

        #region 添加RMA货卡查询起始时间
        public static DateTime RMA_Initializtion_DateTime = DateTime.Parse("2008-01-01");
        #endregion

        //用于DataGrid中每页的记录数
        public const int PageSize = 50;

        //用于DataGrid中每页按钮的数目
        public const int PageButtonCount = 5;

        /// <summary>
        /// 积分和现金RMB转换比例 Point = Cash*ExchangeRate
        /// </summary>
        public static decimal ExchangeRate = 100m;

        // 每张发票的最大行数
        public const int PageMaxLine = 12;

        public const int InvoiceRecordsPerPage = 4;
        public const int PZRecordsPerPage = 7;

        // 每行名称的最大长度
        public const int NameMaxLength = 30;

        // 地址的最大长度，超过长都会被截去一部分
        public const int AddressMaxLength = 100;

        // 商品价格的缺省值
        public const decimal DefaultPrice = 999999m;

        // 前台生成订单对应的销售人员编号
        public const int IcsonSalesMan = 0;
        public const string IcsonSalesManName = "宜齐商城";

        // 系统操作Log，默认ip地址
        public const string SysIP = "127.0.0.1";

        // 系统操作Log，默认User
        public const int SysUser = 0;

        public const int PMDUserSysNo = 47;

        //商品ID后缀
        public const string SuffixB2C = "C";
        public const string SuffixB2B = "B";
        public const string SuffixB2G = "G";
        public const string SuffixDamaged = "D";
        public const string SuffixSecondHand = "R";

        //条码分隔符
        public const char BarcodeSplit = '_';

        public const string ErrorTemplet = @"
          <table width='100%' border='0' cellpadding='1' cellspacing='1'>
            <tr>
                <td bgcolor='#ADD952'>
                    <table width='100%' border='0' cellspacing='0' cellpadding='4' bgcolor='#FFFFD5'>
                        <tr style='padding:5px 0; '>
                            <td bgcolor='#FFFFD5' height='30px'>
                                &nbsp;</td>
                            <td align='left' bgcolor='#FFFFD5' class='ays_font_error_2'>
                                @errorMsg</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>";

        public const string SuccTemplet = @"
          <table bgcolor='#ffffd5' border='0' cellpadding='2' cellspacing='0' width='100%'>
            <tr style='display:none; '>
                <td bgcolor='#ffffd5' width='17'>
                    &nbsp;</td>
                <td>
                    <span class='ays_font_success'>正确信息</span></td>
            </tr>
            <tr style='padding:5px 0; '>
                <td bgcolor='#ffffd5' height='30px'>
                    &nbsp;</td>
                <td class='ays_font_success2' bgcolor='#ffffd5'>
                    @succMsg</td>
            </tr>
        </table>";

        public const string DefaultPwd = "1234";

        public const int ReviewPoint = 10;
        public const int SinglePoint = 5;//晒单积分
        public const int ImageNum = 3;//上传3张送积分

        public const int EmailVerifyPoint = 10;    //邮箱确认积分
        public const int CellPhoneVerifyPoint = 10;  //手机绑定积分

        /// <summary>
        /// 关联商品颜色属性
        /// </summary>
        public const int ProductAssociateColor = -2;

        public const string ProductAssociateColorStr = "颜色";
        /// <summary>
        /// 关联商品尺码属性
        /// </summary>
        public const int ProductAssociateSize = -1;

        public const string ProductAssociateSizeStr = "尺码";

        /// <summary>
        /// 属性可选
        /// </summary>
        public const int Choose = 0;

        /// <summary>
        /// 属性禁用
        /// </summary>
        public const int Forbidden = -1;

        /// <summary>
        /// 属性选中
        /// </summary>
        public const int IsChoosed = 2;

        #region 短信参数

        /// <summary>
        /// 取回密码--用户名
        /// </summary>
        public const string SMS_GetPwd_Customer = "{CustomerID}";

        /// <summary>
        /// 取回密码--密码
        /// </summary>
        public const string SMS_GetPwd_Pwd = "{Pwd}";

        /// <summary>
        /// 出库--订单号
        /// </summary>
        public const string SMS_OutStock_SOID = "{SOID}";

        /// <summary>
        /// 采购计划导入短信内容
        /// </summary>
        public const string SMS_PurPlan = "{PurPlanSMS}";

        #endregion

        #region 图片规格

        /// <summary>
        /// 图片90_55规格
        /// </summary>
        public const string N90_55 = "/90_55/";

        /// <summary>
        /// 图片155_94规格
        /// </summary>
        public const string N155_94 = "/155_94/";

        /// <summary>
        /// 图片359_218规格
        /// </summary>
        public const string N359_218 = "/359_218/";

        /// <summary>
        /// 图片602_366规格
        /// </summary>
        public const string N602_366 = "/602_366/";

        /// <summary>
        /// 图片602_366 N规格
        /// </summary>
        public const string N602_366_N = "/602_366 N/";

        #endregion

        #region 浏览记录

        /// <summary>
        /// B2G前台浏览记录
        /// </summary>
        public const string AnportG_ViewHistory = "G_ViewHistory";

        /// <summary>
        /// B2G前台购买记录
        /// </summary>
        public const string AnportG_ShopCart = "G_ShopCart";

        #endregion

        /// <summary>
        /// 前台采购计划显示的状态
        /// </summary>
        public const string ValidPurPlanStatus = "1,2,3,4";

        /// <summary>
        /// 前台采购计划可申购的状态
        /// </summary>
        public const string ValidPurPlanBuyStatus = "1,2";

        /// <summary>
        /// 客户地址缓存key
        /// </summary>
        public const string CustomerAddressKey = "CustomerAddressKey_1";
        /// <summary>
        /// 商品类别缓存Key
        /// </summary>
        public const string CategoryKey = "CategoryKey_1";
        /// <summary>
        /// 商品中类缓存Key
        /// </summary>
        public const string Category2Key = "Category2Key_1";
        /// <summary>
        /// 商品小类缓存Key
        /// </summary>
        public const string Category3Key = "Category3Key_1";
        /// <summary>
        /// 缓存所有品牌信息
        /// </summary>
        public const string ManufacturerKey = "ManufacturerKey_1";
        /// <summary>
        /// 缓存单个品牌信息包含C3SysNo
        /// </summary>
        public const string ManufacturerC3Key = "ManufacturerC3Key_1";
        /// <summary>
        /// 客户的在处理中订单的数目缓存key
        /// </summary>
        public const string InProgressSOCountKey = "InProgressSOCountKey_1";
        /// <summary>
        /// 客户未读站内信数目缓存Key
        /// </summary>
        public const string MessageCountKey = "MessageCount_1";
        //public const String`
        /// <summary>
        /// 客户优惠券可用张数缓存Key
        /// </summary>
        public const string CouponCountKey = "CouponCountKey_1";
        /// <summary>
        /// 客户代金券可用张数缓存Key
        /// </summary>
        public const string NewCouponCountKey = "NewCouponCountKey_1";
        /// <summary>
        /// 客户购物卡可用张数缓存Key
        /// </summary>
        public const string GiftCardCountKey = "GiftCardCountKey_1";
        /// <summary>
        /// 客户降价通知数目缓存key
        /// </summary>
        public const string LowPriceCountKey = "LowPriceCountKey_1";
        /// <summary>
        /// 客户到货通知数目缓存key
        /// </summary>
        public const string ArrivalProductCountKey = "ArrivalProductCountKey_1";
        /// <summary>
        /// 客户待评价商品数目缓存key
        /// </summary>
        public const string CommentProductCountKey = "CommentProductCountKey_1";
        /// <summary>
        /// 客户待晒单商品数目
        /// </summary>
        public const string ComImgKey = "ComImageKey_1";
        /// <summary>
        /// 广告信息分类
        /// </summary>
        public const string AdvertiseSlotKey = "AdvertiseSlotKey_1_1";
        /// <summary>
        /// 商品价格缓存键
        /// </summary>
        public const string ProductPriceKey = "ProductPriceKey_1";
        /// <summary>
        /// 关键字过滤缓存key
        /// </summary>
        public const string FitWordKey = "FitWordKey_1";
        /// <summary>
        /// 公告新闻活动信息缓存Key
        /// </summary>
        public const string WebBulletinModel = "WebBulletinModel_1";
        /// <summary>
        /// 限时抢购缓存Key
        /// </summary>
        public const string CountNewKey = "CountNewKey_1";
        /// <summary>
        /// 待更新状态限时抢购列表缓存Key
        /// </summary>
        public const string CountDownKey = "CountDownKey_1";
        /// <summary>
        /// 促销信息缓存key
        /// </summary>
        public const string PromotionsNewKey = "PromotionsNewKey";
        /// <summary>
        /// 团购信息缓存key
        /// </summary>
        public const string GroupShoppingKey = "GroupShoppingKey_1";
        /// <summary>
        /// 下期团购信息缓存key
        /// </summary>
        public const string NextGroupShoppingKey = "NextGroupShoppingKey_1";
        /// <summary>
        /// 客户退款单缓存key
        /// </summary>
        public const string CustomerRefund = "CustomerRefund_1";
        /// <summary>
        /// 客户订单列表缓存
        /// </summary>
        public const string CustomerOrderListKey = "CustomerOrderListKey_1";
        /// <summary>
        /// 站内信缓存key
        /// </summary>
        public const string MessageBoxKey = "MessageBoxKey_1";
        /// <summary>
        /// 今日团购缓存key
        /// </summary>
        public const string GroupShoppingTodayKey = "GroupShoppingTodayKey_1";
        /// <summary>
        /// 昨日团购缓存key
        /// </summary>
        public const string GroupShoppingYesterdayKey = "GroupShoppingYesterdayKey_1";
        /// <summary>
        /// 往期团购缓存Key
        /// </summary>
        public const string GroupShoppingHistoryKey = "GroupShoppingHistoryKey_1";
        /// <summary>
        /// 前日团购缓存Key
        /// </summary>
        public const string GroupShoppingQianRiKey = "GroupShoppingQianRiKey_1";
        /// <summary>
        /// 帮助文章缓存Key
        /// </summary>
        public const string ArticleKey = "ArticleKey_1";
        /// <summary>
        /// 帮助文章主题Key
        /// </summary>
        public const string ArticleTheme = "ArticleTheme_1";
        /// <summary>
        /// 帮助文章主题组Key
        /// </summary>
        public const string ArticleThemeGroup = "ArticleThemeGroup_1";
        /// <summary>
        /// 电器知识文章缓存Key
        /// </summary>
        public const string ArticleKeyRepair = "ArticleKeyRepair_1";
        /// <summary>
        /// 电器知识文章主题Key
        /// </summary>
        public const string ArticleThemeRepair = "ArticleThemeRepair_1";
        /// <summary>
        /// 用户返修/退换货申请单
        /// </summary>
        public const string RMARequest = "RMARequest_1";
        /// <summary>
        /// 用户返修/退换货申请单 New
        /// </summary>
        public const string RORequest = "RORequest_1";
        /// <summary>
        /// 优惠券缓存Key
        /// </summary>
        public const string CouponKey = "CouponKey_1";
        /// <summary>
        /// 代金券缓存Key
        /// </summary>
        public const string NewCouponKey = "NewCouponKey_1";
        /// <summary>
        /// 商品清单缓存Key
        /// </summary>
        public const string ProductLisKey = "Product_List_key";
        /// <summary>
        /// 商品价格区间信息缓存Key
        /// </summary>
        public const string Price_RangeKey = "Price_Range_1";
        /// <summary>
        /// 商品属性信息缓存Key
        /// </summary>
        public const string Category_AttributesKey = "Category_AttributesKey_1";
        /// <summary>
        /// 商品优惠信息缓存Key
        /// </summary>
        public const string ProductCouponKey = "ProductCouponKey_1";
        /// <summary>
        /// 商品详细信息Key
        /// </summary>
        public const string ProductDetailsKey = "ProductDetailsKey_1";
        public const string ProductDetailsOptionKey = "ProductDetailsOptionKey_1";
        /// <summary>
        /// 商品评论总数和评论百分比Key
        /// </summary>
        public const string ProductScoreCountKey = "ProductScoreCountKey_1";
        /// <summary>
        /// 商品评论和回复信息缓存Key
        /// </summary>
        public const string ProductReviewKey = "ProductReviewKey_1";
        /// <summary>
        /// 商品赠品信息缓存Key
        /// </summary>
        public const string ProductGiftKey = "ProductGiftKey_1";
        /// <summary>
        /// 商品评论对我有用没用缓存Key
        /// </summary>
        public const string ProductReviewCountKey = "ProductReviewCountKey_1";
        /// <summary>
        /// 找回密码缓存Key
        /// </summary>
        public const string ResetPasswordKey = "Account_ResetPasswordKey_1";
        /// <summary>
        /// 修改邮箱手机缓存Key
        /// </summary>
        public const string modifyMailorCellPhoneKey = "Account_ModifyMailorCellPhoneKey_1";
        /// <summary>
        /// 验证邮箱手机缓存Key
        /// </summary>
        public const string verifyMailorCellPhoneKey = "Account_VerifyMailorCellPhoneKey_1";
        /// <summary>
        /// QA缓存Key
        /// </summary>
        public const string QAKey = "QAKey_1";
        /// <summary>
        /// 记录密码输错缓存key
        /// </summary>
        public const string RecoerdErrorPasswordKey = "Account_RecoedrErrorPasswordKey_1";

        /// <summary>
        /// 记录单个品牌新商品相关缓存key
        /// </summary>
        public const string ManuturefatureBySysNoKey = "ManuturefatureBySysNoKey_1";


        /// <summary>
        /// 首页热搜缓存
        /// </summary>
        public const string SearchKeyRecommendInfo = "SearchKeyRecommendInfo_1";

        /// <summary>
        /// 首页热搜缓存
        /// </summary>
        public const string SearchKeyRecommendInfoList = "SearchKeyRecommendInfoList_1";


        /// <summary>
        /// 首页大类下产品缓存
        /// </summary>
        public const string FromC1ProductList = "FromC1ProductList_1";


        /// <summary>
        /// 首页大类下品牌缓存
        /// </summary>
        public const string FromC1ManutureList = "FromC1ManutureList_1";
        /// <summary>
        /// 详情页 小类品牌缓存
        /// </summary>
        public const string FromC3ManutureList = "FromC3ManutureList_1";
        /// <summary>
        /// 用户记住密码 自动登录时长
        /// </summary>
        public const string ZiDongLoginTimes = "Account_ZiDongLoginTimes_1";
        /// <summary>
        /// LinkSource存放Key
        /// </summary>
        public const string LinkSourceKey = "LinkSourceKey";
        /// <summary>
        ///取得所有品牌的类别和产品信息
        /// </summary>
        public const string DsManu_Category_ProductList = "DsManu_Category_ProductList_1";

        public const string MemCachedCustomerAddressVersion = "_1";


        public const string SearchAnswer = "SearchAnswer_1";
        /// <summary>
        /// 客户浏览记录分析缓存
        /// </summary>
        public const string SOCustomerPayBrowserKey = "SOCustomerPayBrowserKey_1";
        /// <summary>
        /// 客户购买记录分析缓存
        /// </summary>
        public const string SOCustomerPayKey = "SOCustomerPayKey_1";
        /// <summary>
        /// 产品推荐位缓存Key
        /// </summary>
        public const string ProductOnlineKey = "ProductOnlineKey_1";
        /// <summary>
        /// 产品推荐位信息缓存Key
        /// </summary>
        public const string OnlineListKey = "OnlineList_1";
        /// <summary>
        /// 商品组合套餐缓存Key 1个小时
        /// </summary>
        public const string SaleRuleKey = "SakeReluKey_1";
        /// <summary>
        /// 商品随心配缓存Key 
        /// </summary>
        public const string FllowWithKey = "FllowWithKey_1";
        /// <summary>
        /// 手机端客户购买缓存Key
        /// </summary>
        public const string HWCustomerBuyKey_Mobile = "HWCustomerBuyKey_Mobile";
        /// <summary>
        /// 商品属性信息缓存DS 1个小时
        /// </summary>
        public const string ProductAttribute2Key = "ProductAttribute2Key_1";
        /// <summary>
        /// 缓存上商品Info Key
        /// </summary>
        public const string SoInfoKey = "SoInfoKey_1";
        /// <summary>
        /// lucene缓存数据key
        /// </summary>
        public const string ProductLuceneSysNoKey = "ProductLuceneSysNoKey_1";
        /// <summary>
        /// 评论引用信息缓存key
        /// </summary>
        public const string QuoteSysNoKey = "QuoteSysNo_1";
        /// <summary>
        /// 用户等级缓存Key
        /// </summary>
        public const string CustomerRankKey = "CustomerRankKey_1";
        /// <summary>
        /// 执行数据仓库数据存储缓存key
        /// </summary>
        public const string ProductLucenuEvntKey = "ProductLucenuEvntKey_1";
        /// <summary>
        /// 执行Lucene缓存Key
        /// </summary>
        public const string ProductLuceneEvntIndexKey = "ProductLuceneEvntIndexKey_1";
        /// <summary>
        /// 修改和建立商品索引信息缓存Key
        /// </summary>
        public const string ProductLuceneIndexUpdateKey = "ProductLuceneIndexUpdateKey_1";
        /// <summary>
        /// 修改和建立商品备份索引信息缓存Key
        /// </summary>
        public const string ProductLuceneIndexBaceUpdateKey = "ProductLuceneIndexBaceUpdateKey_1";
        /// <summary>
        /// 商品点击率缓存信息Key
        /// </summary>
        public const string ProductDailyClickKey = "ProductDailyClickKey_1";
        /// <summary>
        /// 商品库存信息缓存Key
        /// </summary>
        public const string ProductInvetoryKey = "ProductInvetoryKey_1";
        /// <summary>
        /// 商品库存信息缓存包含限购数量
        /// </summary>
        public const string ProductWithCountInvetoryKey = "ProductWithCountInvetoryKey_1";
        /// <summary>
        /// 商品详细信息缓存Key
        /// </summary>
        public const string ProductDetailsListKey = "ProductDetailsListKey_1";
        /// <summary>
        /// 定的详情页缓存Key
        /// </summary>
        public const string OrderLock = "OrderLock_1";
        /// <summary>
        /// 商品搜索缓存key,转换成拼音的字母
        /// </summary>
        public const string ProductSearchForLuceneKey = "ProductSearchForLuceneKey_1";
        /// <summary>
        /// 商品内部购机缓存key
        /// </summary>
        public const string ProductCountDownTerminal = "ProductCountDownTerminal_1";
        /// <summary>
        /// 系统字段缓存Key
        /// </summary>
        public const string SysFieldKey = "SysFieldKey_1";
        /// <summary>
        /// 终端配送方式缓存Key
        /// </summary>
        public const string HousePurchaseProductCartKey = "HousePurchaseProductCartKey_1";
        /// <summary>
        /// 终端所有下架商品包括内部购机商品ID缓存Key
        /// </summary>
        public const string AllNoShowProductIDKey = "ZDAllNoShowProductID_1";
        /// <summary>
        /// 终端购物错误提示信息缓存
        /// </summary>
        public const string HousePurchase_IndexErrorKey = "HousePurchase_IndexErrorKey_1";

        public const string Currency = "人民币";

        public const string PromotionAreaKey = "PromotionAreaKey_1";


        #region DBCConfigKey
        /// <summary>
        /// 邮件发送开关
        /// </summary>
        public const string EMailIsSend = "EMail_Is_Send";
        /// <summary>
        /// 邮件模板：到货通知
        /// </summary>
        public const string EMailArriveNoticeTemplate = "EMail_ArriveNotice_Template";
        /// <summary>
        /// 邮件模版路径
        /// </summary>
        public const string EMailTemplatePath = "EMail_Template_Path";
        /// <summary>
        /// 邮件模板：验证信箱
        /// </summary>
        public const string EMailVerifyTemplate = "EMail_Verify_Template";
        /// <summary>
        /// 邮件模版：找回密码
        /// </summary>
        public const string EMailForgotTemplate = "EMail_Forgot_Template";
        /// <summary>
        /// 出库单模板
        /// </summary>
        public const string EMailDOTemplet = "EMail_DO_Templet";
        /// <summary>
        /// 配送单模板
        /// </summary>
        public const string EMailDLTemplet = "EMail_DL_Templet";
        /// <summary>
        /// 降价通知
        /// </summary>
        public const string EMailDepreciateNoticeTemplate = "EMail_DepreciateNotice_Template";

        public const string EMailFrom = "EMail_From";
        public const string EMailFromName = "EMail_FromName";
        #endregion

        
    }
}