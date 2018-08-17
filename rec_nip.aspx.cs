using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyFuntion;

namespace MasTicket
{
    public partial class rec_nip : basepage
    {
        wsac.IsacClient ws;

        public void btnAcceso_Click(Object sender, EventArgs e)
        {
            int _nuevo_nip = Convert.ToInt32(check.SafeSqlLiteral(nuevo_nip.Value));
            int _confirm_nuevo_nip = Convert.ToInt32(check.SafeSqlLiteral(confirm_nuevo_nip.Value));
            if (_nuevo_nip != _confirm_nuevo_nip)
            {
                spnJS.Text = "<script>msgError('Los 2 nips deben ser iguales'); </script>";
                return;
            }
            else
            {
                if (!check.ValidaNip(_nuevo_nip.ToString()))
                {
                    spnJS.Text = "<script>msgError('Revise el NIP. (No se permiten consecutivos ni que todos los digitos sean iguales)');</script>";
                    return;
                }
                else
                {
                    ws = Session["wsac"] as wsac.IsacClient;
                    wsac.Usuario apunta = new wsac.Usuario();
                    apunta.idusuario = Convert.ToInt32(Session["id_usuario"].ToString());
                    apunta.nip = _nuevo_nip.ToString();
                    if (ws.Mod_Usuario(apunta) > 0)
                        spnJS.Text = "<script>msgExito('El NIP se modifico correctamente. Vuelva a ingresar'); </script>";
                    else
                        spnJS.Text = "<script>msgError('Ocurrio un error. Contacte con el administrador.'); </script>";

                    /*string json = ws.GetUser(int.Parse(Session["id_usuario"].ToString()), "", "");
                    List<Usuario> lu = JsonConvert.DeserializeObject<List<Usuario>>(json);
                    if (lu.Count > 0)
                    {
                        Session["idusrlogged"] = lu.FirstOrDefault().idusuario;
                        Session["usrlogged"] = lu.FirstOrDefault();
                        Session["fallido"] = null;
                        Session["temporal_n"] = null;
                        Session["fecharecup"] = null;
                        Session["id_usuario"] = null;
                        Response.Redirect("datosrecarga.aspx");
                    }*/
                }
            }
        }

        private void get_link(string link)
        {
            ws = Session["wsac"] as wsac.IsacClient;
            wsac.Usuario obt = new wsac.Usuario();
            obt.nip = nuevo_nip.Value;
            int val = ws.Mod_Usuario(obt);

        }

        private void recupera_valores(string link)
        {
            try
            {
                //if (Session["id_usuario"] == null)
                //{
                    Session["option"] = 1;
                    string str_dato = numerico.Desencripta(Uri.UnescapeDataString(link), numerico.encrip);
                    string recup_nip = str_dato.Substring(0, 4);
                    Session["temporal_n"] = recup_nip;

                    string rec_fecha = str_dato.Substring(4, 10);
                    Session["fecharecup"] = rec_fecha;

                    string id = str_dato.Substring(14, str_dato.Length - 14);
                    Session["id_usuario"] = id;

                    int anio = Convert.ToInt32(rec_fecha.ToString().Substring(6,4));
                    int mes = Convert.ToInt32(rec_fecha.ToString().Substring(3, 2));
                    int dia = Convert.ToInt32(rec_fecha.ToString().Substring(0, 2));

                    DateTime oldDate = new DateTime(anio, mes, dia);
                    DateTime newDate = DateTime.Now;

                    //// Difference in days, hours, and minutes.
                    TimeSpan ts = newDate - oldDate;

                    // Difference in days.
                    int differenceInDays = ts.Days;

                    if (differenceInDays < 4)
                    {
                        lblleyenda_caducaco.Visible = false;
                        lblaviso_caducado.Visible = false;
                        //spnJS.Text = "<script>msgError('Nip: " + Session["temporal_n"] + ", Fecha: " + Session["fecharecup"] + ", idUsuario: " + Session["id_usuario"] + ", anio solo: " + anio + " , mes " + mes + " día: " + dia + " diferencia en dias : " + differenceInDays + "'); </script>";
                    }
                    else
                    {
                        spnJS.Text = "<script>msgError('La liga a expirado, por favor vuelva a generar otro acceso para la recuperación de NIP'); </script>";
                        //spnJS.Text = "<script>msgError('Nip: " + Session["temporal_n"] + ", Fecha: " + Session["fecharecup"] + ", idUsuario: " + Session["id_usuario"] + ", anio solo: " + anio + " , mes " + mes + " día: " + dia + " diferencia en dias : " + differenceInDays + "'); </script>";
                        nuevo_nip.Visible = false;
                        confirm_nuevo_nip.Visible = false;
                        btnAcceso.Visible = false;
                        lblconfirm.Visible = false;
                        lblnuevo.Visible = false;
                        lblaviso_caducado.Visible = true;
                        lblaviso_cad.Visible = false;
                    }
                //}
            }
            catch (Exception er)
            {

            }
            
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string variable = Uri.UnescapeDataString(Request.QueryString["rtgc"]);

                if (!string.IsNullOrEmpty(variable))
                {
                    recupera_valores(variable);
                    //spnJS.Text = "<script>msgError('Entre a cargar datos Nip: " + Session["temporal_n"] + ", Fecha: " + Session["fecharecup"] + ", idUsuario: " + Session["id_usuario"] + "'); </script>";
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
        }
    }
}