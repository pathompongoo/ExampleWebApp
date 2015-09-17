<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StudentReport.aspx.cs" Inherits="CSharpWebApp.Reports.StudentReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="section_content_header" runat="server">
    <h1>Student Management
           
        <small>Report</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="Default.aspx"><i class="fa fa-home"></i>Home</a></li>
        <li><a href="StudentForm.aspx">Student Management</a></li>
        <li class="active">Report</li>
    </ol>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="section_content" runat="server">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="600px" Width="100%" SizeToReportContent="True">
            <LocalReport ReportPath="Reports\Report1.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource Name="DataSet1" DataSourceId="SqlDataSource1"></rsweb:ReportDataSource>
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>

        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ExampleDBConnectionString %>' SelectCommand="SELECT * FROM [StudentView]"></asp:SqlDataSource>
    </form>
</asp:Content>
