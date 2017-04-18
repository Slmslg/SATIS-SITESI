﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="StokEkle.aspx.cs" Inherits="SATIS_SITESI.Pages.Admin.StokEkle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Style/Stok.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="stokEkle">
        <h3>
            STOK EKLE İŞLEMİ
        </h3>
        <table>
            <tr>
                <td class="auto-style2"><asp:Label ID="Label1" runat="server" Text="Ürün Adı : "></asp:Label></td>
                <td><asp:DropDownList ID="urunAdDrop" runat="server" DataSourceID="SqlDataSource1" DataTextField="URUN_ADI" DataValueField="URUN_ID" CssClass="urunAdDrop"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CommerceDatabaseConnectionString %>" SelectCommand="SELECT * FROM [URUNLER]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"><asp:Label ID="Label2" runat="server" Text="Firma Adı : "></asp:Label></td>
                <td><asp:TextBox ID="firmaText" runat="server" Width="180px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style2"><asp:Label ID="Label3" runat="server" Text="Ürün Adeti : "></asp:Label></td>
                <td><asp:DropDownList ID="urunAdetDrop" runat="server" OnSelectedIndexChanged="urunAdetDrop_SelectedIndexChanged" CssClass="urunAdetDrop"></asp:DropDownList></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Img/accept.png" OnClick="ImageButton1_Click" CssClass="accept" />
                </td>
            </tr>
        </table>
    </div>
    <div class="clear"></div>
    <div class="stokSil">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" AutoGenerateSelectButton="True" CellPadding="4" DataKeyNames="SATIS_ID" DataSourceID="StokSilDataSource" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="STOK_ID" HeaderText="STOK_ID" SortExpression="STOK_ID" />
                <asp:BoundField DataField="URUN_STOK_ADET" HeaderText="URUN_STOK_ADET" SortExpression="URUN_STOK_ADET" />
                <asp:BoundField DataField="FIRMA_AD" HeaderText="FIRMA_AD" SortExpression="FIRMA_AD" />
                <asp:BoundField DataField="URUN_ID" HeaderText="URUN_ID" SortExpression="URUN_ID" />
                <asp:BoundField DataField="SATIS_ID" HeaderText="SATIS_ID" InsertVisible="False" ReadOnly="True" SortExpression="SATIS_ID" />
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
        <asp:SqlDataSource ID="StokSilDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CommerceDatabaseConnectionString %>" DeleteCommand="DELETE FROM [STOK] WHERE [SATIS_ID] = @SATIS_ID" InsertCommand="INSERT INTO [STOK] ([STOK_ID], [URUN_STOK_ADET], [FIRMA_AD], [URUN_ID]) VALUES (@STOK_ID, @URUN_STOK_ADET, @FIRMA_AD, @URUN_ID)" SelectCommand="SELECT * FROM [STOK]" UpdateCommand="UPDATE [STOK] SET [STOK_ID] = @STOK_ID, [URUN_STOK_ADET] = @URUN_STOK_ADET, [FIRMA_AD] = @FIRMA_AD, [URUN_ID] = @URUN_ID WHERE [SATIS_ID] = @SATIS_ID">
            <DeleteParameters>
                <asp:Parameter Name="SATIS_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="STOK_ID" Type="Int32" />
                <asp:Parameter Name="URUN_STOK_ADET" Type="Int32" />
                <asp:Parameter Name="FIRMA_AD" Type="String" />
                <asp:Parameter Name="URUN_ID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="STOK_ID" Type="Int32" />
                <asp:Parameter Name="URUN_STOK_ADET" Type="Int32" />
                <asp:Parameter Name="FIRMA_AD" Type="String" />
                <asp:Parameter Name="URUN_ID" Type="Int32" />
                <asp:Parameter Name="SATIS_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
