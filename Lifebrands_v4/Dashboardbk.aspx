<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboardbk.aspx.cs" Inherits="Lifebrands_v4.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet1.css" rel="stylesheet" />

    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            height: 95px;
        }
    </style>

    <title>Dashboard</title>
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
          <li class="selected"><a href="Dashboard.aspx">Home</a></li>
          <li><a href="#">Contact</a></li>
          <li><a href="#">Logout</a></li>          
        </ul>
      </div>
    </div>
    <div id="site_content">
        <!-- Data Sources -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Lifebrands_v2ConnectionString %>" SelectCommand="SELECT [UserName] FROM [List_Employee]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Lifebrands_v2ConnectionString %>" SelectCommand="SELECT [Prod_Name] FROM [List_Product]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Lifebrands_v2ConnectionString %>" SelectCommand="SELECT [Vendor_Name] FROM [Vendor]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Lifebrands_v2ConnectionString %>" SelectCommand="SELECT [Promo_Name] FROM [Promo]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Lifebrands_v2ConnectionString %>" SelectCommand="
            SELECT DISTINCT a.UserName, e.Event_Name, e.Event_Date, s.IdSale
FROM Sale as s, Event AS e, aspnetusers AS a"></asp:SqlDataSource>
      <div id="content">

          <!-- Form -->

        <form id="form1" runat="server">
        <div>
            <h1>Dashboard</h1>
            <!-- table with information -->

            <table class="auto-style2">
                <tr>
                    <td class="auto-style3" style="vertical-align: top; text-align: left"><br />Event Name:<br />
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                       
                    </td>
                    <td class="auto-style3" style="text-align: left; vertical-align: top">Event Date: <br /> (YYYY-MM-DD format)<br />
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                      

                    </td>
                    <td class="auto-style3" style="vertical-align: top; text-align: left">Choose Employee:<br />
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="UserName" DataValueField="UserName" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True" Value="0" Text="Select One"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <br />
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="UserName" DataValueField="UserName" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True" Value="0" Text="Select One"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <br />
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1" DataTextField="UserName" DataValueField="UserName" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True" Value="0" Text="Select One"></asp:ListItem>
                        </asp:DropDownList>
                        
                    </td>
                    <td class="auto-style3" style="vertical-align: top; text-align: left">Choose vendor:<br />
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="Vendor_Name" DataValueField="Vendor_Name" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True" Value="0" Text="Select One"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <br />
                        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource3" DataTextField="Vendor_Name" DataValueField="Vendor_Name" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True" Value="0" Text="Select One"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <br />
                        <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource3" DataTextField="Vendor_Name" DataValueField="Vendor_Name" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True" Value="0" Text="Select One"></asp:ListItem>
                        </asp:DropDownList>
                        
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="vertical-align: top; text-align: left">Description:<br />
                    <asp:TextBox ID="TextBox3" runat="server" Height="107px" Width="257px"></asp:TextBox>                    </td>
                    <td style="vertical-align: top; text-align: left">Choose Product:<br />
                        <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource2" DataTextField="Prod_Name" DataValueField="Prod_Name" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True" Value="0" Text="Select One"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <br />
                        <br />
                        Choose Promotion:<br />
                        <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="SqlDataSource4" DataTextField="Promo_Name" DataValueField="Promo_Name" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True" Value="0" Text="Select One"></asp:ListItem>
                        </asp:DropDownList>
                        
                    </td>
                    <td style="vertical-align: top; text-align: left">Quantity of Product:<br />
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        
                        <br />
                        <br />
                        Sales Details</td>
                </tr>
            </table>
            <table class="auto-style2">
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Submit" Height="40px" OnClick="Button1_Click" Width="60px" />
                    </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Clear" Height="40px" OnClick="Button2_Click" Width="60px" />
                    </td>
                </tr>
                </table>
            

            
            </div>

          <p>Results Below:</p>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource5" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
    </form>

      </div>
    </div>
    <div id="content_footer">
    <div id="footer">
      Copyright &copy; Team D Website
    </div>
    </div>
  </div>
</body>
</html>