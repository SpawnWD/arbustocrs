<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registro.aspx.cs" Async="true" Inherits="MasTicket.registro" %>
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
        </script>

	</head>
	<body class="boxed" data-background="assets/images/creative_4.jpg"><!-- Available classes for body: boxed , pattern1...pattern10 . Background Image - example add: data-background="assets/images/boxed_background/1.jpg"  -->


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
							<!-- GLOBAL SEARCH -->
							<!--<li class="search">
								<form method="get" action="#" class="input-group pull-right">
									<input type="text" class="form-control" name="k" id="k" value="" placeholder="Buscar">
									<span class="input-group-btn">
										<button class="btn btn-primary notransition"><i class="fa fa-search"></i></button>
									</span>
								</form>
							</li>-->
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
		<!-- WRAPPER -->
<!------------------------------------------------------------------------------------------------------------>
        <div id="wrapper" style="background:rgba(0,0,0,0.2);">
            <section class="container top-no-header">
                <div class="row">
                   
                    <!-- REGISTER -->
                    <div class="col-md-6">
                        <div class="white-row">
                        
                        <form id="frmAlta" runat="server">
                            <h2><strong>Crear cuenta</strong></h2>

                            <!-- alert failed -->
                            <!--<div class="alert alert-danger">
                                <i class="fa fa-frown-o"></i>
                                <strong>Password</strong> do not match!
                            </div>-->

                            <div class="row">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <center><figure style="width:50px;height:50px;border-radius:50%;overflow:hidden;"><asp:Image runat="server" ID="imgFoto" /></figure></center>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <label>Nombre</label>
                                        <input runat="server" id="txtNombre" type="text" value="" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <label>E-mail</label>
                                        <input runat="server" id="txtEmail" type="email" required value="" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <label>Número de contacto</label>
                                        <input runat="server" id="txtNumero" type="number" required minlength="10" maxlength="10" value="" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-md-6">
                                        <label>NIP (4 digitos)</label>
                                        <input runat="server" id="txtNip1" type="password" value="" required maxlength="4" minlength="4" class="form-control">
                                    </div>
                                    <div class="col-md-6">
                                        <label>Confirme NIP</label>
                                        <input runat="server" id="txtNip2" type="password" value="" required maxlength="4" minlength="4" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:Button runat="server" data-loading-text="Guardando..." id="btnRegistrar" Text="Registrate" class="btn btn-primary pull-right push-bottom" />
                                </div>
                            </div>

                        </form>
                        </div>
                    </div>
                    <!-- /REGISTER -->
                    <!-- WHY? -->
                    <div class="col-md-6">

                        <div class="white-row">
                            <h2><strong>O usa tus redes sociales</strong></h2>

                            <h4>El registro es rapido, facil y gratis.</h4>
                            <div class="col-md-6 col-sm-12 col-xs-12">
                            <a href="javascript:Cargando();FBLogin();" class="btn-facebook fullwidth radius3"><i class="fa fa-facebook"></i> Entrar con Facebook</a>
                            <a href="javascript:Cargando();" id="btnGG" class="btn-google-plus fullwidth radius3"><i class="fa fa-google-plus"></i> Entrar con Google</a>
                            </div>
                                <br /><br />
                            <p>Una vez que te registres:</p>
                            <ul class="list-icon check">
                                <li>Podras recargar tiempo aire.</li>
                                <li>Acceder a tiempo aire gratis.</li>
                                <li>Dar de alta tus tarjetas.</li>
                                <li>Obtener promociones exclusivas.</li>
                            </ul>

                            <hr class="half-margins" />

                            <p>
                                ¿Ya tienes cuenta?
                                <a href="login.aspx"><strong>Ingresa</strong></a>
                            </p>
                        </div>

                        
                    </div>
                    <!-- /WHY? -->

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
							<a href="https://twitter.com/asicompras/" class="social rounded fa fa-twitter"></a>
							<a href="https://plus.google.com/113562445262862277809?hl=es" class="social rounded fa fa-google-plus"></a>
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
        <script type="text/javascript" src="assets/plugins/jquery.validate.min.js"></script>
        <script type="text/javascript" src="assets/plugins/jquery.inputmask.bundle.min.js"></script>
		<script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="assets/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
		<script type="text/javascript" src="assets/plugins/owl-carousel/owl.carousel.min.js"></script>
		<script type="text/javascript" src="assets/plugins/stellar/jquery.stellar.min.js"></script>
		<script type="text/javascript" src="assets/plugins/knob/js/jquery.knob.js"></script>
		<script type="text/javascript" src="assets/plugins/jquery.backstretch.min.js"></script>
		<script type="text/javascript" src="assets/plugins/superslides/dist/jquery.superslides.min.js"></script>
		<script type="text/javascript" src="assets/plugins/mediaelement/build/mediaelement-and-player.min.js"></script>
        <script type="text/javascript" src="assets/plugins/HoldOn.min.js"></script>
        <script>
            function Cargando() {
                HoldOn.open({
                    theme: "sk-circle",
                    message: "Cargando...",
                });
            }
			
			function ValidateLogin(){
			window.open('bienvenido.aspx','Dates','scrollbars=no,resizable=no,height=450, width=450');
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


        <script>
          $(document).ready(function() {
            $(":input").inputmask();
          });
        </script>
        <script>
          $('#btnRegistrar').on('click', function () {
            var $btn = $(this).button('loading')
            //$btn.button('reset')
          })
        </script>
        <script>
            $('#frmAlta').validate({
                rules: {
                    txtNombre: {
                      required: true,  
                    },
                    txtEmail: {
                        email: true,
                        required: true,  
                    },
                    txtNumero: {
                        number: true,
                        maxlength: 10,
                        minlength: 10,
                        required: true,
                    },
                    txtNip1: {
                        number: true,
                        maxlength: 4,
                        minlength: 4,
                        required: true,
                    },
                    txtNip2: {
                        number: true,
                        maxlength: 4,
                        minlength: 4,
                        required: true,
                    },
                },
                messages: {
                    txtNombre: {
                        required: "El nombre es obligatorio",  
                    },
                    txtEmail: {
                        email: "El formato de correo es invalido o tiene caracteres no validos",
                        required: "El correo electronico es obligatorio",
                    },
                    txtNumero: {
                        required: "El numero de telefono es obligatorio",
                        number: "Numero con caracteres no validos",
                        minlength: "Numero de 10 digitos",
                        maxlength: "Numero de 10 digitos",
                    },
                    txtNip1: {
                        required: "El NIP es obligatorio",
                        number: "Numero con caracteres no validos",
                        minlength: "Numero de 4 digitos",
                        maxlength: "Numero de 4 digitos",
                    },
                    txtNip2: {
                        required: "El NIP es obligatorio",
                        number: "Numero con caracteres no validos",
                        minlength: "Numero de 4 digitos",
                        maxlength: "Numero de 4 digitos",
                    },
                },
                highlight: function (element) {
                    $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                    $('#btnRegistrar').button('reset');
                },
                success: function (element) {
                    element.addClass('valid')
                        .closest('.form-group').removeClass('has-error').addClass('has-success');
                }
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

	</body>
</html>