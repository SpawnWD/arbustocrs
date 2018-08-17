<%@ Page Language="C#" AutoEventWireup="true" CodeFile="datosrecarga.aspx.cs" Inherits="MasTicket.datosrecarga" %>
<!DOCTYPE html>
<!--[if IE 8]>			<html class="ie ie8"> <![endif]-->
<!--[if IE 9]>			<html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->	<html> <!--<![endif]-->
    <html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
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
        <!-- Top Bar -->
		<!--<header id="topHead">
		
			<div class="container">

				<div class="pull-right nav signin-dd">
					<a id="quick_sign_in" href="" data-toggle="dropdown"><i class="fa fa-users"></i>&nbsp;<asp:Label runat="server" ID="lblCtaNom"  CssClass="hidden-xs" Text="Ingresar" /></a>
					<div class="dropdown-menu" role="menu" aria-labelledby="quick_sign_in">
						<h4>Mi cuenta</h4><br />
						<p class="bottom-create-account">
					        <center><a href="#"><asp:Image Width="50" runat="server" ID="imgFoto" /></a></center>
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
                    <div class="col-md-9"><div class="white-row">
                    <h2><i class="fa fa-mobile"></i> <strong>Datos de la Recarga</strong></h2>
    
                <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pais">
                        País <span class="required">*</span>
                    </label>
                    <div id="divPais" class="col-md-6 col-sm-6 col-xs-12">
                        <select id="pais" name="pais" required="required" class="selectpicker form-control col-md-7 col-xs-12">
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="compania">
                        Compañía <span class="required">*</span>
                    </label>
                    <div id="divCompania" class="col-md-6 col-sm-6 col-xs-12">
                        <select id="compania" name="compania" required="required" data-size="7" class="selectpicker form-control col-md-7 col-xs-12">
                        </select>
                    </div>
                </div>  
                <div class="form-group">
                    <label for="numero" class="control-label col-md-3 col-sm-3 col-xs-12">
                    Número <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input runat="server" id="txtNumero" class="form-control col-md-7 col-xs-12" maxlength="10" minlength="10" type="number">
                    </div>
                </div>
                <!-- Se comento este combo
                <div class="form-group">
                    <label for="paquete" class="control-label col-md-3 col-sm-3 col-xs-12">
                        Monto <span class="required">*</span>
                    </label>
                    <div id="divPaquete" class="col-md-6 col-sm-6 col-xs-12">
                        <select id="paquete" name="paquete" required="required"   class="form-control col-md-7 col-xs-12">
                        </select>
                    </div>
                </div>
                -->
                <div class="form-group">
                    <label for="paquete" class="control-label col-md-3 col-sm-3 col-xs-12">
                        Monto <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">

                    <button type="button" class="btn btn-default form-control col-md-7 col-xs-12" style="text-align:left;padding-left:6px;" data-toggle="modal" data-target="#myModal" id="btnmontofin">
                      Seleccione monto
                    </button>

                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
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
                            <button type="button" class="btn btn-primary" data-dismiss="modal" id="btnModalSelec" >Guardar</button>
                          </div>
                        </div>   
                      </div>
                    </div>
                    </div>
                </div>

                <div class="form-group">
                    <hr class="margin-top10 margin-bottom10" /><!-- separator -->
                    <!--<a href="mediosdepago.aspx" class="btn btn-primary">Siguiente</a>-->
                    <asp:Button runat="server" id="btnMediosP" Text="Siguiente" class="btn btn-primary pull-right push-bottom" />
                    <!-- <a href="datosrecarga.aspx" class="btn btn-primary">Atrás</a> -->
                    <!-- <li class="active"><a class="dropdown-toggle" href="confirmacion.aspx"><i class="fa fa-share-square-o"></i> Siguiente</a></li> -->
                </div>

               </div></div>
                    <div class="col-md-3">
                        <div class="white-row">
                            <i class="fa fa-mobile"></i> <strong>Recargas Frecuentes</strong>
                            <span id="divFrec" runat="server">

                            </span>
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
							<a href="https://www.instagram.com/asicompras/" class="social rounded fa fa-google-plus"></a>
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
        <script async type="text/javascript" src="assets/plugins/HoldOn.min.js"></script>
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
            //$(function () {
            //    var valor = $("input[name=optradio]:checked").prop("value");
            //    alert(valor)
            //})

            $(document).ready(function () {
                $("#btnModalSelec").click(function () {
                    //alert($('input:radio[name=optradio]:checked').val());

                    var jsonpq = decodeHtml("<%: jsonPq %>");
                    var arrpq = $.parseJSON(jsonpq);
                    for (var i = 0; i < arrpq.length; i++) {
                        if (arrpq[i].idpaquete == $('input:radio[name=optradio]:checked').val()) {
                            $("#btnmontofin").text('$' + arrpq[i].monto + '.00  (' + arrpq[i].paquete + ')' );
                            $("#idpaquetew").val( arrpq[i].idpaquete);
                            //alert($("#idpaquetew").val());
                            //if (arrpq[i].tipo == 0)
                                //selpq.append('<label><input type="radio" name="optradio" value=\'' + arrpq[i].idpaquete + '\'><strong> $' + arrpq[i].monto + ' .00  ' + arrpq[i].paquete + '</strong></label><br/>');
                            //selpq.append('<option value=\'' + arrpq[i].idpaquete + '\'>' + arrpq[i].monto + '</option>');
                        }
                    }

                    //$("#formulario").submit();
                });
            });

        </script>

        <script>
            $(document).ready(function () {
                $('#pais').on('change', function () {
                    $('#hidPais').val(this.value);
                });
                $('#compania').on('change', function () {
                    $('#hidCompania').val(this.value);
                    $('#idpaquetew').val("0");
                    //selpq.append('<option selected value=\'0\'>Seleccione monto</option>');
                    //for (var i = 0; i < arrpq.length; i++) {
                    //    if (arrpq[i].idoperadora == this.value) {

                    //        selpq.append('<option value=\'' + arrpq[i].idpaquete + '\'>' + arrpq[i].monto + '</option>');
                    //    }
                    //}
                    $("#btnmontofin").text("Seleccione monto");
                    PaquetesEnPopUp(this.value);

                    //selpq.trigger("chosen:updated");
                    //$('.selectpicker').selectpicker('refresh');
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
                selop.append('<option selected value=\'0\'>Seleccione compañia</option>');
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
                $("#compania").trigger("chosen:updated");
                $('.selectpicker').selectpicker('refresh');
                PaquetesEnPopUp(ido);
            }
        </script>
        <script>
            $('#frmDatos').validate({
                rules: {
                    pais:{
                        required: true,
                    },
                    compania:{
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
                        required: "El país es obligatorio",
                    },
                    compania: {
                        required: "La compañía es obligatoria",
                    },
                    txtNumero: {
                        required: "El número de télefono es obligatorio",
                        number: "Número con caracteres no válidos",
                        minlength: "Número de 10 digitos",
                        maxlength: "Número de 10 digitos",
                    },
                    paquete: {
                        required: "El monto es obligatorio",  
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

    <asp:HiddenField ID="idpaquetew" runat="server" Value="0"  />
    <asp:HiddenField runat="server" id="hidPais" Value="0" />
    <asp:HiddenField runat="server" id="hidCompania" Value="0" />
    <asp:HiddenField runat="server" id="hidPaquete" Value="0" />
    <asp:Label runat="server" id="spnJS" Text=""></asp:Label>
    </form>

	</body>
</html>