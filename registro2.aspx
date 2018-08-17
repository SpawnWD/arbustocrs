<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registro2.aspx.cs"  Debug="true" Async="true" Inherits="MasTicket.registro2" EnableEventValidation="false" %>
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
        <meta name="description" content="Así Compras. La nueva forma de recargar tu celular y el de tus amigos desde la palma de tu mano. Descarga la app sin costo alguno." />
        <meta name="keywords" content="Así Compras" />
        <meta name="application-name" content="asicompras.com" />   
        <meta property="og:description" content="Así Compras. La nueva forma de recargar tu celular y el de tus amigos desde la palma de tu mano. Descarga la app sin costo alguno." />
        <meta property="og:image" content="http://asicompras.com/assets/images/asicompraspng.png">

        <!-- for Facebook -->          
        <meta property="og:url" content="https://asicompras.com" />
        
        <!-- for Twitter -->          
        <meta name="twitter:title" content="As%ED%20Compras" />
        <meta name="twitter:description" content="La%20nueva%20forma%20de%20adquirir%20productos%20y%20servicios%20electr%F3nicos%20desde%20la%20palma%20de%20tu%20mano.%20Recargas%20de%20tiempo%20aire%20en%20cualquier%20momento%20y%20cualquier%20lugar.%20T%FA%20decides." />
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
        <form runat="server" method="post" role="form" id="frmAlta">
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
                <span style="font-family:'Conv_cooperblack'; color:#e35205; font-size:50px; text-shadow:-2px 0 white, 0 2px white, 2px 0 white, 0 -2px white;">¡ Así de fácil !</span>
                </center>
                <br />
				<!--<H3><span style="color:#ffffff; font-weight:500;">Recarga tu celular, el de tu familia y amigos desde la palma de tu mano o en linea. Tú decides cuándo y dónde, sin cargos adicionales.</span></H3>-->
                <center><H4><span style="color:#ffffff; text-shadow:-1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;">
                    Recarga tu celular, el de tu familia y amigos desde la palma de tu mano o en linea. Tú decides cuándo y dónde, sin cargos adicionales.
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
                        <center><h2 style="background-color:#e35205; color:#ffffff;">&nbsp;<i class="fa fa-mobile"></i> <strong>Registrate</strong></h2></center>
                        <div class="form-group">
                            <label style="color:#000000;" class="control-label col-md-3 col-sm-3 col-xs-12" for="name">
                                Nombre <span class="required">*</span>
                            </label>
                            <div id="divName" class="col-md-9 col-sm-9 col-xs-12">
                                <input runat="server" id="txtNombre" type="text" value="" class="form-control">                                
                            </div>
                        </div>
                        <div class="form-group">
                            <label style="color:#000000;" class="control-label col-md-3 col-sm-3 col-xs-12" for="email">
                                E-mail <span class="required">*</span>
                            </label>
                            <div id="divMail" class="col-md-9 col-sm-9 col-xs-12">
                                <input runat="server" id="txtEmail" type="email" required value="" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label style="color:#000000;" for="numero" class="control-label col-md-3 col-sm-3 col-xs-12">
                                Número de teléfono móvil <span class="required">*</span>
                            </label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <input runat="server" id="txtNumero" type="number" required minlength="10" maxlength="10" value="" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label style="color:#000000;" for="numero" class="control-label col-md-3 col-sm-3 col-xs-12">
                                Confirmar Número <span class="required">*</span>
                            </label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <input runat="server" id="txtNumeroConfirmar" type="number" required minlength="10" maxlength="10" value="" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label style="color:#000000;" for="nip" class="control-label col-md-3 col-sm-3 col-xs-12">
                                NIP (4 digitos) <span class="required">*</span>
                            </label>
                            <div class="col-md-9 col-sm-9 col-xs-12">

                            <input runat="server" id="txtNip1" type="password" value="" required maxlength="4" minlength="4" class="form-control">

                            </div>
                        </div>
                        <div class="form-group">
                            <label style="color:#000000;" for="nip" class="control-label col-md-3 col-sm-3 col-xs-12">
                               Confirme NIP <span class="required">*</span>
                            </label>
                            <div class="col-md-9 col-sm-9 col-xs-12">

                            <input runat="server" id="txtNip2" type="password" value="" required maxlength="4" minlength="4" class="form-control">

                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Button runat="server" id="btnReg1" Text="O usa Redes Sociales" class="btn btn-primary pull-left push-bottom" />
                            <asp:Button runat="server"  id="btnNuevaT" data-loading-text="Guardando..." Text="Siguiente" class="btn btn-primary pull-right push-bottom" />
                        </div>
                    </div>
                    </div>
				</div>
			</section>

            
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
			            <a href="https://sellosdeconfianza.org.mx/MuestraCertificado.php?NUMERO_SERIE=MD_v255">
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
                $('#btnRegistrar').on('click', function () {
                    var $btn = $(this).button('loading')
                    //$btn.button('reset')
                });

                $('#btnReg1').on('click', function () {
                    location.href = 'registro.aspx';
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
                    txtNumeroConfirmar: {
                        number: true,
                        maxlength: 10,
                        minlength: 10,
                        required: true,
                        equalTo: "#txtNumero",
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
                    txtNumeroConfirmar: {
                        required: "El numero de teléfono es obligatorio",
                        number: "Numero con caracteres no validos",
                        minlength: "Numero de 10 digitos",
                        maxlength: "Numero de 10 digitos",
                        equalTo: "Los numeros de teléfono no coinciden",
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

<!-- 12 Octubre 2017-->
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-97025389-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-97025389-1');
</script>

             <asp:Label runat="server" id="spnJS" Text=""></asp:Label>
        </form>
	</body>
</html>