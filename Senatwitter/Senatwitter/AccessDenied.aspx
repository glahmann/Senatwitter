<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccessDenied.aspx.cs" Inherits="Senatwitter.AccessDenied" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 843px;
            height: 356px;
        }
        .auto-style2 {
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
        <div>
            <h1 class="auto-style2">
                <br />
                <br />
                <img alt="logo" class="auto-style1" src="images/senatwitter.png" /></h1>
            <h1><strong>Access Denied</strong></h1>
        </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    </form>
</body>
</html>
