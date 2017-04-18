using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using SATIS_SITESI.Classes;


namespace SATIS_SITESI.Pages.Admin
{
    public partial class KullaniciEkle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        Yonetim yonet = new Yonetim();
        protected void Button1_Click(object sender, EventArgs e)
        {
            yonet.baglantiAc();
            String yetki;
            Random r = new Random();
            int sayi = r.Next()*100;
            String rastgele = sayi.ToString();
            if (yetkiDrop.SelectedValue == "User")
	            {
		         yetki = "0";
	            }
            else
	            {
                yetki = "1";
	            }
            yonet.kullaniciEkle(kadText.Text,soyadText.Text, sifreText.Text, mailText.Text,yetki,cinsiyetDrop.SelectedValue, yasText.Text, telText.Text,rastgele);
        }
    }
}