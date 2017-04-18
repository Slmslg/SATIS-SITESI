<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/User/User.Master" AutoEventWireup="true" CodeBehind="Forget.aspx.cs" Inherits="SATIS_SITESI.Pages.User.Forget" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Style/SifreYenile.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="forget">
        <asp:Label ID="Label1" CssClass="epostaLabel" runat="server" Text="E-Posta Adresiniz"></asp:Label>
        <asp:TextBox ID="eposta" CssClass="email" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="eposta" ErrorMessage="Boş geçemezsiniz"></asp:RequiredFieldValidator>
        <asp:Button ID="Button1" CssClass="gonderButon" runat="server" Text="Şifre İsteği Gönder" OnClick="Button1_Click" />
        <asp:Label ID="Label2" CssClass="gonderildi" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
