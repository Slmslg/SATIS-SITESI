using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SATIS_SITESI.Classes;

namespace SATIS_SITESI.Pages.User
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kullanici"] != null)
            {
                Label giris = this.Master.FindControl("giris") as Label;

                giris.Text = "Hoşgeldin " + Session["kullanici"].ToString();

                Label kayit = this.Master.FindControl("kayitLabel") as Label;
                kayit.Text = "Profilim";

            }

            if (IsPostBack)
            {
                if (Session["kullanici"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                TextBox giris = this.Master.FindControl("giris") as TextBox;
                String UrunID = Request.QueryString["urunID"];
                Yonetim sepetEkle = new Yonetim();
                giris.Text = UrunID;
                sepetEkle.sepeteEkle(Session["kullanici"].ToString(), UrunID);
                }
               
            }
        }
    }
}