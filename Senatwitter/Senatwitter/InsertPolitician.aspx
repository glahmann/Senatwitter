<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertPolitician.aspx.cs" Inherits="Senatwitter.InsertPolitician" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
        .auto-style2 {
            text-align: left;
        }
        .auto-style3 {
            width: 843px;
            height: 356px;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p class="auto-style4">
            <img alt="logo" class="auto-style3" src="images/senatwitter.png" /></p>
            <div class="auto-style2">
                <span class="auto-style1"><strong>New Politician</strong></span><br />
                <br />
                First name:
                <asp:TextBox ID="fname" runat="server"></asp:TextBox>
                &nbsp;<asp:Label ID="fnameErr" runat="server" ForeColor="#FF3300"></asp:Label>
                <br />
                <br />
                Last name:&nbsp;
                <asp:TextBox ID="lname" runat="server"></asp:TextBox>
                &nbsp;<asp:Label ID="lnameErr" runat="server" ForeColor="#FF3300"></asp:Label>
                <br />
                <br />
                Phone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="phone" runat="server" TextMode="Phone"></asp:TextBox>
                &nbsp;<asp:Label ID="phoneErr" runat="server" ForeColor="#FF3300"></asp:Label>
                <br />
                <br />
                Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="email" runat="server" TextMode="Email"></asp:TextBox>
                &nbsp;<asp:Label ID="emailErr" runat="server" ForeColor="#FF3300"></asp:Label>
                <br />
                <br />
                Party:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="partyDrop" runat="server" DataSourceID="PartyName" DataTextField="PartyName" DataValueField="PartyID">
                </asp:DropDownList>
                <br />
            </div>
            <asp:SqlDataSource ID="PartyName" runat="server" ConnectionString="<%$ ConnectionStrings:Senatwitter %>" SelectCommand="SELECT * FROM [Party] ORDER BY [PartyName]"></asp:SqlDataSource>
            <br />
            State:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="stateDrop" runat="server" DataSourceID="StateName" DataTextField="StateName" DataValueField="StateID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="StateName" runat="server" ConnectionString="<%$ ConnectionStrings:Senatwitter %>" SelectCommand="SELECT [StateName], [StateID] FROM [State] ORDER BY [StateName]"></asp:SqlDataSource>
            <br />
            <br />
            Term Start:
            <asp:TextBox ID="termStart" runat="server" TextMode="Date"></asp:TextBox>
            &nbsp;<asp:Label ID="termStartErr" runat="server" ForeColor="#FF3300"></asp:Label>
            <br />
            <br />
            <asp:Button ID="insertPol" runat="server" Text="Insert Politician" OnClick="insertPol_Click" />
        &nbsp;
        <asp:Label ID="notification" runat="server"></asp:Label>
        <p class="auto-style5">
            <asp:Button ID="logout" runat="server" OnClick="logout_Click" Text="Log Out" />
        </p>
    </form>
</body>
</html>
