<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="qyzz.aspx.cs"
    Inherits="DrugstoreWeb.Web.qyzz" %>

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
                                企业资质查询
                            </h2>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="企业名称："></asp:Label><br />
                            <asp:TextBox ID="txtspbh" runat="server" Width="160px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="chk" runat="server" Text="模糊查找" Checked="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnSearch" runat="server" Text="查询" OnClick="btnSearch_Click" />
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
</asp:Content>
