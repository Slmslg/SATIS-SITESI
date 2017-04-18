using SATIS_SITESI.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SATIS_SITESI.Pages.User
{
    public partial class DirektSatinAl : System.Web.UI.Page
    {
        Double adet;
        Double Tutar;
        protected void Page_Load(object sender, EventArgs e)
        { 
            
            if (Request.QueryString["urunID"] == null)
            {
                Response.Redirect("Anasayfa.aspx");
            }
            else
            {
                String UrunID = Request.QueryString["urunID"];
                Yonetim goster = new Yonetim();
                goster.urunGoster(UrunID);
                while (goster.dr.Read())
                {
                urunAd.Text = goster.dr["URUN_ADI"].ToString();
                urunMarka.Text = goster.dr["MARKA_ADI"].ToString();
                urunModel.Text = goster.dr["MODEL_ADI"].ToString();
                urunFiyat.Text = goster.dr["URUN_FIYAT"].ToString();
                urunIndirim.Text = goster.dr["INDIRIM_ORANI"].ToString();
                urunSatis.Text = goster.dr["INDIRIMLI_FIYAT"].ToString();
                urunImage.ImageUrl = goster.dr["RESIM_YOL"].ToString();
                }
                goster.baglantiKapat();
                if (IsPostBack)
                {
                adet = Double.Parse(kacAdet.SelectedValue);
                Tutar = adet * (Double.Parse(urunSatis.Text));
                toplamTutar.Text = Tutar.ToString();
                }
            }
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
        }

        protected void satinAl_Click(object sender, EventArgs e)
        {
           
            if (Session["kullaniciID"]!=null)
            {
                String UrunID = Request.QueryString["urunID"];
                Yonetim satinAl = new Yonetim();
                Double adet = Double.Parse(kacAdet.SelectedValue);
                Double Tutar = adet * (Double.Parse(urunSatis.Text));
                satinAl.SepettenSatınAl(Session["kullaniciID"].ToString(), UrunID, adet.ToString(), Tutar.ToString());
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void yorumButon_Click(object sender, EventArgs e)
        {
            
            if (Session["kullanici"]!=null)
            {
                Yonetim yorum = new Yonetim();
                String UrunID = Request.QueryString["urunID"];
                yorum.yorumEkle(yorumText.Text, yorumBaslik.Text, UrunID, Session["kullaniciID"].ToString());
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}