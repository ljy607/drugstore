<%@ Page Title="主页" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="DrugstoreWeb._Default" %>

<%--<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>--%>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table style="width: 100%;" id="table1" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width: 15%;" valign="top">
                <table style="width: 100%;" id="table2">
                    <tr>
                        <td>
                            <h2>
                                电子文件查询
                            </h2>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="货号："></asp:Label>
                            <asp:TextBox ID="txtspbh" runat="server" Width="100px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="批号："></asp:Label>
                            <asp:TextBox ID="txtpcbh" runat="server" Width="100px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <asp:CheckBox ID="chk" runat="server" Text="模糊查找" Checked="true" />
                        </td>
                    </tr>
                    <tr>
                        <td style="height:30px;align:center">
                            <asp:Button ID="btnSearch" runat="server" Text="查询" Width="80px" OnClick="btnSearch_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ListBox ID="lstFile" runat="server" Width="180px" AutoPostBack="true" OnSelectedIndexChanged="lstFile_SelectedIndexChanged"
                                Height="500px"></asp:ListBox>
                        </td>
                    </tr>                    
                </table>
            </td>
            <td>
                <asp:Image ID="imgsp" runat="server" />
            </td>
        </tr>
    </table>
    <%--<div>
        <asp:Label ID="Label1" runat="server" Text="货号："></asp:Label>
        <asp:TextBox ID="txtspbh" runat="server"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="批号："></asp:Label>
        <asp:TextBox ID="txtpcbh" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="查询" OnClick="btnSearch_Click" />
        <asp:ListBox ID="lstFile" runat="server" AutoPostBack="true" OnSelectedIndexChanged="lstFile_SelectedIndexChanged">
        </asp:ListBox>
    </div>
    <div>
        <asp:Image ID="imgsp" runat="server" />
    </div>--%>
</asp:Content>
