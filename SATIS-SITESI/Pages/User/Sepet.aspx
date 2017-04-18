<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/User/User.Master" AutoEventWireup="true" CodeBehind="Sepet.aspx.cs" Inherits="SATIS_SITESI.Pages.User.Sepet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Style/Sepet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="kullanici">
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:GridView ID="GridView1" CssClass="GridViewSepet" runat="server" AllowSorting="True" CellPadding="4" DataSourceID="SepetListele" ForeColor="#333333" GridLines="None" Height="115px" Width="842px" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="URUN_ID">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:CheckBox ID="sec" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Seç" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="secilenCheck" runat="server" AutoPostBack="True" OnCheckedChanged="secilenCheck_CheckedChanged" Text="Seç" />
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                              <asp:ListItem Value="1"></asp:ListItem>  
                               <asp:ListItem Value="2"></asp:ListItem> 
                               <asp:ListItem Value="3"></asp:ListItem> 
                               <asp:ListItem Value="4"></asp:ListItem> 
                               <asp:ListItem Value="5"></asp:ListItem> 
                               <asp:ListItem Value="6"></asp:ListItem> 
                               <asp:ListItem Value="7"></asp:ListItem>
                               <asp:ListItem Value="8"></asp:ListItem>
                               <asp:ListItem Value="9"></asp:ListItem>
                               <asp:ListItem Value="10"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:LinkButton  ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
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
    </div>
    <div class="sepet">
       
        <asp:SqlDataSource ID="SepetListele" runat="server" ConnectionString="<%$ ConnectionStrings:CommerceDatabaseConnectionString %>" SelectCommand="SELECT * FROM [SEPET] WHERE ([KULLANICI_ID] = @KULLANICI_ID)" DeleteCommand="DELETE FROM [SEPET] WHERE ([URUN_ID] = @URUN_ID)">
            <SelectParameters>
                <asp:SessionParameter Name="KULLANICI_ID" SessionField="kullaniciID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        
    </div><div class="clear"></div>
    <div class="satisDiv">
        <asp:Button ID="satinAl" runat="server" Text="SATIN AL" OnClick="satinAl_Click" CssClass="satinAlButon" />
    </div>
    <div class="clear"></div>
    <div class="odeme">
        <div class="odemeTutar">
        <asp:Label ID="toplamYazisi" runat="server" Text="TOPLAM" CssClass="toplamLabel"></asp:Label>
        <asp:Label ID="toplamFiyat" runat="server" Text="0"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="  TL"></asp:Label>
        </div>
    </div>
    <div class="alinmisUrunler">

        <asp:GridView ID="GridView2" CssClass="GridSatinAlinmis" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SatinAlınanlar" ForeColor="#333333" GridLines="None" Width="846px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="URUN_ID" HeaderText="ÜRÜN ID" SortExpression="URUN_ID" />
                <asp:BoundField DataField="ALIS_ADET" HeaderText="ADET" SortExpression="ALIS_ADET" />
                <asp:BoundField DataField="TOPLAM_TUTAR" HeaderText="TOPLAM TUTAR" SortExpression="TOPLAM_TUTAR" />
                <asp:BoundField DataField="SATIS_DURUM" HeaderText="SATIŞ DURUM" SortExpression="SATIS_DURUM" />
                <asp:BoundField DataField="KULLANICI_ID" HeaderText="KULLANICI ID" SortExpression="KULLANICI_ID" />
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
        <asp:SqlDataSource ID="SatinAlınanlar" runat="server" ConnectionString="<%$ ConnectionStrings:CommerceDatabaseConnectionString %>" SelectCommand="SELECT * FROM [SATIS] WHERE ([KULLANICI_ID] = @KULLANICI_ID)">
            <SelectParameters>
                <asp:SessionParameter Name="KULLANICI_ID" SessionField="kullaniciID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>
