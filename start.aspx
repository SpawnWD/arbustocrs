<%@ Page Language="C#" AutoEventWireup="true" CodeFile="start.aspx.cs" Inherits="MasTicket.start" %>

<!DOCTYPE html>
<!--[if IE 8]>			<html class="ie ie8"> <![endif]-->
<!--[if IE 9]>			<html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->	<html> <!--<![endif]-->
	<head runat="server">
		<meta charset="utf-8" />
		<title>Así Compras</title>
		<meta name="keywords" content="Así Compras,Recargas,Celular,Movil,Tiempo aire,TopUp" />
		<meta name="description" content="" />

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

		<!-- REVOLUTION SLIDER -->
		<link href="assets/plugins/slider.revolution.v5/css/pack.css" rel="stylesheet" type="text/css" />
		<link href="http://fonts.googleapis.com/css?family=Roboto%3A400%2C100%2C300%2C500%2C700%2C900" rel="stylesheet" property="stylesheet" type="text/css" media="all" />
		<link href="http://fonts.googleapis.com/css?family=Raleway%3A400%2C500%2C600" rel="stylesheet" property="stylesheet" type="text/css" media="all" />
		<link href="http://fonts.googleapis.com/css?family=Lato%3A400%2C900%2C700" rel="stylesheet" property="stylesheet" type="text/css" media="all" />

		<!-- THEME CSS -->
		<link href="assets/css/essentials.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/layout.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/layout-responsive.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/orange.css" rel="stylesheet" type="text/css" /><!-- orange: default style -->
		<!--<link id="css_dark_skin" href="assets/css/layout-dark.css" rel="stylesheet" type="text/css" />--><!-- DARK SKIN -->

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">
		
        <!-- Morenizr -->
        <script type="text/javascript" src="assets/plugins/modernizr.min.js"></script>
        <script type="text/javascript" src="assets/plugins/sweetalert.min.js"></script>
		<script type="text/javascript" src="assets/plugins/modernizr.min.js"></script>
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
        <!-- Available classes for body: boxed , pattern1...pattern10 . Background Image - example add: data-background="assets/images/boxed_background/1.jpg"  -->
        <!-- Top Bar -->
        
        <header id="topHead">
                                  <div class="container">

                                      <!-- PHONE/EMAIL -->
                                      <span class="quick-contact pull-left">
                                          <i class="fa fa-phone"></i> (55) 3330 0090 sin costo de L.D. &bull;
                                          <a class="hidden-xs" href="mailto:informes@asicompras.com">informes@asicompras.com</a>
                                      </span>
                                      <!-- /PHONE/EMAIL -->
                                      <!-- SIGN IN -->
                                      <div class="pull-right nav signin-dd">
                                          <a id="quick_sign_in" href="login.aspx" data-toggle="dropdown"><i class="fa fa-users"></i><span class="hidden-xs"> Ingresar</span></a>
                                          <div class="dropdown-menu" role="menu" aria-labelledby="quick_sign_in">

                                              <h4>Ingresar</h4>
                                              <form action="login.aspx" method="get" role="form">

                                                  <div class="form-group">
                                                      <!-- email -->
                                                      <input required type="email" class="form-control" placeholder="Email">
                                                  </div>

                                                  <div class="input-group">

                                                      <!-- password -->
                                                      <input required type="password" class="form-control" placeholder="Contraseña">

                                                      <!-- submit button -->
                                                      <span class="input-group-btn">
                                                          <button class="btn btn-primary">Aceptar</button>
                                                      </span>

                                                  </div>

                                                  <div class="checkbox">
                                                      <!-- remmember -->
                                                      <label>
                                                          <a href="login.aspx">¿Olvido su contraseña?</a>
                                                      </label>
                                                  </div>

                                              </form>

                                              <hr />

                                              <a href="#" class="btn-facebook fullwidth radius3"><i class="fa fa-facebook"></i> Entrar con Facebook</a>
                                              <a href="#" class="btn-google-plus fullwidth radius3"><i class="fa fa-google-plus"></i> Entrar con Google</a>
                                              <!--<a href="#" class="btn-google-plus fullwidth radius3"><i class="fa fa-google-plus"></i> Connect With Google</a>-->

                                              <p class="bottom-create-account">
                                                  <a href="registro.aspx">Registrarse</a>
                                              </p>
                                          </div>
                                      </div>
                                      <!-- /SIGN IN -->
                                      <!-- LINKS -->
                                      <div class="pull-right nav hidden-xs">
                                          <a href="page-about-us.aspx"><i class="fa fa-angle-right"></i> Acerca de</a>
                                          <a href="contact-us.aspx"><i class="fa fa-angle-right"></i> Contacto</a>
                                      </div>
                                      <!-- /LINKS -->

                                  </div>
                              </header>
        <!-- /Top Bar -->
        <!-- TOP NAV -->
        <header id="topNav" class="topHead">
                                  <!-- remove class="topHead" if no topHead used! -->
                                  <div class="container">

                                      <!-- Mobile Menu Button -->
            <button class="btn btn-mobile" data-toggle="collapse" data-target=".nav-main-collapse">
                <i class="fa fa-bars"></i>
            </button>
                                      <!-- Logo text or image -->
                                      <a class="logo" href="index.aspx">
                                          <img src="assets/images/ascompraspng1.png" alt="Así Compras" />&nbsp;<span class="letramorada">Así</span> <span class="letranaranja">Compras</span>
                                      </a>

                                      <!-- Top Nav -->
                                      <div class="navbar-collapse nav-main-collapse collapse pull-right">
                                          <nav class="nav-main mega-menu">
                                              <ul class="nav nav-pills nav-main scroll-menu" id="topMain">
                                                  <li class="active">
                                                      <a class="dropdown-toggle" href="start.aspx">
                                                          <i class="fa fa-mobile"></i> Recargar
                                                      </a>
                                                  </li>
                                                  <li class="active">
                                                      <a class="dropdown-toggle" href="recgratis.aspx">
                                                          <i class="fa fa-share-square-o"></i> Recargas gratis
                                                      </a>
                                                  </li>
                                                  <li class="active">
                                                      <a class="dropdown-toggle" href="recprogramada.aspx">
                                                          <i class="fa fa-calendar"></i> Recargas programadas
                                                      </a>
                                                  </li>
                                                  <!-- GLOBAL SEARCH -->
                                                  <li class="search">
                                                      <!-- search form -->
                                                      <form method="get" action="#" class="input-group pull-right">
                                                          <input type="text" class="form-control" name="k" id="k" value="" placeholder="Buscar">
                                                          <span class="input-group-btn">
                                                              <button class="btn btn-primary notransition"><i class="fa fa-search"></i></button>
                                                          </span>
                                                      </form>
                                                      <!-- /search form -->
                                                  </li>
                                                  <!-- /GLOBAL SEARCH -->


                                              </ul>
                                          </nav>
                                      </div>
                                      <!-- /Top Nav -->

                                      

                                  </div>
                              </header>
        <!-- /TOP NAV -->
        <span id="header_shadow"></span>
        
        <asp:Label runat="server" id="spnJS" Text=""></asp:Label>
<!------------------------------------------------------------------------------------------------------------>
        <div id="wrapper" style="background:rgba(0,0,0,0.2);">
            <section class="container top-no-header">
                <div class="row">
                    <div class="col-md-9">
                    <div class="white-row">
                    <div id="wizard" class="form_wizard wizard_horizontal">
                        <h2><i class="fa fa-mobile"></i> <strong>Recargar</strong></h2>
                        <%--    <ul class="wizard_steps">
                    <li>
                        <a href="#step-1">
                            <span class="step_no">1</span>
                            <span class="step_descr">
                                <small>Datos de la recarga</small>
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="#step-2">
                            <span class="step_no">2</span>
                            <span class="step_descr">
                                <small>Nueva tarjeta</small>
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="#step-3">
                            <span class="step_no">3</span>
                            <span class="step_descr">
                                <small>Medios de pago</small>
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="#step-4">
                            <span class="step_no">4</span>
                            <span class="step_descr">
                                <small>Confirmación</small>
                            </span>
                        </a>
                    </li>
                </ul>--%>
                        <%--       <div id="step-1">
                    <form class="form-horizontal form-label-left">
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pais">
                                Pais <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select id="pais" name="pais" required="required" class="selectpicker form-control col-md-7 col-xs-12">
                                    <option data-content="<img src='assets/images/flags/mx.png' width='16' height='11' />&nbsp;&nbsp;<span>México</span>">México</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="compania">
                                Compañia <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select id="compania" name="compania" required="required" class="selectpicker form-control col-md-7 col-xs-12">
                                    <option data-content="<img src='assets/images/telcel.png' height='24' />&nbsp;&nbsp;<span>Telcel</span>">Telcel</option>
                                    <option data-content="<img src='assets/images/movi.png' height='24' />&nbsp;&nbsp;<span>Movistar</span>">Movistar</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="numero" class="control-label col-md-3 col-sm-3 col-xs-12">
                            Numero <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input id="numero" class="form-control col-md-7 col-xs-12" data-inputmask="'mask' : '99-9999-9999'" type="text" name="numero">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="paquete" class="control-label col-md-3 col-sm-3 col-xs-12">
                                Monto <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select id="paquete" name="paquete" required="required" class="selectpicker form-control col-md-7 col-xs-12">
                                    <option>$100.00</option>
                                    <option>$50.00</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="cupon" class="control-label col-md-3 col-sm-3 col-xs-12">
                                Cupon
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input id="cupon" name="cupon" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text">
                            </div>
                        </div>
                    </form>
                </div>--%>
                        <%--       <div id="step-2">
                    <form class="form-horizontal form-label-left">
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pais">
                                Pais <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select id="pais" name="pais" required="required" class="selectpicker form-control col-md-7 col-xs-12">
                                    <option data-content="<img src='assets/images/flags/mx.png' width='16' height='11' />&nbsp;&nbsp;<span>México</span>">México</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="emisor">
                                Emisor <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select id="emisor" name="emisor" required="required" class="selectpicker form-control col-md-7 col-xs-12">
                                    <option data-content="<img src='assets/images/visa1.png' height='24' />&nbsp;&nbsp;<span>Visa</span>">Visa</option>
                                    <option data-content="<img src='assets/images/master.png' height='24' />&nbsp;&nbsp;<span>Mastercard</span>">Mastercard</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="numero" class="control-label col-md-3 col-sm-3 col-xs-12">
                                Numero <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input id="numero" class="form-control col-md-7 col-xs-12" placeholder="Numero de la tarjeta" data-inputmask="'mask' : '9999-9999-9999-9999'" type="text" name="numero">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="numero" class="control-label col-md-3 col-sm-3 col-xs-12">
                                Expiración y CVC <span class="required">*</span>
                            </label>
                            <div class="col-md-2">
                                <input placeholder="Mes" data-inputmask="'mask' : '99'" type="text" value="" class="form-control">
                            </div>
                            <div class="col-md-2">
                                <input placeholder="Año" data-inputmask="'mask' : '99'" type="text" value="" class="form-control">
                            </div>
                            <div class="col-md-2">
                                <input placeholder="CVC" data-inputmask="'mask' : '9999'" type="text" value="" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="titular" class="control-label col-md-3 col-sm-3 col-xs-12">
                                Titular <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input id="titular" name="titular" placeholder="Nombre del titular" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text">
                            </div>
                        </div>
                    </form>
            
                </div>--%>
                        <%--        <div id="step-3">
                    <form class="form-horizontal">
                        <div class="col-md-2 col-sm-2"></div>
                        <div class="col-md-8 col-sm-8 col-xs-12">
                                <table class="table table-striped table-hover">
                                    <thead><tr><th>Saldo en monedero</th></tr></thead>
                                    <tbody>
                                        <tr>
                                            <td><img src="assets/images/wallet.png" /></td>
                                            <td>$50.00</td>
                                            <td><a target="_blank" href="#" class="btn default btn-xs btn-primary white"><i class="fa fa-money white"></i> Usar </a></td>
                                        </tr>
                                    </tbody>
                                </table><br />
                                <table class="table table-striped table-hover">
                                    <thead><tr><th>Tarjetas</th></tr></thead>
                                    <tbody>
                                        <tr>
                                            <td><img src="assets/images/visa1.png" /></td>
                                            <td>VISA 6854</td>
                                            <td><a target="_blank" href="#" class="btn default btn-xs btn-primary white"><i class="fa fa-credit-card white"></i> Usar </a></td>
                                        </tr>
                                    </tbody>
                                    <tbody>
                                        <tr>
                                            <td><img src="assets/images/master.png" /></td>
                                            <td>MASTERCARD 2134</td>
                                            <td><a target="_blank" href="#" class="btn default btn-xs btn-primary white"><i class="fa fa-credit-card white"></i> Usar </a></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        <div class="col-md-2 col-sm-2"></div>
        </form>
                </div>--%>
                        <div id="step-4">
                    <div class="col-md-2 col-sm-2"></div>
                    <div class="col-md-8 col-sm-8 col-xs-12">
                        <!-- INVOICE HEADER -->
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <span class="letramorada">Así</span> <span class="letranaranja">Compras</span>
                            </div>
                            <div class="col-md-6 col-sm-6 text-right">
                                <p>
                                    #0123456789 &bull; <strong>29 Junio 2016</strong>
                                    <br />
                                    Detalle de su compra.
                                </p>
                            </div>
                        </div>
                        <!-- /INVOICE HEADER -->

                        <hr class="margin-top10 margin-bottom10" /><!-- separator -->
                        <!-- DETAILS -->
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <h4>Detalle de la <strong>Recarga</strong></h4>
                                <ul class="list-unstyled">
                                    <li><strong>Compañia:</strong> Telcel</li>
                                    <li><strong>Numero:</strong> (55) 2732 4281</li>
                                    <li><strong>Monto:</strong> $100.00</li>
                                    <li><strong>Cupon:</strong> </li>
                                </ul>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <h4>Detalle del <strong>Pago</strong></h4>
                                <ul class="list-unstyled">
                                    <li><strong>Medio:</strong> Tarjeta</li>
                                    <li><strong>Numero:</strong> VISA 4152</li>
                                    <li><strong>Titular:</strong> Jazmine Aline VB</li>
                                </ul>
                            </div>
                        </div>
                        <!-- /DETAILS -->
                    </div>
                    <div class="col-md-2 col-sm-2"></div>
                </div>
                    </div>
                    </div>
                </div>
                    <div class="col-md-3"><div class="white-row">AYUDA</div></div>
                </div>
  
        
<!------------------------------------------------------------------------------------------------------------>
            <!-- FOOTER -->
            <footer>
                <!-- copyright , scrollTo Top -->
                <div class="footer-bar">
                    <div class="container">
                        <span class="copyright">Copyright &copy; Asi Compras, Todos los derechos reservados.</span>
                        <a class="toTop" href="#topNav">ARRIBA <i class="fa fa-arrow-circle-up"></i></a>
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
                                    <!--<h4>ASÍ COMPRAS</h4>-->
                                </div>
                            </div>
                            <!-- /FOOTER LOGO -->
                            <!-- FOOTER LATEST POSTS -->
                            <!--<div class="column col-md-4 text-right">
                            <h3>RECENT POSTS</h3>

                            <div class="post-item">
                                <small>JANUARY 2, 2014 BY ADMIN</small>
                                <h3><a href="blog-single-sidebar-left.aspx">Lorem ipsum dolor sit amet, consectetur adipiscing elit</a></h3>
                            </div>
                            <div class="post-item">
                                <small>JANUARY 2, 2014 BY ADMIN</small>
                                <h3><a href="blog-single-sidebar-left.aspx">Lorem ipsum dolor sit amet, consectetur adipiscing elit</a></h3>
                            </div>
                            <div class="post-item">
                                <small>JANUARY 2, 2014 BY ADMIN</small>
                                <h3><a href="blog-single-sidebar-left.aspx">Lorem ipsum dolor sit amet, consectetur adipiscing elit</a></h3>
                            </div>

                            <a href="blog-masonry-sidebar.aspx" class="view-more pull-right">View Blog <i class="fa fa-arrow-right"></i></a>

                        </div>-->
                            <!-- /FOOTER LATEST POSTS -->

                        </div>

                    </div>
                </div>
                <!-- footer content -->

            </footer>
            <!-- /FOOTER -->
            </section>
</div>
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
            <script type="text/javascript" src="assets/plugins/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>

            <script type="text/javascript" src="assets/js/scripts.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>


            <!-- REVOLUTION SLIDER -->
            <script type="text/javascript" src="assets/plugins/slider.revolution.v5/js/jquery.themepunch.tools.min.js"></script>
            <script type="text/javascript" src="assets/plugins/slider.revolution.v5/js/jquery.themepunch.revolution.min.js"></script>
            <script type="text/javascript">
                var plugin_path = "assets/plugins/";

                jQuery(document).ready(function () {
                    if (jQuery("#rev_slider_428_1").revolution == undefined) {
                        revslider_showDoubleJqueryError("#rev_slider_428_1");
                    } else {
                        revapi428 = jQuery("#rev_slider_428_1").show().revolution({
                            sliderType: "hero",
                            jsFileLocation: plugin_path + "slider.revolution.v5/js/",
                            sliderLayout: "fullscreen",
                            dottedOverlay: "none",
                            delay: 9000,
                            navigation: {
                            },
                            responsiveLevels: [1240, 1024, 778, 480],
                            visibilityLevels: [1240, 1024, 778, 480],
                            gridwidth: [1240, 1024, 778, 480],
                            gridheight: [868, 768, 500, 720],
                            lazyType: "none",
                            parallax: {
                                type: "scroll",
                                origo: "slidercenter",
                                speed: 400,
                                levels: [5, 10, 15, 20, 25, 30, 35, 40, 45, 46, 47, 48, 49, 50, 51, 55],
                                type: "scroll",
                            },
                            shadow: 0,
                            spinner: "off",
                            autoHeight: "off",
                            fullScreenAutoWidth: "off",
                            fullScreenAlignForce: "off",
                            fullScreenOffsetContainer: "",
                            fullScreenOffset: jQuery("#topHead").outerHeight() + jQuery("#topNav").outerHeight() - 10 + "px",
                            disableProgressBar: "on",
                            hideThumbsOnMobile: "off",
                            hideSliderAtLimit: 0,
                            hideCaptionAtLimit: 0,
                            hideAllCaptionAtLilmit: 0,
                            debugMode: false,
                            fallbacks: {
                                simplifyAll: "off",
                                disableFocusListener: false,
                            }
                        });
                    }
                });
            </script>
        <script>
          $(document).ready(function() {
            $(":input").inputmask();
          });
        </script>
        <!-- jQuery Smart Wizard -->
  <%--      <script>
          $(document).ready(function() {
              $('#wizard').smartWizard({
                  labelNext: 'Siguiente >>', // label for Next button
                  labelPrevious: '<< Anterior', // label for Previous button
                  labelFinish: 'RECARGAR',
                  enableAllSteps: true,
                  transitionEffect: 'fade',
                  enableFinishButton: true, // makes finish button enabled always
                  reverseButtonsOrder: false,
              });

            $('.buttonNext').addClass('btn btn-default');
            $('.buttonPrevious').addClass('btn btn-default');
            $('.buttonFinish').addClass('btn btn-primary');
          });
        </script>--%>
        <!-- /jQuery Smart Wizard -->


<!-- 12 Octubre 2017-->
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-97025389-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-97025389-1');
</script>

</body>
</html>
