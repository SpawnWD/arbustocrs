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
                               <p>Términos y condiciones</p>
<p>Términos y condiciones de uso, actualizado el 8 de febrero de 2017.</p>

                            <p align="justify">Este documento contiene los Términos y Condiciones de Uso que debe regir el acceso a la aplicación “ASÍ COMPRAS” accesible a través de: (i) los sitios web (los “Sitios”) www.asicompras.com (la “Aplicación Web”), o bien (ii) las tiendas de Google Play Store, Mac App Store y Windows Store (la “Aplicación Móvil”, y junto con la Aplicación Web, la “Aplicación”) que es responsabilidad de PREPAGO RH S. DE R.L. DE C.V. con sede en la Avenida Insurgentes Sur 544-602, México D.F. 06760 (“Asícompras”), y todos los productos o Servicios disponibles o accesibles a través de la misma. El uso de la Aplicación, que incluye los Servicios prestados a través de la Aplicación, está sujeto a los términos que figuran en el presente y a las condiciones complementarias y subsidiarias determinadas por la empresa ASICOMPRAS e informadas a los Usuarios a través de la Aplicación y/o los canales de comunicación establecidos por la empresa, debiendo también respetarse todas las demás leyes o reglamentaciones nacionales o internacionales aplicables y la política de privacidad. Se considerará que cualquier Usuario que acceda a la Aplicación, en forma ocasional o frecuente, o utilice alguno de los Servicios prestados a través de la Aplicación, expresa la aceptación o está de acuerdo con estos Términos y Condiciones. Por ese motivo, todos los Usuarios deben leer estos Términos y Condiciones de Uso atentamente antes de utilizar la Aplicación. Además de estos Términos y Condiciones de Uso, cada producto o servicio puede regirse por los términos y condiciones particulares, a los que estarán sujetas todas las personas que utilicen estos Servicios o adquieran algún producto. Los documentos citados pueden complementar, modificar o eliminar parte de las cláusulas aquí contenidas, y deben prevalecer sobre estos Términos y Condiciones de Uso. </p>

                            <p align="justify">Recomendamos la lectura de los términos y condiciones particulares. Es una parte integral de los presentes Términos y Condiciones de Uso, la Política de Privacidad disponible en www.asicompras.com/terminos así como todas las páginas y enlaces disponibles en la Aplicación que contienen información que genera derechos y/u obligaciones para los Usuarios y anunciantes. </p>

                            <p align="justify">01. Condición de Usuario a) Información personal Para la obtener la calidad de Usuario basta la sola aceptación de los Términos y Condiciones de Uso y los términos y condiciones particulares establecidas o que pueda establecer en un futuro ASICOMPRAS. Sin embargo, antes de utilizar ciertos Servicios o adquirir ciertos productos podrá establecerse como requisito el previo registro del Usuario. El registro al que se hace referencia tiene como objetivo identificar al Usuario y recopilar la información de contacto necesaria. En relación al registro, la información suministrada por los Usuarios deberá ser fidedigna, y tendrá el carácter de declaración jurada. Cuando la información suministrada por el Usuario sea inexacta o incorrecta, se considerará que dicho Usuario ha dejado de cumplir con estos Términos y Condiciones de Uso, y será responsable por todos los daños ocasionados a ASICOMPRAS o terceros como consecuencia de dicha información falsa. Además, la información proporcionada puede ser usada contra el Usuario que haya actuado de mala fe. Una vez registrado el Usuario dispondrá de un nombre de Usuario y contraseña que le permitirá el acceso personalizado, confidencial y seguro a su cuenta personal dentro de la Aplicación. Los Servicios que requieren registro han sido desarrollados exclusivamente para uso personal del Usuario; por lo tanto, el nombre de Usuario y la contraseña suministrado por ASICOMPRAS sólo debe ser utilizado por el Usuario, y el uso por parte de cualquier otra persona que no sea el Usuario está estrictamente prohibido. El Usuario registrado tiene la obligación de guardar y proteger el nombre de Usuario y contraseña y de informar inmediatamente a ASICOMPRAS en caso de pérdida de la confidencialidad. El Usuario también tiene la obligación de actualizar la información personal asentada en los registros, según sea necesario, y de notificar a ASICOMPRAS cada vez que haya un cambio en relación con la información mencionada. ASICOMPRAS se reserva el derecho de solicitar cualquier comprobante y/o información adicional a efectos de corroborar los datos personales, así como el derecho de suspender temporal o definitivamente las cuentas de los Usuarios cuya información aún no haya podido ser confirmada.</p>

                            <p align="justify">Los Usuarios son responsables de todas las transacciones realizadas a través de sus cuentas personales y deben notificar inmediatamente a ASICOMPRAS, según corresponda, cualquier uso no autorizado de sus cuentas o del ingreso por terceros no autorizados a las mismas. ASICOMPRAS se reserva el derecho de solicitar información adicional con el objeto de verificar los datos personales de los Usuarios, como también el derecho de suspender temporalmente a los Usuarios cuyos datos no pueda confirmarse. ASICOMPRAS está autorizada a rechazar cualquier solicitud de registro o cancelar cualquier registro previamente aceptado, sin necesidad de comunicar el motivo para hacerlo, y sin conferir ningún derecho al Usuario. De acuerdo con la Política de Privacidad adoptada por ASICOMPRAS, toda la información personal proporcionada por los Usuarios debe ser almacenada y tratada adecuadamente en todo momento, garantizando la privacidad.
b) Capacidad Legal de los Usuarios Solo aquellas personas que, de conformidad con las leyes vigentes en su país de residencia, puedan dar su consentimiento para celebrar un contrato de manera válida podrán acceder y utilizar los Servicios ofrecidos por ASICOMPRAS. Las personas que de acuerdo con las leyes vigentes no posean dicha capacidad legal solo podrán utilizar la Aplicación a través de su representante legal, quien será responsable de todos los actos realizados. Cuando la falta de capacidad se deba a la minoría de edad, dicha incapacidad no podrá ser remediada. El acceso a la Aplicación por un menor de edad está estrictamente prohibido, a menos que las leyes del lugar de residencia del menor establezcan lo contrario. En este caso, los adultos responsables por el menor serán totalmente responsables de los Servicios a los que el menor tenga acceso. Por lo tanto, los menores que acceden a la Aplicación deben obtener previamente permiso de sus padres, tutores o representantes legales, siempre que dicho acceso esté permitido por ley. Con respecto a representantes legales de personas jurídicas, los Usuarios deben contar con la facultad suficiente para actuar en nombre de la entidad representada y obligar a la entidad en los términos del presente. Si el Usuario no contara con tales facultades, o actuara fuera del alcance de sus facultades, el Usuario será personalmente responsable. 
</p>

                            <p align="justify">02. Servicios ofrecidos por ASICOMPRAS a) Servicio Principal A través de la Aplicación, los Usuarios podrán realizar recargas de crédito para sus celulares (el “Servicio Principal”). b) Servicios Adicionales Asimismo, la Aplicación, tanto en su versión “Web” como “Móvil”, ofrece a los Usuarios diferentes servicios adicionales, en virtud de los cuales los Usuarios podrán acceder a mayores beneficios en caso de optar por su suscripción (los “Servicios Adicionales” y en forma conjunta con el Servicio Principal, los “Servicios”). En todos los casos, la Aplicación indicará los costos de suscripción mensual a los Servicios Adicionales, siendo de aplicación la modalidad de pago prevista en estos Términos y Condiciones de Uso. Los principales Servicios Adicionales ofrecidos a los Usuarios a través de la Aplicación son los siguientes: (i) Servicio “Recarga Automática” Mediante el pago de una suscripción mensual, el Usuario quedará habilitado para efectuar recargas automáticas, que se acreditarán una vez al mes, por el mismo valor de la recarga inicial efectuada por el Usuario al suscribirse al servicio. Al respecto, se deja expresa constancia de que el Usuario podrá darse de baja de este servicio en cualquier momento, mediante el procedimiento previsto en la Aplicación. A tales fines, se aclara que para desuscribirse al servicio “Recarga Automática” no será suficiente la desinstalación de la Aplicación, sino que el Usuario deberá dar de baja el servicio en forma manual a través de los Sitios, según corresponda. A todo evento, se deja expresa constancia de que, en algunos casos, el valor de la recarga será depositado en la cartera virtual del Usuario disponible a través de la Aplicación, a efectos de que el Usuario disponga de esos fondos para realizar recargas. Se comunica a los Usuarios que ASICOMPRAS podrá, a su exclusivo criterio, considerar expirado cualquier crédito que se mantenga en la cartera virtual y que no hubiera sido utilizado por el Usuario en el plazo de 90 días contado desde la acreditación de los valores en dicha cartera.</p>

                            <p align="justify">03. Modalidad de pago A menos que se especifique de otro modo en casos especiales u ofertas relacionadas con determinados productos o Servicios, los productos y Servicios ofrecidos a través de la Aplicación deben ser abonados mediante: 1. Tarjeta de Crédito o Débito: El uso de tarjetas debe estar sujeto a estos Términos y Condiciones de Uso y a los términos establecidos en el contrato de apertura de cuenta celebrado entre el Usuario y el emisor. En este sentido, las particularidades relacionadas con las tarjetas de crédito o débito, que incluyen la fecha de emisión, vencimiento, límite, bloqueo, etc. deben regirse por el contrato pertinente de apertura de cuenta y ASICOMPRAS no será responsable de dichas particularidades. 2. Monedero: ASICOMPRAS cuenta con una modalidad denominada monedero virtual que funciona como una billetera electrónica y es el lugar donde recibe créditos ganados por el programa de referidos o bien promociones especiales diseñadas para tal efecto. Solicitamos que consulte el artículo - 05 de la Política de privacidad de ASICOMPRAS, Información sobre pagos, que orienta y establece cuáles serán los procedimientos para almacenar la información de la tarjeta de crédito del Usuario. La selección de la modalidad de pago es decisión exclusiva del comprador. ASICOMPRAS no tiene control ni inherencia sobre la forma en que los operadores de los medios de pagos antes mencionados ejecutan sus transacciones. Los Usuarios reconocen y acuerdan que utilizan los medios de pago citados anteriormente, por su propia cuenta y riesgo y que deben cumplir en todo momento con los términos de uso, reglamentaciones y contratos mediante los cuales se comprometen a usar un determinado medio de pago. ASICOMPRAS no será responsable por ninguna acción originada de las actividades del operador de los medios de pago, que incluyen, entre otros, el rechazo del pago, cierre o limitación de la cuenta, error en el importe de montos debitados, errores debidos a fallas en el sistema de los operadores, falta en la acreditación de una cantidad adeudada a ASICOMPRAS, etc. Además, los Usuarios reconocen que su obligación de pago de los Servicios o productos adquiridos a través de la Aplicación, no se extinguirá hasta tanto se acrediten los fondos correspondientes en la cuenta de ASICOMPRAS.
 ASICOMPRAS se reserva el derecho de presentar determinadas condiciones de compra dependiendo del medio de pago seleccionada por el Usuario. 
</p>

                            <p align="justify">04. Contrato a través de la Aplicación Por intermedio de ASICOMPRAS, los proveedores ofrecen productos y/o Servicios que pueden ser aceptados mediante “aceptación por vía electrónica” al utilizar los métodos provistos a través de la Aplicación. Siempre que los Usuarios cumplan con todos los pasos necesarios para adquirir una recarga o cualquier producto o servicio, debe considerarse que los Usuarios han dado su consentimiento y han celebrado un acuerdo con ASICOMPRAS y con el proveedor de la recarga o del servicio. Más precisamente, se tendrá por expresado su consentimiento en el momento de que el Usuario presione “Confirmar Compra”, o su equivalente, conforme sea indicado en la Aplicación. Una vez aceptada la oferta, el Usuario no puede deshacerla, excepto en circunstancias excepcionales. Todas las adquisiciones realizadas por los Usuarios estarán condicionadas a la obtención de la aprobación de la transacción por parte de los operadores de pago seleccionados por los Usuarios. 
Una vez que la transacción es aprobada, ASICOMPRAS debe enviar la información de la recarga adquirida. En caso que se rechace la transacción, se deberá proceder a realizar una nueva transacción. 
</p>

                            <p align="justify">05. Plazo de la oferta y precio Los precios de los productos y Servicios disponibles a través de la Aplicación, desde que aparecen en el listado de la Aplicación, solamente serán considerados válidos y relacionados con dicha Aplicación, y no podrán aplicarse a otros canales de venta utilizados por los proveedores, como puntos de venta, adquisiciones de teléfonos, catálogos, u otros. Los proveedores pueden cambiar cualquier información en la Aplicación, incluyendo, entre otros, aquellas relacionadas con los productos, servicios, precios, existencias y condiciones, en cualquier momento y sin previo aviso, hasta que reciban una confirmación de pago, relacionada con dichos proveedores, sujeta a las condiciones de aprobación de la transacción. ASICOMPRAS se reserva el derecho de modificar los precios de los productos y Servicios publicados en la Aplicación sin previo aviso, así como modificar los términos y condiciones para la adquisición de productos y Servicios ofrecidos a través de la Aplicación. </p>

                            <p align="justify">06. Uso de la información presentada a través de la Aplicación Como se dispone más adelante en la Política de Privacidad, la información personal del Usuario mencionada en estos Términos y Condiciones de Uso debe tener como objetivo confirmar las órdenes de pago y mejorar la publicidad e información de los productos y Servicios ofrecidos. En ninguna circunstancia, ASICOMPRAS divulgará o compartirá información financiera de los Usuarios. ASICOMPRAS no venderá, alquilará, arrendará ni divulgará la información personal de los Usuarios a ningún tercero de otras maneras que no sean las publicadas en la Política de Privacidad. </p>

                            <p align="justify">07. Violación del sistema o base de datos El Usuario no debe tomar ninguna medida ni utilizar ningún dispositivo, software, o rutina que interfiera en las actividades y operaciones de ASICOMPRAS, así como en sus ofertas, informaciones, cuentas o bases de datos o que viole alguna de las restricciones de la Sección 5 anterior, limitando todas las compras realizadas a través de la Aplicación para uso estrictamente personal. Cualquier intromisión, intento de interferencia o violación de las leyes de propiedad intelectual o de las prohibiciones incluidas en el presente y/o amenaza a la seguridad de los sistemas hará responsable a quien lo realice, de cualquier reclamo pertinente y pasible de las sanciones aquí establecidas. </p>

                            <p align="justify">08. Propiedad Intelectual Los contenidos de las páginas web relacionados con los Servicios ofrecidos por ASICOMPRAS, así como todas las informaciones, marcas registradas, nombres comerciales, designaciones, datos, textos, gráficos, imágenes, diseños, fotografías, audio, videos, logotipos, íconos, programas, bases de datos y archivos son propiedad de ASICOMPRAS o de sus proveedores y se encuentran protegidos por las leyes y tratados internacionales con relación a los derechos de autor, marcas registradas, patentes, modelos y proyectos industriales (Tratado del Convenio de París, Convenio de Berna, Tratado de Derechos de Autor WIPO, acuerdo TRIPS, etc.) La utilización o reproducción no autorizada de estos contenidos sin la expresa autorización escrita de ASICOMPRAS está estrictamente prohibida. La utilización de esta Aplicación no garantiza ningún derecho expreso o implícito ni concesión de licencias de los derechos de propiedad intelectual de ASICOMPRAS o de terceros. ASICOMPRAS se reserva todos los derechos de propiedad intelectual u otros derechos de la Aplicación. La copia, distribución, almacenamiento, administración o disposición de la Aplicación están estrictamente prohibidos. </p>

                            <p align="justify">09. Enlaces o Hipervínculos 1. Enlaces o hipervínculos direccionados a la Aplicación: La inclusión de cualquier “hipervínculo” o enlace en una página web ajena a la Aplicación, direccionado para cualquier página web de la Aplicación, debe ser realizada solamente con el consentimiento expreso de ASICOMPRAS. En ningún caso se debe considerar a ASICOMPRAS como responsable de los contenidos o informaciones de las páginas web que contengan enlaces a la Aplicación. El hecho de que una página web ofrezca un hipervínculo a la Aplicación no implica que ASICOMPRAS tenga conocimiento de dicha información o que ASICOMPRAS esté relacionada con los propietarios de la página web desde donde se establece el enlace.</p>

                            <p align="justify">ASICOMPRAS se reserva el derecho de solicitar la remoción de cualquier enlace desde una página web ajena a la Aplicación, en cualquier momento, sin motivo o previo aviso. La persona responsable de la página web desde la cual se efectúa el enlace direccionado a la Aplicación tendrá un plazo de 48 horas a partir del pedido de remoción por parte de ASICOMPRAS para proceder a la remoción del enlace. 2. Enlaces o Hipervínculos en la Aplicación: Los Hipervínculos o enlaces existentes en la Aplicación, direccionados a páginas web de terceros, tienen como objeto mejorar la experiencia de navegación del Usuario en la Aplicación y ofrecerle herramientas, contenidos o Servicios brindados por terceros que no tengan relación con ASICOMPRAS. </p>

                            <p align="justify">ASICOMPRAS no controla, respalda ni garantiza la seguridad, calidad, licitud, veracidad o precisión de los Servicios y contenidos ofrecidos o prestados por terceros en la Aplicación o a través de éste, cuando no estén incluidos en la Aplicación. Además, ASICOMPRAS no será responsable de los daños sufridos por Usuarios que adquieran productos de terceros o utilicen Servicios de terceros. El acceso o utilización de las páginas web que contengan algún enlace a la Aplicación será de responsabilidad exclusiva del Usuario, quien debe tomar todas las medidas de precaución necesarias dependiendo del tipo de servicio, contenido al que acceda o producto adquirido. Cualquier Usuario que quisiera denunciar como impropia una página web que contenga un enlace en la Aplicación, podrá hacerlo, a través del mecanismo de denuncia que se encuentra a disposición del Usuario en la Aplicación.</p>

                            <p align="justify">10. Edición y Actualización de los Datos de Cancelación de la cuenta. Baja de Servicios. LOS USUARIOS TIENEN DERECHO A ACCEDER A SU CUENTA, A EDITAR SU INFORMACIÓN Y A CANCELAR SU CUENTA, ENVIANDO UN CORREO ELECTRÓNICO A contacto@asicompras.com. AL CONTACTARNOS POR FAVOR MENCIONE SU NOMBRE, TELÉFONO Y DIRECCIÓN DE CORREO ELECTRÓNICO Y LA INFORMACIÓN QUE LE GUSTARÍA ACTUALIZAR. ASIMISMO, LOS USUARIOS PODRÁN DAR DE BAJA SERVICIOS ADICIONALES A LOS QUE SE ENCUENTREN SUSCRIPTOS MEDIANTE LOS PROCEDIMIENTOS DE BAJA PREVISTOS PARA CADA CASO EN PARTICULAR. </p>

                            <p align="justify">11. Sanciones. Suspensión de la cuenta Sin perjuicio de cualquier otra medida que se considere adecuada, ASICOMPRAS se considera en el derecho de suspender la cuenta del Usuario temporaria o permanentemente, en caso de que: 1. Infrinjan la ley, los derechos de terceros, las políticas públicas, la moral y las buenas costumbres, o cualquier disposición contenida en los Términos y Condiciones de Uso, la Política de Privacidad o que viole cualquier otra disposición de la Aplicación. 2. No cumplan con los compromisos asumidos. 3. A criterio de ASICOMPRAS, se considere que han actuado en forma fraudulenta o de mala fe. 4. Su identidad no pueda ser comprobada o alguna información brindada por ellos sea errónea. En caso de una cuenta de un Usuario que esté temporalmente suspendida o permanentemente cancelada, todos los productos adquiridos u ofertas realizadas deben ser removidos del sistema, y dicho Usuario no tendrá derecho a realizar ningún reclamo. 12. Funcionamiento de la Aplicación Usted reconoce que el acceso y utilización continua e ininterrumpida de la Aplicación no están garantizados. El sistema puede eventualmente ser suspendido debido a dificultades técnicas, problemas de conexión o cualquier otra razón ajena a ASICOMPRAS. En ningún caso, ASICOMPRAS será responsable por el funcionamiento, eficiencia o seguridad de los Servicios de telecomunicaciones provistos por terceros y disponibles para los Usuarios. ASICOMPRAS no garantiza la precisión de las informaciones y datos contenidos en la Aplicación y no será responsable de ninguna forma por cualquier error u omisión en la Aplicación. Hasta el límite permitido por ley, los Servicios, contenidos en la Aplicación serán ofrecidos tal como se encuentran, sin garantías de ningún tipo, sean implícitas o explícitas, lo que incluye, entre otras, las garantías implícitas de comercialización, adecuación por algún motivo especial o la no violación de derechos. Hasta el límite permitido por ley, ASICOMPRAS niega cualquier culpa o responsabilidad por la precisión, confiabilidad, disponibilidad, integridad, legalidad o funcionalidad de la Aplicación. Al utilizar esta Aplicación o los Servicios, usted reconoce que ASICOMPRAS no será responsable ni culpable de cualquier daño que resulte de (1) la utilización de la Aplicación o de los Servicios; (2) el acceso o la utilización de la información contenida en la Aplicación o los Servicios; y (3) la incapacidad temporaria o permanente de acceso o recuperación de algún servicio o contenido del Usuario en la Aplicación o los Servicios, lo que incluye, entre otros, los daños ocasionados por virus, gusanos, troyanos o cualquier contaminación similar o programa destructivo. En ningún caso, ASICOMPRAS será responsable con relación a la Aplicación o a los Servicios por (1) cualquier daño directo, indirecto, incidental, punitivo o consecuente de cualquier naturaleza; (2) daños por pérdida de uso, de beneficios, datos, imágenes o contenidos del Usuario u otros elementos intangibles; o (3) daños por utilización no autorizada, incumplimiento de la Aplicación, errores u omisiones. ASICOMPRAS se reserva el derecho de hacer cualquier modificación a la Aplicación que considere necesaria, para remover, modificar, editar o limitar el alcance y funcionalidad de la Aplicación, a fin de mejorar la calidad y prestaciones de la Aplicación. El trabajo de mantenimiento puede limitar y/o interrumpir parcialmente la utilización de la Aplicación y, en determinadas circunstancias, provocar la pérdida de datos. Por lo tanto, ASICOMPRAS no garantiza la disponibilidad del servicio o que no haya inconvenientes técnicos ni se pierdan datos. 13. Indemnización El Usuario defenderá y mantendrá indemne a ASICOMPRAS, así como también a sus funcionarios, directores, empleados, representantes, subsidiarias, clientes, socios, proveedores y afiliadas (las “Partes Indemnizadas), con relación a toda responsabilidad, costo o resolución, que incluye, entre otros, los honorarios legales, en los que incurran las Partes Indemnizadas, en relación con cualquier acción tomada para reparar alguna violación de estos Términos y Condiciones de Uso, ocasionada por el Usuario o por algún tercero con cuenta atribuida al Usuario, esté dicho Usuario autorizado o no. 14. Tarifas y Facturación La descarga de la Aplicación, y el registro a través de la misma, es gratis. Siempre que los Usuarios adquieran un producto o servicio, deben abonar el precio indicado en la Aplicación. ASICOMPRAS se reserva el derecho de modificar, alterar, adaptar o cancelar las tarifas vigentes en cualquier momento mediante la publicación de dichas modificaciones en la Aplicación. Además, ASICOMPRAS y los proveedores tienen el derecho a modificar temporariamente la política de tarifas y/o de tarifas promocionales. Las modificaciones entrarán en vigencia inmediatamente al ser publicadas en la Aplicación y deberán permanecer vigentes hasta su posterior modificación. 15. Notificaciones Cualquier notificación o comunicación requerida o permitida por estos Términos y Condiciones de Uso debe realizarse por escrito al Usuario a la dirección o correo electrónico suministrado directamente por el Usuario en el formulario de registro. Todas las comunicaciones que consistan en notificaciones o mensajes publicados en la Aplicación o enviados durante el curso del servicio, que tengan como objetivo informar a los Usuarios sobre determinadas cuestiones, también deben ser considerados como que han sido válidamente entregados y recibidos. 16. Promociones a) Códigos Promocionales ASICOMPRAS podrá, a su sola discreción, crear códigos promocionales que podrán ser canjeados por crédito para recargas u otros elementos o beneficios relacionados con los Servicios, con sujeción a cualquier condición adicional que ASICOMPRAS establezca sobre la base de cada código promocional (“Códigos Promocionales”). El Usuario acuerda que los Códigos Promocionales: (i) deben usarse para la audiencia y el propósito deseado, y de manera lícita; (ii) no podrán duplicarse, venderse o transferirse de ninguna manera ni hacerlos públicos en plataformas de distribución digital incluyendo sin que implique limitación “Google Play Store”, “Mac App Store” o “Windows Store”, a menos que sea con el permiso de ASICOMPRAS; (iii) podrán ser invalidados por ASICOMPRAS en cualquier momento por cualquier motivo sin responsabilidad para ASICOMPRAS; (iv) podrán usarse solo conforme a las condiciones específicas que ASICOMPRAS establezca para dicho Código Promocional; (v) no son válidos como efectivo; y (vi) podrán caducar antes de que el Usuario los utilice. ASICOMPRAS se reserva el derecho de retener o deducir el crédito u otros elementos o beneficios obtenidos a través de la utilización de los Códigos Promocionales por el Usuario o cualquier otro usuario en el caso de que ASICOMPRAS determine o crea que el uso o el canje de los Códigos Promocionales fue de modo erróneo, fraudulento, ilegal o infringiendo las condiciones del Código Promocional o los presentes Términos y Condiciones de Uso. </p>

                            <p align="justify">b) Otras promociones ASICOMPRAS se reserva el derecho, a su sola discreción, de realizar cualquier tipo de acción tendiente a promocionar los productos y Servicios disponibles a través de la Aplicación, pudiendo regular las condiciones para el acceso a los premios que se otorguen, según sea el caso. A todo evento, el criterio utilizado por ASICOMPRAS para la determinación del acceso a estas acciones y los premios otorgados no podrá ser en ningún caso arbitrario, y deberá respetar condiciones de razonabilidad. ASICOMPRAS podrá disponer de términos y condiciones particulares para regular el acceso a estas acciones y los premios otorgados.</p>

                            <p align="justify">c) Contenido proporcionado por el Usuario ASICOMPRAS podrá, a su sola discreción, permitirle al Usuario que envíe, cargue, publique a través de portales u otros sitios, contenido e información de texto, audio y/o visual, incluidos comentarios y opiniones relativos a los Servicios, así como presentación de admisiones para promociones (“Contenido de Usuario”). Todo Contenido de Usuario facilitado por el Usuario seguirá siendo de su propiedad. No obstante, al generar Contenido de Usuario, el Usuario otorga a favor de ASICOMPRAS una licencia mundial, perpetua, irrevocable, transferible, libre de regalías, con derecho a sublicenciar, usar, copiar, modificar, crear obras derivadas, distribuir, exhibir públicamente, presentar públicamente o de otro modo explotar de cualquier manera dicho Contenido de Usuario en todos los formatos y canales de distribución, conocidos ahora o ideados en un futuro (incluidos en relación con los Servicios y el negocio de ASICOMPRAS y en sitios y Servicios de terceros), sin más aviso o consentimiento del Usuario y sin requerirse el pago al Usuario o a cualquier otra persona o entidad. El Usuario declara y garantiza que: (i) es el único y exclusivo propietario de todo el Contenido de Usuario o que tiene todos los derechos, licencias, consentimientos y permisos necesarios para otorgar a ASICOMPRAS la licencia al Contenido de Usuario como establecido anteriormente; y (ii) ni el Contenido de Usuario ni su presentación, carga, publicación o puesta a disposición de otro modo de dicho Contenido de Usuario, ni el uso por parte de ASICOMPRAS del Contenido de Usuario como está aquí permitido, infringirán, malversarán o violarán la propiedad intelectual o los derechos de propiedad de un tercero o los derechos de publicidad o privacidad o resultarán en la violación de cualquier ley o reglamento aplicable. El Usuario acuerda no proporcionar Contenido de Usuario que sea difamatorio, calumnioso, odioso, violento, obsceno, pornográfico, ilícito o de otro modo ofensivo, como determine ASICOMPRAS, a su sola discreción, tanto si dicho material pueda estar protegido o no por la ley. ASICOMPRAS podrá, a su sola discreción y en cualquier momento y por cualquier motivo, sin avisarle previamente, revisar, controlar o eliminar Contenido de Usuario, pero sin estar obligada a ello.</p>

                            <p align="justify">17. Jurisdicción y legislación vigente Estos Términos y Condiciones de Uso y la relación entre ASICOMPRAS y el Usuario se regirán por las leyes de los Estados Unidos Mexicanos. Las Partes eligen los tribunales de la capital del Distrito Federal como única jurisdicción para dirimir cualquier litigio y/o demanda que pueda involucrar a las partes en relación con los Servicios. </p>

                            <p align="justify">18. Cambios y/o Modificaciones ASICOMPRAS podrá realizar cambios y modificaciones a estos Términos y Condiciones de Uso, según lo considere conveniente y a su criterio, en cualquier momento y sin previo aviso, simplemente publicando las modificaciones a través de la Aplicación. Todas las modificaciones entrarán en vigencia al día siguiente de aquel en que fueron publicadas. El Usuario debe notificar a ASICOMPRAS por correo electrónico su rechazo a las modificaciones en un plazo de 5 (cinco) días a partir de la publicación. De lo contrario, se considerará que el Usuario ha aceptado dichas modificaciones.</p>

                            <p align="justify">19. Disposiciones generales La incapacidad o negligencia respecto del cumplimiento de alguna disposición de estos Términos y Condiciones de Uso no constituirá una renuncia a dichos derechos o disposición, cuyo cumplimiento podría exigirse en cualquier momento. Cuando alguna disposición de estos Términos y Condiciones de Uso sea considerada inaplicable o inválida, únicamente dicha disposición será inválida y no afectará las restantes disposiciones de estos Términos y Condiciones de Uso.

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