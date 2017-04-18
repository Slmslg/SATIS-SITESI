using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
    
namespace SATIS_SITESI.Classes
{
    public class Yonetim:Baglanti
    {
        public Double tutar = 0;
        public void kategoriEkle(String kategoriAd, string altKategoriID)
        {
            baglantiAc();
            //cmd = new SqlCommand("INSERT INTO KATEGORILER VALUES (@KategoriAd,@AltKategoriID)",baglan);
            cmd = new SqlCommand("PROC_KATEGORI_EKLE @KategoriAdi=@KategoriAdi,@AltKategoriID=@AltKategoriID", baglan);
            cmd.Parameters.AddWithValue("@KategoriAdi", kategoriAd);
            cmd.Parameters.AddWithValue("@AltKategoriID", altKategoriID);
            cmd.ExecuteNonQuery();
            baglantiKapat();
        }
        public void kategoriSil(String idKategori)
        {
            baglantiAc();
            cmd = new SqlCommand("PROC_KATEGORI_SIL @KategoriID=@KatgoriID",baglan);
            cmd.Parameters.AddWithValue("@KatgoriID", idKategori);
            cmd.ExecuteNonQuery();
            baglantiKapat();
        }
        public void markaEkle(String markaAd)
        {
            baglantiAc();
            cmd = new SqlCommand("INSERT INTO MARKA VALUES (@markaAdi)",baglan);
            cmd.Parameters.AddWithValue("@markaAdi", markaAd);
            cmd.ExecuteNonQuery();
            baglantiKapat();
        }
        public void modelEkle(String markaID,String model)
        {
            baglantiAc();
            cmd = new SqlCommand("INSERT INTO MODEL VALUES (@markaID,@modelAdi)", baglan);
            cmd.Parameters.AddWithValue("@markaID", markaID);
            cmd.Parameters.AddWithValue("@modelAdi", model);
            cmd.ExecuteNonQuery();
            baglantiKapat();
        }
      
        public void kullaniciEkle(String kulAd, String kulSoyad, String sifre, String email, String yetki, String cinsiyet, String yas, String telNo, String adresID)
        {
            baglantiAc();
            cmd = new SqlCommand("PROC_KULLANICI_EKLE @KullaniciAd=@kulAd,@Soyad=@kulSoyad,@Sifre=@sifre,@Posta=@email,@Yetki=@yetki,@Cinsiyet=@cinsiyet,@Yas=@yas,@TelNo=@telNo,@AdresID=@adresID", baglan);
            cmd.Parameters.AddWithValue("@kulAd", kulAd);
            cmd.Parameters.AddWithValue("@kulSoyad", kulSoyad);
            cmd.Parameters.AddWithValue("@sifre", sifre);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@yetki", yetki);
            cmd.Parameters.AddWithValue("@cinsiyet", cinsiyet);
            cmd.Parameters.AddWithValue("@telNo", telNo);
            cmd.Parameters.AddWithValue("@yas", yas);
            cmd.Parameters.AddWithValue("@adresID", adresID);
            SqlTransaction tran = baglan.BeginTransaction();
            tran.Commit();
            cmd.ExecuteNonQuery();
            baglantiKapat();
        }
        public void kullaniciGuncelle(String kID,String kulAd, String kulSoyad, String sifre, String email, String yetki, String cinsiyet, String yas, String telNo, String adresID)
        {
            baglantiAc();
            cmd = new SqlCommand("PROC_KULLANICI_GUNCELLE @KullaniciID,@KullaniciAd=@kulAd,@Soyad=@kulSoyad,@Sifre=@sifre,@Posta=@email,@Yetki=@yetki,@Cinsiyet=@cinsiyet,@Yas=@yas,@TelNo=@telNo,@AdresID=@adresID", baglan);
            cmd.Parameters.AddWithValue("@KullaniciID", kID);
            cmd.Parameters.AddWithValue("@kulAd", kulAd);
            cmd.Parameters.AddWithValue("@kulSoyad", kulSoyad);
            cmd.Parameters.AddWithValue("@sifre", sifre);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@yetki", yetki);
            cmd.Parameters.AddWithValue("@cinsiyet", cinsiyet);
            cmd.Parameters.AddWithValue("@telNo", telNo);
            cmd.Parameters.AddWithValue("@yas", yas);
            cmd.Parameters.AddWithValue("@adresID", adresID);
            SqlTransaction tran = baglan.BeginTransaction();
            tran.Commit();
            cmd.ExecuteNonQuery();
            baglantiKapat();
        }
        public void kullaniciSil(String kullaniciID)
        {
            baglantiAc();
            cmd = new SqlCommand("PROC_KULLANICI_SIL @KullaniciID = @KullaniciID",baglan);
            cmd.Parameters.AddWithValue("@KullaniciID",kullaniciID);
            cmd.ExecuteNonQuery();
            baglantiKapat();
        }
        public void kullaniciGoster(String kullaniciID)
        {
            baglantiAc();
            cmd = new SqlCommand("SELECT * FROM KULLANICI WHERE KULLANICI_ID = @KulID",baglan);
            cmd.Parameters.AddWithValue("@KulID",kullaniciID);
            dr = cmd.ExecuteReader();

        }
        
        public void adresEkle(String kulID, String sokak, String cadde, String mahalle, String kapiNo, String daireNo, String ilce, String sehir, String postaKodu)
        {
            baglantiAc();
            cmd = new SqlCommand("PROC_ADRES_EKLE @Kul_ID=@kulID,@Sokak=@sokak,@Cadde=@cadde,@Mahalle=@mahalle,@KapiNo=@kapiNo,@DaireNo=@daireNo,@Ilce=@ilce,@Sehir=@sehir,@PostaKodu=@postaKodu", baglan);
            cmd.Parameters.AddWithValue("@kulID", kulID);
            cmd.Parameters.AddWithValue("@sokak", sokak);
            cmd.Parameters.AddWithValue("@cadde", cadde);
            cmd.Parameters.AddWithValue("@mahalle", mahalle);
            cmd.Parameters.AddWithValue("@kapiNo", kapiNo);
            cmd.Parameters.AddWithValue("@daireNo", daireNo);
            cmd.Parameters.AddWithValue("@ilce", ilce);
            cmd.Parameters.AddWithValue("@sehir", sehir);
            cmd.Parameters.AddWithValue("@postaKodu", postaKodu);
            cmd.ExecuteNonQuery();
            baglantiKapat();
        }
        public void adresSil(String adresID)
        {
            baglantiAc();
            cmd = new SqlCommand("PROC_ADRES_SIL @ADRESID = @AdresID", baglan);
            cmd.Parameters.AddWithValue("@AdresID", adresID);
            cmd.ExecuteNonQuery();
            baglantiKapat();
        }
        
        public void urunEkle(String urunAd, String markaAd, String modelAd, Decimal urunFiyat, Decimal indirimliFiyat, String indirimOrani, String resimYol, String kategoriID, String satisID, String stokID)
        {
            baglantiAc();
            cmd = new SqlCommand("PROC_URUN_EKLE @UrunAd=@urunAd,@MarkaAd=@markaAd,@ModelAd=@modelAd,@UrunFiyat=@urunFiyat,@IndirimliFiyat=@indirimliFiyat,@IndirimOrani=@indirimOrani,@ResimYol=@resimYol,@KategoriID=@kategoriID,@SatisID=@satisID,@StokID=@stokID", baglan);
            cmd.Parameters.AddWithValue("@urunAd", urunAd);
            cmd.Parameters.AddWithValue("@markaAd", markaAd);
            cmd.Parameters.AddWithValue("@modelAd", modelAd);
            cmd.Parameters.AddWithValue("@urunFiyat", urunFiyat);
            cmd.Parameters.AddWithValue("@indirimliFiyat", indirimliFiyat);
            cmd.Parameters.AddWithValue("@indirimOrani", indirimOrani);
            cmd.Parameters.AddWithValue("@resimYol", resimYol);
            cmd.Parameters.AddWithValue("@kategoriID", kategoriID);
            cmd.Parameters.AddWithValue("@satisID", satisID);
            cmd.Parameters.AddWithValue("@stokID", stokID);
            cmd.ExecuteNonQuery();
            baglantiKapat();
        }
        public void urunSil(int urunID)
        {
            baglantiAc();
            cmd = new SqlCommand("PROC_URUN_SIL @URUNID = @urunID", baglan);
            cmd.Parameters.AddWithValue("@urunID", urunID);
            cmd.ExecuteNonQuery();
            baglantiKapat();
        }
        public void urunGoster(String urunID)
        {
            baglantiAc();
            cmd = new SqlCommand("SELECT * FROM URUNLER WHERE URUN_ID = @urunID", baglan);
            cmd.Parameters.AddWithValue("@urunID", urunID);
            dr = cmd.ExecuteReader();


        }

        public void satisEkle(String urunID, String alisAdet, String toplamTutar, String satisID, String kullaniciID)
        {
            baglantiAc();
            cmd = new SqlCommand("PROC_SATIS_EKLE @UrunID=@urunID,@AlisAdet=@alisAdet,@ToplamTutar=@toplamTutar,@SatisID=@satisID,@KullaniciID=@kullaniciID", baglan);
            cmd.Parameters.AddWithValue("@urunID", urunID);
            cmd.Parameters.AddWithValue("@alisAdet", alisAdet);
            cmd.Parameters.AddWithValue("@toplamTutar", toplamTutar);
            cmd.Parameters.AddWithValue("@satisID", satisID);
            cmd.Parameters.AddWithValue("@kullaniciID", kullaniciID);
            cmd.ExecuteNonQuery();
            baglantiKapat();
        }
        
        public void stokEkle(String stokID, String urunStokAdet, String firmaAd, String urunID)
        {
            baglantiAc();
            int kontrol = 0;
            SqlCommand araKomut = new SqlCommand("SELECT URUN_ID FROM STOK WHERE URUN_ID = @urunID",baglan);
            araKomut.Parameters.AddWithValue("@urunID", urunID);
            SqlDataReader reader = araKomut.ExecuteReader();
            while (reader.Read())
            {
                kontrol++;
            }
            reader.Close();
            baglantiKapat();
            if (kontrol==0)
            {
                baglantiAc();
                cmd = new SqlCommand("PROC_STOK_EKLE @StokID=@stokID,@UrunStokAdet=@urunStokAdet,@FirmaAd=@firmaAd,@UrunID=@urunID", baglan);
                cmd.Parameters.AddWithValue("@stokID", stokID);
                cmd.Parameters.AddWithValue("@urunStokAdet", urunStokAdet);
                cmd.Parameters.AddWithValue("@firmaAd", firmaAd);
                cmd.Parameters.AddWithValue("@urunID", urunID);
                cmd.ExecuteNonQuery();
                baglantiKapat();
                araKomut.Cancel();
                baglan.Dispose();
            }
            else
            {
                baglantiAc();
                araKomut = new SqlCommand("PROC_STOK_ARTTIR @UrunStokAdet=@urunStokAdet,@UrunID=@urunID",baglan);
                araKomut.Parameters.AddWithValue("@urunStokAdet", urunStokAdet);
                araKomut.Parameters.AddWithValue("@urunID", urunID);
                araKomut.ExecuteNonQuery();
                baglantiKapat();

            }
            
        }
        public void stokSil(String SatisID)
        {
            baglantiAc();
            cmd = new SqlCommand("PROC_STOK_SIL @SatisID=@SatisID", baglan);
            cmd.Parameters.AddWithValue("@SatisID", SatisID);
            cmd.ExecuteNonQuery();
            baglantiKapat();
        }
       
        public void yorumEkle(String metin, String baslik, String urunID, String kullaniciID)
        {
            baglantiAc();
            cmd = new SqlCommand("PROC_YORUM_EKLE @Metin=@metin,@Baslik=@baslik,@UrunID=@urunID,@KullaniciID=@kullaniciID", baglan);
            cmd.Parameters.AddWithValue("@metin", metin);
            cmd.Parameters.AddWithValue("@baslik", baslik);
            cmd.Parameters.AddWithValue("@urunID", urunID);
            cmd.Parameters.AddWithValue("@kullaniciID", kullaniciID);
            cmd.ExecuteNonQuery();
            baglantiKapat();
        }
        public void yorumSil(String yorumID)
        {
            baglantiAc();
            cmd = new SqlCommand("DELETE FROM YORUMLAR WHERE @YORUM_ID=@yorumID", baglan);
            cmd.Parameters.AddWithValue("@yorumID", yorumID);
            cmd.ExecuteNonQuery();
            baglantiKapat();
        }
        public void yorumOnay(String yorumID)
        {
            baglantiAc();
            cmd = new SqlCommand("UPDATE YORUMLAR SET DURUM = @durum WHERE YORUM_ID=@yorumID", baglan);
            cmd.Parameters.AddWithValue("@yorumID", yorumID);
            cmd.Parameters.AddWithValue("@durum", "1");
            cmd.ExecuteNonQuery();
            baglantiKapat();
        }

                            /* SEPET İŞLEMLERİ */
        public void sepetListele(String KullaniciID,Repeater rep)
        {
            baglantiAc();
            cmd = new SqlCommand("SELECT * FROM SEPET WHERE @KullaniciID=@KullaniciID", baglan);
            cmd.Parameters.AddWithValue("@KullaniciID", KullaniciID);
            dr = cmd.ExecuteReader();
            rep.DataSource = dr;
            rep.DataBind();
            dr.Close();
            baglantiKapat();
        }
        public void sepeteEkle(String KullaniciID,String UrunID)
        {
            baglantiAc();
            cmd = new SqlCommand("PROC_SEPETE_EKLE @KullaniciID=@KullaniciID,@UrunID=@UrunID", baglan);
            cmd.Parameters.AddWithValue("@KullaniciID", KullaniciID);
            cmd.Parameters.AddWithValue("@UrunID", UrunID);
            cmd.ExecuteNonQuery();
            baglantiKapat();
        }       
        public void sepetToplam(String KullaniciID,String UrunID)
        {
            baglantiAc();
            cmd = new SqlCommand("SELECT * FROM SEPET WHERE KULLANICI_ID=@KullaniciID AND URUN_ID=@URUNID", baglan);
            cmd.Parameters.AddWithValue("@KullaniciID", KullaniciID);
            cmd.Parameters.AddWithValue("@URUNID", UrunID);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
               tutar = double.Parse(dr["URUN_FIYAT"].ToString()); 
            }
            
            dr.Close();
            baglantiKapat();
        }
        public void SepettenSatınAl(String KullaniciID, String UrunID,String Adet, String Tutar)
        {
            baglantiAc();
            cmd = new SqlCommand("[PROC_SATIS_EKLE] @UrunID = @UrunID,@AlisAdet = @Adet,@ToplamTutar = @Tutar,@SatiDurum = @Durum,@KullaniciID = @KullaniciID", baglan);
            cmd.Parameters.AddWithValue("@KullaniciID", KullaniciID);
            cmd.Parameters.AddWithValue("@UrunID", UrunID);
            cmd.Parameters.AddWithValue("@Adet", Adet);
            cmd.Parameters.AddWithValue("@Tutar", Tutar);
            cmd.Parameters.AddWithValue("@Durum", "Onay Bekliyor.");
            cmd.ExecuteNonQuery();
            baglantiKapat();
            SepetCikar(KullaniciID, UrunID);
        }       
        public void SepetCikar(String kullaniciID, String urunID)
        {
            baglantiAc();
            cmd = new SqlCommand("[PROC_SEPET_SİL] @UrunID=@urunID,@KulID=@kullaniciID", baglan);
            cmd.Parameters.AddWithValue("@urunID", urunID);
            cmd.Parameters.AddWithValue("@kullaniciID", kullaniciID);
            cmd.ExecuteNonQuery();
            baglantiKapat();
        }

    }
}