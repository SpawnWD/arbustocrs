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
    public partial class confir_recarga : basepage
    {
        public string OPAYmerchantid = System.Configuration.ConfigurationManager.AppSettings["OPAYmerchantid"];
        public string OPAYpublickey = System.Configuration.ConfigurationManager.AppSettings["OPAYpublickey"];
        wsac.Recarga r = null;
        wsac.IsacClient ws;
        public TarjetasViewModel tvm;
        public RecargasViewModel rvm;
        public string jsonOp = "", jsonPa = "", jsonPq = "", jsonTar = "", jsonEmi = "", jsonErr = "";

        protected void Page_PreRender()
        {
            ClientScript.GetPostBackEventReference(this, string.Empty);
        }

        protected async void Page_Load(object sender, EventArgs e)
        {
            rvm = Session["rvm"] as RecargasViewModel;
            if (!String.IsNullOrEmpty(rvm.OpenPayDeviceId))
                deviceIdHiddenFieldName.Value = rvm.OpenPayDeviceId;
            else
                rvm.OpenPayDeviceId = deviceIdHiddenFieldName.Value;
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
                tvm = Session["tvm"] as TarjetasViewModel;
                if (rvm == null)
                {
                    Response.Redirect("datosrecarga.aspx", false);
                    return;
                }
                else
                {
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

                    if (Request.QueryString != null && Request.QueryString.Count > 0)
                    {//regresando de 3d secure despues de validar y redirect
                        if (!String.IsNullOrEmpty(Request.QueryString["id"]))
                        {
                            spnJS.Text = "<script>Cargando();</script>";
                            await CompletaRecarga3DSec(Request.QueryString["id"]);
                        }
                    }
                    else
                    {
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
                }
            }
            else
            {
                if (Request.Form["__EVENTTARGET"] == "iniciarecarga")
                {
                    
                }
                if (Request.Form["__EVENTTARGET"] == "recargaexito")
                {
                    Session["rvm"] = null;
                    Session["tvm"] = null;
                    Response.Redirect("datosrecarga.aspx", false);
                    return;
                }
                if (Request.Form["__EVENTTARGET"] == "programar")
                {
                    Response.Redirect("recprogramada.aspx", false);
                    return;
                }
            }

            btnCancel.Click += (s, ea) =>
            {
                Response.Redirect("datosrecarga.aspx");
            };

            txtNip4.TextChanged += async (s, ea) =>
            {
                string nip = Request.Form["__EVENTARGUMENT"].ToString();
                Usuario u = Session["usrlogged"] as Usuario;
                if (u.nip == nip)
                {
                    if (String.IsNullOrEmpty(deviceIdHiddenFieldName.Value))
                    {
                        spnJS.Text = "<script>msgError('Ocurrio un error. Vuelva a intentar');</script>";
                        return;
                    }
                    rvm.OpenPayDeviceId = deviceIdHiddenFieldName.Value;
                    await Recargar();
                }
                else
                    spnJS.Text = "<script>msgError('NIP invalido. Vuelva a intentar');</script>";
            };
        }

        private async Task CompletaRecarga3DSec(string idopenpaytr)
        {
            wsac.CargaOpenPay1aVezResponse v1r = new wsac.CargaOpenPay1aVezResponse();
            wsac.Tarjeta t = Session["TarjetaParaRecargar"] as wsac.Tarjeta;
            r = Session["RecargaParaRecargar"] as wsac.Recarga;
            rvm = Session["rvm"] as RecargasViewModel;

            v1r = await ws.CargaOpenPay1aVezAsync(r, null, t, idopenpaytr, rvm.OpenPayDeviceId);
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
                ticket += "TRANSACCIÓN EXITOSA DE: " + (Session["catOperadora"] as catOperadora).operadora + "<br />";
                ticket += "<b>MONTO: " + (Session["catPaquete"] as catPaquete).monto.ToString("c") + "</b><br />";
                ticket += "celular: " + rvm.NumeroRecarga + "<br />";
                ticket += "AUTORIZACIÓN: " + err.tresp.op_authorization + "<br />";
                ticket += err.tresp.printDatam_data;
                spnJS.Text = "<script>ticket('" + ticket + "');</script>";
            }
        }

        private async Task Recargar()  //btnRecargar.Click += async (s, ea) =>
        {
            rvm = Session["rvm"] as RecargasViewModel;
            tvm = Session["tvm"] as TarjetasViewModel;
            if (rvm.idFormaPago == 1) //monedero
            {
                r = new wsac.Recarga()
                {
                    idusuario = rvm.IdUsuario,
                    idpais = rvm.idpais,
                    idoperadora = rvm.idoperadora,
                    idpaquete = rvm.idpaquete,
                    idformapago = rvm.idFormaPago,
                    idtarjeta = (rvm.idFormaPago == 2) ? rvm.IdTarjeta : -1,
                    numerorecarga = rvm.NumeroRecarga,
                    contactorecarga = rvm.ContactoRecarga,
                    fecha = DateTime.Now,
                    TransactionID = Guid.NewGuid().ToString(),
                    err = -1, // -1 es una recarga recien creada q aun no ha sido procesada (pagada)
                    os = Request.UserAgent,
                    ip = Request.UserHostAddress,
                };
                wsac.AltaRecargaViaWalletResponse vwr = new wsac.AltaRecargaViaWalletResponse();
                try
                {
                    ws = Session["wsac"] as wsac.IsacClient;
                    vwr = await ws.AltaRecargaViaWalletAsync(r);
                    errRecarga err = JsonConvert.DeserializeObject<errRecarga>(vwr.Body.AltaRecargaViaWalletResult);
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
                        ticket += "TRANSACCIÓN EXITOSA DE: " + (Session["catOperadora"] as catOperadora).operadora + "<br />";
                        ticket += "<b>MONTO: " + (Session["catPaquete"] as catPaquete).monto.ToString("c") + "</b><br />";
                        ticket += "celular: " + rvm.NumeroRecarga + "<br />";
                        ticket += "AUTORIZACIÓN: " + err.tresp.op_authorization + "<br />";
                        ticket += err.tresp.printDatam_data;
                        spnJS.Text = "<script>ticket('" + ticket + "');</script>";
                    }
                    //spnJS.Text = "<script>ticket('prueba');</script>";
                }
                catch (Exception ex)
                {
                    //Aqui modifico Pablo y se regreso como estaba, aqui no esta el detalle
                    spnJS.Text = "<script>msgError('Ocurrio un error');</script>";
                }
            }
            //------------------------------------------------------------------------------
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
                    r = new wsac.Recarga()
                    {
                        idusuario = rvm.IdUsuario,
                        idpais = rvm.idpais,
                        idoperadora = rvm.idoperadora,
                        idpaquete = rvm.idpaquete,
                        idformapago = rvm.idFormaPago,
                        idtarjeta = (rvm.idFormaPago == 2) ? rvm.IdTarjeta : -1,
                        numerorecarga = rvm.NumeroRecarga,
                        contactorecarga = rvm.ContactoRecarga,
                        fecha = DateTime.Now,
                        TransactionID = Guid.NewGuid().ToString(),
                        err = -1, // -1 es una recarga recien creada q aun no ha sido procesada (pagada)
                        os = Request.UserAgent,
                        ip = Request.UserHostAddress,
                    };
                    try
                    {
                        ws = Session["wsac"] as wsac.IsacClient;
                        r.idrecarga = ws.AltaRecarga(r);
                        t.permtoken = rvm.OpenPayTokenId;
                        t.Last4 = (!String.IsNullOrEmpty(tvm.NumeroTarjeta) ? tvm.NumeroTarjeta.Substring(tvm.NumeroTarjeta.Length - 4, 4) : "");
                        var response3d = await ws.Carga3DSecureAsync(r, null, rvm.OpenPayDeviceId, t, 1);
                        var redirect = JsonConvert.DeserializeObject<Response3dSecure>(response3d.Body.Carga3DSecureResult);
                        if (!redirect.err)
                        {
                            Session["TarjetaParaRecargar"] = t;
                            Session["RecargaParaRecargar"] = r;
                            Response.Redirect(redirect.desc, false);
                            return;
                        }
                        else
                        {
                            string strerrcard = "";
                            int errcard = 0;
                            int.TryParse(redirect.desc, out errcard);
                            switch (errcard)
                            {
                                case 3001:
                                    strerrcard = "La tarjeta fue declinada."; break;
                                case 3002:
                                    strerrcard = "La tarjeta ha expirado."; break;
                                case 3003:
                                    strerrcard = "La tarjeta no tiene fondos suficientes."; break;
                                case 3004:
                                    strerrcard = "La tarjeta ha sido identificada como una tarjeta robada."; break;
                                case 3005:
                                    strerrcard = "La tarjeta ha sido rechazada por el sistema antifraudes."; break;
                                case 3006:
                                    strerrcard = "La operación no esta permitida para este cliente o esta transacción."; break;
                                case 3007:
                                    strerrcard = "Deprecado. La tarjeta fue declinada."; break;
                                case 3008:
                                    strerrcard = "La tarjeta no es soportada en transacciones en línea."; break;
                                case 3009:
                                    strerrcard = "La tarjeta fue reportada como perdida."; break;
                                case 3010:
                                    strerrcard = "El banco ha restringido la tarjeta."; break;
                                case 3011:
                                    strerrcard = "El banco ha solicitado que la tarjeta sea retenida. Contacte al banco."; break;
                                case 3012:
                                    strerrcard = "Se requiere solicitar al banco autorización para realizar este pago."; break;
                            }
                            spnJS.Text = "<script>msgError('Ocurrio un error: " + strerrcard + "');</script>";
                        }
                    }
                    //Este es el exception que salta
                    catch (Exception ex)
                    {
                        spnJS.Text = "<script>msgError('Ocurrio un error: " + r.err.ToString() + "');</script>";
                    }
                }
                //-----------------------------------------------------------------------------------
                if (rvm.TipoTrans == TipoTransaccion.SegundaVez)
                {
                    wsac.Tarjeta t = new wsac.Tarjeta() { idtarjeta = rvm.IdTarjeta };
                    r = new wsac.Recarga()
                    {
                        idusuario = rvm.IdUsuario,
                        idpais = rvm.idpais,
                        idoperadora = rvm.idoperadora,
                        idpaquete = rvm.idpaquete,
                        idformapago = rvm.idFormaPago,
                        idtarjeta = (rvm.idFormaPago == 2) ? rvm.IdTarjeta : -1,
                        numerorecarga = rvm.NumeroRecarga,
                        contactorecarga = rvm.ContactoRecarga,
                        fecha = DateTime.Now,
                        TransactionID = Guid.NewGuid().ToString(),
                        err = -1, // -1 es una recarga recien creada q aun no ha sido procesada (pagada)
                        os = Request.UserAgent,
                        ip = Request.UserHostAddress,
                    };
                    try
                    {
                        ws = Session["wsac"] as wsac.IsacClient;
                        r.idrecarga = ws.AltaRecarga(r);
                        var response3d = await ws.Carga3DSecureAsync(r, null, rvm.OpenPayDeviceId, t, 2);
                        var redirect = JsonConvert.DeserializeObject<Response3dSecure>(response3d.Body.Carga3DSecureResult);
                        if (!redirect.err)
                        {
                            Session["TarjetaParaRecargar"] = t;
                            Session["RecargaParaRecargar"] = r;
                            Response.Redirect(redirect.desc, false);
                            return;
                        }
                        else
                        {
                            string strerrcard = "";
                            int errcard = 0;
                            int.TryParse(redirect.desc, out errcard);
                            switch (errcard)
                            {
                                case 3001:
                                    strerrcard = "La tarjeta fue declinada."; break;
                                case 3002:
                                    strerrcard = "La tarjeta ha expirado."; break;
                                case 3003:
                                    strerrcard = "La tarjeta no tiene fondos suficientes."; break;
                                case 3004:
                                    strerrcard = "La tarjeta ha sido identificada como una tarjeta robada."; break;
                                case 3005:
                                    strerrcard = "La tarjeta ha sido rechazada por el sistema antifraudes."; break;
                                case 3006:
                                    strerrcard = "La operación no esta permitida para este cliente o esta transacción."; break;
                                case 3007:
                                    strerrcard = "Deprecado. La tarjeta fue declinada."; break;
                                case 3008:
                                    strerrcard = "La tarjeta no es soportada en transacciones en línea."; break;
                                case 3009:
                                    strerrcard = "La tarjeta fue reportada como perdida."; break;
                                case 3010:
                                    strerrcard = "El banco ha restringido la tarjeta."; break;
                                case 3011:
                                    strerrcard = "El banco ha solicitado que la tarjeta sea retenida. Contacte al banco."; break;
                                case 3012:
                                    strerrcard = "Se requiere solicitar al banco autorización para realizar este pago."; break;
                            }
                            spnJS.Text = "<script>msgError('Ocurrio un error: " + strerrcard + "');</script>";
                        }
                    }
                    catch (Exception ex)
                    {
                        spnJS.Text = "<script>msgError('Ocurrio un error: " + r.err.ToString() + "');</script>";
                    }
                }// if segundavez
            }// if formapago = 2
        }

        protected void btnCorregir_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("datosrecarga.aspx");
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