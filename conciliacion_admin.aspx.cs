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

namespace MasTicket
{
    public partial class conciliacion_admin : basepage
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
                //if (Session["rvm"] == null)
                //    Response.Redirect("datosrecarga.aspx");
                //else
                //    Refresh();
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

        private string PaymentStatus(int ps)
        {
            string ret = "";
            switch (ps)
            {
                case 1:
                    ret = "Failed"; break;
                case 3:
                    ret = "Denied"; break;
                case 4:
                    ret = "Cancelled"; break;
                case 6:
                    ret = "Failed Payment"; break;
                case 10:
                    ret = "Successful Payment"; break;
                case 13:
                    ret = "Business Rules Denied"; break;
                case 100:
                    ret = "Failed Payment"; break;
            }
            return (ret);
        }

        private void DumpExcel(string fi, string ff)
        {
            ws = Session["wsac"] as wsac.IsacClient;
            byte[] reporte = ws.ExportaRepConc(fi, ff);
            //MemoryStream stream = new MemoryStream();
            //stream.Write(reporte, 0, reporte.Length);
            //NPOI.HSSF.UserModel.HSSFWorkbook excel = new NPOI.HSSF.UserModel.HSSFWorkbook()
            string saveAsFileName = "RepConciliacion.xls";
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", saveAsFileName));
            Response.Clear();
            Response.BinaryWrite(reporte);
            Response.End();

            //using (var exporter = new NpoiExport())
            //{
            //    exporter.ExportDataTableToWorkbook(dt, "Results");
            //    string saveAsFileName = "RepConciliacion.xls"; //string.Format("Results-{0:d}.xls", DateTime.Now);
            //    Response.ContentType = "application/vnd.ms-excel";
            //    Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", saveAsFileName));
            //    Response.Clear();
            //    Response.BinaryWrite(exporter.GetBytes());
            //    Response.End();
            //}
        }

        private void Refresh(string fi, string ff)
        {
            string json = "";
            ws = Session["wsac"] as wsac.IsacClient;
            json = ws.GetReporteConciliacion(fi, ff);
            repconc rep = JsonConvert.DeserializeObject<repconc>(json);
            foreach(DataRow dr in rep.recargas.Rows)
            {
                HtmlTableRow row = new HtmlTableRow();
                Label lbl = new Label();
                if (dr["err"] is DBNull)
                    lbl.Text = "<a id=\"\" style='background-color:yellow;' class=\"btn default btn-xs\"</a>";
                else {
                    switch (dr["err"].ToString())
                    {
                        case "0":
                            lbl.Text = "<a id=\"\" style='background-color:#00ff00;' class=\"btn default btn-xs\"</a>";
                            break;
                        case "1":
                            lbl.Text = "<a id=\"\" style='background-color:#0000ff;' class=\"btn default btn-xs\"</a>";
                            break;
                        case "2":
                            lbl.Text = "<a id=\"\" style='background-color:#ff0000;' class=\"btn default btn-xs\"</a>";
                            break;
                        case "-1":
                        case "3":
                            lbl.Text = "<a id=\"\" style='background-color:yellow;' class=\"btn default btn-xs\"</a>";
                            break;
                    }
                }
                row.Cells.Add(new HtmlTableCell() { Width = "2%;" });
                row.Cells[0].Controls.Add(lbl);
                row.Cells.Add(new HtmlTableCell() { Width = "10%;", InnerHtml = dr["operadora"].ToString() });
                row.Cells.Add(new HtmlTableCell() { Width = "10%;", InnerHtml = dr["paquete"].ToString() });
                row.Cells.Add(new HtmlTableCell() { Width = "10%;", InnerHtml = dr["numerorecarga"].ToString() });
                row.Cells.Add(new HtmlTableCell() { Width = "10%;", InnerHtml = dr["fecha"].ToString() });
                row.Cells.Add(new HtmlTableCell() { Width = "10%;", InnerHtml = dr["PaymentID"].ToString() });
                row.Cells.Add(new HtmlTableCell() { Width = "10%;", InnerHtml = (rep.recargas.Columns.Contains("rstransactionid") ? dr["rstransactionid"].ToString() : "") });
                row.Cells.Add(new HtmlTableCell() { Width = "10%;", InnerHtml = (rep.recargas.Columns.Contains("rsrcode") ? dr["rsrcode"].ToString() : "") });
                row.Cells.Add(new HtmlTableCell() { Width = "28%;", InnerHtml = dr["errvestadetallado"].ToString() });
                tbReporte.Rows.Add(row);

                HtmlTable tbInterna = new HtmlTable();
                HtmlTableRow row2 = null, rowint = null; ;
                List<string> ls = new List<string> { "0", "1", "2" };
                if (ls.Contains(dr["err"].ToString()))
                {
                    DataRow[] drvesta = (rep.vesta.Rows.Count > 0 ? rep.vesta.Select("paymentid = '" + dr["PaymentID"].ToString() + "'") : new DataRow[0]);
                    DataRow[] drrs = (rep.rs.Rows.Count > 0 ? rep.rs.Select("idtransaccion = '" + dr["rstransactionid"].ToString() + "'") : new DataRow[0]);
                    if (drvesta.Count() > 0)
                    {
                        row2 = new HtmlTableRow() { BgColor = "#ffffff" };
                        rowint = new HtmlTableRow() { BgColor = "#ffffff" };
                        rowint.Cells.Add(new HtmlTableCell() { Width = "2%", InnerHtml = "<img width='40' src='assets/images/vesta.png'>" });
                        rowint.Cells.Add(new HtmlTableCell() { Width = "10%", InnerHtml = drvesta[0]["paymentid"].ToString() });
                        rowint.Cells.Add(new HtmlTableCell() { Width = "10%", InnerHtml = (decimal.Parse(drvesta[0]["amount"].ToString())).ToString("c") });
                        rowint.Cells.Add(new HtmlTableCell() { Width = "10%", InnerHtml = drvesta[0]["vestadate"].ToString() });
                        rowint.Cells.Add(new HtmlTableCell() { Width = "10%", InnerHtml = PaymentStatus(int.Parse(drvesta[0]["paymentstatus"].ToString())) });
                        rowint.Cells.Add(new HtmlTableCell() { Width = "10%", InnerHtml = drvesta[0]["paymentstatusreason"].ToString() });
                    }
                    if (dr["err"].ToString() == "0")
                    {
                        if (drrs.Count() > 0)
                        {
                            if (rowint == null)
                                rowint = new HtmlTableRow() { BgColor = "#ffffff" };
                            if (row2 == null)
                                row2 = new HtmlTableRow() { BgColor = "#ffffff" };
                            rowint.Cells.Add(new HtmlTableCell() { Width = "2%", InnerHtml = "<img width='30' src='assets/images/rs.png'>" });
                            rowint.Cells.Add(new HtmlTableCell() { Width = "10%", InnerHtml = drrs[0]["idtransaccion"].ToString() });
                            rowint.Cells.Add(new HtmlTableCell() { Width = "10%", InnerHtml = drrs[0]["fecha"].ToString() });
                            rowint.Cells.Add(new HtmlTableCell() { Width = "10%", InnerHtml = drrs[0]["celular"].ToString() });
                            rowint.Cells.Add(new HtmlTableCell() { Width = "10%", InnerHtml = (decimal.Parse(drrs[0]["monto"].ToString())).ToString("c") });
                            rowint.Cells.Add(new HtmlTableCell() { Width = "10%", InnerHtml = drrs[0]["carrier"].ToString() });
                            rowint.Cells.Add(new HtmlTableCell() { Width = "10%", InnerHtml = drrs[0]["folio"].ToString() });
                        }
                        tbInterna.Width = "100%";
                    }
                    else
                        tbInterna.Width = "50%";
                    if (drvesta.Count() > 0 || drrs.Count() > 0)
                    {
                        tbInterna.Rows.Add(rowint);
                        StringBuilder sb = new StringBuilder();
                        StringWriter tw = new StringWriter(sb);
                        HtmlTextWriter hw = new HtmlTextWriter(tw);
                        tbInterna.RenderControl(hw);
                        row2.Cells.Add(new HtmlTableCell() { Width = "100%", ColSpan = 9, InnerHtml = sb.ToString() });
                        tbReporte.Rows.Add(row2);
                    }
                }
            }
        }

    }

    public class repconc
    {
        public DataTable recargas { get; set; }
        public DataTable vesta { get; set; }
        public DataTable rs { get; set; }
    }

}
