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
    public partial class histrecprog : basepage
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
                //if (Session["rvm"] == null)
                //    Response.Redirect("datosrecarga.aspx");
                //else
                    Refresh();
            }
            else
            {
                if (Request.Form["__EVENTTARGET"] == "delrec")
                {
                    int idr = int.Parse(Request.Form["__EVENTARGUMENT"].ToString());
                    ws = Session["wsac"] as wsac.IsacClient;
                    if (ws.EliminaRecProg(idr))
                    {
                        Response.Redirect("histrecprog.aspx");
                    }
                }
            }
        }

        private void Refresh()
        {
            string json = "", formapag = "";
            tvm = Session["tvm"] as TarjetasViewModel;
            json = ws.GetCatalogo(13, "where idusuario = " + Session["idusrlogged"].ToString());
            List<RecargaProg> lsRec = JsonConvert.DeserializeObject<List<RecargaProg>>(json);

            json = ws.GetCatalogo(9, "where idusuario = " + Session["idusrlogged"].ToString());
            List<Tarjeta> lsTar = JsonConvert.DeserializeObject<List<Tarjeta>>(json);

            foreach (RecargaProg r in lsRec)
            {
                if (r.idformapago == 1)
                    formapag = "Monedero";
                if (r.idformapago == 2)
                {
                    Tarjeta t = lsTar.Where(x => x.idtarjeta == r.idtarjeta).FirstOrDefault();
                    formapag = tvm.LsEmisores().Where(x => x.idemisor == t.idemisor).FirstOrDefault().emisor + " " + (t != null ? t.last4 : "");
                }
                HtmlTableRow row = new HtmlTableRow();
                row.Cells.Add(new HtmlTableCell() { Width = "30%;", InnerHtml = r.numerorecarga });
                row.Cells.Add(new HtmlTableCell() { Width = "30%;", InnerHtml = formapag });
                row.Cells.Add(new HtmlTableCell() { Width = "30%;", InnerHtml = r.diasmes.Substring(0, r.diasmes.Length - 1) + " de cada mes" });

                Label lbldel = new Label();
                lbldel.Text = "<a id=\"del" + r.idrecarga.ToString() + "\" class=\"btn default btn-xs bg-black white\" href=\"javascript:borrarecarga(" + r.idrecarga.ToString() + ");\"><i class=\"fa fa-trash\"></i> Borrar recarga</a>";
                row.Cells.Add(new HtmlTableCell() { Width = "60%;" });
                row.Cells[3].Controls.Add(lbldel);

                row.Cells.Add(new HtmlTableCell() { Width = "15%;", InnerHtml = "" });
                tbTarjetas.Rows.Add(row);
            }
        }

    }
}