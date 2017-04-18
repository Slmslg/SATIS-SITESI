using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace SATIS_SITESI.Classes
{
    public class Sepet
    {
        public void Ekle(string id, string isim, int adet, double fiyat)
        {

            try
            {
                DataTable dt = new DataTable(); // sepeti tutacagimiz bir datatable olusturuyoruz

                if (HttpContext.Current.Session["sepet"] != null)//daha önceden sepet olusturulmus mu diye sessiona bakiyoruz
                {
                    dt = (DataTable)HttpContext.Current.Session["sepet"];//session varsa  sessionu datatbale ye cast edip datatablemizi elde ediyoruz

                }
                else//session yok ise yani sepet daha önce olusturulup sessiona atilmamis ise dataTableyi olusturuyoruz
                {
                    dt.Columns.Add("id");// DataTableye id colonunu ekliyoruz
                    dt.Columns.Add("isim");//DataTableye isim colonunu ekliyoruz
                    dt.Columns.Add("fiyat");//DataTableye fiyat colonunu ekliyoruz
                    dt.Columns.Add("adet");//DataTableye adet colonunu ekliyoruz
                    dt.Columns.Add("tutar");//DataTableye tutar colonunu ekliyoruz

                }

                bool varmi = Kontrol(id.ToString());//Kontrol adindaki methoda gelen id  degerini gönderiyoruz
                // böylece ayni id ye sahip ürün daha önce eklendiyse ayni ürünü birdaha eklemek yerine sadece ürünnün sepeteki adetini artiracagiz
                // Kontrol methodu ürün varsa true yoks false deger döndürüyor
                if (varmi == false)//ürün daha önce eklenmemis ise
                {
                    DataRow drow = dt.NewRow();//yeni bir row (satir) olusturuluyor.
                    drow["id"] = id;//satirin id colonuna gelen id yaziliyor.
                    drow["isim"] = isim;//satirin isim colonuna gelen isim yaziliyor.
                    drow["fiyat"] = fiyat;//satirin fiyat colonuna gelen fiyat yaziliyor.
                    drow["adet"] = adet;//satirin adet colonuna gelen adet yaziliyor.
                    drow["tutar"] = (fiyat * adet).ToString();//satirin tutar alanina gelen fiyat ile adet çarpimi  yaziliyor.
                    dt.Rows.Add(drow);//olusturulan satir tabloya ekleniyor.
                }
                else//eger ürün tabloya daha önce eklenmis ise
                {
                    Artir(id, adet, fiyat);//Artir methoduna gelen id fiyat ve adet degerleri gönderiliyor. Fiyata gerek yok aslinda ama neyse :)
                    //artir metoduna giddip bakalim simdi
                }
                HttpContext.Current.Session["sepet"] = dt;//en son olarak olsturulan DataTable nin sayfa postback oldugunda kaybolmamasi için
                // sessiona atiliyor. artik birdaki sefere session oldugu için tablo bu sessiondan alinip üzerine yazilcak

            }
            catch
            {
                
            }
        }

        public double SepetToplam()
 {
     double toplam = 0;//toplam degiskeni tanimlaniyor
     if (HttpContext.Current.Session["sepet"] != null)//sessiomn kontolü yapiliyor
     {
        
         DataTable dt = new DataTable();//tablo olusturuluyor
         dt =(DataTable) HttpContext.Current.Session["sepet"];//sessiondaki sepet aliniyor tabloya aktariliyor
         for (int i = 0; i < dt.Rows.Count; i++)//yine tablonun tüm alanlarinda dönecek döngü baslatiliyor
         {
             toplam +=Convert.ToDouble(dt.Rows[i]["tutar"].ToString());//her satirdaki tutar miktari toplam degiskenine aktariliyor
         }
      
     }
     return toplam; //toplam degeri döndürülüyor.
 }
 


//Son olarak sepetten ürün silecek olan method.
public void Sil(string id)//silinecek olan ürünün id degeri aliniyor
    {
        DataTable dt = new DataTable();//tablo örnegi olusturuluyor
        if (HttpContext.Current.Session["sepet"] != null)//sessin  kontrolü yapiliyor
        {
            dt = (DataTable)HttpContext.Current.Session["sepet"];//sessiondaki tablo aliniyor
            for (int i = 0; i < dt.Rows.Count; i++)//tablonun satir sayisi kadar yine bir döngü olusturuluyor
            {
                if (dt.Rows[i]["id"].ToString() == id)//o naki satirin id alani ile gelen id alani esit ise
                {
                    dt.Rows[i].Delete();//tablonun o satiri siliniyor.
                    HttpContext.Current.Session["sepet"] = dt;//tablonun son hali sessiona aktariliyor
                    break;//dögüden çikiliyor
 
                }
            }
 
        }
    }
       
   private void Artir(string id,int adet,double fiyat) 
    {
        try{
 
            DataTable dt = new DataTable();
 
            dt = (DataTable)HttpContext.Current.Session["sepet"];
 
            for (int i = 0; i < dt.Rows.Count; i++)
 
            {
 
                if (dt.Rows[i]["id"].ToString() == id) 
                { 
                    int adet1 = Convert.ToInt32(dt.Rows[i]["adet"].ToString()); 
                    adet1 += adet;
                    dt.Rows[i]["adet"] = adet1.ToString();
                    double tutar1 = Convert.ToDouble(dt.Rows[i]["tutar"].ToString());
                    tutar1 = (adet * Convert.ToDouble(dt.Rows[i]["fiyat"])) + tutar1;
                    dt.Rows[i]["tutar"] = tutar1.ToString();
                    HttpContext.Current.Session["sepet"] = dt;
                    break;
 
                }
 
            }
 
        }
 
        catch
        {
 
        }
 
    }
 
 
 
 
 
private bool Kontrol(string id)
 
    { 
        bool r=false; 
        DataTable dt = new DataTable(); 
        if (HttpContext.Current.Session["sepet"] != null)
        { 
            dt = (DataTable)HttpContext.Current.Session["sepet"]; 
            for (int i = 0; i < dt.Rows.Count; i++) 
            { 
                if (dt.Rows[i]["id"].ToString() == id) 
                { 
                    r = true; 
                    break; 
                } 
            } 
        }
        return r;
    }
        }
}