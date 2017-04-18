<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/User/User.Master" AutoEventWireup="true" CodeBehind="YorumSil.aspx.cs" Inherits="SATIS_SITESI.Pages.User.YorumSil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Style/YorumSil.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="yorumSil">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <p><%#Eval("BASLIK") %></p>
            <p><%#Eval("METIN") %></p>
            <p><%#Eval("URUN_ID") %></p>
            <asp:Button ID="Button1" runat="server" Text="SİL" PostBackUrl='<%# "Onayla.aspx?urunID="+Eval("URUN_ID") %>'/>
        </ItemTemplate>
    </asp:Repeater>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CommerceDatabaseConnectionString %>" SelectCommand="SELECT * FROM [YORUMLAR] WHERE ([KULLANICI_ID] = @KULLANICI_ID)">
        <SelectParameters>
            <asp:SessionParameter Name="KULLANICI_ID" SessionField="kullaniciID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
