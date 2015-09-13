<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StudentForm.aspx.cs" Inherits="CSharpWebApp.StudentForm" EnableEventValidation="false" %>
<%@ Register assembly="Microsoft.AspNet.EntityDataSource" namespace="Microsoft.AspNet.EntityDataSource" tagprefix="ef" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="section_content_header" runat="server">
    <h1>Student Management
           
        <small>Student Details</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="Default.aspx"><i class="fa fa-home"></i>Home</a></li>
        <li class="active">Student Management</li>
    </ol>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="section_content" runat="server">
    <div class="form-group">
        <label for="studentTitleName">คำนำหน้าชื่อ</label>
        <asp:DropDownList ID="TitleDropDownList" runat="server" 
            CssClass="form-control" 
            DataSourceID="EntityDataSource1" DataTextField="Name.TH" DataValueField="Id"></asp:DropDownList>
        <ef:EntityDataSource runat="server" ID="EntityDataSource1" 
            OnContextCreating="EntityDataSource1_ContextCreating"
            EntitySetName="Titles"></ef:EntityDataSource>

        <label for="studentFirstName">ชื่อ (ภาษาไทย)</label>
        <asp:TextBox ID="FirstNameTHTextBox" CssClass="form-control" runat="server"></asp:TextBox>
        <label for="studentLastName">นามสกุล (ภาษาไทย)</label>
        <asp:TextBox ID="LastNameTHTextBox" CssClass="form-control" runat="server"></asp:TextBox>
        <label for="studentFirstName">ชื่อ (ภาษาอังกฤษ)</label>
        <asp:TextBox ID="FirstNameENTextBox" CssClass="form-control" runat="server"></asp:TextBox>
        <label for="studentLastName">นามสกุล (ภาษาอังกฤษ)</label>
        <asp:TextBox ID="LastNameENTextBox" CssClass="form-control" runat="server"></asp:TextBox>
        <label for="gender">เพศ</label>
        <asp:DropDownList ID="GenderDropDownList" runat="server" DataSourceID="EntityDataSource2"
            DataTextField="Name.TH" DataValueField="Id" CssClass="form-control"></asp:DropDownList>
        <ef:EntityDataSource runat="server" ID="EntityDataSource2"
            OnContextCreating="EntityDataSource1_ContextCreating"
            EntitySetName="GenderSet"></ef:EntityDataSource>
        <label for="age">อายุ</label>
        <asp:TextBox ID="AgeTextBox" CssClass="form-control" runat="server"></asp:TextBox>
        <label for="gpa">เกรดเฉลี่ย</label>
        <asp:TextBox ID="GPATextBox" CssClass="form-control" runat="server"></asp:TextBox>
    </div>
    <asp:Button ID="SaveButton" runat="server" Text="Save" CssClass="btn btn-default" 
        OnClick="SaveButton_Click" />
</asp:Content>
