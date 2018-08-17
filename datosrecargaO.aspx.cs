using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Newtonsoft.Json;
using System.Threading.Tasks;
using System.Text;

namespace MasTicket
{
    public partial class datosrecarga : basepage
    {
        wsac.IsacClient ws;
        public string jsonOp = "", jsonPa = "", jsonPq = "", jsonRc = "";
        RecargasViewModel rvm;

        protected void Page_PreRender()
        {
            ClientScript.GetPostBackEventReference(this, string.Empty);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
//--------------------------------------------------------------------------------------------------
            int idusr = 0;
            if (!IsPostBack)
            {
                divMenu.InnerHtml = check.GeneraMenu();
                if (Session["idusrlogged"] != null)
                {
                    if (int.TryParse(Session["idusrlogged"].ToString(), out idusr))
                    {
                        if (idusr > 0)
                        {
                            ws = Session["wsac"] as wsac.IsacClient;
                            //string json = ws.GetCatalogo(10, "where idusuario = " + idusr + "");
                            string json = ws.GetUser(idusr, "", "");
                            List<Usuario> lu = JsonConvert.DeserializeObject<List<Usuario>>(json);
                            if (lu.Count > 0)
                            {
                                Session["usrlogged"] = lu.FirstOrDefault();
                                lblCtaNom.Text = lu.FirstOrDefault().name;
                                if (!String.IsNullOrEmpty(lu.FirstOrDefault().picture))
                                    imgFoto.ImageUrl = lu.FirstOrDefault().picture;
                                else
                                    imgFoto.ImageUrl = "assets/images/icono_app.png";
                            }
                            else
                                Response.Redirect("index.aspx");
                        }
                        else
                            Response.Redirect("index.aspx");
                    }
                    else
                        Response.Redirect("index.aspx");
                }
                CargaCombos(false);
            }
            else
            {
                if (Request["__EVENTTARGET"] == "lnkSalir")
                {
                    Session["idusrlogged"] = 0;
                    Session["usrlogged"] = null;
                    Response.Redirect("index.aspx");
                    Session.Abandon();
                    Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
                }
            }
            //--------------------------------------------------------------------------------------------------

            if (!IsPostBack)
            {
                Session["rvm"] = null;
                ws = Session["wsac"] as wsac.IsacClient;
                //-------       la ultima exitosa       ---------------------------------------------------
                jsonRc = ws.GetCatalogo(11, "where idusuario = " + Session["idusrlogged"].ToString() + " and err = 0 and rsauthorization is not null and rsauthorization != '' order by idrecarga desc limit 1"); //recargas
                List<Recarga> lsr = JsonConvert.DeserializeObject<List<Recarga>>(jsonRc);
                if (lsr.Count > 0)
                {
                    Recarga r = lsr.FirstOrDefault();
                    spnJS.Text = "<script>CargaCombos(); SelOper(" + r.idoperadora.ToString() + ", '" + r.numerorecarga + "', " + r.idpaquete.ToString() + ");</script>";
                }
                else
                    spnJS.Text = "<script>CargaCombos();</script>";
                //------------------------------------------------------------------------------------------
                //-------       frecuentes      ------------------------------------------------------------
                jsonRc = ws.GetCatalogo(11, "where idusuario = " + Session["idusrlogged"].ToString() + " and err = 0");
                lsr = JsonConvert.DeserializeObject<List<Recarga>>(jsonRc);
                IEnumerable<string> lsnum = lsr.Select(x => x.numerorecarga).Distinct();
                List<RecargaFrecuente> lsnumcount = new List<RecargaFrecuente>();
                lsnumcount = lsnum.Select(x => new RecargaFrecuente { numerorecarga = x, numRecargas = lsr.Where(z => z.numerorecarga == x).Count() }).ToList();
                List<RecargaFrecuente> lsfrec = lsnumcount.OrderByDescending(x => x.numRecargas).Take(3).ToList();
                divFrec.InnerHtml = "<br /><br />";
                List<catOperadora> lso; List<catPaquete> lsp; string href = "";
                foreach (RecargaFrecuente rf in lsfrec)
                {
                    Recarga rtmp = lsr.Where(x => x.numerorecarga == rf.numerorecarga).FirstOrDefault();
                    rf.contactorecarga = rtmp.contactorecarga;
                    rf.idpais = rtmp.idpais;
                    rf.idoperadora = rtmp.idoperadora;
                    rf.idpaquete = rtmp.idpaquete;
                    string numformatted = new StringBuilder(12).Append(rf.numerorecarga, 0, 2).Append(" ").Append(rf.numerorecarga, 2, 4).Append(' ').Append(rf.numerorecarga, 6, 4).ToString();
                    lso = JsonConvert.DeserializeObject<List<catOperadora>>(jsonOp);
                    lsp = JsonConvert.DeserializeObject<List<catPaquete>>(jsonPq);
                    href = "javascript:CargaCombos();SelOper(" + rf.idoperadora.ToString() + ", '" + rf.numerorecarga + "', " + rf.idpaquete.ToString() + ");";
                    divFrec.InnerHtml += "<p><a href=\"" + href + "\"><b>" + numformatted + "</b><br />" + lso.Where(x => x.idoperadora == rf.idoperadora).FirstOrDefault().operadora + "&nbsp;&nbsp;" + lsp.Where(x => x.idpaquete == rf.idpaquete).FirstOrDefault().monto.ToString("c") + "</a></p>";
                }
                //--------------------------------------------------------------------------------------------------
            }

            btnMediosP.Click += (s, ea) =>
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
                    rvm.IdUsuario = int.Parse(Session["idusrlogged"].ToString());
                    rvm.idpais = int.Parse(hidPais.Value.ToString());
                    rvm.idoperadora = int.Parse(hidCompania.Value.ToString());
                    rvm.NumeroRecarga = txtNumero.Value;
                    //rvm.idpaquete = int.Parse(hidPaquete.Value.ToString());
                    rvm.idpaquete = int.Parse(idpaquetew.Value.ToString());
                    Session["rvm"] = rvm;
                    Response.Redirect("mediosdepago.aspx");
                }
            };
        }

        private void CargaCombos(bool muestraerr)
        {
            //spnJS.Text = "<script>Cargando();</script>";
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