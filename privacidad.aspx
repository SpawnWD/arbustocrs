<%@ Page Language="C#" AutoEventWireup="true" CodeFile="template.aspx.cs" Inherits="MasTicket.template" %>
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
        </script>
	</head>
	<body class="boxed" data-background="assets/images/creative_4.jpg">
        <form runat="server" method="post" role="form">
		<!-- Top Bar -->
		

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
                    <div class="col-md-9" >
                        <div class="terminos"> 
<p align='justify'>AVISO DE PRIVACIDAD
</p>
<p align='justify'>Última fecha de actualización: 25 de enero de 2017</p>
<p align='justify'>Este aviso de privacidad forma parte del sitio www.asicompras.com. Sus datos personales serán tratados por Prepago RH S. de R.L. de C.V.(AsiCompras en lo sucesivo) ubicados en Av. Insurgentes Sur 544-602 Col. Roma, Delegación Cuauhtémoc, Distrito Federal, C.P. 06760. Nuestros teléfono: (55) 3330 0090.
</p>
<p align='justify'>Nuestro responsable de protección de datos es el Lic.Jorge Alonso Albarrán Razo y se ubica en el mismo domicilio, usted podrá contactarlo en el correo electrónico: contacto@asicompras.com
</p>
<p align='justify'>Este documento es parte integrante de los Términos y Condiciones. Mediante la aceptación de los Términos y Condiciones de registro, usted acepta las políticas aquí contenidas.
</p>
<p align='justify'>DATOS PERSONALES QUE SOLICITAMOS<br />
La información solicitada al usuario en la sección de Registro es: <br />
• Nombre <br />
• Dirección de correo electrónico <br />
• Número telefónico de contacto <br />
• Contraseña 
</p>
<p align='justify'>Utilizamos la información solicitada con las siguientes finalidades: <br />
	1. Para ofrecer nuestros servicios. AsiCompras utiliza información de los Usuarios para ayudarlos a procesar sus pedidos y emitir facturas, para ofrecer nuevos productos o servicios brindados por nuestros asociados y anunciantes, proveer atención al cliente, responder comentarios y consultas de los Usuarios, enviar notificaciones técnicas o actualizar los servicios.
</p>
<p align='justify'>	2. Para enviar mensajes del Sitio. De vez en cuando AsiCompras enviará información y mensajes a los Usuarios sobre los nuevos productos o servicios, con promociones u otros datos relacionados con el servicio, que AsiCompras considere relevante para los Usuarios.
</p>
<p align='justify'>	3. Para la solución de conflictos. AsiCompras puede revelar información del Usuario con el fin de cumplir con la ley y cuando AsiCompras, de buena fe, considere necesaria la divulgación de dicha información para investigar algún fraude, violación de la propiedad intelectual o cualquier otra actividad ilegal que pueda comprometer a AsiCompras o a sus Usuarios.
</p>
<p align='justify'>Es importante recalcar que la información deberá ser veraz y completa. El usuario o solicitante responderá en todo momento por la veracidad de los datos proporcionados y en ningún caso AsiCompras será responsable a este respecto.
</p>
<p align='justify'>LIMITACIÓN DE USO Y DIVULGACIÓN DE INFORMACIÓN<br />
En AsiCompras no utilizamos la información solicitada para fines distintos a los descritos en el párrafo anterior ni tampoco divulgamos sus datos personales a terceros.
En nuestro programa de notificación de promociones, ofertas y servicios a través de correo electrónico o mensajes a celular, sólo www.asicompras.com tiene acceso a la información recabada. Este tipo de publicidad se realiza mediante avisos y mensajes promocionales de correo electrónico o mensajes a celular, los cuales sólo serán enviados a usted y a aquellos contactos registrados para tal propósito, esta indicación podrá usted modificarla en cualquier momento enviando un correo a soporte@asicompras.com. En este tipo de publicidad, pueden incluirse ocasionalmente ofertas de terceras partes que sean nuestros socios comerciales
</p>
<p align='justify'>CONSENTIMIENTO<br />
Para la revocación del consentimiento deberá enviarnos un correo electrónico a soporte@asicompras.comempleando el mismo procedimiento descrito en el párrafo siguiente, correspondiente a los derechos de cancelación y oposición.
Por medio de esta cláusula, el usuario manifiesta su no negativa al consentimiento de las finalidades de tratamiento descritas con anterioridad.
</p>
<p align='justify'>DERECHOS ARCO (ACCESO, RECTIFICACIÓN, CANCELACIÓN Y OPOSICIÓN)<br />
El usuario puede acceder a los datos personales que ha proporcionado en su perfil de usuario, ingresándolo junto con su contraseña, asimismo podrá modificar su perfil por la misma vía. Para solicitar la cancelación de su expediente o la oposición al tratamiento de sus datos personales podrá enviarnos, en cualquier momento, un correo a soporte@asicompras.com .
Su petición deberá ir acompañada de los fundamentos por los que solicita ejercer los derechos especificados, precisando los datos personales en cuestión, enviándonos una identificación oficial del titular de los datos o de su apoderado. En un plazo máximo de 20 (veinte) días hábiles atenderemos su solicitud y le informaremos sobre la procedencia de la misma a través del correo electrónico del que provenga la petición.
AsiCompras solicita al usuario que actualice sus datos cada vez que éstos sufran alguna modificación, ya que esto permitirá brindarle un servicio eficiente y personalizado.

Si los Usuarios deciden cancelar su cuenta o se vuelven inactivos, toda la información se mantendrá desactivada en nuestro banco de datos. Guardamos esta información solamente de ser necesario para resolver controversias, solucionar problemas y cumplir con nuestras Cláusulas y Condiciones.
</p>
<p align='justify'>¿QUÉ SON LOS COOKIES Y CÓMO SE UTILIZAN?<br />
Los cookies son pequeñas piezas de información que son enviadas por el sitio Web a su navegador y se almacenan en el disco duro de su equipo y se utilizan para determinar sus preferencias cuando se conecta a los servicios de nuestros sitios, así como para rastrear determinados comportamientos o actividades llevadas a cabo por usted dentro de nuestros sitios.
En algunas secciones de nuestro sitio requerimos que el cliente tenga habilitados los cookies ya que algunas de las funcionalidades requieren de éstas para trabajar. La utilización de cookies no será utilizada para identificar a los usuarios, con excepción de los casos en que se investiguen posibles actividades fraudulentas.
El empleo de cookies no será utilizado para identificar a los usuarios, con excepción de los casos en que se investiguen posibles actividades fraudulentas. Si el usuario quisiera deshabilitar las cookies, deberá hacerlo directamente en su explorador de internet.
</p>
<p align='justify'>TRANSFERENCIAS DE INFORMACIÓN CON TERCEROS<br />
AsiCompras nunca venderá, alquilará, arrendará ni revelará su información a terceros en forma distinta de la publicada en esta política de privacidad.
Sin perjuicio de lo anterior, el Usuario reconoce que AsiCompras puede transferir la totalidad o parte de la información a cualquiera de sus subsidiarias y/o afiliadas en cualquier momento o de cualquier forma que considere apropiada.
En caso de una transición comercial, tal como una fusión, adquisición por parte de otra empresa, o venta de la totalidad o parte de los activos, su información probablemente estará entre los activos transferidos. Se le notificará por correo electrónico y / o por medio de un aviso destacado en nuestro Sitio durante 30 días, de cualquier cambio en la titularidad o en el control de su información.
</p>
<p align='justify'>INFORMACIÓN SOBRE PAGOS<br />
Al elegir la opción de tarjeta de crédito o débito para realizar un pago a través de nuestro Sitio, compartiremos su información de facturación con una empresa externa que procesa las tarjetas de crédito para facturarle los productos y servicios. Estas empresas no retienen, comparten, guardan ni utilizan información de identificación personal para ningún otro propósito.
Todos los métodos de pago ofrecidos recogerán los datos y la información de la tarjeta de crédito o débito del Usuario. Los datos se cifran y almacenan en servidores específicos. El Usuario reconoce y está de acuerdo con el almacenamiento de esta información.
</p>
<p align='justify'>CAMBIOS EN EL AVISO DE PRIVACIDAD<br />
Este aviso puede tener cambios en el futuro, de ser así se le avisará oportunamente en la sección de Aviso de Privacidad del sitio www.asicompras.com.
</p>
<p align='justify'>PROTECCIÓN DE LA INFORMACIÓN PERSONAL<br />
En el sitio web www.asicompras.com utilizamos un candado SSL (Secure Socket Layer) para cifrar la información registrada y que viaje segura durante su transmisión.
Le recomendamos que no revele su información personal, incluidos usuarios y contraseñas, a nadie. En todo momento, el usuario es el responsable único y final de mantener en secreto su sus datos personales.
</p>
<p align='justify'>ACEPTACIÓN DE LOS TÉRMINOS<br />
Esta declaración de Confidencialidad / Privacidad constituye un acuerdo legal entre el usuario y AsiCompras.
Si el usuario utiliza los servicios de este sitio web, significa que ha leído, entendido y consentido los términos antes expuestos.
Para resolver cualquier duda en este sentido y cualquiera referente a este aviso de privacidad, nos podrá contactar al correo soporte@asicompras.com
</p>
<p align='justify'>AUTORIDAD<br />
Si el usuario considera que han sido vulnerados sus derechos respecto de la protección de datos personales, tiene el derecho de acudir a la autoridad correspondiente para defender su ejercicio. La autoridad es el Instituto Nacional de Transparencia, Acceso a la Información y Protección de Datos Personales (INAI), su sitio web es:www.inai.org.mx.
</p>
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
					<p align='justify'><a class="toTop" href="#topNav">ARRIBA <i class="fa fa-arrow-circle-up"></i></a></p>
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