using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SATIS_SITESI.Classes;

namespace SATIS_SITESI.Pages.User
{
    public partial class YorumSil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kullaniciID"]==null)
            {
                Response.Redirect("Login.aspx");
            }
            
        }
    }
}