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
using System.Data;
using System.Text;
using System.IO;
using System.Globalization;

namespace MasTicket
{
    public partial class repusuarios : basepage
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
                if (Session["idadminlogged"] != null)
                {
                    if (int.TryParse(Session["idadminlogged"].ToString(), out idusr))
                    {
                        if (idusr > 0)
                        {
                            ws = Session["wsac"] as wsac.IsacClient;
                            string json = ws.GetAdmin(idusr, "", "");
                            List<Usuario> lu = JsonConvert.DeserializeObject<List<Usuario>>(json);
                            if (lu.Count > 0)
                            {
                                Session["adminlogged"] = lu.FirstOrDefault();
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
                    Session["idadminlogged"] = 0;
                    Session["adminlogged"] = null;
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
            }

            btnExcel.Click += (s, ea) =>
            {
                DateTime dtini = DateTime.MinValue; DateTime dtfin = DateTime.MinValue;
                if (DateTime.TryParseExact(fini.Value, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out dtini) && DateTime.TryParseExact(ffin.Value, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out dtfin))
                {
                    DumpExcel(dtini.ToString("yyyyMMdd"), dtfin.ToString("yyyyMMdd"));
                    spnJS.Text = "";
                }
                else
                    spnJS.Text = "<script>msgError('Faltan fecha de inicio y fin');</script>";
            };
            btnConsultar.Click += (s, ea) =>
            {
                DateTime dtini = DateTime.MinValue; DateTime dtfin = DateTime.MinValue;
                if (DateTime.TryParseExact(fini.Value, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out dtini) && DateTime.TryParseExact(ffin.Value, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out dtfin))
                {
                    Refresh(dtini.ToString("yyyyMMdd"), dtfin.ToString("yyyyMMdd"));
                    spnJS.Text = "";
                }
                else
                    spnJS.Text = "<script>msgError('Faltan fecha de inicio y fin');</script>";
            };
        }

        private void DumpExcel(string fi, string ff)
        {
            ws = Session["wsac"] as wsac.IsacClient;
            byte[] reporte = ws.ExportaRepUsrF(fi,ff);
            string saveAsFileName = "RepUsrs.xls";
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", saveAsFileName));
            Response.Clear();
            Response.BinaryWrite(reporte);
            Response.End();
        }

        private void Refresh(string fi, string ff)
        {
            string json = "";
            string formatted = "";
            ws = Session["wsac"] as wsac.IsacClient;
            json = ws.GetUsersF(fi,ff);
            List<Usuario> lsu = JsonConvert.DeserializeObject<List<Usuario>>(json);
            CultureInfo ci = new CultureInfo("es-MX");
            foreach (Usuario u in lsu)
            {
                HtmlTableRow row = new HtmlTableRow();
                row.Cells.Add(new HtmlTableCell() { Width = "3%;", InnerHtml = u.idusuario.ToString() });
                row.Cells.Add(new HtmlTableCell() { Width = "10%;", InnerHtml = u.fechaalta.ToString("dd/MMM/yyyy", ci) });
                row.Cells.Add(new HtmlTableCell() { Width = "10%;", InnerHtml = (u.FechaPrimera == null ? "" : (u.FechaPrimera.Year == 1 ? "" : u.FechaPrimera.ToString("dd/MMM/yyyy", ci))) });
                row.Cells.Add(new HtmlTableCell() { Width = "10%;", InnerHtml = (u.FechaUltima == null ? "" : (u.FechaUltima.Year == 1 ? "" : u.FechaUltima.ToString("dd/MMM/yyyy", ci))) });
                row.Cells.Add(new HtmlTableCell() { Width = "10%;", InnerHtml = u.NumRecargas.ToString() });
                row.Cells.Add(new HtmlTableCell() { Width = "20%;", InnerHtml = u.name });
                //row.Cells.Add(new HtmlTableCell() { Width = "10%;", InnerHtml = u.gender });
                row.Cells.Add(new HtmlTableCell() { Width = "20%;", InnerHtml = u.email });
                formatted = (u.numerocontacto.Length == 10 ? new StringBuilder(12).Append(u.numerocontacto, 0, 2).Append(" ").Append(u.numerocontacto, 2, 4).Append(' ').Append(u.numerocontacto, 6, 4).ToString() : u.numerocontacto);
                row.Cells.Add(new HtmlTableCell() { Width = "20%;", InnerHtml = formatted });
                tbReporte.Rows.Add(row);
            }
        }

    }

}
