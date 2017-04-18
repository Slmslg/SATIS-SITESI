using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using SATIS_SITESI.Classes;
using System.Web.UI.WebControls;

namespace SATIS_SITESI.Classes
{
    
    public class IDIslemleri:Baglanti
    {
        public string id;
        public DropDownList ds = new DropDownList();
        public List<String> IdAl(String id) 
        {
            List<String> liste = new List<string>();
            baglantiAc();
            cmd = new SqlCommand("SELECT * FROM MODEL WHERE MARKA_ID = @markaID", baglan);
            cmd.Parameters.AddWithValue("@markaID",id);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                liste.Add(dr["MODEL_AD"].ToString());
            }
            return liste;
        }
        public List<String> liste = new List<String>();
        public DropDownList dlist = new DropDownList();
        public void adres(String id)
        {
            
            baglantiAc();
            cmd = new SqlCommand("SELECT * FROM ADRES WHERE KULLANICI_ID = @KullaniciID", baglan);
            cmd.Parameters.AddWithValue("@KullaniciID", id);
           // SqlDataReader dr = new SqlDataReader();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                dlist.SelectedItem.Text = dr["SOKAK"].ToString()+" "+dr["MAHALLE"].ToString();
                dlist.SelectedValue = dr["KULLANICI_ADRES_ID"].ToString();
            }
        }
       
    }
}