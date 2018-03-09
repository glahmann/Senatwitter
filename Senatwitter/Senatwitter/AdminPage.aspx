<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="Senatwitter.AdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style3 {
            width: 843px;
            height: 356px;
        }
        .auto-style4 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
        <h1 class="auto-style4">
            <img alt="logo" class="auto-style3" src="images/senatwitter.png" /></h1>
        <h1>
            <br />
            ADMIN LOGIN</h1>
        <p>
            Username:
            <asp:TextBox ID="username" runat="server" Height="25px"></asp:TextBox>
        </p>
        <p>
            <br />
            Password:&nbsp;
            <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
        </p>
        <p>
            <br />
            <asp:Button ID="loginButton" runat="server" OnClick="loginButton_Click" Text="Login" />
            <br />
        </p>
    </form>
</body>
</html>
