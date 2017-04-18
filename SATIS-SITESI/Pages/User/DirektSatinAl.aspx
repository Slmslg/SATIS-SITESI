<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/User/User.Master" AutoEventWireup="true" CodeBehind="DirektSatinAl.aspx.cs" Inherits="SATIS_SITESI.Pages.User.DirektSatinAl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="../../Style/UrunDetay.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="urun-div">   
         <div class="urunresmi">  
             <asp:Image ID="urunImage" CssClass="urunImage" runat="server" />
         </div>   
     <div class="urun-baslik">                   
           <asp:Label ID="urunAd" CssClass="urunAd" runat="server" Text="-"></asp:Label>
     </div>
               
         <div class="urunBilgileri">
             <table>
                 
                  <tr>
                     <td>
                         <asp:Label ID="Label2" runat="server" Text="Marka"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="urunMarka" runat="server" Text="-"></asp:Label>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <asp:Label ID="Label3" runat="server" Text="Model"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="urunModel" runat="server" Text="-"></asp:Label>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <asp:Label ID="Label4" runat="server" Text="Fiyat"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="urunFiyat" runat="server" Text="-"></asp:Label>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <asp:Label ID="Label5" runat="server" Text="Indirim Oranı"></asp:Label>
                     </td>
                     <td>
                         %  <asp:Label ID="urunIndirim" runat="server" Text="-"></asp:Label>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <asp:Label ID="Label6" runat="server" Text="İndirimli Fiyatı"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="urunSatis" CssClass="urunSatis" runat="server" Text="-"></asp:Label>
                     </td>
                 </tr>
                  <tr>
                     <td>
                         <asp:Label ID="Label7" runat="server" Text="Adet "></asp:Label>
                     </td>
                     <td>
                         <asp:DropDownList ID="kacAdet" runat="server" AutoPostBack="True" DataTextField="1">
                             <asp:ListItem Selected="True">1</asp:ListItem>
                             <asp:ListItem>2</asp:ListItem>
                             <asp:ListItem>3</asp:ListItem>
                             <asp:ListItem>4</asp:ListItem>
                             <asp:ListItem>5</asp:ListItem>
                             <asp:ListItem>5</asp:ListItem>
                             <asp:ListItem>7</asp:ListItem>
                             <asp:ListItem>8</asp:ListItem>
                             <asp:ListItem>9</asp:ListItem>
                             <asp:ListItem>10</asp:ListItem>
                         </asp:DropDownList>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <asp:Label ID="Label8" runat="server" Text="Toplam Tutar"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="toplamTutar" CssClass="toplamTutar" runat="server" Text="-"></asp:Label>
                     </td>
                 </tr>
                 <tr>
                     <td></td>
                     <td>
                        <asp:Button ID="satinAl" CssClass="satinAl" runat="server" Text="SATIN AL" OnClick="satinAl_Click" />
                     </td>
                 </tr>
             </table>
         </div>      
                     
     </div>
    <div>
        <h3>YORUMLAR</h3>
    </div>
    <div class="yorumYap">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Başlık"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="yorumBaslik" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td>
                    <asp:TextBox ID="yorumText" runat="server" Height="105px" TextMode="MultiLine" Width="455px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="yorumButon" runat="server" Text="ONAYLA" OnClick="yorumButon_Click" CssClass="yorumButon" />
                </td>
            </tr>
        </table>
    </div>
    <div class="yorumlar">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="Yorumlar">
           <ItemTemplate>
               <div class="yorumKisi">
               <span class="baslik"><%#Eval("BASLIK") %></span>
               <span class="metin"><%#Eval("METIN") %></span>
               </div>
           </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="Yorumlar" runat="server" ConnectionString="<%$ ConnectionStrings:CommerceDatabaseConnectionString %>" SelectCommand="SELECT [BASLIK], [METIN] FROM [YORUMLAR] WHERE ([URUN_ID] = @URUN_ID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="URUN_ID" QueryStringField="urunID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
