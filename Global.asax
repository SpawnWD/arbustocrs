<%@ Application Language="C#" %>

<script runat="server">

    wsac.IsacClient ws;

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        System.ServiceModel.BasicHttpBinding binding = new System.ServiceModel.BasicHttpBinding(System.ServiceModel.BasicHttpSecurityMode.Transport)
        {
            Name = "basicHttpBinding",
            MaxBufferSize = 2147483647,
            MaxReceivedMessageSize = 2147483647,

        };
        TimeSpan timeout = new TimeSpan(0, 3, 0);
        binding.SendTimeout = timeout;
        binding.OpenTimeout = timeout;
        binding.ReceiveTimeout = timeout;
        /*binding.Security = new System.ServiceModel.BasicHttpSecurity
        {
            Mode = System.ServiceModel.BasicHttpSecurityMode.Transport,
            Transport = new System.ServiceModel.HttpTransportSecurity
            {
                ClientCredentialType = System.ServiceModel.HttpClientCredentialType.Basic,
                ProxyCredentialType = System.ServiceModel.HttpProxyCredentialType.None,
                Realm = "",
            },
        };*/
        binding.Security = new System.ServiceModel.BasicHttpSecurity
        {
            Mode = System.ServiceModel.BasicHttpSecurityMode.None,
        };
        //System.ServiceModel.EndpointAddress ea = new System.ServiceModel.EndpointAddress("https://asicompras.com/wsac/sac.svc");
        System.ServiceModel.EndpointAddress ea = new System.ServiceModel.EndpointAddress("http://localhost/asicomprasweb/wsac/sac.svc");
        ws = new wsac.IsacClient(binding, ea);
        ws.ClientCredentials.UserName.UserName = "wsac";
        ws.ClientCredentials.UserName.Password = "C0r1t2016";
        //Session.Abandon();
        //Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
        Session["wsac"] = ws;
        Session["idpais"] = 1; //Mexico default
        Session["idusrlogged"] = 0;
        Session["usrlogged"] = null;
        Session["idadminlogged"] = 0;
        Session["adminlogged"] = null;
        Session["SaldoMonedero"] = null;
        Session["RecargaPendiente"] = false;
    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

</script>
