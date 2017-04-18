<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/User/User.Master" AutoEventWireup="true" CodeBehind="AdresEkle.aspx.cs" Inherits="SATIS_SITESI.Pages.User.AdresEkle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Style/AdresEkle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="adresHeader"> <p><h3>Adres Ekle</h3></p></div>
    <div class="adresEkle">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Sokak"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="sokakText" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Mahalle"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="mahalleText" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Cadde"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="caddeText" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Kapı No"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="kapiNoText" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Daire No"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="daireNoText" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="İlçe"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="ilcetext" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Şehir"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="sehirText" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Posta Kodu"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="postaKoduText" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Ekle" OnClick="Button1_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
