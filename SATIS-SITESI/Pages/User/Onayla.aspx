<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Onayla.aspx.cs" Inherits="SATIS_SITESI.Pages.User.Onayla" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Onaylıyor Musunuz ?</h1>
        <asp:Button ID="Button1" runat="server" Text="Evet" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Hayır" OnClick="Button2_Click" />
    </div>
    </form>
</body>
</html>
