using SATIS_SITESI.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SATIS_SITESI.Pages.User
{
    public partial class Onayla : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["kullaniciID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (IsPostBack)
            {
                Yonetim yorum = new Yonetim();
                String UrunID = Request.QueryString["urunID"];
                //yorum.yorumSil(UrunID, Session["kullaniciID"].ToString());
                Response.Redirect("YorumSil.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("YorumSil.aspx");
        }
    }
}