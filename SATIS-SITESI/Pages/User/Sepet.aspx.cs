using SATIS_SITESI.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SATIS_SITESI.Pages.User
{
    public partial class Sepet : System.Web.UI.Page
    { 
        public Double toplamTutar = 0;
        Yonetim sepet = new Yonetim();
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (Session["kullaniciID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (IsPostBack)
                {
                   foreach (GridViewRow item in GridView1.Rows)
                    {
                        if (((CheckBox)item.FindControl("secilenCheck")).Checked)
                        {
                            String secilenID = GridView1.DataKeys[item.RowIndex].Value.ToString();                        
                            DropDownList drop = (DropDownList)item.FindControl("DropDownList1");
                            String adet = drop.SelectedValue;
                            sepet.sepetToplam(Session["kullaniciID"].ToString(), secilenID);
                            toplamTutar += (sepet.tutar* Double.Parse(adet));
                            toplamFiyat.Text = Convert.ToString(toplamTutar);
                        }
                    } 
                }
            }
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
           
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
                       
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow item in GridView1.Rows)
            {
                ((CheckBox)item.FindControl("secilenCheck")).Checked = ((CheckBox)sender).Checked;
            }
            
        }

        protected void secilenCheck_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox tumCheck = (CheckBox)GridView1.HeaderRow.FindControl("sec");
            if (tumCheck.Checked)
            {
                tumCheck.Checked = ((CheckBox)sender).Checked;
            }
            else
            {
                bool secilimi = true;
                foreach (GridViewRow item in GridView1.Rows)
                {
                    if (!((CheckBox)item.FindControl("secilenCheck")).Checked)
                    {
                        secilimi = false;
                        
                        String secilenID = GridView1.DataKeys[item.RowIndex].Value.ToString();
                        DropDownList drop = (DropDownList)item.FindControl("DropDownList1");
                        String adet = drop.SelectedValue;
                        sepet.sepetToplam(Session["kullaniciID"].ToString(), secilenID);
                        toplamTutar += (sepet.tutar * Double.Parse(adet));
                        toplamFiyat.Text = Convert.ToString(toplamTutar);
                        break;
                    }
                }
                tumCheck.Checked = secilimi;
            }
        }

        protected void satinAl_Click(object sender, EventArgs e)
        {
         
            Yonetim sepetIslemi = new Yonetim();
            foreach (GridViewRow item in GridView1.Rows)
            {
                if (((CheckBox)item.FindControl("secilenCheck")).Checked)
                {
                    String secilenID = GridView1.DataKeys[item.RowIndex].Value.ToString();
                    //Double fiyat = Convert.ToDouble(GridView1.DataKeys[item.RowIndex].Value.ToString());
                    //sepetIslemi.SepetSil(Session["kullaniciID"].ToString(), secilenID);
                    DropDownList drop = (DropDownList)item.FindControl("DropDownList1");
                    sepetIslemi.sepetToplam(Session["kullaniciID"].ToString(), secilenID);
                    String adet = drop.SelectedValue;
                    Double tutar = Double.Parse(adet) * sepetIslemi.tutar;                   
                    sepetIslemi.SepettenSatınAl(Session["kullaniciID"].ToString(), secilenID, adet,tutar.ToString());
                }   
            }
           
        }
    }
}