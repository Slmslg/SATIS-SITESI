using SATIS_SITESI.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SATIS_SITESI.Pages.Admin
{
    public partial class ModelEkle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Yonetim model = new Yonetim();
            model.modelEkle(markaDrop.SelectedValue,modelText.Text);
            Label3.Text = "Başarıyla eklenmiştir.";
            Label3.Visible = true;
        }
    }
}