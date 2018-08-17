using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.UI;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Web;
using System.Net;
using System.IO;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using System.Web.Security;
using System.Collections;
using System.Net.Sockets;
using MasTicket;

namespace MasTicket
{
    public partial class registro2 : basepage
    {
        wsac.IsacClient ws;
        wsmoon.wsMoonSoapClient wsmoon;
        public string jsonOp = "", jsonPa = "", jsonPq = "", jsonRc = "";
        RecargasViewModel rvm;

       
        public void btnAcceso_Click(Object sender, EventArgs e)
        {
            string str_email = Email.Value;
            string str_Nip = NIP.Value;

            Session["fallido"] = null;

            if (!string.IsNullOrEmpty(str_email) && !string.IsNullOrEmpty(str_Nip))
            {
                ws = Session["wsac"] as wsac.IsacClient;
                string json = ws.GetUser(0, check.SafeSqlLiteral(str_email), check.SafeSqlLiteral(str_Nip));
                List<Usuario> lu = JsonConvert.DeserializeObject<List<Usuario>>(json);

                if (lu.Count > 0)
                {
                    if (lu.FirstOrDefault().idusuario == -1)
                        spnJS.Text = "<script>CargaCombos(); msgError('El usuario se encuentra bloqueado. Revise el correo con el que se registro'); </script>";
                    else
                    {
                        Session["idusrlogged"] = lu.FirstOrDefault().idusuario;
                        Session["usrlogged"] = lu.FirstOrDefault();
                        Session["fallido"] = null;
                        Response.Redirect("datosrecarga.aspx");
                    }
                }
                else
                {
                    //Session["fallido"] = "1";
                    //Response.Redirect("index.aspx");
                    spnJS.Text = "<script>CargaCombos(); msgError('Los datos no son correctos revise nuevamente');</script>";
                }
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            int idusr = 0;
            if (!IsPostBack)
            {
                if (Session["idusrlogged"] != null)
                {
                    if (int.TryParse(Session["idusrlogged"].ToString(), out idusr))
                    {
                        if (idusr > 0)
                        {
                            ws = Session["wsac"] as wsac.IsacClient;
                            string json = ws.GetUser(idusr, "", "");
                            List<Usuario> lu = JsonConvert.DeserializeObject<List<Usuario>>(json);
                            if (lu.Count > 0)
                            {
                                Session["usrlogged"] = lu.FirstOrDefault();
                                Response.Redirect("datosrecarga.aspx");
                            }
                        }
                    }
                }
                if (!string.IsNullOrEmpty(Request.Form["redireccion"]))
                {
                    spnJS.Text = "<script>msgError('Ya existe un usuario con este email. Inicie sesion con su NIP');</script>";
                }
                //if (Session["fallido"] != null)
                //{
                //    spnJS.Text = "<script>msgError('Los datos no son correctos revise nuevamente');</script>";
                //    Session["fallido"] = null;
                //}
            }
            //CargaCombos(false);

            if (!IsPostBack)
            {
                Session["RecargaPendiente"] = false;
                Session["rvm"] = null;
                ws = Session["wsac"] as wsac.IsacClient;
                jsonRc = ws.GetCatalogo(11, "where idusuario = " + Session["idusrlogged"].ToString() + " and err = 0 and rsauthorization is not null and rsauthorization != '' order by idrecarga desc limit 1"); //recargas
                List<Recarga> lsr = JsonConvert.DeserializeObject<List<Recarga>>(jsonRc);
                if (lsr.Count > 0)
                {
                    Recarga r = lsr.FirstOrDefault();
                    spnJS.Text = "<script>CargaCombos(); SelOper(" + r.idoperadora.ToString() + ", '" + r.numerorecarga + "', " + r.idpaquete.ToString() + ");</script>";
                }
               
            }

            btnNuevaT.Click += async (s, ea) =>
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

               /*string nip1 = "", nip2 = "", email = "", nombre = "", numero = "";
               nip1 = check.SafeSqlLiteral(txtNip1.Value.Trim());
               nip2 = check.SafeSqlLiteral(txtNip2.Value.Trim());
               email = check.SafeSqlLiteral(txtEmail.Value.Trim());
               nombre = check.SafeSqlLiteral(txtNombre.Value.Trim());
               numero = check.SafeSqlLiteral(txtNumero.Value.Trim());
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
                       idpais = int.Parse(Session["idpais"].ToString())
                   };
                   wsac.AltaUsrV2Response res = await ws.AltaUsrV2Async(u,0);
                   if (res.Body.AltaUsrV2Result > 0)
                   {

                       Session["idusrlogged"] = res.Body.AltaUsrV2Result;
                       Session["datosredes"] = null;
                       if (Session["RecargaPendiente"] != null)
                       {
                           if (bool.Parse(Session["RecargaPendiente"].ToString()))
                           {
                               RecargasViewModel rvm = Session["rvm"] as RecargasViewModel;
                               rvm.IdUsuario = res.Body.AltaUsrV2Result;
                               TarjetasViewModel tvm = Session["tvm"] as TarjetasViewModel;
                               tvm.Idusuario = res.Body.AltaUsrV2Result;
                               Response.Redirect("confir_recarga.aspx");
                           }
                           else
                           {

                               Session["bienvenido"] = true;
                               Response.Redirect("datosrecarga.aspx");
                           }
                       }
                       else
                       {

                           Session["bienvenido"] = true;
                           Response.Redirect("datosrecarga.aspx");

                       }
                   }
                   else
                   {
                       spnJS.Text = "<script>msgError('Ocurrio un error. Contacte al administrador');</script>";
                       return;
                   }
               };*/
           };

            btnReg1.Click +=  (s, ea) =>
            {
                Response.Redirect("registro.aspx");
            };
    }
        

    }
}

