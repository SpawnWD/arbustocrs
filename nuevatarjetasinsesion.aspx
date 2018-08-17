<%@ Page Language="C#" EnableEventValidation="false" Async="true" AutoEventWireup="true" CodeFile="nuevatarjetasinsesion.aspx.cs" Inherits="MasTicket.nuevatarjetasinsesion" %>
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
        <style type="text/css">
            input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
  -webkit-appearance: none; 
  margin: 0; 
}
        </style>
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
        </script>
	</head>
	<body class="boxed" data-background="assets/images/creative_4.jpg">
        <form runat="server" method="post" role="form" id="frmnuevatarjeta">
		<!-- Top Bar -->
		<!--<header id="topHead">
			<div class="container">
				<span class="quick-contact pull-left">
					<i class="fa fa-phone"></i> (55) 3330 0090 sin costo de L.D. &bull; 
					<a class="hidden-xs" href="mailto:informes@asicompras.com">informes@asicompras.com</a>
				</span>
			</div>
		</header>-->
		<!-- /Top Bar -->

		<!-- TOP NAV -->
		<header id="topNav" class="topHead"><!-- remove class="topHead" if no topHead used! -->
			<div class="container">

				<!-- Mobile Menu Button -->
				<!--<button class="btn btn-mobile" data-toggle="collapse" data-target=".nav-main-collapse">
					<i class="fa fa-bars"></i>
				</button>-->

				<!-- Logo text or image -->
				<a class="logo" style="font-family:'Conv_cooperblack';" href="index.aspx">
					<img src="assets/images/ascompraspng1.png" alt="Así Compras" />
				</a>

			</div>
		</header>
		<!-- /TOP NAV -->
        <span id="header_shadow"></span>

		<!-- WRAPPER -->
<!------------------------------------------------------------------------------------------------------------>
        <div id="wrapper" style="background:rgba(0,0,0,0.2);">
            <section class="container top-no-header">
                <div class="row" id="containerForm">
                    <div class="col-md-9"><div class="white-row">
                        <h2><i class="fa fa-credit-card"></i> <strong>Nueva Tarjeta</strong></h2>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pais">
                                    Pais <span class="required">*</span>
                                </label>
                                <div id="divPais" class="col-md-6 col-sm-6 col-xs-12">
                                    <select id="pais" name="pais" required="required" class="selectpicker form-control col-md-7 col-xs-12">
                                    </select>
                                </div>
                                <div id="divEmisor" class="col-md-2 col-sm-2 col-xs-3">
                                    <select id="emisor" runat="server" name="emisor" disabled class="selectpicker form-control" enableviewstate="True">
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="numero" class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Numero de tarjeta <span class="required">*</span>
                                </label>
                                <div class="col-md-2 col-sm-2 col-xs-3">
                                    <asp:TextBox runat="server" id="txtNum1" name="txtNum1" class="form-control col-md-1 col-xs-3" required minlength="4" maxlength="4" type="number" />
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-3">
                                    <asp:TextBox runat="server" id="txtNum2" name="txtNum2" class="form-control col-md-1 col-xs-3" required minlength="4" maxlength="4" type="number" />
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-3">
                                    <asp:TextBox runat="server" id="txtNum3" name="txtNum3" class="form-control col-md-1 col-xs-3" required minlength="4" maxlength="4" type="number" />
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-3">
                                    <asp:TextBox runat="server" id="txtNum4" name="txtNum4" class="form-control col-md-1 col-xs-3" required minlength="3" maxlength="4" type="number" onchange="Cargando();" AutoPostBack="True" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="numero" class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Expiración y CVC <span class="required">*</span>
                                </label>
                                <div class="col-md-2">
                                    <input runat="server" id="mes" name="mes" placeholder="Mes" required maxlength="2" minlength="2" type="number" value="" class="form-control">
                                </div>
                                <div class="col-md-2">
                                    <input runat="server" id="anio" name="anio" placeholder="Año" required maxlength="2" minlength="2" type="number" value="" class="form-control">
                                </div>
                                <div class="col-md-2">
                                    <input runat="server" id="cvc" name="cvc" placeholder="CVC" required maxlength="4" minlength="4" type="number" value="" class="form-control">
                                </div>
                            </div>
                            <!------ Datos del Titular --------->
                            <div class="form-group">
                                <label for="titular" class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Titular <span class="required">*</span>
                                </label>
                                <div class="col-md-4 col-sm-4 col-xs-6">
                                    <input runat="server" id="nombre" name="nombre" placeholder="Nombre(s)" class="date-picker form-control col-md-12 col-xs-12" required="required" type="text">
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-6">
                                    <input runat="server" id="apellidos" name="apellidos" placeholder="Apellido(s)" class="date-picker form-control col-md-9 col-xs-12" required="required" type="text">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="titular" class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Domicilio <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input runat="server" id="domicilio" name="domicilio" placeholder="Calle y Número" class="date-picker form-control col-md-9 col-xs-12" required="required" type="text">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pais">
                                    Estado <span class="required">*</span>
                                </label>
                                <div id="divEdo" class="col-md-6 col-sm-6 col-xs-12">
                                    <select id="estado" name="estado" required="required" class="form-control col-md-7 col-xs-12">
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pais">
                                    Ciudad <span class="required">*</span>
                                </label>
                                <div id="divCiudad" class="col-md-6 col-sm-6 col-xs-12">
                                    <select id="ciudad" name="ciudad" required="required" class="form-control col-md-7 col-xs-12">
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="titular" class="control-label col-md-3 col-sm-3 col-xs-12">
                                    Código Postal <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input runat="server" id="codpostal" name="codpostal" placeholder="Cod. Postal" class="date-picker form-control col-md-9 col-xs-12" required="required" maxlength="5" minlength="5" type="number">
                                </div>
                            </div>   
                            <div class="form-group">
                                <hr class="margin-top10 margin-bottom10" /><!-- separator -->
                                <!--<a href="datosrecarga.aspx" class="btn btn-primary">Atrás</a>-->
                                <a href="index.aspx" id="btnCancelar" class="btn btn-default">Cancelar</a>
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button runat="server" id="btnGuardar" Text="Guardar" class="btn btn-primary" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="white-row">
								<p>Debe capturar los digitos de la tarjeta (16 Visa/Mastercard, 15 American Express), tal como aparecen en el anverso de la tarjeta</p>
                                <figure>
                                    <a class="img-thumbnail lightbox" href="assets/images/nuevat3.jpg" data-plugin-options='{"type":"image"}'>
                                    <img src="assets/images/nuevat3.jpg" class="img-responsive thumbnail zoom" alt="img" />
                                    </a>
                                </figure>
                                <p>Captura mes y año de expiracion, asi como el codigo de verificacion, el cual se localiza en la parte de atras en la mayoria de las tarjetas, excepto las American Express que esta por el frente</p>
								<figure>
                                    <a class="img-thumbnail lightbox" href="assets/images/nuevat4.jpg" data-plugin-options='{"type":"image"}'>
                                    <img src="assets/images/nuevat4.jpg" class="img-responsive" alt="img" />
                                        </a>
                                </figure>
                                <figure>
                                    <a class="img-thumbnail lightbox" href="assets/images/cvv.png" data-plugin-options='{"type":"image"}'>
                                    <img src="assets/images/cvv.png" class="img-responsive" alt="img" />
                                        </a>
                                </figure>
                                <p>Por ultimo captura el nombre del titular de la tarjeta y da click en el boton <strong>"Guardar"</strong></p>
								<figure>
                                    <a class="img-thumbnail lightbox" href="assets/images/nuevat5.jpg" data-plugin-options='{"type":"image"}'>
                                    <img src="assets/images/nuevat5.jpg" class="img-responsive" alt="img" />
                                        </a>
                                </figure>

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
          $(document).ready(function () {
              $("#btnGuardar").click(function () {

              });
          });

var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/57ec0e5081b5df649ae7d136/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();

            $('#pais').on('change', function () {
                $('#hidPais').val(this.value);
            });
            /*$('#emisor').on('change', function () {
                $('#hidEmisor').val(this.value);
            });*/
            $('#estado').on('change', function () {
                $('#hidEstado').val(this.value);
                $('#hidCiudad').val("0");
                var selcd = $("#ciudad");
                selcd.empty();
                var jsoncd = decodeHtml("<%: jsonCd %>");
                var arrcd = $.parseJSON(jsoncd);
                for (var i = 0; i < arrcd.length; i++) {
                    if (arrcd[i].idestado == this.value) {
                        if ($('#hidCiudad').val() == arrcd[i].idmunicipio)
                            selcd.append('<option selected value=\'' + arrcd[i].idmunicipio + '\'>' + arrcd[i].municipio + '</option>');
                        else
                            selcd.append('<option value=\'' + arrcd[i].idmunicipio + '\'>' + arrcd[i].municipio + '</option>');
                    }
                }
            });
            $('#ciudad').on('change', function () {
                $('#hidCiudad').val(this.value);
            });

            function SetEmisor(ide) {
                var selem = $("#emisor");
                selem.val(ide);
                selem.trigger("chosen:updated");
                selem.selectpicker('refresh');
            }

            function CargaCombos() {
                var selpa = $("#pais");
                selpa.empty();
                var jsonpa = decodeHtml("<%: jsonPa %>");
                var arrpa = $.parseJSON(jsonpa);
                for (var i = 0; i < arrpa.length; i++) {
                    if ($('#hidPais').val() == arrpa[i].idpais)
                        selpa.append('<option selected data-content="<img src=\'' + arrpa[i].img + '\' height=\'24\' />&nbsp;&nbsp;<span>' + arrpa[i].pais + '</span>" value=\'' + arrpa[i].idpais + '\'>' + arrpa[i].pais + '</option>');
                    else
                        selpa.append('<option data-content="<img src=\'' + arrpa[i].img + '\' height=\'24\' />&nbsp;&nbsp;<span>' + arrpa[i].pais + '</span>" value=\'' + arrpa[i].idpais + '\'>' + arrpa[i].pais + '</option>');
                }
                $('#hidPais').val("1"); //default

                var selem = $("#emisor");
                selem.empty();
                var jsonem = decodeHtml("<%: jsonEmi %>");
                var arrem = $.parseJSON(jsonem);
                for (var i = 0; i < arrem.length; i++) {
                    if (arrem[i].idemisor == "98") {
                        selem.append('<option selected data-content="<img src=\'' + arrem[i].img + '\' height=\'24\' /><span></span>" value=\'' + arrem[i].idemisor + '\'>' + arrem[i].emisor + '</option>');
                        selem.trigger("chosen:updated");
                        selem.selectpicker('refresh');
                    }
                    else
                        selem.append('<option data-content="<img src=\'' + arrem[i].img + '\' height=\'24\' /><span></span>" value=\'' + arrem[i].idemisor + '\'>' + arrem[i].emisor + '</option>');
                }

                var seled = $("#estado");
                seled.empty();
                var jsoned = decodeHtml("<%: jsonEdo %>");
                var arred = $.parseJSON(jsoned);
                for (var i = 0; i < arred.length; i++) {
                    if ($('#hidEstado').val() == arred[i].idestado) 
                        seled.append('<option selected value=\'' + arred[i].idestado + '\'>' + arred[i].estado + '</option>');
                    else
                        seled.append('<option value=\'' + arred[i].idestado + '\'>' + arred[i].estado + '</option>');
                }

                var selcd = $("#ciudad");
                selcd.empty();
                var jsoncd = decodeHtml("<%: jsonCd %>");
                var arrcd = $.parseJSON(jsoncd);
                for (var i = 0; i < arrcd.length; i++) {
                    if (arrcd[i].idestado.toString() == $('#hidEstado').val()) {
                        if ($('#hidCiudad').val() == arrcd[i].idmunicipio.toString())
                            selcd.append('<option selected value=\'' + arrcd[i].idmunicipio + '\'>' + arrcd[i].municipio + '</option>');
                        else
                            selcd.append('<option value=\'' + arrcd[i].idmunicipio + '\'>' + arrcd[i].municipio + '</option>');
                    }
                }
            }

            function decodeHtml(html) {
                var txt = document.createElement("textarea");
                txt.innerHTML = html;
                return txt.value;
            }
        </script>
        <script>
            if ($("#txtNum1").val().length > 0 && $("#txtNum2").val().length > 0 && $("#txtNum3").val().length > 0 && $("#txtNum4").val().length > 0)
                $("#mes").focus();
            else
                $("#txtNum1").focus();
            
            $("input").bind("input", function () {
                var $this = $(this);
                setTimeout(function () {
                    if ($this.val().length >= parseInt($this.attr("maxlength"), 10)) {
                        if ($this.attr('id') == 'txtNum1')
                            $("#txtNum2").focus();
                        if ($this.attr('id') == 'txtNum2')
                            $("#txtNum3").focus();
                        if ($this.attr('id') == 'txtNum3')
                            $("#txtNum4").focus();
                        if ($this.attr('id') == 'mes')
                            $("#anio").focus();
                        if ($this.attr('id') == 'anio')
                            $("#cvc").focus();
                    }
                }, 0);
            });

            //var formatted = new Formatter(document.getElementById('txtNum'), {
            //    'pattern': '{{9999}} {{9999}} {{9999}} {{9999}}',
            //    'persistent': false
            //});
        </script>
        <script>
            $('#frmnuevatarjeta').validate({
            rules: {
                txtNum1: {
                    required: true,
                    number: true,
                    maxlength: 4,
                    minlength: 4,
                },
                mes: {
                    number: true,
                    maxlength: 2,
                    minlength: 2,
                    required: true,
                },
                anio: {
                    number: true,
                    maxlength: 2,
                    minlength: 2,
                    required: true,
                },
                cvc: {
                    number: true,
                    maxlength: 4,
                    minlength: 3,
                    required: true,
                },
                nombre: {
                    required: true,
                },
                apellidos: {
                    required: true,
                },
                domicilio: {
                    required: true,
                },
                codpostal: {
                    number: true,
                    maxlength: 5,
                    minlength: 5,
                    required: true,
                },
                ciudad: {
                    required: true,
                },
                
            },
            messages: {
                txtNum: {
                    required: "El numero de tarjeta es obligatorio",
                    number: "Numero con caracteres no validos",
                    minlength: "16 a 19 digitos",
                    maxlength: "16 a 19 digitos",
                },
                mes: {
                    required: "El mes es obligatorio",
                    number: "Numero con caracteres no validos",
                    minlength: "2 digitos",
                    maxlength: "2 digitos",
                },
                anio: {
                    required: "El año es obligatorio",
                    number: "Numero con caracteres no validos",
                    minlength: "2 digitos",
                    maxlength: "2 digitos",
                },
                cvc: {
                    required: "El CVC es obligatorio",
                    number: "Numero con caracteres no validos",
                    minlength: "3 a 4 digitos",
                    maxlength: "3 a 4 digitos",
                },
                nombre: {
                    required: "El nombre es obligatorio",
                },
                apellidos: {
                    required: "Los apellidos son obligatorios",
                },
                domicilio: {
                    required: "Falta el domicilio",
                },
                codpostal: {
                    required: "Introduzca el CP.",
                    number: "Solo Numeros",
                    minlength: "5 digitos",
                    maxlength: "5 digitos",
                },
                ciudad: {
                    required: "Seleccione la Ciudad",
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