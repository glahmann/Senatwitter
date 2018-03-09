<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Senatwitter.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Senatwitter</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;

        }
     </style>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
          <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
              </button>
              <a class="navbar-brand" href="HomePage.aspx">Senatwitter</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
                <li class="active"><a href="PoliticianInfo.aspx"> Politician Info <span class="sr-only">(current)</span></a></li>
                <li><a href="#"> Fun! </a></li>
              </ul>
              <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Advanced <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="AdminPage.aspx">Admin</a></li>
                    <li><a href="InsertPolitician.aspx">Add Politician</a></li>
                  </ul>
                </li>
              </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
        </nav>
        <div class="auto-style1">
            <br />
            <br />
            <img src="images/senatwitter.png" alt="Logo" />
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="HomeDataSource2" DataTextField="Lname" DataValueField="Lname">
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="HomeDataSource3" DataTextField="Fname" DataValueField="Fname">
            </asp:DropDownList>
            <br />
            <asp:SqlDataSource ID="HomeDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Senatwitter %>" SelectCommand="SELECT [Fname] FROM [Politicians]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="HomeDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Senatwitter %>" SelectCommand="SELECT [Lname] FROM [Politicians]"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" HorizontalAlign="Center">
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="HomeDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Senatwitter %>" SelectCommand="SELECT [PartyName] FROM [Party]"></asp:SqlDataSource>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    </form>
    </body>
</html>
