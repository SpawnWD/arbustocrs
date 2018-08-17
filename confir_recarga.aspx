<%@ Page Language="C#" EnableEventValidation="false" Async="true" AutoEventWireup="true" CodeFile="confir_recarga.aspx.cs" Inherits="MasTicket.confir_recarga" Debug="true" %>
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
        
        <script type="text/javascript" src="https://openpay.s3.amazonaws.com/openpay.v1.min.js"></script>
        <script type="text/javascript" src="https://openpay.s3.amazonaws.com/openpay-data.v1.min.js"></script>
        <!-- modernizr -->
		<script type="text/javascript" src="assets/plugins/modernizr.min.js"></script>
        <script type="text/javascript" src="assets/plugins/sweetalert.min.js"></script>
        <script type='text/javascript'>
            function msgAviso(txt) {
                swal("Aviso", txt);
            }
            function msgExito(txt) {
                swal({ html: true, title: "Exito", text: txt, type: "success" });
            }
            function msgError(txt) {
                swal("Error", txt, "error");
            }
            function ticket(txt) {
                swal({
                    html: true, title: "Exito", text: txt, type: "success",
                    showCancelButton: true,
                    cancelButtonText: "Cerrar",
                    closeOnCancel: false,
                    closeOnConfirm: false,
                    confirmButtonText: "¿Programar esta recarga?",
                },
                function(isConfirm) {
                    if (isConfirm) {
                        //swal({ html: true, title: "Programar recarga", text: "<div id='sandbox-container'><div>", type: "info" });
                        //$('#sandbox-container div').datepicker({
                        //});
                        __doPostBack("programar");
                    } else {
                        __doPostBack("recargaexito");
                    }
                });
            }
        </script>
        <script type="text/javascript">
<!--
            function enviar() {
                window.location = "datosrecarga.aspx";
            }
//-->
</script>
	</head>
	<body class="boxed" data-background="assets/images/creative_4.jpg">
        <!-- Top Bar -->
		<!--<header id="topHead">
		
			<div class="container">

				    <div class="pull-right nav signin-dd">
					<a id="quick_sign_in" href="" data-toggle="dropdown"><i class="fa fa-users"></i>&nbsp;<asp:Label runat="server" ID="lblCtaNom" class="hidden-xs" Text="Ingresar" /></a>
					<div class="dropdown-menu" role="menu" aria-labelledby="quick_sign_in">
						<h4>Mi cuenta</h4><br />
						<p class="bottom-create-account">
					        <center><a href="#"><asp:Image Width="50" runat="server" ID="imgFoto" /></a></center>
						</p>
                        <p class="bottom-create-account" style="background-color:#53318f; color:#ffffff;">
					        
						</p>
					</div>
				</div>

			</div>
		</header>-->
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
                    
                </div>
                <!-- /Top Nav -->

			</div>
		</header>
		<!-- /TOP NAV -->
        <span id="header_shadow"></span>
            <form runat="server" method="post" role="form" id="frmDatos">
		
		<!-- WRAPPER -->
<!------------------------------------------------------------------------------------------------------------>
        <div id="wrapper" style="background:rgba(0,0,0,0.2);">
            <section class="container top-no-header">
            <div class="row">
                <div class="col-md-9">
                    <div class="white-row" >
                        <h2><i class="fa fa-mobile"></i> <strong>Recargar</strong></h2>
                        <div class="col-md-2 col-sm-2"></div>
                        <!--<div class="col-md-8 col-sm-8 col-xs-12">-->
                        <div class="form-group">
                            <!-- INVOICE HEADER -->
                            <div class="row">
                                <!--<div class="col-md-6 col-sm-6">
                                    <span class="letramorada">Así</span> <span class="letranaranja">Compras</span>
                                </div>-->
                                <div class="col-md-12 col-sm-12 text-right">
                                    <p>
                                        <strong><asp:Label runat="server" ID="lblFecha" /></strong>
                                        <h4><b>Detalle de su compra.</b></h4>
                                    </p>
                                </div>
                            </div>
                            <!-- /INVOICE HEADER -->
                            <hr class="margin-top10 margin-bottom10" /><!-- separator -->
                            <!-- DETAILS -->
                            <div class="white-row">
                                <div class="col-md-6 col-sm-6">
                                    <input runat="server" type="text" id="deviceIdHiddenFieldName" value="" />

                                    <h4>Detalle de la <strong>Recarga</strong></h4>
                                    <ul class="list-unstyled">
                                        <li><strong>Pais:</strong> <asp:Label runat="server" ID="lblPais" /></li>
                                        <li><strong>Compañia:</strong> <asp:Label runat="server" ID="lblOperadora" /></li>
                                        <li><strong>Numero:</strong> <asp:Label runat="server" ID="lblNumero" /></li>
                                        <li><strong>Monto:</strong> <asp:Label runat="server" ID="lblMonto" /></li>
                                    </ul>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <h4>Detalle del <strong>Pago</strong></h4>
                                    <ul class="list-unstyled">
                                        <li><strong>Medio:</strong> <asp:Label runat="server" ID="lblFormaPago" /></li>
                                        <li><strong><asp:Label runat="server" ID="lblTarjTxt" Text="Numero:" /></strong> <asp:Label runat="server" ID="lblEmisor" /></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- /DETAILS -->
                        </div>

                        <div class="col-md-2 col-sm-2"><div runat="server" id="divFinger"></div></div>

                        <div id="divNIP" class="row mfp-hide" style="position: relative;background:#FFF; padding:20px; width:auto; height:auto; max-width:500px; max-height:300px; margin:20px auto;">
                            <h2><i class="fa fa-lock"></i> Introduzca su <strong>NIP</strong></h2>
                            <div class="col-md-12">
                                <div class="white-row">
                                    <div class="form-group">
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <asp:TextBox runat="server" id="txtNip1" name="txtNip1" class="form-control col-md-2 col-xs-3" required minlength="1" maxlength="1" type="password" />
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <asp:TextBox runat="server" id="txtNip2" name="txtNip2" class="form-control col-md-2 col-xs-3" required minlength="1" maxlength="1" type="password" />
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <asp:TextBox runat="server" id="txtNip3" name="txtNip3" class="form-control col-md-2 col-xs-3" required minlength="1" maxlength="1" type="password" />
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <asp:TextBox runat="server" id="txtNip4" name="txtNip4" class="form-control col-md-2 col-xs-3" required minlength="1" maxlength="1" type="password" />
                                        </div>
                                    </div>
                                </div></div>
                            <a class="btn btn-primary" id="btnCancelNIP" href="#">Cancelar</a>
                        </div>

                        <div class="form-group">
                            <hr class="margin-top10 margin-bottom10" /><!-- separator -->
                            <p align="right">
                            <asp:Button CssClass="btn btn-primary" Text="Cancelar" runat="server" ID="btnCancel" />
                            &nbsp;&nbsp;
                            <a href="#" runat="server" id="btnNIP" data-mfp-src="#divNIP" class="open-popup-link btn btn-success">¡ Recargar Ahora !</a>
                            </p>
                        </div> 
                           
                    </div>
                </div>
                
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
        <script type="text/javascript" src="assets/plugins/bootbox.min.js"></script>
        <script>
            $('.open-popup-link').magnificPopup({
                type: 'inline',
                modal: true,
                focus: '#txtNip1',
                midClick: true // Allow opening popup on middle mouse click. Always set it to true if you don't provide alternative source in href.
            });
            $(document).on('click', '#btnCancelNIP', function (e) {
                e.preventDefault();
                $.magnificPopup.close();
            });
            $(document).on('click', '#btnNIP', function (e) {
                $("#txtNip1").val("");
                $("#txtNip2").val("");
                $("#txtNip3").val("");
                $("#txtNip4").val("");
            });
            $("input").bind("input", function () {
                var $this = $(this);
                setTimeout(function () {
                    if ($this.val().length >= parseInt($this.attr("maxlength"), 10)) {
                        if ($this.attr('id') == 'txtNip1')
                            $("#txtNip2").focus();
                        if ($this.attr('id') == 'txtNip2')
                            $("#txtNip3").focus();
                        if ($this.attr('id') == 'txtNip3')
                            $("#txtNip4").focus();
                        if ($this.attr('id') == 'txtNip4') {
                            $.magnificPopup.close();
                            Cargando();
                            __doPostBack("iniciarecarga", $("#txtNip1").val().toString() + $("#txtNip2").val().toString() + $("#txtNip3").val().toString() + $("#txtNip4").val().toString());
                        }
                    }
                }, 0);
            });

            function ErrorNip() {
                $("#divNIP").effect("shake", {
                    direction: "left",
                    times: 4,
                    distance: 5
                }, 30);
            }

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
        <script type="text/javascript">
            $(document).ready(function () {
                if (!$('#deviceIdHiddenFieldName').val()) {
                    OpenPay.setId('<%= OPAYmerchantid %>');
                    OpenPay.setApiKey('<%= OPAYpublickey %>');
                    OpenPay.setSandboxMode(true);
                    var deviceSessionId = OpenPay.deviceData.setup();
                    $('#deviceIdHiddenFieldName').val(deviceSessionId);
                }
            });
        </script>

        <script>
          $(document).ready(function() {
            $(":input").inputmask();
          });

        var name = '<%: (Session["usrlogged"] as MasTicket.Usuario).name %>';
          var email = '<%: (Session["usrlogged"] as MasTicket.Usuario).email %>';
          Tawk_API = Tawk_API || {};
          Tawk_API.visitor = {
              name: name,
              email: email,
          };
          var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
          (function () {
              var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
              s1.async = true;
              s1.src = 'https://embed.tawk.to/57ec0e5081b5df649ae7d136/default';
              s1.charset = 'UTF-8';
              s1.setAttribute('crossorigin', '*');
              s0.parentNode.insertBefore(s1, s0);
          })();
        </script>
        
        <script>
            $('#frmDatos').validate({
                rules: {
                    txtCVV: {
                        number: true,
                        maxlength: 4,
                        minlength: 3,
                        required: true,
                    },
                },
                messages: {
                    txtCVV: {
                        required: "El CVC es obligatorio",
                        number: "Numero con caracteres no validos",
                        minlength: "Numero de 3 digitos",
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


    <asp:HiddenField runat="server" id="hidPais" Value="0" />
    <asp:HiddenField runat="server" id="hidEstado" Value="0" />
    <asp:HiddenField runat="server" id="hidCiudad" Value="0" />
    <asp:Label runat="server" id="spnJS" Text=""></asp:Label>
    </form>
	</body>
</html>