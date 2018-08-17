using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Data;
using System.Globalization;

namespace MasTicket
{
    public partial class datosrecarga : basepage
    {
        wsac.IsacClient ws;

        protected void Page_PreRender()
        {
            ClientScript.GetPostBackEventReference(this, string.Empty);
        }

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

                // Retrieve the PageDropDownList DropDownList from the bottom pager row.
                DropDownList pageList = (DropDownList)pagerRow.Cells[0].FindControl("PageDropDownList");

                // Set the PageIndex property to display that page selected by the user.
                GridView1.PageIndex = pageList.SelectedIndex;
                //GridView1.RowDataBound += new GridViewRowEventHandler(CustomersGridView_DataBound);
                getrecargas();

            }
            catch (Exception err)
            {

            }
            // Retrieve the pager row.
            

        }

        protected void CustomersGridView_DataBound(Object sender, EventArgs e)
        {

            // Retrieve the pager row.
            GridViewRow pagerRow = GridView1 .BottomPagerRow;

            // Retrieve the DropDownList and Label controls from the row.
            DropDownList pageList = (DropDownList)pagerRow.Cells[0].FindControl("PageDropDownList");
            Label pageLabel = (Label)pagerRow.Cells[0].FindControl("CurrentPageLabel");

            if (pageList != null)
            {

                // Create the values for the DropDownList control based on 
                // the  total number of pages required to display the data
                // source.
                for (int i = 0; i < GridView1.PageCount; i++)
                {

                    // Create a ListItem object to represent a page.
                    int pageNumber = i + 1;
                    ListItem item = new ListItem(pageNumber.ToString());

                    // If the ListItem object matches the currently selected
                    // page, flag the ListItem object as being selected. Because
                    // the DropDownList control is recreated each time the pager
                    // row gets created, this will persist the selected item in
                    // the DropDownList control.   
                    if (i == GridView1.PageIndex)
                    {
                        item.Selected = true;
                    }

                    // Add the ListItem object to the Items collection of the 
                    // DropDownList.
                    pageList.Items.Add(item);

                }

            }

            if (pageLabel != null)
            {

                // Calculate the current page number.
                int currentPage = GridView1.PageIndex + 1;

                // Update the Label control with the current page information.
                pageLabel.Text = "Pagina " + currentPage.ToString()  +
                  " de " + GridView1.PageCount.ToString();

            }

        }

        private void getrecargas()
        {
            int idusr = 0;
            if (int.TryParse(Session["idusrlogged"].ToString(), out idusr))
            {
                if (idusr > 0)
                {
                    try
                    {
                        ws = Session["wsac"] as wsac.IsacClient;

                        string json_3 = ws.GetCatalogo(1, " ");
                        List<catOperadora> operadora = JsonConvert.DeserializeObject<List<catOperadora>>(json_3);

                        string json_4 = ws.GetCatalogo(3, " ");
                        List<catPaquete> cat_paquet = JsonConvert.DeserializeObject<List<catPaquete>>(json_4);

                        string json = ws.GetCatalogo(11, "where idusuario = " + idusr + " and err = 0 and rsauthorization is not null and rsauthorization != '' order by idrecarga desc");
                        List<Recarga> lu = JsonConvert.DeserializeObject<List<Recarga>>(json);

                        List<recarga_detalle> fill_detalle = new List<recarga_detalle>();

                        recarga_detalle tem;

                        foreach (Recarga item in lu)
                        {
                            tem = new recarga_detalle();
                            tem.fecha = item.fecha.ToString("dd/MMM/yyyy", CultureInfo.InvariantCulture);
                            tem.operadora = operadora.Where(x => x.idoperadora == item.idoperadora).SingleOrDefault().operadora;
                            tem.den_monto = cat_paquet.Where(c => c.idpaquete == item.idpaquete).SingleOrDefault().monto;
                            tem.numerorecarga = item.numerorecarga;
                            tem.rsauthorization = item.rsauthorization;
                            tem.rsrcode = item.rsrcode;
                            tem.rstransactionid = item.rstransactionid;
                            fill_detalle.Add(tem);
                        }

                        string json_2 = ws.GetCatalogo(14, "where idusuario = " + idusr + " and err = 0 and PaymentID is not null and PaymentID != '' order by idrecargamonedero desc");
                        List <RecargaMonedero> _recarga_monedero = JsonConvert.DeserializeObject<List<RecargaMonedero>>(json_2);

                        if (lu.Count > 0)
                        {
                            //List<Recarga> conexito = lu.Where (x => x.rstransactionid == null).ToList();
                            //List<Recarga> con_tem = lu.Where(x => x.rstransactionid != null).ToList();

                            GridView1.DataSource = fill_detalle;
                            GridView1.DataBind();
                            GridView2.DataSource = _recarga_monedero;
                            GridView2.DataBind();

                        }
                        //else
                        //    Response.Redirect("index.aspx");
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
                                getrecargas();
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
        }

    }
}