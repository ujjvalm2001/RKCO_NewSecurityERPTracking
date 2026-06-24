<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QRCodePage.aspx.cs" Inherits="NewSecurityERP.Masters.QRCodePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        th, td {
            padding: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center" border="1" width="30%">
                <tr>
                    <td colspan="2" align="center">
                        <asp:Image ID="imgQRCode" runat="server" Width="250" Height="250" />
                    </td>
                </tr>
                <tr>
                    <td width="40%"><b>Unit Code :</b></td>
                    <td width="60%">
                        <asp:Label ID="lblUnitCode" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td><b>Unit Name :</b> </td>
                    <td>
                        <asp:Label ID="lblUnitName" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td><b>Address : </b></td>
                    <td>
                        <asp:Label ID="lblAddress" runat="server"></asp:Label></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>



