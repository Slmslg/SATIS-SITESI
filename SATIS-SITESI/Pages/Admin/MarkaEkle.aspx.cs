using SATIS_SITESI.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SATIS_SITESI.Pages.Admin
{
    public partial class MarkaEkle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Yonetim marka = new Yonetim();
            marka.markaEkle(markaText.Text);
            Label2.Visible = true;
            Label2.Text = "Marka Eklenmiştir.";
        }
    }
}