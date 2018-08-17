using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MasTicket
{
    public partial class start : System.Web.UI.Page
    {
        wsac.IsacClient ws;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string str_email = Request.Form["s"];

                if (!string.IsNullOrEmpty(str_email))
                {
                    //ws = Session["wsac"] as wsac.IsacClient;
                    //string json = ws.GetCatalogo(10, "where email = '" + str_email + "' and nip='" + str_Nip + "'");
                    //List<Usuario> lu = JsonConvert.DeserializeObject<List<Usuario>>(json);

                    //if (lu.Count > 0)
                    //{
                    //    Session["idusrlogged"] = lu.FirstOrDefault().idusuario;
                    //    Session["usrlogged"] = lu.FirstOrDefault();
                    //    Response.Redirect("datosrecarga.aspx");
                    //}
                    //else
                    //{
                        //Response.Redirect("login.aspx");
                        spnJS.Text = "<script>msgError('" + str_email + "'); </script>";
                    //}
                }

            }
        }
    }
}