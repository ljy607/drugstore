<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaveData.aspx.cs" Inherits="DrugstoreWeb.Web.SaveData" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    
    <div><asp:Label id="lblMessage" runat="server" EnableViewState="False"></asp:Label></div>
    <div>
        <asp:TextBox ID="txtdh" runat="server" Width="150"></asp:TextBox>
        <asp:Button ID="btn_Search" runat="server" Text="查询" 
            onclick="btn_Search_Click" />&nbsp;<asp:Button ID="btn_Save" runat="server" 
            Text="导入" onclick="btn_Save_Click" />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        
    </div>
    </form>
</body>
</html>
