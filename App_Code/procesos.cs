using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;
using System.Net.Mime;
using MyFuntion;
using System.IO;

/// <summary>
/// Summary description for procesos
/// </summary>
public class procesos
{
    public procesos()
    {
        
    }

    private string liga()
    {
        string url = HttpContext.Current.Request.Url.PathAndQuery;
        
        //.AbsoluteUri; // http://localhost:1302/TESTERS/Default6.aspx string path = HttpContext.Current.Request.Url.AbsolutePath; // /TESTERS/Default6.aspx string host = HttpContext.Current.Request.Url.Host; // localhost
        //DnsSafeHost  saca el nombre del servidor ejemplo localhost
        String cadena = url;
        //SEGUNDA PARTE: RUTINA DE CONTEO DEL PATRÓN
        int contador = 0, posicion = 0;
        int empezar = 0;
        String patron = "/";

        for (int i = 0; i < cadena.Length; i++)
        {
            posicion = cadena.IndexOf(patron);
            if (posicion != -1)
            {
                empezar += posicion;
                cadena = cadena.Substring(posicion + patron.Length);
            }
        }
        string pagina_web = "";
        cadena = url;

        if (empezar > 0)
        {
            //empezar += 1;
            pagina_web = cadena.Substring(1, (cadena.Length + 1) - (empezar));
        }
        return   pagina_web ;
    }

    private void EnviaMail(string email, string liga)
    {
        const String FROM = "soporte@asicompras.com";
        String TO = email;
        String SUBJECT = "";
        string readText = "";

        SUBJECT = "Recordatorio de NIP en AsiCompras";
        readText = File.ReadAllText(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "emails/recorda.html"));
        readText = readText.Replace("@@LINK@@", liga);


        String BODY = readText;

        const String SMTP_USERNAME = "AKIAJK63XZEQQPRAVU3Q";
        const String SMTP_PASSWORD = "At+XeAQc5kVQWclfzF7cvyaoxs7Q7ZMh05lNaaURRlSy";
        // Amazon SES SMTP host name. This example uses the US West (Oregon) region.
        const String HOST = "email-smtp.us-west-2.amazonaws.com";
        // The port you will connect to on the Amazon SES SMTP endpoint. We are choosing port 587 because we will use
        // STARTTLS to encrypt the connection.
        const int PORT = 587;

        MailMessage message = new MailMessage();
        message.From = new MailAddress(FROM);
        message.To.Add(TO);
        message.Subject = SUBJECT; //"Request from " + SessionFactory.CurrentCompany.CompanyName + " to add a new supplier";
        message.IsBodyHtml = true;
        message.Body = BODY;

        using (SmtpClient client = new SmtpClient(HOST, PORT))
        {
            client.Credentials = new System.Net.NetworkCredential(SMTP_USERNAME, SMTP_PASSWORD);
            client.EnableSsl = true;
            try
            {
                Console.WriteLine("Attempting to send an email through the Amazon SES SMTP interface...");
                client.Send(message);
                Console.WriteLine("Email sent!");
            }
            catch (Exception ex)
            {
                Console.WriteLine("The email was not sent.");
                Console.WriteLine("Error message: " + ex.Message);
            }
        }
    }

    public void EnviaCorreo(int idusuario, string correo_destino, string nip, string ligafinal)
    {

        string nombre_servidor = HttpContext.Current.Request.Url.DnsSafeHost;
        DateTime newDate = DateTime.Now;
        string fechaactual = newDate.ToShortDateString();

        string cadena = ligafinal + "rec_nip.aspx?rtgc=" + numerico.Encripta(nip + fechaactual + idusuario, numerico.encrip);
        EnviaMail(correo_destino, cadena);
    }
}