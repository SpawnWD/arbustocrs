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
    public partial class nuevatarjetasinsesion : basepage
    {
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
                CargaCombos(false);
            }

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
            /*btnCancelar.Click += (s, ea) =>
            {
                Session["rvm"] = null;
                Session["tvm"] = null;
                Response.Redirect("index.aspx");
            };*/
            btnGuardar.Click += (s, ea) =>
            {
                if (Session["tvm"] != null)
                    tvm = Session["tvm"] as TarjetasViewModel;
                else
                    tvm = new TarjetasViewModel();
                tvm.Idusuario = 0; //int.Parse(Session["idusrlogged"].ToString());
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
                        Session["rvm"] = rvm;
                        Response.Redirect("registro.aspx");
                    }
                }
            };
        }

        private wsac.Tarjeta ConvierteTarjTemp(TarjetasViewModel tvm)
        {
            wsac.Tarjeta t = new wsac.Tarjeta()
            {
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