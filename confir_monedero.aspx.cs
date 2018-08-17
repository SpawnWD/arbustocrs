using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Text;
using System.Threading.Tasks;
using System.Net.Http;
using System.Net;

namespace MasTicket
{
    public partial class confir_monedero : basepage
    {
        wsac.RecargaMonedero rm = null;
        wsac.IsacClient ws;
        public TarjetasViewModel tvm;
        public RecargasViewModel rvm;
        public string jsonOp = "", jsonPa = "", jsonPq = "", jsonTar = "", jsonEmi = "", jsonErr = "";
        ChargeAccountToTemporaryToken tk;

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
                    lblMonto.Text = rvm.MontoRecargaMonedero.ToString("c");
                    lblFormaPago.Text = (rvm.idFormaPago == 1 ? "Monedero" : "Tarjeta");
                    if (rvm.idFormaPago == 2)
                        lblEmisor.Text = tipo;
                }
            }
            else
            {
                if (Request.Form["__EVENTTARGET"] == "recargaexito")
                {
                    Session["rvm"] = null;
                    Session["tvm"] = null;
                    Response.Redirect("monedero.aspx");
                }
            }

            btnCancel.Click += (s, ea) =>
            {
                Response.Redirect("monedero.aspx");
            };

            txtNip4.TextChanged += async (s, ea) =>
            {
                string nip = Request.Form["__EVENTARGUMENT"].ToString();
                Usuario u = Session["usrlogged"] as Usuario;
                if (u.nip == nip)
                    await Recargar();
                else
                    spnJS.Text = "<script>msgError('NIP invalido. Vuelva a intentar');</script>";
            };
        }

        private async Task Recargar()
        {
            rvm = Session["rvm"] as RecargasViewModel;
            tvm = Session["tvm"] as TarjetasViewModel;
            if (rvm.idFormaPago == 2) //tarjeta
            {
                if (rvm.TipoTrans == TipoTransaccion.PrimeraVez)
                {
                    wsac.Tarjeta t = new wsac.Tarjeta()
                    {
                        idusuario = tvm.Idusuario,
                        idpais = tvm.idpais,
                        idemisor = tvm.idemisor,
                        permtoken = tvm.NumeroTarjeta,
                        Last4 = tvm.Last4,
                        titularFN = tvm.TitularFN,
                        titularLN = tvm.TitularLN,
                        calleynumero = tvm.CalleyNum,
                        idestado = tvm.IdEstado,
                        idciudad = tvm.IdCiudad,
                        codigopostal = tvm.CP,
                        expirationMMYY = tvm.ExpiraMM + tvm.ExpiraYY,
                    };
                    wsac.AltaRecargaMonederoResponse ar = new wsac.AltaRecargaMonederoResponse();
                    wsac.CargaOpenPay1aVezResponse v1r = new wsac.CargaOpenPay1aVezResponse();
                    rm = new wsac.RecargaMonedero()
                    {
                        idusuario = rvm.IdUsuario,
                        idtarjeta = (rvm.idFormaPago == 2) ? rvm.IdTarjeta : -1,
                        monto = rvm.MontoRecargaMonedero,
                        fecha = DateTime.Now,
                        TransactionID = Guid.NewGuid().ToString(),
                        os = Request.UserAgent,
                        ip = Request.UserHostAddress,
                        err = -1 // -1 es una recarga recien creada q aun no ha sido procesada (pagada)
                    };
                    try
                    {
                        ws = Session["wsac"] as wsac.IsacClient;
                        ar = await ws.AltaRecargaMonederoAsync(rm);
                        GetSessionTags tags = JsonConvert.DeserializeObject<GetSessionTags>(ar.Body.AltaRecargaMonederoResult);
                        FingerP(tags.OrgID, tags.WebSessionID);
                        await Task.Delay(TimeSpan.FromSeconds(10));
                        tk = await TempToken(tvm);
                        if (tk.ResponseCode == 0)
                        {
                            t.permtoken = tk.ChargeAccountNumberToken;
                            t.Last4 = tk.PaymentDeviceLast4;
                            rm.idrecargamonedero = tags.idrecarga;
                            v1r = await ws.CargaOpenPay1aVezAsync(null, rm, t, tags.WebSessionID, "");
                            errRecarga err = JsonConvert.DeserializeObject<errRecarga>(v1r.Body.CargaOpenPay1aVezResult);
                            if (err.err > 0)
                            {
                                jsonErr = ws.GetCatalogo(6, "");
                                List<catErrores> lserr = JsonConvert.DeserializeObject<List<catErrores>>(jsonErr);
                                string msg = "";
                                switch (err.err)
                                {
                                    case 1: //RecargaSell
                                        msg = lserr.Where(x => x.iderror == err.errRs).FirstOrDefault().error;
                                        break;
                                    case 2: //Vesta
                                        msg = lserr.Where(x => x.iderror == err.errVs).FirstOrDefault().error;
                                        break;
                                    case 3: //Comunicaciones
                                        msg = lserr.Where(x => x.iderror == 9).FirstOrDefault().error;
                                        break;
                                }
                                if (!String.IsNullOrEmpty(err.tresp.rcode_description))
                                    msg += "\\n" + err.tresp.rcode_description;
                                //spnJS.Text = "<script>msgError('Ocurrio un error: " + ce.error + (!String.IsNullOrEmpty(err.tresp.printDatam_data) ? " " + err.tresp.printDatam_data : "") + "');</script>";
                                spnJS.Text = "<script>msgError('Ocurrio un error: " + msg + "');</script>";
                            }
                            else
                            {
                                rvm = Session["rvm"] as RecargasViewModel;
                                rvm.IdTarjeta = err.idtarjeta;
                                Session["rvm"] = rvm;
                                string ticket = "";
                                ticket += "TRANSACCIÓN " + err.tresp.transaction_id + "<br />";
                                ticket += "FECHA " + DateTime.Now.ToString("dd/MMM/yyyy") + "<br />";
                                ticket += "TRANSACCIÓN EXITOSA<br />";
                                ticket += "<b>MONTO: " + rvm.MontoRecargaMonedero.ToString("c") + "</b><br />";
                                spnJS.Text = "<script>ticket('" + ticket + "');</script>";
                            }
                        }
                        else
                        {
                            spnJS.Text = "<script>msgError('Ocurrio un error');</script>";
                        }

                    }
                    catch (Exception ex)
                    {
                        spnJS.Text = "<script>msgError('Ocurrio un error');</script>";
                    }
                }
                //-----------------------------------------------------------------------------------
                if (rvm.TipoTrans == TipoTransaccion.SegundaVez)
                {
                    rm = new wsac.RecargaMonedero()
                    {
                        idusuario = rvm.IdUsuario,
                        idtarjeta = (rvm.idFormaPago == 2) ? rvm.IdTarjeta : -1,
                        monto = rvm.MontoRecargaMonedero,
                        fecha = DateTime.Now,
                        TransactionID = Guid.NewGuid().ToString(),
                        os = Request.UserAgent,
                        ip = Request.UserHostAddress,
                        err = -1 // -1 es una recarga recien creada q aun no ha sido procesada (pagada)
                    };
                    wsac.CargaVesta2aVezResponse v2r = new wsac.CargaVesta2aVezResponse();
                    try
                    {
                        ws = Session["wsac"] as wsac.IsacClient;
                        v2r = await ws.CargaVesta2aVezAsync(null, rm, "");
                        errRecarga err = JsonConvert.DeserializeObject<errRecarga>(v2r.Body.CargaVesta2aVezResult);
                        if (err.err > 0)
                        {
                            jsonErr = ws.GetCatalogo(6, "");
                            List<catErrores> lserr = JsonConvert.DeserializeObject<List<catErrores>>(jsonErr);
                            string msg = "";
                            switch (err.err)
                            {
                                case 1: //RecargaSell
                                    msg = lserr.Where(x => x.iderror == err.errRs).FirstOrDefault().error;
                                    break;
                                case 2: //Vesta
                                    msg = lserr.Where(x => x.iderror == err.errVs).FirstOrDefault().error;
                                    break;
                                case 3: //Comunicaciones
                                    msg = lserr.Where(x => x.iderror == 9).FirstOrDefault().error;
                                    break;
                            }
                            if (!String.IsNullOrEmpty(err.tresp.rcode_description))
                                msg += "\\n" + err.tresp.rcode_description;
                            spnJS.Text = "<script>msgError('Ocurrio un error: " + msg + "');</script>";
                        }
                        else
                        {
                            string ticket = "";
                            ticket += "TRANSACCIÓN " + err.tresp.transaction_id + "<br />";
                            ticket += "FECHA " + DateTime.Now.ToString("dd/MMM/yyyy") + "<br />";
                            ticket += "TRANSACCIÓN EXITOSA<br />";
                            ticket += "<b>MONTO: " + rvm.MontoRecargaMonedero.ToString("c") + "</b><br />";
                            spnJS.Text = "<script>ticket('" + ticket + "');</script>";
                        }
                    }
                    catch (Exception ex)
                    {
                        spnJS.Text = "<script>msgError('Ocurrio un error');</script>";
                    }
                }// if segundavez
            }// if formapago = 2
        }

        protected void btnCorregir_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("monedero.aspx");
        }

        private void FingerP(string orgid, string websess)
        {
            string FingerprintAPI = System.Configuration.ConfigurationManager.AppSettings["FingerprintAPI"];
            string s = String.Format(@"<form>
<p style=""background:url('{0}/ThreatMetrixUIRedirector/fp/clear.png?org_id={1}&session_id={2}&m=1')""></p>
<img src=""{0}/ThreatMetrixUIRedirector/fp/clear.png?org_id={1}&session_id={2}&m=2"" alt=""""/>
<script src=""{0}/ThreatMetrixUIRedirector/fp/check.js?org_id={1}&session_id={2}"" type=""text/javascript""></script>
<object data=""{0}/ThreatMetrixUIRedirector/fp/fp.swf?org_id={1}&session_id={2}"" type=""application/x-shockwave-flash"" width=""1"" height=""1"" id=""obj_id"">
<param value=""{0}/ThreatMetrixUIRedirector/fp/fp.swf?org_id={1}&session_id={2}"" name=""movie"" /></object>
    </form>", FingerprintAPI, orgid, websess);
            divFinger.InnerHtml = s;
        }

        private async Task<ChargeAccountToTemporaryToken> TempToken(TarjetasViewModel tvm)
        {
            string TokenizationAPI = System.Configuration.ConfigurationManager.AppSettings["TokenizationAPI"];
            string APIUsername = System.Configuration.ConfigurationManager.AppSettings["APIUsername"];
            string json = "";
            
            ChargeAccountToTemporaryToken token = new ChargeAccountToTemporaryToken();
            try
            {
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Ssl3 | SecurityProtocolType.Tls | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;
                using (var client = new HttpClient())
                {
                    var values2 = new Dictionary<string, string>
                    {
                        { "AccountName", APIUsername },
                        { "ChargeAccountNumber", tvm.NumeroTarjeta }
                    };
                    json = JsonConvert.SerializeObject(values2);
                    client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
                    var response = await client.PostAsync(TokenizationAPI + "/ChargeAccountToTemporaryToken", new StringContent(json, Encoding.UTF8, "application/json"));
                    var responseString = await response.Content.ReadAsStringAsync();
                    token = JsonConvert.DeserializeObject<ChargeAccountToTemporaryToken>(responseString);
                }
            }
            catch (Exception ex)
            {

            }
            return (token);
        }

    }
}