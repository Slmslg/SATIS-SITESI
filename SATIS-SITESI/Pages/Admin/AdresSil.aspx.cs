using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SATIS_SITESI.Classes;

namespace SATIS_SITESI.Pages.Admin
{
    public partial class AdresSil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                adresSilDrop.Items.Clear();
            }
        }

        protected void adresSilDrop_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void silButon_Click(object sender, EventArgs e)
        {

        }

        protected void kulDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            adresSilDrop.Items.Clear();
            List<String> liste = new List<string>();
            IDIslemleri idIslem = new IDIslemleri();
            idIslem.adres(kulDropDown.SelectedValue);
            foreach(var item in idIslem.dlist.SelectedValue)
            {
                adresSilDrop.SelectedValue = item.ToString();
            }
            foreach (var item in idIslem.dlist.SelectedValue)
            {
                adresSilDrop.SelectedValue = item.ToString();
            }
            foreach (var item in idIslem.dlist.SelectedItem.Text)
            {
                adresSilDrop.SelectedValue = item.ToString();
            }
        }
    }
}