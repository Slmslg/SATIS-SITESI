using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SATIS_SITESI.Classes;
using System.IO;

namespace SATIS_SITESI.Pages.Admin
{
    public partial class UrunEkle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void markaDrop_SelectedIndexChanged(object sender, EventArgs e)
        {
            modelDrop.Items.Clear();
            List<String> liste = new List<string>();
            IDIslemleri idIslem = new IDIslemleri();
            liste = idIslem.IdAl(markaDrop.SelectedValue);
            foreach (var item in liste)
            {
                modelDrop.Items.Add(item);
            }
            
        }

        protected void urunEkleButon_Click(object sender, EventArgs e)
        {
            if (resimUpload.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(resimUpload.FileName);
                    resimUpload.SaveAs(Server.MapPath("~/Img/") + filename);
                }
                catch (System.Data.SqlClient.SqlException)
                {
                    Response.Write("<script>alert('HATA OLUŞTU')</script>");
                }
            }
            Yonetim urun = new Yonetim();
            Random r = new Random();
            String sayi = (r.Next()/1000).ToString();
            decimal fiyat = Convert.ToDecimal(fiyatText.Text);
            decimal indirimliFiyat = 0;
            urun.urunEkle(urunAdText.Text, markaDrop.Text, modelDrop.Text, fiyat, indirimliFiyat, indirimText.Text, "../../Img/" + resimUpload.FileName, kategoriDrop.SelectedValue, "0", sayi);
        }
    }
}