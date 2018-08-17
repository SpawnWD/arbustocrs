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
    public partial class registro : System.Web.UI.Page
    {
        wsac.IsacClient ws;
        wsmoon.wsMoonSoapClient wsmoon;
        DatosRedes datosredes = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Form.Count > 0)
                {
                    datosredes = JsonConvert.DeserializeObject<DatosRedes>(Request.Form[0]);
                    Session["datosredes"] = datosredes;
                    ws = Session["wsac"] as wsac.IsacClient;
                    if (datosredes.email != null && !datosredes.email.Equals(""))
                    {
                        string json = ws.GetUser(0, check.SafeSqlLiteral(datosredes.email), "");
                        List<Usuario> lu = JsonConvert.DeserializeObject<List<Usuario>>(json);
                        if (lu.Count > 0)
                        {
                            if (lu.FirstOrDefault().idusuario == -1)
                                spnJS.Text = "<script>msgError('El usuario se encuentra bloqueado. Revise el correo con el que se registro'); </script>";
                            else
                            {
                                Session["idusrlogged"] = lu.FirstOrDefault().idusuario;
                                Session["usrlogged"] = lu.FirstOrDefault();

                                if (Session["RecargaPendiente"] != null)
                                {
                                    if (bool.Parse(Session["RecargaPendiente"].ToString()))
                                    {
                                        RecargasViewModel rvm = Session["rvm"] as RecargasViewModel;
                                        rvm.IdUsuario = lu.FirstOrDefault().idusuario;
                                        TarjetasViewModel tvm = Session["tvm"] as TarjetasViewModel;
                                        tvm.Idusuario = lu.FirstOrDefault().idusuario;
                                        Response.Redirect("confir_recarga.aspx");
                                    }
                                    else
                                    {

                                        Response.Redirect("datosrecarga.aspx");
                                    }
                                }
                                else
                                {


                                    Response.Redirect("datosrecarga.aspx");
                                }
                            }
                        }
                        else
                        {
                            txtNombre.Value = datosredes.name;
                            txtEmail.Value = datosredes.email;
                            imgFoto.ImageUrl = datosredes.picture.data.url;
                        }
                    }
                    else
                    {
                        spnJS.Text = "<script>msgError('Error al logearse con redes sociales'); </script>";

                    }
                }
            }
            btnRegistrar.Click += async (s, ea) =>
            {
                string nip1 = "", nip2 = "", email = "", nombre = "", numero = "";
                nip1 = check.SafeSqlLiteral(txtNip1.Value.Trim());
                nip2 = check.SafeSqlLiteral(txtNip2.Value.Trim());
                email = check.SafeSqlLiteral(txtEmail.Value.Trim());
                nombre = check.SafeSqlLiteral(txtNombre.Value.Trim());
                numero = check.SafeSqlLiteral(txtNumero.Value.Trim());
               //verificador de correo
                Random r = new Random();
                int verif = r.Next(100000, 999999);
              
                if (nip1 != nip2)
                {
                    spnJS.Text = "<script>msgError('Los 2 nips deben ser iguales');</script>";
                    return;
                }
                else
                {
                    if (!check.ValidaNip(nip1))
                    {
                        spnJS.Text = "<script>msgError('Revise el NIP. (No se permiten consecutivos ni que todos los digitos sean iguales)');</script>";
                        return;
                    }
                    else
                        spnJS.Text = "";
                }
                ws = Session["wsac"] as wsac.IsacClient;
                string json = ws.GetUser(0, check.SafeSqlLiteral(email), "");
                List<Usuario> lu = JsonConvert.DeserializeObject<List<Usuario>>(json);
                if (lu.Count > 0)
                {
                    spnJS.Text = "<script>msgError('Ya existe un usuario con este email. Inicie sesion con su NIP');</script>";
                    return;
                }
                else
                {
                    spnJS.Text = "";
                    wsac.Usuario u = new wsac.Usuario()
                    {
                        numerocontacto = numero,
                        email = email,
                        name = nombre,
                        nip = nip1,
                        fechaalta = DateTime.Now,
                        //verificacion = nip1 + verif,
                        verificacion = verif.ToString(),
                        idpais = int.Parse(Session["idpais"].ToString())
                    };
                    if (Session["datosredes"] != null)
                        datosredes = Session["datosredes"] as DatosRedes;
                    if (datosredes != null)
                    {
                        u.first_name = check.SafeSqlLiteral(!String.IsNullOrEmpty(datosredes.first_name) ? datosredes.first_name : "");
                        u.last_name = check.SafeSqlLiteral(!String.IsNullOrEmpty(datosredes.last_name) ? datosredes.last_name : "");
                        u.gender = check.SafeSqlLiteral(!String.IsNullOrEmpty(datosredes.gender) ? datosredes.gender : "");
                        u.picture = check.SafeSqlLiteral(!String.IsNullOrEmpty(datosredes.picture.data.url) ? datosredes.picture.data.url : "");
                    }
                    wsac.AltaUsrV2Response res = await ws.AltaUsrV2Async(u,0);
                    if (res.Body.AltaUsrV2Result > 0)
                    {

                        Session["idusrlogged"] = res.Body.AltaUsrV2Result;
                        Session["datosredes"] = null;

                        wsmoon = new wsmoon.wsMoonSoapClient();
                        bool respuestaSMS = wsmoon.getSN("dragonballZ@", "wsM00n", "ws4d1mnt43@", u.numerocontacto, "Bienvenido a Asicompras, tu codigo de verificacion es: " + u.verificacion);
                        if (respuestaSMS)
                        {
                            Response.Redirect("valida_codigo.aspx");
                        }
                        else
                        {
                            spnJS.Text = "<script>msgError('Ocurrio un error. Contacte al administrador');</script>";
                            return;
                        }
                        
                        if (Session["RecargaPendiente"] != null)
                        {

                            if (bool.Parse(Session["RecargaPendiente"].ToString()))
                            {
                                  RecargasViewModel rvm = Session["rvm"] as RecargasViewModel;
                                  rvm.IdUsuario = res.Body.AltaUsrV2Result;
                                  TarjetasViewModel tvm = Session["tvm"] as TarjetasViewModel;
                                  tvm.Idusuario = res.Body.AltaUsrV2Result;
                                  Response.Redirect("confir_recarga.aspx");
                              //  spnJS.Text = "<script>alert('Revise su mail de confirmación');</script>";
                              //  enviaMail(u.email,u.verificacion);
                             //   Session["bienvenido"] = true;
                               // Response.Redirect("datosrecarga.aspx");
                            }
                            else
                            {

                                //spnJS.Text = "<script>alert('Revise su mail de confirmación');</script>";
                                Session["bienvenido"] = true;
                                Response.Redirect("datosrecarga.aspx");
                            }
                        }
                        else
                        {
                            //spnJS.Text = "<script>alert('Revise su mail de confirmación');</script>";
                            Session["bienvenido"] = true;
                            Response.Redirect("datosrecarga.aspx");

                        }
                    }
                    else
                    {
                        spnJS.Text = "<script>msgError('Ocurrio un error. Contacte al administrador');</script>";
                        return;
                    }
                };
            };
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