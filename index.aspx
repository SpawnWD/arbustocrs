<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="MasTicket.index" EnableEventValidation="false" Debug="true" %>
<!DOCTYPE html>
<!--[if IE 8]>			<html class="ie ie8"> <![endif]-->
<!--[if IE 9]>			<html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->	<html> <!--<![endif]-->
	<head>
		<meta charset="utf-8" />
		<title>Así Compras</title>
        <meta name="keywords" content="Así Compras,Recargas,Celular,Movil,Tiempo aire,TopUp" />

        <!-- for Google -->
        <meta property="og:title" content="Así Compras">
        <meta name="description" content="Así Compras, ¡Te conviene!. Recarga tu celular, el de tu familia y amigos en cualquier momento y lugar. Conoce la forma inteligente de ahorrar tiempo y dinero de manera segura" />
        <meta name="keywords" content="Así Compras" />
        <meta name="application-name" content="asicompras.com" />   
        <meta property="og:description" content="Así Compras, ¡Te conviene!. Recarga tu celular, el de tu familia y amigos en cualquier momento y lugar. Conoce la forma inteligente de ahorrar tiempo y dinero de manera segura" />
        <meta property="og:image" content="https://asicompras.com/assets/images/asicomprasfb.png">

        <!-- for Facebook -->          
        <meta property="og:url" content="https://asicompras.com" />
        
        <!-- for Twitter -->          
        <meta name="twitter:title" content="As%ED%20Compras" />
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
        <link href="assets/plugins/HoldOn.min.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/sweetalert.css" rel="stylesheet" type="text/css" />


		<!-- REVOLUTION SLIDER -->
		<link href="assets/plugins/slider.revolution.v5/css/pack.css" rel="stylesheet" type="text/css" />
		<link href="http://fonts.googleapis.com/css?family=Roboto%3A400%2C100%2C300%2C500%2C700%2C900" rel="stylesheet" property="stylesheet" type="text/css" media="all" />
		<link href="http://fonts.googleapis.com/css?family=Raleway%3A400%2C500%2C600" rel="stylesheet" property="stylesheet" type="text/css" media="all" />
		<link href="http://fonts.googleapis.com/css?family=Lato%3A400%2C900%2C700" rel="stylesheet" property="stylesheet" type="text/css" media="all" />

		<!-- THEME CSS -->
		<link href="assets/css/essentials.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/layout.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/layout-responsive.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/orange.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/botonnegro.css" rel="stylesheet" type="text/css" />
        <!-- orange: default style -->
		<!--<link id="css_dark_skin" href="assets/css/layout-dark.css" rel="stylesheet" type="text/css" />--><!-- DARK SKIN -->
        <link rel="stylesheet" href="assets/css/bootstrap-select.min.css">
		<!-- modernizr -->

        <script type="text/javascript" src="assets/plugins/modernizr.min.js"></script>
        <script type="text/javascript" src="assets/plugins/sweetalert.min.js"></script>
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

            function msgError_Sesion(txt) {
                swal("Error", txt, "error");
                setTimeout("location.href = 'index.aspx'", 5000);
            }

        </script>

	</head>
	<body><!-- Available classes for body: boxed , pattern1...pattern10 . Background Image - example add: data-background="assets/images/boxed_background/1.jpg"  -->
        <form runat="server" method="post" role="form" id="frmDatos">
		<!-- Top Bar -->
		<header id="topHead">
		
			<div class="container" style="padding-top:10px; padding-left:10px;">

				<!-- SIGN IN -->
                <div class="pull-right nav signin-dd">
                    <a href="registro.aspx"><i class="fa fa-sign-in"></i><span class="hidden-xs"> Registrarse</span></a>
                </div>

				<div class="pull-right nav signin-dd">
					<a id="quick_sign_in" href="" data-toggle="dropdown"><i class="fa fa-user"></i><span class="hidden-xs"> Ingresar</span></a>
                    <div class="dropdown-menu" style="min-width:260px;" role="menu" aria-labelledby="quick_sign_in">
						<h4>Ingresar</h4>
							<div class="form-group"><!-- email -->
								<input runat="server"  type="email" class="form-control" placeholder="Email" id="Email" name="Email"/>
							</div>
							<div class="input-group">
								<!-- password -->
                                <input runat="server" data-inputmask="'mask' : '9999'" type="password" class="form-control" placeholder="NIP" id="NIP" name="NIP"/>
								<!-- submit button -->
								<span class="input-group-btn">
                                    <asp:Button runat="server" OnClientClick="ValidateLogin();" data-loading-text="Accesando..." id="btnAcceso" Text="Aceptar" class="btn btn-primary" OnClick="btnAcceso_Click"/>
								</span>
							</div>
							<div class="checkbox"><!-- remmember -->
								<label>
									<a href="login.aspx">¿Olvidó su NIP?</a>
								</label>
							</div>
						<hr />
						<a href="javascript:Cargando();FBLogin();" class="btn-facebook fullwidth radius3"><i class="fa fa-facebook"></i> Entrar con Facebook</a>
						<a href="javascript:Cargando();" id="btnGG" class="btn-google-plus fullwidth radius3"><i class="fa fa-google-plus"></i> Entrar con Google</a>
                    </div>
				</div>
				<!-- /SIGN IN -->
			</div>
		</header>
		<!-- /Top Bar -->

		<!-- TOP NAV -->
		<header id="topNav" class="topHead"><!-- remove class="topHead" if no topHead used! -->
			<div class="container">

				<!-- Logo text or image -->
				<a class="logo" style="font-family:'Conv_cooperblack';" href="index.aspx">
					<img src="assets/images/ascompraspng1.png" alt="Así Compras" /></a>

				<!-- Top Nav -->
				<div class="navbar-collapse nav-main-collapse collapse pull-right">
					<nav class="nav-main mega-menu">
						<ul class="nav nav-pills nav-main scroll-menu" id="topMain">
						</ul>
					</nav>
				</div>
				<!-- /Top Nav -->
			</div>
		</header>
		<!-- /TOP NAV -->
        <!--<span id="header_shadow"></span>-->

		<!-- WRAPPER -->
		<div id="wrapper">
			<section id="page-title" style="background-image:url('assets/images/app_bg.jpg')">
                <br />
                <center>
                <span style="font-family:'Conv_cooperblack'; color:#e35205; font-size:50px; text-shadow:-2px 0 white, 0 2px white, 2px 0 white, 0 -2px white;">¡ Te Conviene !</span>
                </center>
                <br />
				<!--<H3><span style="color:#ffffff; font-weight:500;">Recarga tu celular, el de tu familia y amigos desde la palma de tu mano o en linea. Tú decides cuándo y dónde, sin cargos adicionales.</span></H3>-->
                <center><H4><span style="color:#ffffff; text-shadow:-1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;">
                    Recarga tu celular, el de tu familia y amigos en cualquier momento y lugar. Ahorra tiempo y dinero de forma inteligente y segura.
                </span></H4></center>
                </center>
				<span class="overlay image"><!-- image overlay --></span>
				<div class="container">
                    <div class="col-md-5 col-sm-5 col-xs-8">
                        <img style="display:none;" id="imgCel" src="assets/images/vistaapp.png" class="img-responsive" />
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <br /><br /><br />
                        <a href="https://itunes.apple.com/us/app/asi-compras/id1166739856?l=es&ls=1&mt=8">
                        <img style="display:none;" id="imgAppA" src="./assets/images/app_store.png" class="img-responsive" />
                        </a>
                        <br />
                        <a href="https://play.google.com/store/apps/details?id=corit.asicompras">
                        <img style="display:none;" id="imgAppN" src="./assets/images/google_play.png" class="img-responsive" />
                        </a>
                    </div>
                    <div class="col-md-5 col-sm-5 col-xs-12">
                    <div class="white-row" style="display:none;" id="divRec">
                        <center><h2 style="background-color:#e35205; color:#ffffff;">&nbsp;<i class="fa fa-mobile"></i> <strong>RECARGA AQUI</strong></h2></center>
                        <div class="form-group">
                            <label style="color:#000000;" class="control-label col-md-3 col-sm-3 col-xs-12" for="pais">
                                País <span class="required">*</span>
                            </label>
                            <div id="divPais" class="col-md-9 col-sm-9 col-xs-12">
                                <select id="pais" name="pais" required="required" class="selectpicker form-control col-md-7 col-xs-12"></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label style="color:#000000;" class="control-label col-md-3 col-sm-3 col-xs-12" for="compania">
                                Compañía <span class="required">*</span>
                            </label>
                            <div id="divCompania" class="col-md-9 col-sm-9 col-xs-12">
                                <select id="compania" name="compania" required="required" data-size="7" class="selectpicker form-control col-md-7 col-xs-12"></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label style="color:#000000;" for="numero" class="control-label col-md-3 col-sm-3 col-xs-12">
                                Número <span class="required">*</span>
                            </label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <input runat="server" id="txtNumero" class="form-control col-md-7 col-xs-12" maxlength="10" minlength="10" type="number">
                            </div>
                        </div>
                        <div class="form-group">
                            <label style="color:#000000;" for="paquete" class="control-label col-md-3 col-sm-3 col-xs-12">
                                Monto <span class="required">*</span>
                            </label>
                            <div class="col-md-9 col-sm-9 col-xs-12">

                            <button type="button" class="btn btn-default form-control col-md-7 col-xs-12" style="text-align:left;padding-left:6px;" data-toggle="modal" data-target="#myModal" id="btnmontofin">
                                Seleccione monto
                            </button>

                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Button runat="server" OnClientClick="ValidateDatos();" id="btnNuevaT" Text="Siguiente" class="btn btn-primary pull-right push-bottom" />
                        </div>
                    </div>
                    </div>
				</div>
			</section>

            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">Seleccione monto</h4>
                                    </div>
                                    <div class="modal-body" style="height:250px; overflow-y:auto;">
                                        <div class="funkyradio" id="divPaquete">
                                            <div class="funkyradio-default" id="paquete">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                        <button type="button" class="btn btn-primary" data-dismiss="modal" id="btnModalSelec">Guardar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
            
			<!-- FEATURED BOXES 3 -->
			<section class="container">
                <br />
                <center>
                <span style="font-family:'Conv_cooperblack'; color:#e35205; font-size:50px; text-shadow:-2px 0 white, 0 2px white, 2px 0 white, 0 -2px white;">Beneficios</span>
                </center>
                
				<div class="row">
					<div class="col-md-4">
						<div class="featured-box nobg border-only">
							<div class="box-content">
								<img src="assets/images/B1.png" class="img-responsive" />
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="featured-box nobg border-only left-separator">
                            <img src="assets/images/B2.png" class="img-responsive" />
						</div>
					</div>
					<div class="col-md-4">
						<div class="featured-box nobg border-only left-separator">
                            <img src="assets/images/B3.png" class="img-responsive" />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 col-sm-4 col-xs-4">
						<a href="https://itunes.apple.com/us/app/asi-compras/id1166739856?l=es&ls=1&mt=8">
                        <img src="assets/images/app_store.png" class="img-responsive" />
                        </a>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-4">
			            <a href="https://sellosdeconfianza.org.mx/MuestraCertificado.php?NUMERO_SERIE=MD_w194">
                        <img src="assets/images/amipci.jpg" class="img-responsive" />
                        </a>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-4">
						<a href="https://play.google.com/store/apps/details?id=corit.asicompras">
                        <img src="assets/images/google_play.png" class="img-responsive" />
                        </a>
					</div>
				</div>
			</section>
			<!-- /FEATURED BOXES 3 -->
        </div>
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
										Teléfono: (55) 3330 0090 sin costo de L.D.
									</li>
									<li class="footer-sprite email">
										<a href="mailto:contacto@asicompras.com">contacto@asicompras.com</a>
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
							<a href="https://www.twitter.com/asicompras/" class="social rounded fa fa-twitter"></a>
							<a href="https://plus.google.com/113562445262862277809?hl=es" class="social rounded fa fa-google-plus"></a>
                            <a href="https://www.instagram.com/asicompras/" class="social rounded fa fa-instagram"></a>
						</d>
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
        <script>
            IniciarFeis();
        </script>
        <script type="text/javascript" src="assets/js/gugle.js"></script>
        <script>
            startApp();
        </script>

		<!-- REVOLUTION SLIDER -->
		<script type="text/javascript" src="assets/plugins/slider.revolution.v5/js/jquery.themepunch.tools.min.js"></script>
		<script type="text/javascript" src="assets/plugins/slider.revolution.v5/js/jquery.themepunch.revolution.min.js"></script>
        <script>
          $(document).ready(function() {
              $(":input").inputmask();

              $("#imgCel").fadeIn(1000, function () {
                  $("#imgAppA").fadeIn(1000);
                  $("#imgAppN").fadeIn(1000, function () {
                      $("#divRec").fadeIn(1000);
                  });
              });
          });
        </script>
        <script>
            function ValidateLogin() {
                $('#frmDatos').addClass('valid').closest('.form-group').removeClass('has-error');

                $('#frmDatos').validate({
                    rules: {
                        email: {
                            email: true,
                            required: true,
                        },
                        NIP: {
                            number: true,
                            maxlength: 4,
                            minlength: 4,
                            required: true,
                        },
                    },
                    messages: {
                        email: {
                            email: "El formato de correo es invalido o tiene caracteres no validos",
                            required: "El correo electronico es obligatorio",
                        },
                        NIP: {
                            required: "El NIP es obligatorio",
                            number: "Número con caracteres no validos",
                            minlength: "Número de 4 digitos",
                            maxlength: "Número de 4 digitos",
                        },
                    },
                    highlight: function (element) {
                        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                        $('#btnNuevaT').button('reset');
                        $('#btnAcceso').button('reset');
                    },
                    success: function (element) {
                        element.addClass('valid')
                            .closest('.form-group').removeClass('has-error').addClass('has-success');
                    }
                });
            }

            function ValidateDatos() {
                $('#frmDatos').validate({
                    rules: {
                        pais: {
                            required: true,
                        },
                        compania: {
                            required: true,
                        },
                        txtNumero: {
                            number: true,
                            maxlength: 10,
                            minlength: 10,
                            required: true,
                        },
                        paquete: {
                            required: true,
                        },
                    },
                    messages: {
                        pais: {
                            required: "El pais es obligatorio",
                        },
                        compania: {
                            required: "La compañia es obligatoria",
                        },
                        txtNumero: {
                            required: "El Número de telefono es obligatorio",
                            number: "Número con caracteres no validos",
                            minlength: "Número de 10 digitos",
                            maxlength: "Número de 10 digitos",
                        },
                        paquete: {
                            required: "El monto es obligatorio",
                        },
                    },
                    highlight: function (element) {
                        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                        $('#btnNuevaT').button('reset');
                        $('#btnAcceso').button('reset');
                    },
                    /*success: function (element) {
                        element.addClass('valid')
                            .closest('.form-group').removeClass('has-error').addClass('has-success');
                    }*/
                });
            }
        </script>
        <script>
            $(document).ready(function () {
                $("#btnModalSelec").click(function () {
                    var jsonpq = decodeHtml("<%: jsonPq %>");
                    var arrpq = $.parseJSON(jsonpq);
                    for (var i = 0; i < arrpq.length; i++) {
                        if (arrpq[i].idpaquete == $('input:radio[name=optradio]:checked').val()) {
                            $("#btnmontofin").text('$' + arrpq[i].monto + '.00  (' + arrpq[i].paquete + ')' );
                            $("#idpaquetew").val( arrpq[i].idpaquete);
                        }
                    }
                });
            });
            $(document).ready(function () {
                $('#pais').on('change', function () {
                    $('#hidPais').val(this.value);
                });
                $('#compania').on('change', function () {
                    $('#hidCompania').val(this.value);
                    $('#idpaquetew').val("0");
                    $("#btnmontofin").text("Seleccione monto");
                    PaquetesEnPopUp(this.value);
                });
                $('#paquete').on('change', function () {
                    $('#hidPaquete').val(this.value);
                });
            });
            function PaquetesEnPopUp(ido) {
                var selpq = $("#paquete");
                selpq.empty();
                var jsonpq = decodeHtml("<%: jsonPq %>");
                var arrpq = $.parseJSON(jsonpq);

                selpq.append('<h4>Tiempo Aire</h4>');
                for (var i = 0; i < arrpq.length; i++) {
                    if (arrpq[i].idoperadora == ido) {
                        if (arrpq[i].tipo == 0)
                            selpq.append('<label><input type="radio" name="optradio" value=\'' + arrpq[i].idpaquete + '\'><strong> $' + arrpq[i].monto + '.00  (' + arrpq[i].paquete + ')</strong></label><br/>');
                    }
                }

                var jk = 0;
                for (var i = 0; i < arrpq.length; i++) {
                    if (arrpq[i].idoperadora == ido) {
                        if (arrpq[i].tipo == 1) {
                            if (jk == 0)
                            {
                                selpq.append('<br/><h4>Datos</h4>');
                                jk = 1;
                            }
                            selpq.append('<label><input type="radio" name="optradio" value=\'' + arrpq[i].idpaquete + '\'><strong> $' + arrpq[i].monto + '.00  (' + arrpq[i].paquete + ')</strong></label><br/>');
                        }
                    }
                }
            }

            function CargaCombos() {
                var selpa = $("#pais");
                selpa.empty();
                var jsonpa = decodeHtml("<%: jsonPa %>");
                var arrpa = $.parseJSON(jsonpa);
                for (var i = 0; i < arrpa.length; i++) {
                    selpa.append('<option data-content="<img src=\'' + arrpa[i].img + '\' height=\'24\' />&nbsp;&nbsp;<span>' + arrpa[i].pais + '</span>" value=\'' + arrpa[i].idpais + '\'>' + arrpa[i].pais + '</option>');
                    $('#hidPais').val(arrpa[i].idpais);
                }

                var selop = $("#compania");
                selop.empty();
                var jsonop = decodeHtml("<%: jsonOp %>");
                var arrop = $.parseJSON(jsonop);
                selop.append('<option selected value=\'0\'>Seleccione compañía</option>');
                for (var i = 0; i < arrop.length; i++) {
                    selop.append('<option data-content="<img src=\'' + arrop[i].img + '\' height=\'24\' />&nbsp;&nbsp;<span>' + arrop[i].operadora + '</span>" value=\'' + arrop[i].idoperadora + '\'>' + arrop[i].operadora + '</option>');
                }

                var selpq = $("#paquete");
                selpq.empty();
                selpq.append('<option selected value=\'0\'>Seleccione monto</option >');
            }
            function decodeHtml(html) {
                var txt = document.createElement("textarea");
                txt.innerHTML = html;
                return txt.value;
            }
            function SelOper(ido, num, idpq) {
                $("#compania").val(ido);
                $("#hidCompania").val(ido);
                $("#txtNumero").val(num);
                var jsonpq = decodeHtml("<%: jsonPq %>");
                var arrpq = $.parseJSON(jsonpq);
                for (var i = 0; i < arrpq.length; i++) {
                    if (arrpq[i].idpaquete == idpq) {
                        $("#btnmontofin").text('$' + arrpq[i].monto + '.00  (' + arrpq[i].paquete + ')');
                        $("#idpaquetew").val(arrpq[i].idpaquete);
                    }
                }
                PaquetesEnPopUp(ido);
            }
        </script>

<!-- livezilla.net code (PLEASE PLACE IN BODY TAG) -->
<!--<div id="livezilla_tracking" style="display:none"></div><script type="text/javascript">-->
<!--var script = document.createElement("script");script.async=true;script.type="text/javascript";var src = "http://localhost/chat/server.php?a=139b0&rqst=track&output=jcrpt&el=ZXM_&ovlc=I2UzNTEwMg__&ovlct=I2ZmZmZmZg__&ovlts=MA__&ovlt=QXl1ZGEgRW4gTGluZWE_&ovlto=QXl1ZGEgRW4gTGluZWE_&eca=MQ__&echt=wr9OZWNlc2l0YXMgYXl1ZGEgcGFyYSByZWNhcmdhcj8_&echst=IA__&ecoht=wr9OZWNlc2l0YXMgYXl1ZGEgcGFyYSByZWNhcmdhcj8_&ecohst=IA__&ecfs=I0ZGRkZGRg__&ecfe=I0ZGRkZGRg__&echc=IzU1MzE5MQ__&ecsgs=I0UzNTEwMg__&ecsge=I0UzNTEwMg__&ecsp=MQ__&nse="+Math.random();setTimeout("script.src=src;document.getElementById('livezilla_tracking').appendChild(script)",1);</script><noscript><img src="http://localhost/chat/server.php?a=139b0&amp;rqst=track&amp;output=nojcrpt" width="0" height="0" style="visibility:hidden;" alt=""></noscript>-->
<!-- http://www.livezilla.net -->

<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/57ec0e5081b5df649ae7d136/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->


<!-- 12 Octubre 2017-->
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-97025389-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-97025389-1');
</script>

    <asp:HiddenField ID="idpaquetew" runat="server" Value="0"  />
    <asp:HiddenField runat="server" id="hidPais" Value="0" />
    <asp:HiddenField runat="server" id="hidCompania" Value="0" />
    <asp:HiddenField runat="server" id="hidPaquete" Value="0" />
    <asp:Label runat="server" id="spnJS" Text=""></asp:Label>

        </form>
	</body>
</html>