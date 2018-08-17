<%@ Page Language="C#" AutoEventWireup="true" CodeFile="rec_nip.aspx.cs" Inherits="MasTicket.rec_nip" %>
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

            function msgError_Sesion(txt) {
                swal("Error", txt, "error");
                setTimeout("location.href = 'index.aspx'", 5000);
            }

        </script>
        
       
	</head>
	<body class="boxed" data-background="assets/images/creative_4.jpg">
        
		
		<header id="topHead">
		
			<div class="container">

				<!-- PHONE/EMAIL -->
				<span class="quick-contact pull-left">
					<i class="fa fa-phone"></i> (55) 3330 0090 sin costo de L.D. &bull; 
					<a class="hidden-xs" href="mailto:informes@asicompras.com">informes@asicompras.com</a>
				</span>
				<!-- /PHONE/EMAIL -->

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

			</div>
		</header>
		<!-- /TOP NAV -->
        <span id="header_shadow"></span>

		<!-- WRAPPER -->
            <asp:Label runat="server" id="spnJS" Text=""></asp:Label>
            <asp:Label runat="server" id="redireccion" Text=""></asp:Label>
<!------------------------------------------------------------------------------------------------------------>
        <div id="wrapper" style="background:rgba(0,0,0,0.2);">
            <section class="container top-no-header">
                <div class="row">
                    <!-- LOGIN -->
                    <div class="col-md-6">
                        <div class="white-row" id="todo">
                        <form method="post"  role="form" runat="server" id="frmAcceso" >
                            <h2><strong>Recuperación de NIP</strong></h2>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label runat="server" id="lblaviso_caducado">La liga ha caducado. </label>
                                        <label runat="server" id="lblaviso_cad">Por favor llene los datos que se le piden a continuación </label>
&nbsp;
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label runat="server" id="lblnuevo">Nuevo NIP (4 digitos)</label>
                                        <input runat="server" data-inputmask="'mask' : '9999'" required type="password" class="form-control" placeholder="Nuevo NIP" id="nuevo_nip" name="nuevo_nip"/>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label runat="server" id="lblconfirm">Confirmar Nuevo NIP</label>
                                        <input runat="server" data-inputmask="'mask' : '9999'" required type="password" class="form-control" placeholder="Nuevo NIP" id="confirm_nuevo_nip" name="confirm_nuevo_nip"/>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <!--<div class="col-md-6">
                                    <span class="remember-box checkbox">
                                        <label for="rememberme">
                                            <input type="checkbox" id="rememberme" name="rememberme">Remember Me
                                        </label>
                                    </span>
                                </div>-->
                                <div class="col-md-6">
                                    <asp:Button runat="server" data-loading-text="Guardando..." id="btnAcceso" Text="Guardar" class="btn btn-primary" OnClick="btnAcceso_Click"/>
                                </div>
                            </div>

                        </form>
                        </div>
                    </div>
                    <!-- /LOGIN -->
                    <!-- PASSWORD -->
                                       <div class="col-md-6">
                        <div class="white-row">
                            <h2><strong></strong></h2>

                            <p>
                                <label runat="server" id="lblleyenda_caducaco"></label>
                            </p>

                            <!-- alert success -->
                            <!--<div class="alert alert-success">
                                <i class="fa fa-check-circle"></i>
                                <strong>New Password Sent!</strong> Check your E-mail Address!
                            </div>-->

                            <!-- alert failed -->
                            <!--<div class="alert alert-danger">
                                <i class="fa fa-frown-o"></i>
                                <strong>E-mail Address</strong> not found!
                            </div>-->

                            <!-- password form -->
                           
                    </div>
 
                    <!-- /PASSWORD -->
                </div>
            </section>

        </div>
<!------------------------------------------------------------------------------------------------------------>
		<!-- /WRAPPER -->
        <asp:Label runat="server" id="Label1" Text=""></asp:Label>
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

		<script type="text/javascript" src="assets/js/scripts.js"></script>
        <script type="text/javascript" src="assets/js/feis.js"></script>
        <script type="text/javascript" src="assets/js/gugle.js"></script>

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
            $('#frmAcceso').validate({
                rules: {
                    nip: {
                        number: true,
                        maxlength: 4,
                        minlength: 4,
                        required: true,
                    },
                    nuevo_ip: {
                        number: true,
                        maxlength: 4,
                        minlength: 4,
                        required: true,
                    }
                    ,
                    confirm_nuevo_nip: {
                        number: true,
                        maxlength: 4,
                        minlength: 4,
                        required: true,
                    }
                },
                messages: {
                    nip: {
                        required: "El NIP es obligatorio",
                        number: "Numero con caracteres no validos",
                        minlength: "Numero de 4 digitos",
                        maxlength: "Numero de 4 digitos",
                    },
                    nuevo_nip: {
                        required: "El nuevo NIP es obligatorio",
                        number: "Numero con caracteres no validos",
                        minlength: "Numero de 4 digitos",
                        maxlength: "Numero de 4 digitos",
                    }
                    ,
                    confirm_nuevo_nip: {
                        required: "Confirme su nuevo NIP, es obligatorio",
                        number: "Numero con caracteres no validos",
                        minlength: "Numero de 4 digitos",
                        maxlength: "Numero de 4 digitos",
                    }
                },
                highlight: function (element) {
                    $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                    $('#btnAcceso').button('reset');
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