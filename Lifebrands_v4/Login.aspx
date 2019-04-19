<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Lifebrands_v4.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        </style>
    <title>Login</title>
</head>
<body>
<div id="main">
    <div id="header">
      <div id="logo">
        <div id="logo_text">
          <!-- class="logo_colour", allows you to change the colour of the text -->
          <h1><a href="index.aspx">Life<span class="logo_colour">Brands</span></a></h1>
          <h2>We are new and improved for you convenience.</h2>
        </div>
      </div>
      <div id="menubar">
        <ul id="menu">
          <!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
          <li class="selected"><a href="Login.aspx">Login</a></li>          
          <li><a href="#">Register</a></li>
          
        </ul>
      </div>
    </div>
    <div id="site_content">
      <!-- Data Sources -->
        

      <div id="content">

          <!-- Form -->

    <form id="form1" runat="server">
                    <h1>Login</h1>

        <table class="auto-style2">
            <tr>
                <td>Email:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1"
                    ErrorMessage="Required Field" 
                    ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Password:</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox2"
                    ErrorMessage="Required Field" 
                    ForeColor="Red">*</asp:RequiredFieldValidator>
                    
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

<asp:ValidationSummary 
id="ValidationSummary1" 
DisplayMode="BulletList" 
runat="server"
HeaderText="You must enter a value in the following fields:" ForeColor="Red"
/>
    </form>

      </div>
    </div>
    <div id="content_footer"></div>
    <div id="footer">
      Copyright &copy; Team D Website
    </div>
  </div>
</body>
</html>
