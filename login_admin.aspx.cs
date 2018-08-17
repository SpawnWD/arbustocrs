using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MasTicket
{
    public partial class login_admin : basepage
    {
        wsac.IsacClient ws;

        public void btnAcceso_Click(Object sender, EventArgs e)
        {
            string str_email = email.Value;
            string str_Nip = NIP.Value;
            Session["fallo"] = null;

            if (!string.IsNullOrEmpty(str_email) && !string.IsNullOrEmpty(str_Nip))
            {
                ws = Session["wsac"] as wsac.IsacClient;
                string json = ws.GetAdmin(0, check.SafeSqlLiteral(str_email), check.SafeSqlLiteral(str_Nip));
                List<administrador> lu = JsonConvert.DeserializeObject<List<administrador>>(json);

                if (lu.Count > 0)
                {
                    Session["idadminlogged"] = lu.FirstOrDefault().idadministrador;
                    Session["adminlogged"] = lu.FirstOrDefault();
                    Response.Redirect("recargas_historial_admin.aspx");
                }
                else
                {
                    Session["fallo"] = "1";
                    Response.Redirect("login_admin.aspx");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["fallo"] != null)
                {
                    spnJS.Text = "<script>msgError('Los datos no son correctos, verifique e intente nuevamente'); </script>";
                    Session["fallo"] = null;
                }
                
            }
        }
    }
}