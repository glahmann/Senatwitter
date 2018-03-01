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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="auto-style2">
                <span class="auto-style1"><strong>New Politician</strong></span><br />
                <br />
                First name:
                <asp:TextBox ID="fname" runat="server"></asp:TextBox>
                <br />
                Last name:
                <asp:TextBox ID="lname" runat="server"></asp:TextBox>
                <br />
                Phone:
                <asp:TextBox ID="phone" runat="server"></asp:TextBox>
                <br />
                Email:
                <asp:TextBox ID="email" runat="server"></asp:TextBox>
                <br />
                Party:
                <asp:DropDownList ID="partyDrop" runat="server" DataSourceID="PartyName" DataTextField="PartyName" DataValueField="PartyID">
                </asp:DropDownList>
            </div>
            <asp:SqlDataSource ID="PartyName" runat="server" ConnectionString="<%$ ConnectionStrings:Senatwitter %>" SelectCommand="SELECT * FROM [Party] ORDER BY [PartyName]"></asp:SqlDataSource>
            <br />
            State: <asp:DropDownList ID="stateDrop" runat="server" DataSourceID="StateName" DataTextField="StateName" DataValueField="StateID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="StateName" runat="server" ConnectionString="<%$ ConnectionStrings:Senatwitter %>" SelectCommand="SELECT [StateName], [StateID] FROM [State] ORDER BY [StateName]"></asp:SqlDataSource>
            <br />
            Term Start:
            <asp:TextBox ID="termStart" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="insertPol" runat="server" Text="Insert Politician" />
        </div>
    </form>
</body>
</html>
