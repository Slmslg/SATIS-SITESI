using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace SATIS_SITESI.Classes
{
    public class Baglanti
    {
        public SqlCommand cmd;
        public SqlDataAdapter da;
        public SqlDataReader dr;
        public DataTable dt;
        public string sorgu = "";
        public SqlConnection baglan = new SqlConnection(@"Data Source=.;Initial Catalog=CommerceDatabase;Integrated Security=True");
        public void baglantiAc()
        {
            if (baglan.State == ConnectionState.Closed)
            {
                baglan.Open();
            }
        }
        public void baglantiKapat()
        {
            if (baglan.State == ConnectionState.Open)
            {
                baglan.Close();
            }
        }
    }
}