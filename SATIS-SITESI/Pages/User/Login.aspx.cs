using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SATIS_SITESI.Classes;

namespace SATIS_SITESI.Pages.User
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void onayButon_Click(object sender, EventArgs e)
        {
            KullaniciGiris login = new KullaniciGiris();
            login.kullaniciGirisi(kAD.Text,kSifre.Text);
            Session["kullanici"] = login.kulAd.ToString();
            Session["kullaniciID"] = login.id.ToString();
            if (login.kontrol > 0)
            {
                forget.Text = Session["kullaniciID"].ToString();
                Response.Redirect("Anasayfa.aspx");
            }
            else
            {
                Response.Redirect("UyeOl.aspx");
            }
        }
    }
}