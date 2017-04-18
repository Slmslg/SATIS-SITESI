<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdresEkle.aspx.cs" Inherits="SATIS_SITESI.Pages.Admin.AdresEkle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Style/Adres.css" rel="stylesheet" />
    <style type="text/css">
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="kul-adres">
    
    <div class="adresEkle">
        <div id="kul-baslik"><h3>Kullanıcının Adres Bilgileri</h3></div>
        <table>
            <tr>
                <td><asp:Label ID="Label9" runat="server" Text="Kullanıcı ID"></asp:Label></td>
                <td class="auto-style2">
                    <asp:DropDownList ID="kulIDropDown" CssClass="kulIDropDown" runat="server" DataSourceID="KullaniciID" DataTextField="KULLANICI_AD" DataValueField="KULLANICI_ID" Height="30px" Width="160px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    
                    <asp:SqlDataSource ID="KullaniciID" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CommerceDatabaseConnectionString %>" DeleteCommand="DELETE FROM [KULLANICI] WHERE [KULLANICI_ID] = @original_KULLANICI_ID AND (([KULLANICI_AD] = @original_KULLANICI_AD) OR ([KULLANICI_AD] IS NULL AND @original_KULLANICI_AD IS NULL))" InsertCommand="INSERT INTO [KULLANICI] ([KULLANICI_AD]) VALUES (@KULLANICI_AD)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [KULLANICI_ID], [KULLANICI_AD] FROM [KULLANICI]" UpdateCommand="UPDATE [KULLANICI] SET [KULLANICI_AD] = @KULLANICI_AD WHERE [KULLANICI_ID] = @original_KULLANICI_ID AND (([KULLANICI_AD] = @original_KULLANICI_AD) OR ([KULLANICI_AD] IS NULL AND @original_KULLANICI_AD IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="original_KULLANICI_ID" Type="Int32" />
                            <asp:Parameter Name="original_KULLANICI_AD" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="KULLANICI_AD" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="KULLANICI_AD" Type="String" />
                            <asp:Parameter Name="original_KULLANICI_ID" Type="Int32" />
                            <asp:Parameter Name="original_KULLANICI_AD" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    
                </td>
                <td><asp:ImageButton ID="idAra" runat="server"  ImageUrl="~/Img/products.png" Height="32px" Width="32px"  /></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label1" runat="server" Text="Sokak"></asp:Label></td>
                <td class="auto-style2"><asp:TextBox ID="sokaktext" runat="server" Width="160px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label2" runat="server" Text="Mahalle"></asp:Label></td>
                <td class="auto-style2"><asp:TextBox ID="mahText" runat="server" Width="160px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label3" runat="server" Text="Cadde"></asp:Label></td>
                <td class="auto-style2"><asp:TextBox ID="caddeText" runat="server" Width="160px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label4" runat="server" Text="Kapı No"></asp:Label></td>
                <td class="auto-style2"><asp:TextBox ID="kapiNoText" runat="server" Width="160px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label5" runat="server" Text="Daire No"></asp:Label></td>
                <td class="auto-style2"><asp:TextBox ID="daireNoText" runat="server" Width="160px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label6" runat="server" Text="İlçe"></asp:Label></td>
                <td class="auto-style2"><asp:TextBox ID="ilceText" runat="server" Width="160px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style3"><asp:Label ID="Label7" runat="server" Text="Şehir"></asp:Label></td>
                <td class="auto-style4"><asp:TextBox ID="sehirText" runat="server" Width="160px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label8" runat="server" Text="Posta Kodu"></asp:Label></td>
                <td class="auto-style2"><asp:TextBox ID="postaKodText" runat="server" Width="160px"></asp:TextBox></td>
            </tr>
           <tr>
               <td></td>
               <td class="auto-style2"><asp:Button ID="kaydet" CssClass="kaydet" runat="server" Text="KAYDET" OnClick="Button1_Click" Width="160px" /></td>
           </tr>
        </table>
   
    </div>
    <table><tr><td>
    <div class="kullaniciAdresleri">
        <asp:Label ID="Label10" CssClass="kullaniciAdresBaslik" runat="server" Text="Kullanıcı Adresleri"></asp:Label> <br />       
        <asp:Repeater ID="repeaterAdres" runat="server"> 
            <ItemTemplate>
                <p> <strong>Adres :</strong> <%#Eval("SOKAK")%> Sokak <%#Eval("CADDE")%> Caddesi <%#Eval("MAHALLE")%> Mahallesi Kapı Numarası : <%#Eval("KAPI_NO")%>  Daire No :<%#Eval("DAIRE_NO")%><%#Eval("ILCE")%>/ <%#Eval("SEHIR")%> <%#Eval("POSTA_KODU")%></p>                
            </ItemTemplate>
        </asp:Repeater>
    </div></td>
           </tr>
    </table>

 </div>

    <div class="gridView">
        <asp:Repeater ID="Repeater1" runat="server"></asp:Repeater>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="KULLANICI_ID" DataSourceID="KullaniciBilgileri" Height="330px" Width="346px" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="KULLANICI_ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="KULLANICI_ID" />
                <asp:BoundField DataField="KULLANICI_AD" HeaderText="AD" SortExpression="KULLANICI_AD" />
                <asp:BoundField DataField="KULLANICI_SOYAD" HeaderText="SOYAD" SortExpression="KULLANICI_SOYAD" />
                <asp:BoundField DataField="KULLANICI_SİFRE" HeaderText="SİFRE" SortExpression="KULLANICI_SİFRE" />
                <asp:BoundField DataField="KULLANICI_EPOSTA" HeaderText="E-POSTA" SortExpression="KULLANICI_EPOSTA" />
                <asp:BoundField DataField="YETKI" HeaderText="YETKİ" SortExpression="YETKI" />
                <asp:BoundField DataField="KULLANICI_CINSIYET" HeaderText="CİNSİYET" SortExpression="KULLANICI_CINSIYET" />
                <asp:BoundField DataField="KULLANICI_YAS" HeaderText="YAŞ" SortExpression="KULLANICI_YAS" />
                <asp:BoundField DataField="KULLANICI_TELEFON_NO" HeaderText="TELEFON NO" SortExpression="KULLANICI_TELEFON_NO" />
                <asp:BoundField DataField="KULLANICI_ADRES_ID" HeaderText="ADRES ID" SortExpression="KULLANICI_ADRES_ID" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="KullaniciBilgileri" runat="server" ConnectionString="<%$ ConnectionStrings:CommerceDatabaseConnectionString %>" SelectCommand="SELECT * FROM [KULLANICI]"></asp:SqlDataSource>
    </div>
</asp:Content>
