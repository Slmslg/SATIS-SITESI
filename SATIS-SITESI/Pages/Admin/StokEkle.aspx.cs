using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using SATIS_SITESI.Classes;

namespace SATIS_SITESI.Pages.Admin
{
    public partial class StokEkle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            for (int i = 0; i < 10000; i++)
            {
                urunAdetDrop.Items.Add(i.ToString());
            }
        }
        protected void urunAdetDrop_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Yonetim yonet = new Yonetim();
            yonet.baglantiAc();
            yonet.stokEkle(urunAdDrop.SelectedValue,urunAdetDrop.Text,firmaText.Text,urunAdDrop.SelectedValue);
        }

    }
}