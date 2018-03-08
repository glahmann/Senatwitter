<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PoliticianInfo.aspx.cs" Inherits="Senatwitter.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Select a state:
            <asp:DropDownList ID="stateDrop" runat="server" OnSelectedIndexChanged="stateDrop_SelectedIndexChanged">
            </asp:DropDownList>
&nbsp; Select a senator:
            <asp:DropDownList ID="senatorDrop" runat="server">
            </asp:DropDownList>
        </div>
    </form>
</body>
</html>
