using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace SATIS_SITESI.Pages.User
{
    public partial class Forget : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kullanici"]==null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           MailMessage ePosta = new MailMessage();
           ePosta.From = new MailAddress("scottishhell@gmail.com");
           ePosta.To.Add(eposta.Text);
           ePosta.Subject = "Bittibitiyor.com Kullanıcı Şifre Yenileme İsteği";
           ePosta.Body = "Bittibitiyor.com Kullanıcı Şifre Yenileme İsteği Gönderilmiştir.Eğer bu mesajı siz göndermediyseniz bu iletiyi umursamayınız.";
           SmtpClient smtp = new SmtpClient();
           //SSL etkinleştirilir
           smtp.EnableSsl = true;
           smtp.Credentials = new NetworkCredential("scottishhell@gmail.com", "sananebesalak");
           smtp.Port = 587;
           smtp.Host = "smtp.gmail.com";
           smtp.Send(ePosta);
           Label2.Text = "E-Posta Başarıyla Gönderildi";
        }
    }
}