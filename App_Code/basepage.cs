using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MasTicket
{
    public abstract class basepage : System.Web.UI.Page
    {
        protected override void OnInit(EventArgs e)
        {
            ViewStateUserKey = Session.SessionID;
            base.OnInit(e);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}