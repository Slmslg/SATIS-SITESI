using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data.Sql;

namespace SATIS_SITESI.Classes
{
    public class KullaniciGiris:Baglanti
    {
        public String id, kulAd,hataMesaj;
        public byte kontrol = 0;
        public void kullaniciGirisi(String kAd,String kSifre) 
        {
            baglantiAc();
            cmd = new SqlCommand("SELECT * FROM KULLANICI WHERE KULLANICI_AD = @KulAdi AND KULLANICI_SİFRE = @KulSifre",baglan);
            cmd.Parameters.AddWithValue("@KulAdi",kAd);
            cmd.Parameters.AddWithValue("@KulSifre",kSifre);
            dr = cmd.ExecuteReader();
            while (dr.Read())
	        {
                kontrol++;
	            kulAd = dr["KULLANICI_AD"].ToString(); 
                id = dr["KULLANICI_ID"].ToString();
	        }       
        }
    }
}