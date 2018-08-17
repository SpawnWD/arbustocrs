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
    public partial class mediosdepago : basepage
    {
        wsac.IsacClient ws;
        TarjetasViewModel tvm;
        RecargasViewModel rvm;

        protected void Page_Load(object sender, EventArgs e)
        {
            //--------------------------------------------------------------------------------------------------
            int idusr = 0;
            if (!IsPostBack)
            {
                divMenu.InnerHtml = check.GeneraMenu();
                ws = Session["wsac"] as wsac.IsacClient;
                int hab = ws.GetMonederoHab();
                if (hab == 1)
                    tbMonedero.Visible = true;
                else
                    tbMonedero.Visible = false;

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
                ws = Session["wsac"] as wsac.IsacClient;
                if (tvm == null)
                {
                    tvm = new TarjetasViewModel();
                    Session["tvm"] = tvm;
                }
                tvm.WS = ws;
                tvm.Inicia();
                if (Session["rvm"] == null)
                    Response.Redirect("datosrecarga.aspx");
                else
                    Refresh();
            }
            else
            {
                if (Request.Form["__EVENTTARGET"] == "selcard")
                {
                    RecargasViewModel rvm = Session["rvm"] as RecargasViewModel;
                    rvm.IdTarjeta = int.Parse(Request.Form["__EVENTARGUMENT"].ToString());
                    rvm.TipoTrans = TipoTransaccion.SegundaVez;
                    rvm.idFormaPago = 2; //tarjeta
                    Session["rvm"] = rvm;

                    Response.Redirect("confir_recarga.aspx");
                }
                if (Request.Form["__EVENTTARGET"] == "delcard")
                {
                    int idt = int.Parse(Request.Form["__EVENTARGUMENT"].ToString());
                    ws = Session["wsac"] as wsac.IsacClient;
                    if (ws.EliminaTarjeta(idt))
                    {
                        Response.Redirect("mediosdepago.aspx");
                    }
                }
            }

            btnUsarMon.Click += (s, ea) =>
            {
                RecargasViewModel rvm = Session["rvm"] as RecargasViewModel;
                rvm.idFormaPago = 1; //monedero
                Session["rvm"] = rvm;
                SaldoMonedero mon = Session["SaldoMonedero"] as SaldoMonedero;
                ws = Session["wsac"] as wsac.IsacClient;
                string jsonPq = ws.GetCatalogo(3, "");
                List<catPaquete> lspq = JsonConvert.DeserializeObject<List<catPaquete>>(jsonPq);

                if (lspq.Where(x => x.idpaquete == rvm.idpaquete).FirstOrDefault().monto > mon.saldo)
                {
                    spnJS.Text = "<script>msgError('No tiene suficiente saldo');</script>";
                    Refresh();
                }
                else
                    Response.Redirect("confir_recarga.aspx");
            };
            btnNvaTarjeta.Click += (s, ea) =>
            {
                Response.Redirect("nuevatarjeta.aspx");
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
                {
                    lblSaldoMon.Text = lsMon.FirstOrDefault().saldo.ToString("c");
                    btnUsarMon.CssClass = "btn default btn-xs btn-primary white";
                }
                else
                {
                    lblSaldoMon.Text = (0M).ToString("c");
                    btnUsarMon.CssClass = "btn disabled default btn-xs btn-primary white";
                }
            }
            else
            {
                Session["SaldoMonedero"] = new SaldoMonedero();
                lblSaldoMon.Text = (0M).ToString("c");
                btnUsarMon.CssClass = "btn disabled default btn-xs btn-primary white";
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