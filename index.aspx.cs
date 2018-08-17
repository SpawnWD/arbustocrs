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
    public partial class index : basepage
    {
        wsac.IsacClient ws;
        public string ver;
        public string jsonOp = "", jsonPa = "", jsonPq = "", jsonRc = "",jsonVerif="";
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
            /*if (Request.QueryString["verifica"] != null)
            {
                ver=Request.QueryString["verifica"];
                if (validaVerif(ver))
                {
                    string vtn = "window.open('bienvenido.aspx','Dates','scrollbars=no,resizable=no,height=450, width=450')";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", vtn, true);
                }
                else {

                }
            }*/
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
            CargaCombos(false);

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
                else
                    spnJS.Text = "<script>CargaCombos();</script>";
            }

            btnNuevaT.Click += (s, ea) =>
            {
                if (hidPais.Value == "0" || hidCompania.Value == "0" || idpaquetew.Value == "0" || String.IsNullOrEmpty(txtNumero.Value))
                {
                    CargaCombos(true);
                    return;
                }
                else {
                    rvm = new RecargasViewModel();
                    rvm.Tiporecarga = TipoRecarga.RecargaTA;
                    rvm.WS = Session["wsac"] as wsac.IsacClient;
                    rvm.IdUsuario = 0; //int.Parse(Session["idusrlogged"].ToString());
                    rvm.idpais = int.Parse(hidPais.Value.ToString());
                    rvm.idoperadora = int.Parse(hidCompania.Value.ToString());
                    rvm.NumeroRecarga = txtNumero.Value;
                    //rvm.idpaquete = int.Parse(hidPaquete.Value.ToString());
                    rvm.idpaquete = int.Parse(idpaquetew.Value.ToString());
                    Session["rvm"] = rvm;
                    Session["RecargaPendiente"] = true;
                    Response.Redirect("nuevatarjetasinsesion.aspx");
                }
            };
        }
        private bool validaVerif(string ver) {
            bool res = false;
            ws = Session["wsac"] as wsac.IsacClient;
            bool jsonVerif = ws.verificaCliente(ver);
            if (jsonVerif) {
                res = true;
            }
            return res;
        }
        private void CargaCombos(bool muestraerr)
        {
            try
            {
                ws = Session["wsac"] as wsac.IsacClient;
                jsonPa = ws.GetCatalogo(2, ""); //pais
                jsonOp = ws.GetCatalogo(1, ""); //operadora
                jsonPq = ws.GetCatalogo(3, ""); //paquete
                if (muestraerr)
                    spnJS.Text = "<script>msgError('Faltan algunos campos obligatorios'); CargaCombos();</script>";
                else
                    spnJS.Text = "<script>CargaCombos();</script>";
            }
            catch (Exception ex)
            {
            }
        }

    }
}

