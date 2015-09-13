<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StudentGridForm.aspx.cs" Inherits="CSharpWebApp.StudentGridForm" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="section_content_header" runat="server">
    <h1>Student Management
           
        <small>Student Details on Grid</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="Default.aspx"><i class="fa fa-home"></i>Home</a></li>
        <li><a href="StudentForm.aspx">Student Management</a></li>
        <li class="active">Show on Grid</li>
    </ol>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="section_content" runat="server">
    <asp:GridView ID="GridView1" runat="server" DataSourceID="EntityDataSource1" 
        CssClass="table table-striped table-bordered table-condensed table-responsive box-body" 
        EmptyDataText="There is no some data on database.">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ButtonType="Button" ShowHeader="True" HeaderText="Command" 
                ItemStyle-CssClass="btn btn-sm btn-default"></asp:CommandField>
        </Columns>
    </asp:GridView>
    <ef:EntityDataSource runat="server" ID="EntityDataSource1"
        OnContextCreating="EntityDataSource1_ContextCreating"
         EntitySetName="People" EntityTypeFilter="Student" 
         EnableDelete="true" EnableUpdate="true"></ef:EntityDataSource>
</asp:Content>
