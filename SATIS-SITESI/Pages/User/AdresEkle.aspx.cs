using SATIS_SITESI.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SATIS_SITESI.Pages.User
{
    public partial class AdresEkle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Yonetim adres = new Yonetim();
            adres.adresEkle(Session["kullaniciID"].ToString(), sokakText.Text, caddeText.Text,mahalleText.Text, kapiNoText.Text, daireNoText.Text, ilcetext.Text, sehirText.Text, postaKoduText.Text);
            Label9.Text = "Ekleme İşlemi Gerçekleştirilmiştir.";
        }
    }
}