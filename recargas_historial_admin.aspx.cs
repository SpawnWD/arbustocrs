using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Data;

namespace MasTicket
{
    public partial class recargas_historial_admin : basepage
    {
        wsac.IsacClient ws;

        protected void GridView1_PageIndexChanging(Object sender, GridViewPageEventArgs e)
        {
            GridView gv = (GridView)sender;
            gv.PageIndex = e.NewPageIndex;
            //getrecargas();
        }



        protected void PageDropDownList_SelectedIndexChanged(Object sender, EventArgs e)
        {
            try
            {   
                GridViewRow pagerRow = GridView1.BottomPagerRow;
                DropDownList pageList = (DropDownList)pagerRow.Cells[0].FindControl("PageDropDownList");
                GridView1.PageIndex = pageList.SelectedIndex;
                getoperadora(" ");
            }
            catch (Exception err)
            {

            }
        }

        protected void list_operadora_SelectedIndexChanged(Object sender, EventArgs e)
        {
            try
            {
                GridView1.Visible = false;
                 string claveoperadora = list_operadora.SelectedValue;
                loadpaquete(claveoperadora);
            }
            catch (Exception err)
            {

            }
        }

        protected void list_paquete_SelectedIndexChanged(Object sender, EventArgs e)
        {
            try
            {
                string claveopaquete = list_paquete.SelectedValue;
                get_detallado(claveopaquete);
            }
            catch (Exception err)
            {

            }
        }


        protected void CustomersGridView_DataBound(Object sender, EventArgs e)
        {
            GridViewRow pagerRow = GridView1 .BottomPagerRow;
            DropDownList pageList = (DropDownList)pagerRow.Cells[0].FindControl("PageDropDownList");
            Label pageLabel = (Label)pagerRow.Cells[0].FindControl("CurrentPageLabel");

            if (pageList != null)
            {
                for (int i = 0; i < GridView1.PageCount; i++)
                {
                    int pageNumber = i + 1;
                    ListItem item = new ListItem(pageNumber.ToString());
                    if (i == GridView1.PageIndex)
                    {
                        item.Selected = true;
                    }
                    pageList.Items.Add(item);
                }
            }

            if (pageLabel != null)
            {
                int currentPage = GridView1.PageIndex + 1;
                pageLabel.Text = "Pagina " + currentPage.ToString()  +
                  " de " + GridView1.PageCount.ToString();
            }
        }

        protected void PageDropDownList1_DataBound(Object sender, EventArgs e)
        {
            GridViewRow pagerRow = GridView2.BottomPagerRow;
            DropDownList pageList = (DropDownList)pagerRow.Cells[0].FindControl("PageDropDownList1");
            Label pageLabel = (Label)pagerRow.Cells[0].FindControl("CurrentPageLabel1");

            if (pageList != null)
            {
                for (int i = 0; i < GridView2.PageCount; i++)
                {
                    int pageNumber = i + 1;
                    ListItem item = new ListItem(pageNumber.ToString());
                    if (i == GridView2.PageIndex)
                    {
                        item.Selected = true;
                    }
                    pageList.Items.Add(item);
                }
            }

            if (pageLabel != null)
            {
                int currentPage = GridView2.PageIndex + 1;
                pageLabel.Text = "Pagina " + currentPage.ToString() +
                  " de " + GridView2.PageCount.ToString();
            }
        }

        private void loadoperadora()
        {
            ws = Session["wsac"] as wsac.IsacClient;

            string sql_consulta = "SELECT * FROM catoperadora";

            string json = ws.GetCatalogoPersonalizado(sql_consulta);
            List<catOperadora> list_oper = JsonConvert.DeserializeObject<List<catOperadora>>(json);

            if (list_oper.Count > 0)
            {
                list_operadora.DataSource = list_oper;
                list_operadora.DataTextField = "operadora";
                list_operadora.DataValueField = "idoperadora";
                list_operadora.DataBind();

            }
        }

        void Check_Clicked(Object sender, EventArgs e)
        {
            if (checkdetalle.Checked)
            {
                list_operadora.Visible = true;
                list_paquete.Visible = true;
            }
            else
            {
                list_operadora.Visible = false;
                list_paquete.Visible = false;
            }
        }

        private void loadpaquete(string id)
        {
            ws = Session["wsac"] as wsac.IsacClient;

            string sql_consulta = "SELECT * FROM catpaquete";

            if (id != null)
                sql_consulta = sql_consulta + " WHERE idoperadora=" + id;

            string json = ws.GetCatalogoPersonalizado(sql_consulta);
            List<catPaquete> list_oper = JsonConvert.DeserializeObject<List<catPaquete>>(json);

            if (list_oper.Count > 0)
            {
                list_paquete.DataSource = list_oper;
                list_paquete.DataTextField = "paquete";
                list_paquete.DataValueField = "idpaquete";
                list_paquete.DataBind();

            }
        }

        private void get_detallado(string idpaquete)
        {
            int idusr = 0;
            if (int.TryParse(Session["idadminlogged"].ToString(), out idusr))
            {
                if (idusr > 0)
                {
                    try
                    {
                        ws = Session["wsac"] as wsac.IsacClient;

                        string sql_consulta = "SELECT recarga.idrecarga, usuario.name, usuario.first_name, usuario.last_name, " +
                                              "recarga.numerorecarga, catpaquete.monto, recarga.contactorecarga FROM recarga " +
                                              "INNER JOIN catpaquete ON catpaquete.idpaquete = recarga.idpaquete " +
                                              "INNER JOIN usuario ON usuario.idusuario = recarga.idusuario " +
                                              " WHERE recarga.err = 0 and recarga.idpaquete =" + idpaquete;

                        string json = ws.GetCatalogoPersonalizado(sql_consulta);
                        List<paquetes_mod> list_oper = JsonConvert.DeserializeObject<List<paquetes_mod>>(json);

                        if (list_oper.Count > 0)
                        {
                            GridView2.DataSource = list_oper;
                            GridView2.DataBind();
                            GridView2.Visible = true;
                        }
                        else
                            Response.Redirect("index.aspx");
                    }
                    catch (Exception er)
                    {

                    }

                }
                else
                    Response.Redirect("index.aspx");
            }
            else
                Response.Redirect("index.aspx");

        }

        //WHERE recarga.fecha >= '2016/10/01' AND recarga.fecha <= '2016/10/15'

        private void getoperadora(string rango)
        {
            int idusr = 0;
            if (int.TryParse(Session["idadminlogged"].ToString(), out idusr))
            {
                if (idusr > 0)
                {
                    try
                    {
                        ws = Session["wsac"] as wsac.IsacClient;

                        string sql_consulta = "SELECT recarga.idoperadora , catoperadora.img ,  catoperadora.operadora as 'telefonia' , COUNT(*) AS 'Total_Recargas', sum(catpaquete.monto) as 'MontoPesos' " +
                            " FROM recarga INNER JOIN catoperadora ON catoperadora.idoperadora = recarga.idoperadora INNER JOIN catpaquete ON catpaquete.idpaquete = recarga.idpaquete  " +
                            rango + "  where recarga.err = 0 GROUP BY recarga.idoperadora";

                        string json = ws.GetCatalogoPersonalizado(sql_consulta);
                        List<operadora> list_oper = JsonConvert.DeserializeObject<List<operadora>>(json);

                        if (list_oper.Count > 0)
                        {
                            GridView1.DataSource = list_oper;
                            GridView1.DataBind();

                        }
                        else
                            Response.Redirect("index.aspx");
                    }
                    catch (Exception er)
                    {

                    }

                }
                else
                    Response.Redirect("index.aspx");
            }
            else
                Response.Redirect("index.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
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
                            //string json = ws.GetCatalogo(15, "where idadministrador = " + idusr + "");
                            string json = ws.GetAdmin(idusr, "", "");
                            List<administrador> lu = JsonConvert.DeserializeObject<List<administrador>>(json);
                            if (lu.Count > 0)
                            {
                                Session["adminlogged"] = lu.FirstOrDefault();
                                loadoperadora();
                                loadpaquete(null);
                                getoperadora(" ");
                                GridView2.Visible = false;
                            }
                            else
                                Response.Redirect("login_admin.aspx");
                        }
                        else
                            Response.Redirect("login_admin.aspx");
                    }
                    else
                        Response.Redirect("login_admin.aspx");
                }
            }
            else
            {
                if (Request["__EVENTTARGET"] == "lnkSalir")
                {
                    Session["idadminlogged"] = 0;
                    Session["usrlogged"] = null;
                    Response.Redirect("index.aspx");
                    Session.Abandon();
                    Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
                }
            }

        }

    }
}