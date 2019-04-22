<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Lifebrands_v4.Dashboard1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />

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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Lifebrands_v2ConnectionString %>" SelectCommand="SELECT [UserName] FROM [aspnetusers]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Lifebrands_v2ConnectionString %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Lifebrands_v2ConnectionString %>" SelectCommand="SELECT [Vendor_Name] FROM [Vendor]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Lifebrands_v2ConnectionString %>" SelectCommand="SELECT [Promo_Name] FROM [Promo]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Lifebrands_v2ConnectionString %>" SelectCommand="SELECT * FROM [Event]" DeleteCommand="DELETE FROM [Event] WHERE [IdEvent] = @IdEvent" InsertCommand="INSERT INTO [Event] ([IdEvent], [Event_Name], [Event_Description], [Event_Date]) VALUES (@IdEvent, @Event_Name, @Event_Description, @Event_Date)" UpdateCommand="UPDATE [Event] SET [Event_Name] = @Event_Name, [Event_Description] = @Event_Description, [Event_Date] = @Event_Date WHERE [IdEvent] = @IdEvent">
            <DeleteParameters>
                <asp:Parameter Name="IdEvent" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="IdEvent" Type="String" />
                <asp:Parameter Name="Event_Name" Type="String" />
                <asp:Parameter Name="Event_Description" Type="String" />
                <asp:Parameter DbType="Date" Name="Event_Date" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Event_Name" Type="String" />
                <asp:Parameter Name="Event_Description" Type="String" />
                <asp:Parameter DbType="Date" Name="Event_Date" />
                <asp:Parameter Name="IdEvent" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Lifebrands_v2ConnectionString %>" SelectCommand="SELECT * FROM [Sale]">
        
    </asp:SqlDataSource>

      <style>

    body { 
        background-color: #f0efe2;
    }
    .navbar-inverse {
    background-color: #192737;
    border-color: #080808;
    color: white;
    }

    .navbar-inverse .navbar-nav > li > a {
    color: white;
    }

    .body-content {
    margin-top: 50px;
    padding-left: 0px;
    padding-right: 0px;
    background-color: white;
}

    .row {
    margin-right: 0px;
    margin-left: 0;
    }

    #footer_content {
    width: 200px;
    margin-left: auto !important;
    margin-right: auto !important;
}

    #footer_content p { 
        color: white;

    }

    #content_alt { padding-left: 15px; padding-right: 15px;}

}

      </style>
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/">LifeBrands,Inc</a>

                
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="/">Home</a></li>
                    <li><a href="/Home/About">About</a></li>
                    <li><a href="/Home/Contact">Contact</a></li>
                 </ul>
                    <ul class="nav navbar-nav navbar-right">
        <li><a href="/Home/Logout">Logout</a></li>
    </ul>

            </div>
        </div>
    </div>
    <div class="container body-content" style="padding-left: 15px; padding-right: 15px;">


          <!-- Form -->

        <form id="form1" runat="server">
        <div>
            <h1>Dashboard.</h1>

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
                        <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource2" DataTextField="Prod_Name" DataValueField="Cost" AppendDataBoundItems="True">
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
                        Sales Details:
                        <br /><br />
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
            <table class="auto-style2">
                <tr>
                    <td style="padding-top: 30px;">
                        <asp:Button ID="Button1" runat="server" Text="Submit" Height="40px" OnClick="Button1_Click" Width="60px" />
                    </td>
                    <td style="padding-top: 30px;">
                        <asp:Button ID="Button2" runat="server" Text="Clear" Height="40px" OnClick="Button2_Click" Width="60px" />
                    </td>
                    <td style="padding-top: 30px;">
                        <asp:Button ID="Button3" runat="server" Height="40px" OnClick="Button3_Click" Text="View" Width="60px" />
                    </td>
                </tr>
                </table>
            

            
            </div>
            <br />
            
          <h3>Results Below:</h3>
<br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource5" ForeColor="Black" GridLines="Vertical" DataKeyNames="IdEvent">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="IdEvent" HeaderText="IdEvent" ReadOnly="True" SortExpression="IdEvent" />
                    <asp:BoundField DataField="Event_Name" HeaderText="Event_Name" SortExpression="Event_Name" />
                    <asp:BoundField DataField="Event_Description" HeaderText="Event_Description" SortExpression="Event_Description" />
                    <asp:BoundField DataField="Event_Date" HeaderText="Event_Date" SortExpression="Event_Date" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>

             </form>

        <footer style="background-color: #192737; padding: 15px;">
            <div id="footer_content"><p>&copy; 2019 - Team D Website</p></div>
        </footer>
   </div>
</body>
</html>
