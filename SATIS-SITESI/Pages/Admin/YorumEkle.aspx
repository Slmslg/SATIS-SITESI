<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="YorumEkle.aspx.cs" Inherits="SATIS_SITESI.Pages.Admin.YorumEkle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="YORUM_ID" DataSourceID="YorumDataSource" ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="YORUM_ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="YORUM_ID" />
                <asp:BoundField DataField="METIN" HeaderText="YORUMLAR" SortExpression="METIN" />
                <asp:BoundField DataField="BASLIK" HeaderText="BAŞLIK" SortExpression="BASLIK" />
                <asp:BoundField DataField="URUN_ID" HeaderText="ÜRÜN ID" SortExpression="URUN_ID" />
                <asp:BoundField DataField="KULLANICI_ID" HeaderText="KULLANICI D" SortExpression="KULLANICI_ID" />
                <asp:BoundField DataField="DURUM" HeaderText="DURUM" SortExpression="DURUM" />
                <asp:ButtonField ButtonType="Button" CommandName="Guncelle" HeaderText="Onayla" ShowHeader="True" Text="Onayla" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="YorumDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CommerceDatabaseConnectionString %>" SelectCommand="SELECT YORUM_ID, METIN, BASLIK, URUN_ID, KULLANICI_ID, DURUM FROM YORUMLAR WHERE (DURUM = '0')" ></asp:SqlDataSource>
    </div>
    </asp:Content>
