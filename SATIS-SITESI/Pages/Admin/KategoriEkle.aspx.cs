using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using SATIS_SITESI.Classes;
namespace SATIS_SITESI.Pages.Admin
{
    public partial class KategoriEkle : System.Web.UI.Page
    {
        Yonetim yonet = new Yonetim();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {            
            String id = katIDDrop.SelectedValue;
            yonet.kategoriEkle(kategoriText.Text, id);
        }
    }
}