using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SATIS_SITESI.Classes;

namespace SATIS_SITESI.Pages.User
{
    public partial class UyeOl : System.Web.UI.Page
    {
        Yonetim yonet = new Yonetim();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kullanici"] == null)
            {
                
            }
            else
            {
                Response.Redirect("Anasayfa.aspx");   
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            yonet.baglantiAc();
            String yetki = "1";
            Random r = new Random();
            int sayi = r.Next() * 100;
            String rastgele = sayi.ToString();            
            yonet.kullaniciEkle(kadText.Text, soyadText.Text, sifreText.Text, mailText.Text, yetki, cinsiyetDrop.SelectedValue, yasText.Text, telText.Text, rastgele);
        
        }
    }
}