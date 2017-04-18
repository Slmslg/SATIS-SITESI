using SATIS_SITESI.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SATIS_SITESI.Pages.Admin
{
    public partial class YorumEkle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Guncelle")
            {
                       // butona tıklayınca olacaklar
                    int index = Convert.ToInt32(e.CommandArgument);
                    TableRow yorum = GridView1.Rows[index];
                    String yorumID = yorum.Cells[1].Text;
                    Yonetim yorumlar = new Yonetim();
                    yorumlar.yorumOnay(yorumID);
            }
        }
    }
}
   