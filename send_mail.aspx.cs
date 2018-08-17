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
    public partial class send_mail : basepage
    {
        wsac.IsacClient ws;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                msgMensaje.Visible = false;
                msgaviso.Visible = false;
                string str_email = Request.Form["s"];

                if (!string.IsNullOrEmpty(str_email))
                {
                    try
                    {
                        msgMensaje.Visible = true;
                        msgaviso.Visible = false;
                        procesos apunta = new procesos();
                        ws = Session["wsac"] as wsac.IsacClient;

                        string json = ws.GetUser(0, check.SafeSqlLiteral(str_email), "");

                        /*List<Usuario> lu = JsonConvert.DeserializeObject<List<Usuario>>(json);

                        Usuario users = lu.Where(x => x.email.Equals(str_email)).First();

                        string nombre_servidor = HttpContext.Current.Request.Url.AbsoluteUri;

                        string[] segmentosURL = HttpContext.Current.Request.Url.Segments;
                        string pagina = segmentosURL[segmentosURL.Length - 1];

                        string linkfinal = nombre_servidor.Substring(0, nombre_servidor.Length - pagina.Length);

                        if (lu.Count > 0)
                        {
                            apunta.EnviaCorreo(users.idusuario, str_email, users.nip, linkfinal);
                        }*/
                    }
                    catch (Exception er)
                    {

                        msgaviso.Visible = true;
                        msgMensaje.Visible = false;
                    }
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
            
        }
    }
}