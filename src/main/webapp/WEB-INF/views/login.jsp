<!doctype html>
<html class="fixed">
	<head>

		<title>BrandTex</title>
		
		<!-- Basic -->
		<meta charset="UTF-8">

		<meta name="keywords" content="HTML5 Admin Template" />
		<meta name="description" content="Porto Admin - Responsive HTML5 Template">
		<meta name="author" content="okler.net">

		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

		<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/images/logo-brandtex-mini.png" />
		
		<!-- Vendor CSS -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/bootstrap-datepicker/css/datepicker3.css" />

		<!-- Theme CSS -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/stylesheets/theme.css" />

		<!-- Skin CSS -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/stylesheets/skins/default.css" />

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/stylesheets/theme-custom.css">

		<!-- Head Libs -->
		<script src="<%=request.getContextPath()%>/resources/vendor/modernizr/modernizr.js"></script>
		<script src="<%=request.getContextPath()%>/resources/javascripts/forms/util.js"></script>

	</head>
	<body class="body-login">
		<div class="fondo">
			<img src="<%=request.getContextPath()%>/resources/images/background.jpg" height="1862" alt="979" />
		</div>
		<!-- start: page -->
		<section class="body-sign">
			<div class="center-sign">
			
				<a href="/" class="logo pull-left login">
					<img src="<%=request.getContextPath()%>/resources/images/logo01.png" height="54" alt="BrandTex" />
				</a>
				
				<div class="panel panel-sign">
					<div class="panel-title-sign mt-xl text-center lg">
						<h4>SISTEMA<span> DE GESTI&Oacute;N</span></h4>
              			<h3><b>BRANDTEX</b></h3>
					</div>
					<div class="panel-body">
						<form accept-charset="UTF-8" role="form" id="loginForm" method="post">
						
							<div class="pull-center">
								<div id="loginMessages" class="alert-custom"></div>
							</div>
							
							<div class="form-group mb-lg">
								<label></label>
								<div class="input-group input-group-icon">
									<span class="input-group-addon">
										<span class="icon icon-lg">
											<i class="fa fa-user"></i>
										</span>
									</span>
									<input id="desLogin" name="desLogin" placeholder="Usuario" type="text" class="form-control input-lg" />
									
								</div>
							</div>

							<div class="form-group mb-lg">
								<div class="clearfix">
									<label class="pull-left"></label>
									
								</div>
								<div class="input-group input-group-icon">
									<span class="input-group-addon">
										<span class="icon icon-lg">
											<i class="fa fa-lock"></i>
										</span>
									</span>
									<input id="desClave" name="desClave" name="pwd" type="password" placeholder="Contrase�a" class="form-control input-lg" autocomplete="off" />
									
								</div>
							</div>
<!-- 							<a href="pages-recover-password.html" class="pull-right">¿Olvidó su contraseña?</a> -->
							<div class="row">
								
								<div class="col-sm-12 text-right lg">
									<button id="btnAceptar" type="button" class="btn btn-primary btn-block btn-lg mt-lg">Ingresar</button>
								</div>
							</div>

						</form>
					</div>
					<p class="text-center text-muted mt-md mb-md">&copy; Brandtex Copyright 2021. All Rights Reserved.</p>
				</div>

				
			</div>
		</section>
		<!-- end: page -->

		<!-- Vendor -->
		<script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.js"></script>
		<script src="<%=request.getContextPath()%>/resources/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.js"></script>
		<script src="<%=request.getContextPath()%>/resources/vendor/nanoscroller/nanoscroller.js"></script>
		<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="<%=request.getContextPath()%>/resources/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="<%=request.getContextPath()%>/resources/vendor/jquery-placeholder/jquery.placeholder.js"></script>
		
		<!-- PLUGIN JQUERY -->
		<script type="text/javascript" src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.serializejson.min.js" />"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="<%=request.getContextPath()%>/resources/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="<%=request.getContextPath()%>/resources/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="<%=request.getContextPath()%>/resources/javascripts/theme.init.js"></script>

	</body>
	
	<script type="text/javascript">
	    $(document).ready(function() {
	        inicializarVariables();
	        cargarComponentes();
	    });

        var btnAceptar = null;
        var loginForm = null;
        var login = null;
        var password = null;
        
        function inicializarVariables(){

            btnAceptar = $('#btnAceptar');
            loginForm = $('#loginForm');
            login = $('#desLogin');
            password = $('#desClave');
        }

        function cargarComponentes(){
        	
			btnAceptar.click(function(event){
	              if(validarFormulario()){
	                autenticarUsuario();
	              }
	            });
            
            function validarFormulario(){
                estado = true;
                if($('#desLogin').val().trim()==''){
                	mostrarMensajeError("Debe ingresar el usuario");
                    estado = false;
                } else if ($('#desClave').val().trim()==''){
                	mostrarMensajeError("Debe ingresar la contraseña");
                    estado = false;
                }
                return estado;
            }

            login.keypress(function(e) {
                if(e.which == 13) {
                  btnAceptar.click();
                }
              });

            password.keypress(function(e) {
              if(e.which == 13) {
                btnAceptar.click();
              }
            });
        }
        
        function autenticarUsuario(){
            var usuarioJson = JSON.stringify(loginForm.serializeJSON());
            $.ajax({
                url: "./autenticarUsuario",
                type: "POST",
                dataType: "json",
                data : {
                    usuario: usuarioJson	                  
                }
            }).done(function(paramJson) {
                if(paramJson.estadoRespuesta=='OK'){
                	setCookie("idMenu", "", 1);
                	setCookie("idMenuExp", "", 1);
                    window.location.href = './cargarPanel';
                }else{
                	limpiarText();
                    mostrarMensajeError(paramJson.mensajeRespuesta);	                    
                }
            }).fail(function( jqXHR, textStatus, errorThrown ) {
                alert( "error"+errorThrown +", "+jqXHR+","+textStatus);
            });
            
        }

        function mostrarMensajeError(mensajeError){
            var mensajeHTML = '';
            mensajeHTML = '<div class="alert alert-danger" role="alert" style="margin-bottom: 0px; height: auto!important;">';
            mensajeHTML = mensajeHTML + '<i class="fa fa-warning"></i> ';
            mensajeHTML = mensajeHTML + mensajeError;
            $('#loginMessages div').remove();
            $('#loginMessages').append(mensajeHTML);
        }
        
        function limpiarText(){
        	login.val("");
        	password.val("");
	    }

     </script>
</html>