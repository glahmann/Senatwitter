<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Funstats.aspx.cs" Inherits="Senatwitter.WebForm2" %>

<!DOCTYPE html>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
            font-weight: normal;
            text-decoration: underline;
            color: #CC0099;
        }
        .auto-style2 {
            text-decoration: underline;
            font-size: x-large;
            color: #FF0000;
        }
        .auto-style3 {
            text-decoration: underline;
            font-size: x-large;
            color: #0000FF;
        }
        .auto-style5 {
            text-align: center;
        }
        .auto-style6 {
            width: 843px;
            height: 356px;
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
                <li class="active"><a href="PoliticianInfo.aspx"> Politician Info -<span class="sr-only">(current)</span></a></li>
                <li><a href="Funstats.aspx">- Fun Stats! -</a></li>
              </ul>
              <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">- Admin Only<span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="AdminPage.aspx">Login</a></li>
                  </ul>
                </li>
              </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
        </nav>
        <div class="auto-style5">
            <br />
            <br />
<%--            <img alt="logo" class="auto-style6" src="images/senatwitter.png" /></div>--%>
        <div style="margin-top: 32px; width: 740px;">
            
            
            <h6 class="auto-style1"><strong>RATINGS</strong></h6>
            <br />
            <span class="auto-style2"><strong><em>HOTNESS</em></strong></span><br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" Height="233px" Width="173px" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="HOTNESS" HeaderText="HOTNESS" SortExpression="HOTNESS" />
                    <asp:BoundField DataField="Fname" HeaderText="Fname" SortExpression="Fname" />
                    <asp:BoundField DataField="Lname" HeaderText="Lname" SortExpression="Lname" />
                    <asp:ImageField DataImageUrlField="imgPath" HeaderText="Image"></asp:ImageField> 
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
            <br />
            ___________________________________________________<br />
            <br />
            <span class="auto-style3"><strong><em>HUMOR</em></strong></span><br />
            <br />
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2" GridLines="Vertical" Width="167px" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="Gainsboro" />
                <Columns>
                    <asp:BoundField DataField="HUMOR" HeaderText="HUMOR" SortExpression="HUMOR" />
                    <asp:BoundField DataField="Fname" HeaderText="Fname" SortExpression="Fname" />
                    <asp:BoundField DataField="Lname" HeaderText="Lname" SortExpression="Lname" />
                    <asp:ImageField DataImageUrlField="imgPath" HeaderText="Image"></asp:ImageField> 
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Senatwitter %>" SelectCommand="SELECT STATS.HUMOR, Politicians.Fname, Politicians.Lname, Politicians.imgPath FROM STATS INNER JOIN Politicians ON STATS.PID = Politicians.PID ORDER BY STATS.HUMOR DESC"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Senatwitter %>" SelectCommand="SELECT STATS.HOTNESS, Politicians.Fname, Politicians.Lname, Politicians.imgPath FROM STATS INNER JOIN Politicians ON STATS.PID = Politicians.PID ORDER BY STATS.HOTNESS DESC"></asp:SqlDataSource>
            <br />
            
        </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    </form>
    
</body>
</html>

