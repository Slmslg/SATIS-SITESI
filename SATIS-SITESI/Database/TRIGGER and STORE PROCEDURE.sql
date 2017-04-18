              /* ADRES EKLEME PROCEDURE*/
CREATE PROC PROC_ADRES_EKLE (@Kul_ID int,@Sokak varchar(30),@Cadde varchar(30),@Mahalle varchar(30),@KapiNo varchar(3),@DaireNo varchar(3),@Ilce varchar(30),@Sehir varchar(30),@PostaKodu varchar(5))
AS
BEGIN
	INSERT INTO ADRES VALUES (@Kul_ID,@Sokak,@Cadde,@Mahalle,@KapiNo,@DaireNo,@Ilce,@Sehir,@PostaKodu)
END

			/* ADRES SÝL PROCEDURE*/
CREATE PROC PROC_ADRES_SIL (@AdresID int)
AS
BEGIN
	DELETE FROM ADRES WHERE KULLANICI_ADRES_ID = @AdresID 
END

           /* KATEGORI EKLEME PROCEDURE'U*/           
CREATE PROC PROC_KATEGORI_EKLE (@KategoriAdi varchar(30),@AltKategoriID int)
AS
BEGIN
	INSERT INTO KATEGORILER VALUES (@KategoriAdi,@AltKategoriID)
END

		  /* KATEGORÝ SÝLME PROCEDURE */
CREATE PROC PROC_KATEGORI_SIL (@KategoriID int)
AS
BEGIN
	DELETE FROM KATEGORILER WHERE KATEGORI_ID = @KategoriID
END
          /* KULLANICI EKLEME PROCEDURE'U*/           
CREATE PROC PROC_KULLANICI_EKLE (@KullaniciAd varchar(50),@Sifre varchar(50),@Posta varchar(50),@Yetki tinyint,@Soyad varchar(50),@Cinsiyet varchar(5),@Yas tinyint,@TelNo varchar(12),@AdresID int)
AS
BEGIN
	INSERT INTO KULLANICI VALUES (@KullaniciAd,@Sifre,@Posta,@Yetki,@Soyad,@Cinsiyet,@Yas,@TelNo,@AdresID)
END
		/* KULLANICI SÝLME PROCEDURE'U*/ 
CREATE PROC PROC_KULLANICI_SIL (@KullaniciID int) 
AS BEGIN 
	DELETE FROM KULLANICI WHERE KULLANICI_ID = @KullaniciID
END
			/* URUN FIYAT TRIGGER'I*/  
CREATE TRIGGER TR_URUN_FIYAT ON URUNLER
FOR INSERT
AS BEGIN 
	DECLARE @UrunFiyat money,@IndirimliFiyat money,@IndirimOrani int,@UrunID int
	SELECT @UrunFiyat = URUN_FIYAT,@IndirimOrani = INDIRIM_ORANI,@UrunID = URUN_ID FROM INSERTED 
	UPDATE URUNLER SET INDIRIMLI_FIYAT = @UrunFiyat-(@IndirimOrani*@UrunFiyat/100) WHERE @UrunID = URUN_ID
END
			/* URUN FIYAT UPDATE TRIGGER'I*/  
CREATE TRIGGER TR_URUN_UPDATE_FIYAT on URUNLER
FOR UPDATE
AS BEGIN
      DECLARE @UrunFiyat money,@IndirimliFiyat money,@IndirimOrani int,@UrunID int
      SELECT @UrunFiyat = URUN_FIYAT,@IndirimOrani = INDIRIM_ORANI,@UrunID = URUN_ID FROM INSERTED
	  BEGIN 
	  UPDATE URUNLER SET INDIRIMLI_FIYAT = @UrunFiyat-(@IndirimOrani*@UrunFiyat/100) WHERE @UrunID = URUN_ID
	  END      
END

             /* URUN EKLEME PROCEDURE'U*/           
CREATE PROC PROC_URUN_EKLE (@UrunAd varchar(40),@MarkaAd varchar(40),@ModelAd varchar(40),@UrunFiyat money,@IndirimliFiyat money,@IndirimOrani int,@ResimYol varchar(50),@KategoriID int,@SatisID int,@StokID int)
AS
BEGIN
	INSERT INTO URUNLER VALUES (@UrunAd,@MarkaAd,@ModelAd,@UrunFiyat,NULL,@IndirimOrani,@ResimYol,@KategoriID,@SatisID,@StokID)
END
             /* URUN SÝLME PROCEDURE'U*/           
CREATE PROC PROC_URUN_SIL (@UrunID int)
AS
BEGIN
	DELETE FROM URUNLER WHERE URUN_ID = @UrunID
END
		    /* STOK EKLEME PROCEDURE'U*/           
CREATE PROC PROC_STOK_EKLE (@StokID int,@UrunStokAdet int,@FirmaAd varchar(40),@UrunID int)
AS
BEGIN
	INSERT INTO STOK VALUES (@StokID,@UrunStokAdet,@FirmaAd,@UrunID)
END
		/* STOK SÝLME PROCEDURE'U*/
CREATE PROC PROC_STOK_SIL (@SatisID int) 
AS BEGIN 
	DELETE FROM STOK WHERE SATIS_ID = @SatisID
END
				/* STOK ARTTIRMA PROCEDURE'U*/           
ALTER PROC PROC_STOK_ARTTIR (@UrunStokAdet int,@UrunID int)
AS
BEGIN
UPDATE STOK SET URUN_STOK_ADET=(URUN_STOK_ADET+@UrunStokAdet) WHERE URUN_ID = @UrunID
END
		    /* SATIS EKLEME PROCEDURE'U*/           
CREATE PROC PROC_SATIS_EKLE (@UrunID int,@AlisAdet int,@ToplamTutar money,@SatisID int,@KullaniciID int)
AS
BEGIN
	INSERT INTO SATIS VALUES (@UrunID,@AlisAdet,@ToplamTutar,@SatisID,@KullaniciID)
END

		    /* YORUM EKLEME PROCEDURE'U*/           
CREATE PROC PROC_YORUM_EKLE (@Metin varchar(120),@Baslik varchar(30),@UrunID int,@KullaniciID int)
AS
BEGIN
	INSERT INTO YORUMLAR VALUES (@Metin,@Baslik,@UrunID,@KullaniciID)
END
			/* YORUM SÝLME PROCEDURE'U*/           
CREATE PROC PROC_URUN_SIL (@UrunID int)
AS
BEGIN
	DELETE FROM URUNLER WHERE URUN_ID = @UrunID
END

CREATE TRIGGER [dbo].[TR_URUN_UPDATE_DURUM] on [dbo].SATIS
FOR UPDATE
AS BEGIN
      DECLARE @UrunDurum varchar(50),@UrunID int
      SELECT @UrunDurum = SATIS_DURUM,@UrunID=URUN_ID FROM INSERTED
	  BEGIN 
	  IF @UrunDurum = 'Satýldý'
	  BEGIN
		UPDATE STOK SET URUN_STOK_ADET = URUN_STOK_ADET - 1 WHERE URUN_ID = @UrunID
	  END
	  END      
END