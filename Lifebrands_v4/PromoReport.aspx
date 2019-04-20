<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PromoReport.aspx.cs" Inherits="Lifebrands_v4.PromoReport" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Height="863px" Width="1314px">
            <Series>
                <asp:Series Name="Series1" XValueMember="Vendor_Name" YValueMembers="Total" ChartType="Column" />
               
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                    
                    <AxisY Title="Promotion Dollars">
                    </AxisY>
                    <AxisX Title="Vendor" IsLabelAutoFit="True">
                    <LabelStyle Angle="-90" Interval="1" />
                    </AxisX>
                    <Area3DStyle Enable3D="True" />
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT DISTINCT * FROM [Vendor_Promo_Money_Spent] ORDER BY [Vendor_Name]"></asp:SqlDataSource>
    </form>
</body>
</html>
