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
    public partial class recprogramada : System.Web.UI.Page
    {
        wsac.IsacClient ws;
        public TarjetasViewModel tvm;
        public RecargasViewModel rvm;
        public string jsonOp = "", jsonPa = "", jsonPq = "", jsonTar = "", jsonEmi = "", jsonErr = "";

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
            
            btnProgramar.Click += async (s, ea) =>
            {
                wsac.AltaRecargaProgResponse rr = new wsac.AltaRecargaProgResponse();
                string dias = hidDias.Value.Trim();
                if (dias.Length > 1)
                {
                    try
                    {
                        ws = Session["wsac"] as wsac.IsacClient;
                        rvm = Session["rvm"] as RecargasViewModel;
                        tvm = Session["tvm"] as TarjetasViewModel;
                        wsac.RecargaProg rp = new wsac.RecargaProg()
                        {
                            idusuario = rvm.IdUsuario,
                            idpais = rvm.idpais,
                            idoperadora = rvm.idoperadora,
                            idpaquete = rvm.idpaquete,
                            idformapago = rvm.idFormaPago,
                            idtarjeta = (rvm.idFormaPago == 2) ? rvm.IdTarjeta : -1,
                            numerorecarga = rvm.NumeroRecarga,
                            contactorecarga = rvm.ContactoRecarga,
                            diasmes = dias,
                        };
                        rr = await ws.AltaRecargaProgAsync(rp);
                        if (rr.Body.AltaRecargaProgResult > 0)
                            spnJS.Text = "<script>programada('Su recarga quedo programada');</script>";
                    }
                    catch (Exception ex)
                    {
                        spnJS.Text = "<script>msgError('Ocurrio un error');</script>";
                    }
                }
                else
                    spnJS.Text = "<script>msgError('Seleccione al menos un dia');</script>";
            };
            if (!IsPostBack)
            {
                catPais pa = new catPais();
                catOperadora op = new catOperadora();
                catPaquete cp = new catPaquete();
                Tarjeta tar = new Tarjeta();
                catEmisorTC em = new catEmisorTC();
                string tipo = "";
                rvm = Session["rvm"] as RecargasViewModel;
                tvm = Session["tvm"] as TarjetasViewModel;
                if (rvm == null)
                    Response.Redirect("datosrecarga.aspx");
                else {
                    jsonOp = ws.GetCatalogo(1, "");
                    List<catOperadora> lsoper = JsonConvert.DeserializeObject<List<catOperadora>>(jsonOp);
                    op = lsoper.Where(x => x.idpais == rvm.idpais && x.idoperadora == rvm.idoperadora).FirstOrDefault();
                    Session["catOperadora"] = op;
                    jsonPa = ws.GetCatalogo(2, "");
                    List<catPais> lspais = JsonConvert.DeserializeObject<List<catPais>>(jsonPa);
                    pa = lspais.Where(x => x.idpais == rvm.idpais).FirstOrDefault();
                    jsonPq = ws.GetCatalogo(3, "");
                    List<catPaquete> lspq = JsonConvert.DeserializeObject<List<catPaquete>>(jsonPq);
                    cp = lspq.Where(x => x.idpaquete == rvm.idpaquete).FirstOrDefault();
                    Session["catPaquete"] = cp;

                    if (rvm.idFormaPago == 2)
                    { //tarjeta
                        if (rvm.TipoTrans == TipoTransaccion.PrimeraVez)
                        {
                            jsonEmi = ws.GetCatalogo(4, "");
                            List<catEmisorTC> lsemi = JsonConvert.DeserializeObject<List<catEmisorTC>>(jsonEmi);
                            em = lsemi.Where(x => x.idemisor == tvm.idemisor).FirstOrDefault();
                            tipo = (em != null ? em.emisor + " " : "") + tvm.NumeroTarjeta.Substring(tvm.NumeroTarjeta.Length - 4, 4);
                        }
                        if (rvm.TipoTrans == TipoTransaccion.SegundaVez)
                        {
                            jsonTar = ws.GetCatalogo(9, "where idusuario = " + Session["idusrlogged"].ToString());
                            List<Tarjeta> lstar = JsonConvert.DeserializeObject<List<Tarjeta>>(jsonTar);
                            tar = lstar.Where(x => x.idtarjeta == rvm.IdTarjeta).FirstOrDefault();
                            jsonEmi = ws.GetCatalogo(4, "");
                            List<catEmisorTC> lsemi = JsonConvert.DeserializeObject<List<catEmisorTC>>(jsonEmi);
                            em = lsemi.Where(x => x.idemisor == tar.idemisor).FirstOrDefault();
                            tipo = (em != null ? em.emisor + " " : "") + tar.last4;
                        }
                    }
                    string formatted = new StringBuilder(12).Append(rvm.NumeroRecarga, 0, 2).Append(" ").Append(rvm.NumeroRecarga, 2, 4).Append(' ').Append(rvm.NumeroRecarga, 6, 4).ToString();
                    lblPais.Text = pa.pais;
                    lblNumero.Text = formatted;
                    lblOperadora.Text = op.operadora;
                    lblMonto.Text = cp.monto.ToString("c");
                    lblFormaPago.Text = (rvm.idFormaPago == 1 ? "Monedero" : "Tarjeta");
                    if (rvm.idFormaPago == 2)
                        lblEmisor.Text = tipo;
                    if (rvm.idFormaPago == 1)
                        lblTarjTxt.Text = "";
                }
            } else
            {
                if (Request.Form["__EVENTTARGET"] == "programaexito")
                {
                    Session["rvm"] = null;
                    Session["tvm"] = null;
                    Response.Redirect("datosrecarga.aspx");
                }
            }
        }
    }
}