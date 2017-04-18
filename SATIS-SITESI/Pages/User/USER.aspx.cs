using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SATIS_SITESI.Classes;

namespace SATIS_SITESI.Pages.User
{
    public partial class USER : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Yonetim kulGoster = new Yonetim();
            kulGoster.kullaniciGoster(Session["kullaniciID"].ToString());
            while (kulGoster.dr.Read())
            {
                kullaniciAd.Text = kulGoster.dr["KULLANICI_AD"].ToString();
                soyad.Text = kulGoster.dr["KULLANICI_SOYAD"].ToString();
                ePosta.Text = kulGoster.dr["KULLANICI_EPOSTA"].ToString();
                sifre.Text = kulGoster.dr["KULLANICI_SİFRE"].ToString();
                cinsiyet.Items.Add(kulGoster.dr["KULLANICI_CINSIYET"].ToString());
                yas.Text = kulGoster.dr["KULLANICI_YAS"].ToString();
                telNo.Text = kulGoster.dr["KULLANICI_TELEFON_NO"].ToString();
            }
            kulGoster.baglantiKapat();
        }

        protected void guncelle_Click(object sender, EventArgs e)
        {
            Yonetim guncelle = new Yonetim();
            guncelle.kullaniciGuncelle(Session["kullaniciID"].ToString(), kullaniciAd.Text, soyad.Text, sifre.Text, ePosta.Text, "0", cinsiyet.Text, yas.Text, telNo.Text, "0");
        }

        protected void adresEkleme_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdresEkle.aspx");
        }
    }
}