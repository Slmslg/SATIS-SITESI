<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/User/User.Master" AutoEventWireup="true" CodeBehind="UyeOl.aspx.cs" Inherits="SATIS_SITESI.Pages.User.UyeOl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Style/UyeOl.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="uyeOl">

        <table>
            <tr>
                <td class="auto-style3"><asp:Label ID="Label1" runat="server" Text="Adı"></asp:Label></td>
                <td class="auto-style2"><asp:TextBox ID="kadText" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style3"><asp:Label ID="Label2" runat="server" Text="Soyad"></asp:Label></td>
                <td class="auto-style2"><asp:TextBox ID="soyadText" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style4"><asp:Label ID="Label3" runat="server" Text="Şifre"></asp:Label></td>
                <td class="auto-style5"><asp:TextBox ID="sifreText" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style3"><asp:Label ID="Label4" runat="server" Text="Şifre Tekrar"></asp:Label></td>
                <td class="auto-style2"><asp:TextBox ID="sifreTekrarText" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style3"><asp:Label ID="Label5" runat="server" Text="E-Posta"></asp:Label></td>
                <td class="auto-style2"><asp:TextBox ID="mailText" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="emailValidation" runat="server" ControlToValidate="mailText" ErrorMessage="Lütfen Geçerli Bir E-Posta Adresi Giriniz." Font-Italic="True" Font-Size="18px" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
               <td class="auto-style3"><asp:Label ID="Label6" runat="server" Text="Cinsiyet"></asp:Label></td>
                <td class="auto-style2">
                    <asp:DropDownList ID="cinsiyetDrop" runat="server" Height="16px" Width="125px" AutoPostBack="True">
                        <asp:ListItem Selected="True">BAY</asp:ListItem>
                        <asp:ListItem>BAYAN</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"><asp:Label ID="Label7" runat="server" Text="Yaş"></asp:Label></td>
                <td class="auto-style2"><asp:TextBox ID="yasText" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style3"><asp:Label ID="Label8" runat="server" Text="Telefon Numarası"></asp:Label></td>
                <td class="auto-style2"><asp:TextBox ID="telText" runat="server"></asp:TextBox></td>                
            </tr>
             <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2"><asp:Button ID="Button1" runat="server" Text="Ekle" OnClick="Button1_Click" Width="126px" /></td>                
            </tr>
            
        </table>

    </div>
</asp:Content>
