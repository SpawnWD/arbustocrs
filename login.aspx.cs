using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MasTicket
{
    public partial class login : basepage
    {
        wsac.IsacClient ws;

        public void btnAcceso_Click(Object sender, EventArgs e)
        {
            string str_email = email.Value;
            string str_Nip = NIP.Value;
            //Session["fallo"] = null;

            if (!string.IsNullOrEmpty(str_email) && !string.IsNullOrEmpty(str_Nip))
            {
               
                ws = Session["wsac"] as wsac.IsacClient;
                string json = ws.GetUser(0, check.SafeSqlLiteral(str_email), check.SafeSqlLiteral(str_Nip));
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
                                Response.Redirect("datosrecarga.aspx");
                        }
                        else
                            Response.Redirect("datosrecarga.aspx");
                    }
                }
                else
                {
                    spnJS.Text = "<script>msgError('Los datos no son correctos, verifique e intente nuevamente'); </script>";
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    if (Session["fallo"] != null)
            //    {
            //        if (Session["fallo"].ToString() == "1")
            //        {
            //            spnJS.Text = "<script>msgError('Los datos no son correctos, verifique e intente nuevamente'); </script>";
            //            Session["fallo"] = null;
            //        }
            //        if (Session["fallo"].ToString() == "-1")
            //        {
            //            spnJS.Text = "<script>msgError('El usuario se encuentra bloqueado. Revise el correo con el que se registro'); </script>";
            //            Session["fallo"] = null;
            //        }
            //    }

            //}

            btnEnviaCorreo.Click += (s, ea) =>
            {
                string email = "";
                ws = Session["wsac"] as wsac.IsacClient;
                if (!String.IsNullOrEmpty(edtCorreo.Value))
                    email = check.SafeSqlLiteral(edtCorreo.Value.Trim());
                if (email == "")
                    spnJS.Text = "<script>msgError('No existe ese usuario y/o email'); </script>";
                else {
                    //UserDialogs.Instance.ShowLoading("Cargando...");
                    string json = ws.GetUser(0, email, "");
                    List<Usuario> lu = JsonConvert.DeserializeObject<List<Usuario>>(json);
                    if (lu.Count > 0)
                    {
                        //UserDialogs.Instance.HideLoading();
                        ws.EnviaMailRecordatorioAsync(lu.FirstOrDefault().idusuario);
                        spnJS.Text = "<script>msgExito('Se envio su nip al correo registrado'); </script>";
                        //await App.Nav.PopAsync(Constantes.animated);
                    }
                    else {
                        //UserDialogs.Instance.HideLoading();
                        spnJS.Text = "<script>msgError('No existe ese usuario y/o email'); </script>";
                    }
                }
            };

        }
    }
}