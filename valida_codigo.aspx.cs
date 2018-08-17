using System;
using System.Configuration;
using System.Net;
using System.IO;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Collections;
using Newtonsoft.Json;
using System.Net.Mail;

namespace MasTicket
{
    public partial class registro : basepage
    {
        wsac.IsacClient ws;
        wsmoon.wsMoonSoapClient wsmoon;
        DatosRedes datosredes = null;

        protected void Page_Load(object sender, EventArgs e)
        {

            int idusr = 0;
            if (IsPostBack)
            {
              
                if (Session["idusrlogged"] != null)
                {
                    if (int.TryParse(Session["idusrlogged"].ToString(), out idusr))
                    {
                        if (idusr > 0)
                        {
                            //Validar session y status de usuario, si ya valido por SMS
                            ws = Session["wsac"] as wsac.IsacClient;
                            string json = ws.GetUserV2(idusr, "", "");
                            List<Usuario> lu = JsonConvert.DeserializeObject<List<Usuario>>(json);
                            if (lu.Count > 0)
                            {
                                Session["usrlogged"] = lu.FirstOrDefault();
                                string numero = "";
                                numero = check.SafeSqlLiteral(txtCodigo.Value.Trim());
                                if(numero==lu.FirstOrDefault().verificacion){
                                    bool res = ws.ActivarUsr(idusr);
                                    if(res){
                                        Response.Redirect("index.aspx");
                                    }else{
                                        spnJS.Text = "<script>msgError('Error al verificar tu cuenta, revisa tu código.');</script>";
                                    }                                    
                                }else{
                                    spnJS.Text = "<script>msgError('Error al verificar tu cuenta, revisa tus datos.');</script>";
                                }
                                //Response.Redirect("datosrecarga.aspx");
                            }
                            
                        }else{
                            spnJS.Text = "<script>msgError('Ocurrio un error, contacta por teléfono. (Error 1) ');</script>";
                        }
                    }else{
                        spnJS.Text = "<script>msgError('Ocurrio un error, contacta por teléfono. (Error 2) ');</script>";
                    }
                }else{
                    spnJS.Text = "<script>msgError('Ocurrio un error, contacta por teléfono. (Error 3)  ');</script>";
                }
                if (!string.IsNullOrEmpty(Request.Form["redireccion"]))
                {
                    spnJS.Text = "<script>msgError('Ya existe un usuario con este email. Inicie sesion con su NIP');</script>";
                }                        

            }
         

//

                btnRegistrar.Click += (s, ea) =>
                {
                    /*string numero = "";
                    numero = check.SafeSqlLiteral(txtCodigo.Value.Trim());
                   
                    ws = Session["wsac"] as wsac.IsacClient;
                    string json = ws.GetUser(idusr, "", "");
                    List<Usuario> lu = JsonConvert.DeserializeObject<List<Usuario>>(json);
                    if (lu.Count > 0)
                    {
                        
                        spnJS.Text = "<script>msgError('Tenemos al usuarioo "+lu.FirstOrDefault().verificacion+" a "+numero+"');</script>";
                        return;
                    }*/
                };


                //


        }
        
    }
    
    public class DatosRedes
    {
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string name { get; set; }
        public string gender { get; set; }
        public string email { get; set; }
        public Picture picture { get; set; }
    }
    public class Picture
    {
        public DataPicture data { get; set; }
    }
    public class DataPicture
    {
        public bool is_silhouette { get; set; }
        public string url { get; set; }
    }

}