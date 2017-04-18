<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SATIS_SITESI.Pages.User.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Style/GirisStil.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="login">
            <div id="kullaniciAd">
                 <img src="../../Img/man.png" />
                 <asp:TextBox ID="kAD" runat="server" placeholder="Kullanıcı Adınız"></asp:TextBox><br/>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="kAD" ErrorMessage="Boş Geçilemez" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div id="kullaniciAd">
                <img src="../../Img/key.png" />
                <asp:TextBox ID="kSifre" runat="server" placeholder="Şifre" TextMode="Password"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="kSifre" ErrorMessage="Boş Geçilemez" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
             <div id="kullaniciAd">
                <asp:Button ID="onayButon" runat="server" Text="Giriş Yap" OnClick="onayButon_Click" style="height: 26px" />
            </div>
            <div id="kullaniciAd">
                <a href="Forget.aspx">
                <asp:Label ID="forget" CssClass="forget" runat="server" Text=" |Şifreyi Unuttuysan!"></asp:Label>
                </a>
                <a href="UyelOl.aspx">
                <asp:Label ID="uyeOl" CssClass="uyeOl" runat="server" Text="|Kayıt Ol"></asp:Label>
                </a>
            </div>            
        </div>

    </form>
</body>
</html>
