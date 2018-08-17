<%@ Page Language="C#" AutoEventWireup="true" CodeFile="recargas_historial_admin.aspx.cs" Inherits="MasTicket.recargas_historial_admin" %>

<!DOCTYPE html>
<!--[if IE 8]>			<html class="ie ie8"> <![endif]-->
<!--[if IE 9]>			<html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->	<html> <!--<![endif]-->
	<head>
		<meta charset="utf-8" />
		<title>Así Compras</title>
		<meta name="keywords" content="Así Compras,Recargas,Celular,Movil,Tiempo aire,TopUp" />
		<meta name="description" content="" />

        <!-- for Google -->
        <meta name="description" content="La%20nueva%20forma%20de%20adquirir%20productos%20y%20servicios%20electr%F3nicos%20desde%20la%20palma%20de%20tu%20mano.%20Recargas%20de%20tiempo%20aire%20en%20cualquier%20momento%20y%20cualquier%20lugar.%20T%FA%20decides.%20REGISTRATE" />
        <meta name="keywords" content="As%ED%20Compras" />
        <meta name="application-name" content="asicompras.com" />

        <!-- for Facebook -->          
        <meta property="og:title" content=“As%ED%20Compras“ />
        <meta property="og:url" content=“asicompras.com” />
        <meta property="og:description" content="La%20nueva%20forma%20de%20adquirir%20productos%20y%20servicios%20electr%F3nicos%20desde%20la%20palma%20de%20tu%20mano.%20Recargas%20de%20tiempo%20aire%20en%20cualquier%20momento%20y%20cualquier%20lugar.%20T%FA%20decides.%20REGISTRATE" />

        <!-- for Twitter -->          
        <meta name="twitter:title" content="As%ED%20Compras" />
        <meta name="twitter:description" content="La%20nueva%20forma%20de%20adquirir%20productos%20y%20servicios%20electr%F3nicos%20desde%20la%20palma%20de%20tu%20mano.%20Recargas%20de%20tiempo%20aire%20en%20cualquier%20momento%20y%20cualquier%20lugar.%20T%FA%20decides.%20REGISTRATE" />
        <!-- -->

        <!-- For Google Single Sign On -->
        <meta name="google-signin-scope" content="profile email" />
        <meta name="google-signin-client_id" content="575858484188-fu504sovv3e4nfo87af9152t9jpcvks5.apps.googleusercontent.com" />
        <script src="https://apis.google.com/js/api:client.js"></script>
		<!-- mobile settings -->
		<meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />
         
		<!-- WEB FONTS -->
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800" rel="stylesheet" type="text/css" />

		<!-- CORE CSS -->
		<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/font-awesome.css" rel="stylesheet" type="text/css" />
		<link href="assets/plugins/owl-carousel/owl.carousel.css" rel="stylesheet" type="text/css" />
		<link href="assets/plugins/owl-carousel/owl.theme.css" rel="stylesheet" type="text/css" />
		<link href="assets/plugins/owl-carousel/owl.transitions.css" rel="stylesheet" type="text/css" />
		<link href="assets/plugins/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/animate.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/superslides.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/sweetalert.css" rel="stylesheet" type="text/css" />
        <link href="assets/plugins/HoldOn.min.css" rel="stylesheet" type="text/css" />

		<!-- THEME CSS -->
		<link href="assets/css/essentials.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/layout.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/layout-responsive.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/orange.css" rel="stylesheet" type="text/css" /><!-- orange: default style -->
		<!--<link id="css_dark_skin" href="assets/css/layout-dark.css" rel="stylesheet" type="text/css" />--><!-- DARK SKIN -->

        <link rel="stylesheet" href="assets/css/bootstrap-select.min.css">
		<!-- modernizr -->
		<script type="text/javascript" src="assets/plugins/modernizr.min.js"></script>
        <script type="text/javascript" src="assets/plugins/sweetalert.min.js"></script>

       
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="css/calendario.css" type="text/css" rel="stylesheet">
        <script src="js/calendar.js" type="text/javascript"></script>
        <script src="js/calendar-es.js" type="text/javascript"></script>
        <script src="js/calendar-setup.js" type="text/javascript"></script>

        <script type='text/javascript'>
            function msgAviso(txt) {
                swal("Aviso", txt);
            }
            function msgExito(txt) {
                swal("Exito", txt, "success");
            }
            function msgError(txt) {
                swal("Error", txt, "error");
            }
        </script>
        
       
	</head>
	<body class="boxed" data-background="assets/images/creative_4.jpg">
        <form runat="server" method="post" role="form">
		<!-- Top Bar -->
		<header id="topHead">
		
			<div class="container">

				<!-- LINKS -->
<%--				<div class="pull-right nav hidden-xs">
					<a href="page-about-us.aspx"><i class="fa fa-angle-right"></i> Acerca de</a>
					<a href="contacto.aspx"><i class="fa fa-angle-right"></i> Contacto</a>
				</div>--%>
				<!-- /LINKS -->

			</div>
		</header>
		<!-- /Top Bar -->

		<!-- TOP NAV -->
		<header id="topNav" class="topHead"><!-- remove class="topHead" if no topHead used! -->
			<div class="container">

				<!-- Mobile Menu Button -->
				<button class="btn btn-mobile" data-toggle="collapse" data-target=".nav-main-collapse">
					<i class="fa fa-bars"></i>
				</button>

				<!-- Logo text or image -->
				<a class="logo" style="font-family:'Conv_cooperblack';" href="index.aspx">
					<img src="assets/images/ascompraspng1.png" alt="Así Compras" /></a>

                <!-- Top Nav -->
                <div id="divMenu" runat="server" class="navbar-collapse nav-main-collapse collapse pull-right">
                    <nav class="nav-main mega-menu">
                        <ul class="nav nav-pills nav-main scroll-menu" id="topMain">
                            <li class="active">
                                <a class="dropdown-toggle" href="recargas_historial_admin.aspx">
                                    <i class="fa fa-calendar"></i> Historial de recargas
                                </a>
                            </li>
                            <li class="active">
                                <a class="dropdown-toggle" href="conciliacion_admin.aspx">
                                    <i class="fa fa-money"></i> Reporte de conciliación
                                </a>
                            </li>
                            <li class="active">
                                <a class="dropdown-toggle" href="repusuarios.aspx">
                                    <i class="fa fa-users"></i> Reporte de usuarios
                                </a>
                            </li>
                            <li class="active">
                                <a class="dropdown-toggle" onclick="javascript:FBLogout();GGsignOut();" href="javascript:__doPostBack('lnkSalir','');">
                                    <i class="fa fa-times"></i> <b>SALIR</b>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <!-- /Top Nav -->

			</div>
		</header>
		<!-- /TOP NAV -->
        <span id="header_shadow"></span>

		<!-- WRAPPER -->
<!------------------------------------------------------------------------------------------------------------>
        <div id="wrapper" style="background:rgba(0,0,0,0.2);">
            <section class="container top-no-header">
                <div class="row">
                    <div class="col-md-9">
                        <div class="white-row">
                            <div id="wizard" class="form_wizard wizard_horizontal">
                                <h2><i class="fa fa-mobile"></i> <strong>Modulo de Consultas Administrativas</strong></h2>

                                <div class="panel panel-default">
                                    <div class="panel-heading">Filtrado por. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Todas las companias] - [Todas las Fechas] --  &nbsp;&nbsp; <asp:CheckBox runat="server" ID="checkdetalle" Text="Filtrar Detalladamente"  AutoPostBack="true"  />
                                         </div>
                                        <div class="panel-body">
                                            
                                            <table>
                                                <tr>
                                                    <td>Filtrar por Operadora : <asp:DropDownList runat="server" ID="list_operadora" OnSelectedIndexChanged="list_operadora_SelectedIndexChanged" autopostback="true"></asp:DropDownList></td>
                                                    <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Por Paquete : <asp:DropDownList runat="server" ID="list_paquete" OnSelectedIndexChanged="list_paquete_SelectedIndexChanged" autopostback="true" ></asp:DropDownList></td>
                                                    <td>
                                                        <div id="datepicker"></div>
                                                        <script>
                                                            $('#datepicker').datepicker({
                                                                language: "es",
                                                                multidate: true,
                                                                todayHighlight: true
                                                            });
                                                        </script>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <center>
                                                        <asp:GridView ondatabound="CustomersGridView_DataBound" runat="server" ID="GridView1" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" AllowSorting="true" 
                                                               ShowFooter="true" CssClass="table table-bordered table-hover"  Width="68%"   OnPageIndexChanging="GridView1_PageIndexChanging" PagerSettings-Mode="NextPreviousFirstLast" PagerSettings-FirstPageImageUrl="~/images/first.png" PagerSettings-LastPageImageUrl="~/images/last.png" PagerSettings-NextPageImageUrl="~/images/next.png" PagerSettings-PreviousPageImageUrl="~/images/previous.png" PagerSettings-Position="Bottom" PagerStyle-BorderStyle="None">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="ID" HeaderStyle-Width="40px">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="lbloperadora" Text='<%# Eval("idoperadora") %> '></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Logo" HeaderStyle-Width="25px">
                                                                    <ItemTemplate>
                                                                        <asp:Image runat="server" ID="lblimg" Width="50"   ImageUrl='<%# Eval("img") %> '></asp:Image>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Operadora" HeaderStyle-Width="25px">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="lbltelefonia" Text='<%# Eval("telefonia") %> '></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Total de Recargas" HeaderStyle-Width="20px">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="lblden_monto" Text='<%#  Eval("Total_Recargas") %> '></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Importe en Pesos" HeaderStyle-Width="20px">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="lblmontopesos" Text='<%# "$ " + Eval("MontoPesos") %> '></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <pagertemplate>
                                                                    <table width="100%">                    
                                                                    <tr>                        
                                                                        <td style="width:70%">
                                                                        <asp:label id="MessageLabel"
                                                                            forecolor="Blue"
                                                                            text="Seleccione la Pagina:" 
                                                                            runat="server"/>
                                                                        <asp:dropdownlist id="PageDropDownList"
                                                                            autopostback="true"
                                                                            onselectedindexchanged="PageDropDownList_SelectedIndexChanged" 
                                                                            runat="server"/>
                                                                        </td>   
                                                                        <td style="width:70%; text-align:right">
                                                                        <asp:label id="CurrentPageLabel"
                                                                            forecolor="Blue"
                                                                            runat="server"/>
                                                                        </td>
                                                                    </tr>                    
                                                                    </table>
                                                            </pagertemplate> 
                                                        </asp:GridView>     
                                          </center>

                                            <!-- Agregando el otro GRID-->

                                            <center>
                                                        <asp:GridView ondatabound="CustomersGridView_DataBound" runat="server" ID="GridView2" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" AllowSorting="true" 
                                                               ShowFooter="true" CssClass="table table-bordered table-hover"  Width="68%"   OnPageIndexChanging="GridView1_PageIndexChanging" PagerSettings-Mode="NextPreviousFirstLast" PagerSettings-FirstPageImageUrl="~/images/first.png" PagerSettings-LastPageImageUrl="~/images/last.png" PagerSettings-NextPageImageUrl="~/images/next.png" PagerSettings-PreviousPageImageUrl="~/images/previous.png" PagerSettings-Position="Bottom" PagerStyle-BorderStyle="None">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="ID" HeaderStyle-Width="40px">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="lblrecarga" Text='<%# Eval("idrecarga") %> '></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Nombre Completo" HeaderStyle-Width="30px">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="lblname" Text='<%# Eval("name") %> '></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Apellido Pat" HeaderStyle-Width="25px">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="lblfirst_name" Text='<%# Eval("first_name") %> '></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Apellido Mat" HeaderStyle-Width="20px">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="lbl_last_name" Text='<%#  Eval("last_name") %> '></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Num. Rec." HeaderStyle-Width="20px">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="lblnumerorecarga" Text='<%#  Eval("numerorecarga") %> '></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Monto" HeaderStyle-Width="20px">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="lblmonto" Text='<%# "$ " +  Eval("monto") %> '></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Monto" HeaderStyle-Width="20px">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="lblcontacto" Text='<%# "$ " +  Eval("contactorecarga") %> '></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <pagertemplate>
                                                                    <table width="100%">                    
                                                                    <tr>                        
                                                                        <td style="width:70%">
                                                                        <asp:label id="MessageLabel"
                                                                            forecolor="Blue"
                                                                            text="Seleccione la Pagina:" 
                                                                            runat="server"/>
                                                                        <asp:dropdownlist id="PageDropDownList1"
                                                                            autopostback="true"
                                                                             
                                                                            runat="server"/>
                                                                        </td>   
                                                                        <td style="width:70%; text-align:right">
                                                                        <asp:label id="CurrentPageLabel1"
                                                                            forecolor="Blue"
                                                                            runat="server"/>
                                                                        </td>
                                                                    </tr>                    
                                                                    </table>
                                                            </pagertemplate> 
                                                        </asp:GridView>     
                                          </center>
                                    <div class="panel-footer"></div>
                                </div>
                                <h1></h1>
                        </div>

            <div class="col-md-2 col-sm-2">
                
            </div>
       
            <!-- Termina lo agregado por mi-->

        <div id="step-1">

               
        </div>
            </section>
        </div>
<!------------------------------------------------------------------------------------------------------------>
		<!-- /WRAPPER -->

		<!-- FOOTER -->
		<footer>

			<!-- copyright , scrollTo Top -->
			<div class="footer-bar">
				<div class="container">
					<center><span class="copyright">Copyright &copy; Asi Compras, Todos los derechos reservados.</span></center>
					<p><a class="toTop" href="#topNav">ARRIBA <i class="fa fa-arrow-circle-up"></i></a></p>
				</div>
			</div>
			<!-- copyright , scrollTo Top -->


			<!-- footer content -->
			<div class="footer-content">
				<div class="container">

					<div class="row">


						<!-- FOOTER CONTACT INFO -->
						<div class="column col-md-4">
							<h3>CONTACTO</h3>

							<p class="contact-desc">
																		
							</p>
							<address class="font-opensans">
								<ul>
									<li class="footer-sprite address">
                                        Insurgentes Sur 544, Col. Roma Sur<br />
                                        México, D.F.  CP. 06760
									</li>
									<li class="footer-sprite phone">
										Telefono: (55) 3330 0090 sin costo de L.D.
									</li>
									<li class="footer-sprite email">
										<a href="mailto:informes@asicompras.com">informes@asicompras.com</a>
									</li>
								</ul>
							</address>

						</div>
						<!-- /FOOTER CONTACT INFO -->


						<!-- FOOTER LOGO -->
						<div class="column logo col-md-4 text-center">
							<div class="logo-content">
								<img class="animate_fade_in" src="assets/images/asicompraspng.png" width="200" alt="" />
								
							</div>											
						</div>
						<!-- /FOOTER LOGO -->


						<!-- FOOTER LATEST POSTS -->
						<div class="column col-md-4 text-right">
							<div class="post-item">
                                <span>Consulta nuestro <a href="privacidad.aspx"> aviso de privacidad</a><br /> y  los <a href="terminos.aspx">términos y condiciones</a> </span>
							</div>
                            <br /><br />
                            <a href="https://www.facebook.com/asicompras/" class="social rounded fa fa-facebook"></a>
							<a href="#" class="social rounded fa fa-twitter"></a>
							<a href="#" class="social rounded fa fa-google-plus"></a>
                            <a href="https://www.instagram.com/asicompras/" class="social rounded fa fa-instagram"></a>
						</div>
						<!-- /FOOTER LATEST POSTS -->

					</div>

				</div>
			</div>
			<!-- footer content -->

		</footer>
		<!-- /FOOTER -->



		<!-- JAVASCRIPT FILES -->
		<script type="text/javascript" src="assets/plugins/jquery-2.2.3.min.js"></script>
		<script type="text/javascript" src="assets/plugins/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="assets/plugins/jquery.cookie.js"></script>
		<script type="text/javascript" src="assets/plugins/jquery.appear.js"></script>
		<script type="text/javascript" src="assets/plugins/jquery.isotope.js"></script>
		<script type="text/javascript" src="assets/plugins/masonry.js"></script>
        <script type="text/javascript" src="assets/plugins/jquery.inputmask.bundle.min.js"></script>
		<script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="assets/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
		<script type="text/javascript" src="assets/plugins/owl-carousel/owl.carousel.min.js"></script>
		<script type="text/javascript" src="assets/plugins/stellar/jquery.stellar.min.js"></script>
		<script type="text/javascript" src="assets/plugins/knob/js/jquery.knob.js"></script>
		<script type="text/javascript" src="assets/plugins/jquery.backstretch.min.js"></script>
		<script type="text/javascript" src="assets/plugins/superslides/dist/jquery.superslides.min.js"></script>
		<script type="text/javascript" src="assets/plugins/mediaelement/build/mediaelement-and-player.min.js"></script>
        <script type="text/javascript" src="assets/plugins/jquery.validate.min.js"></script>
        <script src="assets/js/bootstrap-select.min.js"></script>
        <script type="text/javascript" src="assets/plugins/HoldOn.min.js"></script>
        <script>
            function Cargando() {
                HoldOn.open({
                    theme: "sk-circle",
                    message: "Cargando...",
                });
            }
        </script>

		<script type="text/javascript" src="assets/js/scripts.js"></script>
        <script type="text/javascript" src="assets/js/feis.js"></script>
        <script type="text/javascript" src="assets/js/gugle.js"></script>

        <script>
          $(document).ready(function() {
            $(":input").inputmask();
          });
        </script>

<!-- 12 Octubre 2017-->
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-97025389-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-97025389-1');
</script>

    </form>
	</body>
</html>