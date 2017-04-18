using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SATIS_SITESI.Pages.User
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kullanici"] != null)
            {
                cikisYap.Visible = true;
                cikisLabel.Visible = true;
            }

        }

        protected void kayitOl_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["kullanici"]!=null)
            {
                Response.Redirect("Profilim.aspx");
            }
            else
            {
                Response.Redirect("UyeOl.aspx");
            }
        }
        protected void cikisYap_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["kullanici"] != null)
            {
                Response.Redirect("CikisYap.aspx");
            }
            else
            {
                Response.Redirect("UyeOl.aspx");
            }
        }

        protected void cikisYap_Click1(object sender, ImageClickEventArgs e)
        {

        }
    }
}