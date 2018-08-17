using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Newtonsoft.Json;
using System.Net.Sockets;
using System.Net;

namespace MasTicket
{
    public partial class monedero : basepage
    {
        wsac.IsacClient ws;
        TarjetasViewModel tvm;
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
                if (Session["idusrlogged"] != null)
                {
                    if (int.TryParse(Session["idusrlogged"].ToString(), out idusr))
                    {
                        if (idusr > 0)
                        {
                            ws = Session["wsac"] as wsac.IsacClient;
                            //  18/Mar/2017
                            //int hab = ws.GetMonederoHab();
                            //if (hab == 1){
                            //          //string json = ws.GetCatalogo(10, "where idusuario = " + idusr + "");
                            //          string json = ws.GetUser(idusr, "", "");
                            //          List<Usuario> lu = JsonConvert.DeserializeObject<List<Usuario>>(json);
                            //          if (lu.Count > 0)
                            //          {
                            // 	            Session["usrlogged"] = lu.FirstOrDefault();
                            //     	        lblCtaNom.Text = lu.FirstOrDefault().name;
                            //         	    if (!String.IsNullOrEmpty(lu.FirstOrDefault().picture))
                            //             	    imgFoto.ImageUrl = lu.FirstOrDefault().picture;
                            //             	else
                            //                 	imgFoto.ImageUrl = "assets/images/icono_app.png";
                            //         	}
                            //         	else
                            //             	Response.Redirect("index.aspx");
                            //         }
                            //         else
                            Response.Redirect("datosrecarga.aspx"); //monedero no habilitado
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
            //-------------------------------------------------------------------------------------------------

            if (!IsPostBack)
            {
                ws = Session["wsac"] as wsac.IsacClient;
                if (tvm == null)
                {
                    tvm = new TarjetasViewModel();
                    Session["tvm"] = tvm;
                }
                tvm.WS = ws;
                tvm.Inicia();
                Refresh();

                rvm = new RecargasViewModel();
                rvm.Tiporecarga = TipoRecarga.Monedero;
                rvm.WS = Session["wsac"] as wsac.IsacClient;
                rvm.IdUsuario = int.Parse(Session["idusrlogged"].ToString());
                rvm.MontoRecargaMonedero = 0;
                Session["rvm"] = rvm;
            }
            else
            {
                ws = Session["wsac"] as wsac.IsacClient;
                if (Request.Form["__EVENTTARGET"] == "selcard")
                {
                    decimal monto = 0;
                    if (decimal.TryParse(check.SafeSqlLiteral(txtMonto.Text.Trim()), out monto))
                    {
                        if (monto > 0M)
                        {
                            decimal montomax = ws.GetMontoMax();
                            if (monto > montomax)
                            {
                                spnJS.Text = "<script>msgError('Solamente le es permitido agregar " + montomax.ToString("c") + " por cada evento');</script>";
                                Refresh();
                            }
                            else
                            {
                                RecargasViewModel rvm = Session["rvm"] as RecargasViewModel;
                                rvm.IdTarjeta = int.Parse(Request.Form["__EVENTARGUMENT"].ToString());
                                rvm.TipoTrans = TipoTransaccion.SegundaVez;
                                rvm.idFormaPago = 2; //tarjeta
                                rvm.MontoRecargaMonedero = monto;
                                Session["rvm"] = rvm;
                                Response.Redirect("confir_monedero.aspx");
                            }
                        }
                        else {
                            spnJS.Text = "<script>msgError('Capture el saldo a cargar');</script>";
                            Refresh();
                        }
                    }
                    else
                    {
                        spnJS.Text = "<script>msgError('Capture el saldo a cargar');</script>";
                        Refresh();
                    }
                }
                if (Request.Form["__EVENTTARGET"] == "delcard")
                {
                    int idt = int.Parse(Request.Form["__EVENTARGUMENT"].ToString());
                    ws = Session["wsac"] as wsac.IsacClient;
                    if (ws.EliminaTarjeta(idt))
                    {
                        Response.Redirect("monedero.aspx");
                    }
                }
            }

            
            btnNvaTarjeta.Click += (s, ea) =>
            {
                ws = Session["wsac"] as wsac.IsacClient;
                decimal monto = 0;
                if (decimal.TryParse(txtMonto.Text.Trim(), out monto))
                {
                    if (monto > 0M)
                    {
                        decimal montomax = ws.GetMontoMax();
                        if (monto > montomax)
                        {
                            spnJS.Text = "<script>msgError('Solamente le es permitido agregar " + montomax.ToString("c") + " por cada evento');</script>";
                            Refresh();
                        }
                        else
                        {
                            RecargasViewModel rvm = Session["rvm"] as RecargasViewModel;
                            rvm.TipoTrans = TipoTransaccion.SegundaVez;
                            rvm.idFormaPago = 2; //tarjeta
                            rvm.MontoRecargaMonedero = monto;
                            Session["rvm"] = rvm;
                            Response.Redirect("nuevatarjeta.aspx");
                        }
                    }
                    else {
                        spnJS.Text = "<script>msgError('Capture el saldo a cargar');</script>";
                        Refresh();
                    }
                }
                else
                {
                    spnJS.Text = "<script>msgError('Capture el saldo a cargar');</script>";
                    Refresh();
                }
            };
        }

        private void Refresh()
        {
            string json = "";
            tvm = Session["tvm"] as TarjetasViewModel;
            // monedero
            json = ws.GetCatalogo(12, "where idusuario = " + Session["idusrlogged"].ToString());
            List<SaldoMonedero> lsMon = JsonConvert.DeserializeObject<List<SaldoMonedero>>(json);
            if (lsMon.Count() > 0)
            {
                Session["SaldoMonedero"] = lsMon.FirstOrDefault();
                if (lsMon.FirstOrDefault().saldo > 0M)
                    lblSaldoMon.Text = lsMon.FirstOrDefault().saldo.ToString("c");
                else
                    lblSaldoMon.Text = (0M).ToString("c");
            }
            else
            {
                Session["SaldoMonedero"] = new SaldoMonedero();
                lblSaldoMon.Text = (0M).ToString("c");
            }
            json = "";
            json = ws.GetCatalogo(9, "where idusuario = " + Session["idusrlogged"].ToString());
            List<Tarjeta> lsTar = JsonConvert.DeserializeObject<List<Tarjeta>>(json);
            foreach (Tarjeta t in lsTar)
            {
                HtmlTableRow row = new HtmlTableRow();
                row.Cells.Add(new HtmlTableCell() { Width = "20%;", InnerHtml = "<img src='" + tvm.LsEmisores().Where(x => x.idemisor == t.idemisor).FirstOrDefault().img + "' />" });
                row.Cells.Add(new HtmlTableCell() { Width = "30%;", InnerHtml = tvm.LsEmisores().Where(x => x.idemisor == t.idemisor).FirstOrDefault().emisor + " " + t.last4 });
                //row.Cells.Add(new HtmlTableCell() { Width = "35%;", InnerHtml = tvm.LsEmisores().Where(x => x.idemisor == t.idemisor).FirstOrDefault().emisor + " " + t.last4 });

                Label lbl = new Label();
                lbl.Text = "<a id=\"sel" + t.idtarjeta.ToString() + "\" class=\"btn default btn-xs btn-primary white\" href=\"javascript:__doPostBack('selcard','" + t.idtarjeta.ToString() + "');\"><i class=\"fa fa-credit-card\"></i> Usar esta tarjeta</a>&nbsp;&nbsp;&nbsp;";

                Label lbldel = new Label();
                lbldel.Text = "<a id=\"del" + t.idtarjeta.ToString() + "\" class=\"btn default btn-xs bg-black white\" href=\"javascript:borratarjeta(" + t.idtarjeta.ToString() + ");\"><i class=\"fa fa-trash\"></i> Borrar tarjeta</a>";

                row.Cells.Add(new HtmlTableCell() { Width = "60%;" });
                row.Cells[2].Controls.Add(lbl);
                row.Cells[2].Controls.Add(lbldel);

                row.Cells.Add(new HtmlTableCell() { Width = "15%;", InnerHtml = "" });
                tbTarjetas.Rows.Add(row);
            }
        }

    }
}