using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using CreditCardValidator;

namespace MasTicket
{
    public partial class nuevatarjeta : basepage
    {
        public string OPAYmerchantid = System.Configuration.ConfigurationManager.AppSettings["OPAYmerchantid"];
        public string OPAYpublickey = System.Configuration.ConfigurationManager.AppSettings["OPAYpublickey"];
        wsac.IsacClient ws;
        public string jsonPa = "", jsonEmi = "", jsonEdo = "", jsonCd = "";
        public TarjetasViewModel tvm;
        public CreditCardDetector ccv;

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
            //-------------------------------------------------------------------------------------------------

            txtNum4.TextChanged += (s, ea) =>
            {
                string num = "";
                if (!String.IsNullOrEmpty(txtNum1.Text) && !String.IsNullOrEmpty(txtNum2.Text) && !String.IsNullOrEmpty(txtNum3.Text) && !String.IsNullOrEmpty(txtNum4.Text))
                {
                    num = txtNum1.Text.Trim() + txtNum2.Text.Trim() + txtNum3.Text.Trim() + txtNum4.Text.Trim(); 
                    if (Session["tvm"] != null)
                        tvm = Session["tvm"] as TarjetasViewModel;
                    else
                        tvm = new TarjetasViewModel();

                    ccv = new CreditCardDetector(num);
                    if (ccv.IsValid())
                    {
                        tvm.idemisor = SetEmisor(ccv.Brand);
                        tvm.NumeroTarjeta = num;
                        emisor.Value = tvm.idemisor.ToString();
                    }
                    else {
                        tvm.idemisor = SetEmisor(ccv.Brand);
                        tvm.NumeroTarjeta = "";
                        emisor.Value = tvm.idemisor.ToString();
                    }
                    Session["tvm"] = tvm;

                    ws = Session["wsac"] as wsac.IsacClient;
                    jsonPa = ws.GetCatalogo(2, ""); //pais
                    jsonEmi = ws.GetCatalogo(4, ""); //emisor
                    jsonEdo = ws.GetCatalogo(7, ""); //estados
                    jsonCd = ws.GetCatalogo(8, "order by municipio"); //ciudades
                    spnJS.Text = "<script>CargaCombos(); SetEmisor('" + tvm.idemisor.ToString() + "');</script>";                    
                }
            };
            btnCancelar.Click += (s, ea) =>
            {
                RecargasViewModel rvm = Session["rvm"] as RecargasViewModel;
                if (rvm.Tiporecarga == TipoRecarga.RecargaTA)
                    Response.Redirect("mediosdepago.aspx");
                if (rvm.Tiporecarga == TipoRecarga.Monedero)
                    Response.Redirect("monedero.aspx");
            };
            btnGuardar.Click += (s, ea) =>
            {
                if (String.IsNullOrEmpty(deviceIdHiddenFieldName.Value))
                {
                    spnJS.Text = "<script>msgError('Ocurrio un error. Vuelva a intentar');</script>";
                    return;
                }
                if (String.IsNullOrEmpty(token_id.Value))
                {
                    spnJS.Text = "<script>msgError('Ocurrio un error. Vuelva a intentar');</script>";
                    return;
                }

                if (Session["tvm"] != null)
                    tvm = Session["tvm"] as TarjetasViewModel;
                else
                    tvm = new TarjetasViewModel();
                tvm.Idusuario = int.Parse(Session["idusrlogged"].ToString());
                tvm.idpais = int.Parse(hidPais.Value);
                tvm.ExpiraMM = mes.Value;
                tvm.ExpiraYY = anio.Value;
                tvm.Cvc = cvc.Value;
                tvm.TitularFN = nombre.Value;
                tvm.TitularLN = apellidos.Value;
                tvm.CalleyNum = domicilio.Value;
                tvm.IdEstado = int.Parse(hidEstado.Value);
                tvm.IdCiudad = int.Parse(hidCiudad.Value);
                tvm.CP = codpostal.Value;
                Session["tvm"] = tvm;

                if (tvm.EsIncompleta())
                    CargaCombos(true);
                else {
                    if (tvm.ExpiraMM.Length < 2 || tvm.ExpiraYY.Length < 2)
                        CargaCombos(true);
                    else {
                        RecargasViewModel rvm = Session["rvm"] as RecargasViewModel;
                        rvm.TipoTrans = TipoTransaccion.PrimeraVez;
                        rvm.idFormaPago = 2; //tarjeta
                        rvm.OpenPayDeviceId = deviceIdHiddenFieldName.Value;
                        rvm.OpenPayTokenId = token_id.Value;
                        Session["rvm"] = rvm;
                        if (rvm.Tiporecarga == TipoRecarga.RecargaTA)
                            Response.Redirect("confir_recarga.aspx");
                        if (rvm.Tiporecarga == TipoRecarga.Monedero)
                            Response.Redirect("confir_monedero.aspx");
                    }
                }
            };
        }

        private wsac.Tarjeta ConvierteTarjTemp(TarjetasViewModel tvm)
        {
            wsac.Tarjeta t = new wsac.Tarjeta()
            {
                //idpais = tvm.idpais,
                //idemisor = tvm.idemisor,
                //numero = tvm.NumeroTarjeta,
                //expiramm = tvm.ExpiraMM,
                //expirayy = tvm.ExpiraYY,
                //cvv = tvm.Cvc,
                titularFN = tvm.TitularFN,
                titularLN = tvm.TitularLN,
                calleynumero = tvm.CalleyNum,
                idestado = tvm.IdEstado,
                idciudad = tvm.IdCiudad,
                codigopostal = tvm.CP,
                idusuario = tvm.Idusuario,
            };
            return (t);
        }

        private void CargaCombos(bool muestraerr)
        {
            ws = Session["wsac"] as wsac.IsacClient;
            jsonPa = ws.GetCatalogo(2, ""); //pais
            jsonEmi = ws.GetCatalogo(4, ""); //emisor
            jsonEdo = ws.GetCatalogo(7, ""); //estados
            jsonCd = ws.GetCatalogo(8, "order by municipio"); //ciudades
            if (muestraerr)
                spnJS.Text = "<script>msgError('Faltan algunos campos obligatorios'); CargaCombos();</script>";
            else
                spnJS.Text = "<script>CargaCombos();</script>";
        }

        private int SetEmisor(CardIssuer tipo)
        {
            int localtipo = 0;
            switch (tipo)
            {
                case CardIssuer.AmericanExpress:
                    localtipo = 3; break;
                case CardIssuer.DinersClub:
                    localtipo = 7; break;
                case CardIssuer.Discover:
                    localtipo = 6; break;
                //case CardIssuer.JCB:
                //    Cambia(9); break;
                //case CardIssuer.Maestro:
                //    Cambia(5); break;
                case CardIssuer.MasterCard:
                    localtipo = 5; break;
                case CardIssuer.Unknown:
                    localtipo = 98; break;
                case CardIssuer.Visa:
                    localtipo = 4; break;
                default:
                    localtipo = 98; break;
            }
            return (localtipo);
        }

    }
}