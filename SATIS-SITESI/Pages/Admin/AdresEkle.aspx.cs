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
    public partial class AdresEkle : System.Web.UI.Page
    { 
        Yonetim yonet = new Yonetim();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            
            yonet.baglantiAc();
            yonet.adresEkle(kulIDropDown.SelectedValue, sokaktext.Text, caddeText.Text, mahText.Text, kapiNoText.Text, daireNoText.Text, ilceText.Text, sehirText.Text, postaKodText.Text);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            if (!Page.IsPostBack)
            {
                Label10.Text = kulIDropDown.SelectedValue.ToString();
            }
            yonet.baglantiAc();
            SqlCommand cmd = new SqlCommand("SELECT * FROM ADRES WHERE KULLANICI_ID = @KulID", yonet.baglan);
            cmd.Parameters.AddWithValue("@KulID", kulIDropDown.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);            
            DataTable dt = new DataTable();
            da.Fill(dt);
            repeaterAdres.DataSource = dt;
            repeaterAdres.DataBind();
            yonet.baglantiKapat();
        }
    }
}