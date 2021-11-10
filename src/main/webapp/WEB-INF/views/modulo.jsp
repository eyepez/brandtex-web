<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html class="fixed">
<head>

<!-- Librerias cabecera:start -->
<jsp:include page="plantillas/libreriasCabecera.jsp" />
<!-- Librerias cabecera:end -->

</head>

<body>
	<section class="body">

		<!-- start: header -->
		<header class="header">
			<jsp:include page="plantillas/header.jsp" />
		</header>
		<!-- end: header -->

		<div class="inner-wrapper">

			<!-- start: sidebar -->
			<jsp:include page="plantillas/aside.jsp" />
			<!-- end: sidebar -->


			<section role="main" class="content-body" style="padding-top: 30px;">
				<header id="cabecera" class="page-header animated fadeInLeft">

					<h2>Mantenimiento de M&oacute;dulos</h2>
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li><a href="#"> <i class="fa fa-home"></i>
							</a></li>
							<li><span>Mantenimiento de M&oacute;dulos</span></li>
						</ol>

<!-- 						<a class="sidebar-right-toggle" data-open="sidebar-right"><i -->
<!-- 							class="fa fa-chevron-left"></i></a> -->
					</div>
				</header>

				<!-- START: PAGE -->

				<div class="row">

					<div class="col-md-12">
						<section class="panel animated fadeInRight">
							<header class="panel-heading">
								<h2 class="panel-title">LISTA DE M&Oacute;DULOS</h2>
							</header>

							<div class="panel-body">
								<div id="tabla" class="col-md-11">
									<table id="tblModulo"
										class="table table-bordered table-striped mb-none">
										<thead>
											<tr>
												<th class="text-center">SEL</th>
												<th class="text-center">C&Oacute;DIGO</th>
												<th class="text-center">M&Oacute;DULO</th>
												<th class="text-center">&Oacute;RDEN</th>
												<th class="text-center" style="display: none;">&Oacute;RDEN REAL</th>
											</tr>
										</thead>
									</table>
								</div>
								<div class="col-md-1">
									<div class="row"><span> </span> </div>
									<div class="row">
										<a id="btnSubir" class="btn btn-sm " style=" color: #777777; background-color: white; border-color: #dddddd;" onclick="subirOrden();"><i class="fa fa-arrow-up"> </i> Subir</a>
									</div>
									<div class="row">
										<a id="btnBajar" class="btn btn-sm " style=" color: #777777; background-color: white; border-color: #dddddd;" onclick="bajarOrden();"><i class="fa fa-arrow-down"> </i> Bajar</a>
									</div>
									<div class="row">
										<a id="btnReindexar" class="btn btn-sm " style=" color: #777777; background-color: white; border-color: #dddddd;" onclick="actualizarOrden();"><i class="fa fa-spinner"> </i> Reindexar</a>
									</div>
								</div>
							</div>
							<footer class="panel-footer">
								<div class="row">
									<div class="center">
										<a id="btnNuevo" class="btn btn-sm btn-primary width-default" onclick="nuevoModulo();"><i class="fa fa-check"> </i> NUEVO</a>
										<a id="btnModificar" class="btn btn-sm btn-primary" onclick="modificarModulo();"><i class="fa fa-refresh"> </i> MODIFICAR</a>
									</div>
								</div>
							</footer>
						</section>
					</div>

					<div class="col-md-12" id="divModulo" style="display: none">
						<form method="post" class="form-horizontal"  id="form" name="form">
							<input type="hidden" name="method" value="" /> 

							<section class="panel animated fadeInRight">
								<header class="panel-heading">
									<h2 class="panel-title">DATOS DEL M&Oacute;DULO</h2>

								</header>
								<div class="panel-body">

									<div class="form-group">
										<label class="col-sm-3 control-label"> C&Oacute;DIGO <span class="required">*</span></label>
										<div class="col-sm-9">
											<input type="text" id="txtCodigo" name="txtCodigo" class="form-control"  />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label"> M&Oacute;DULO <span class="required">*</span>
										</label>
										<div class="col-sm-9">
											<input type="text" id="txtNombre" name="txtNombre" class="form-control" maxlength="50" 
												onkeydown="upperCase(this)" title="Favor, Ingresar un M&oacute;dulo" required />
										</div>
									</div>
								</div>
							</section>

							<section class="panel animated fadeInRight">
								<header class="panel-heading">
									<h2 class="panel-title">DATOS DE CONFIGURACI&Oacute;N</h2>

								</header>
								<div class="panel-body">

									<div class="form-group">
										<label class="col-sm-3 control-label"> RUTA IMAGEN </label>
										<div class="col-sm-9">
											<input type="text" id="txtRutaImagen" name="txtRutaImagen" class="form-control" />
										</div>
									</div>
								</div>
								<footer class="panel-footer">
									<div class="row">
										<div class="center">
											<input class="btn btn-sm btn-primary width-default" type="submit" value="GUARDAR">
											<button class="btn btn-sm btn-danger width-default" type="reset" onclick="cancelar();">CANCELAR</button>
										</div>
									</div>
								</footer>
							</section>

						</form>
					</div>
				</div>
				
				</div>


				<!-- END: PAGE -->

				<jsp:include page="plantillas/footer.jsp" />

			</section>


		</div>

		<!-- START: sidebar-->

<%-- 		<jsp:include page="plantillas/sidebar.jsp" /> --%>

		<!-- END: sidebar-->

	</section>


	<!-- START: LIB JS FOOTER-->
	<jsp:include page="plantillas/libreriasPie.jsp" />
	<!-- END: LIB JS FOOTER-->



	<script type="text/javascript">
	
	var ipUser = null;
	var nomTemp = "";
	
	$(document).ready(function() {
		inicializarVariables();
		cargarComponentes();
		
		$('#form').validate({
				submitHandler: function() {
					 validarNombre();
				 },			
				rules : {
					txtNombre : {
						minlength : 1,
						required : true
					},
				},
				highlight : function(element) {
					$(element).css({
						"border-color" : "#d2322d"
					}).closest('.form-group').addClass('has-error');
				},
				unhighlight : function(element) {
					$(element).css({
						"border-color" : "#cccccc"
					}).closest('.form-group').removeClass('has-error');
				},
			});

		});

		function inicializarVariables() {
			var tableTest = $('#tblModulo').DataTable();
			document.getElementById("divModulo").style.display = "none";
		}

		function cargarComponentes() {
			$.ajax({
				url : "./cargarComponentesModulo",
				type : "POST",
				dataType : "json"
			}).done(
					function(paramJson) {

						if (paramJson.estadoRespuesta == 'OK') {

							var lstModulo = JSON
									.parse(paramJson.parametros.lstModulo);
							loadTableModulo(lstModulo);

						} else {
							callNotification('error',
									paramJson.mensajeRespuesta, 'Error');
						}

					}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
			});
		}

		function cancelar() {
			limpiarText();
			document.getElementById("divModulo").style.display = "none";
		}

	function guardar() {

		var codEmp = document.getElementById("txtCodigo");
		var nomEmp = document.getElementById("txtNombre");
		var rutImg = document.getElementById("txtRutaImagen");
		var codigo = $('input[name="fila"]:checked');
			$.ajax({
				url : "./guardarModulo",
				type : "POST",
				dataType : "json",
				data : {
					codigo 		: codEmp.value,
					nombre 		: nomEmp.value,
					ipUser 		: ipUser,
					numOrden	: codigo.val(),
					rutaImagen	: rutImg.value
				}
			})
			.done(
				function(paramJson) {
					if (paramJson.estadoRespuesta == 'OK') {
						limpiarText();
						callNotification('success','Se ha guardado satisfactoriamente los datos del modulo','Correcto');
						document.getElementById("divModulo").style.display = "none";
						var lstModulo = JSON.parse(paramJson.parametros.lstModulo);
						loadTableModulo(lstModulo);
					} else {
						callNotification('error',
								paramJson.mensajeRespuesta, 'Error');
					}

				}).fail(
				function(jqXHR, textStatus, errorThrown) {
					alert("error" + errorThrown + ", " + jqXHR
							+ "," + textStatus);
				});
	}
	
	function loadTableModulo(lista){
		 
		 $('#tblModulo').dataTable().fnClearTable();
		 var tblModulo = $('#tblModulo').DataTable(); 

		 // Deshabilitando botones
		 if(lista.length > 0){
			 $("#btnModificar").removeAttr("disabled");
			 $("#btnSubir").removeAttr("disabled");
			 $("#btnBajar").removeAttr("disabled");
			 $("#btnReindexar").removeAttr("disabled");
		 }else {
			 $("#btnModificar").attr("disabled", true);
			 $("#btnSubir").attr("disabled", true);
			 $("#btnBajar").attr("disabled", true);
			 $("#btnReindexar").attr("disabled", true);
		 }
		 
		 $.each(lista,function(i,obj){
			 
			 var rowNode = tblModulo.row.add( [
				   '<input type="radio" id="fila" name="fila" value="'+ obj.codigo+"|"+obj.numOrden+"|"+lista.length  +'">',
				   obj.codigo,
				   obj.nombre,
				   obj.numOrdenTemp,
				   obj.numOrden
				   ] ).draw( false ).node();
			 
			// Centrando columnas seleccion y codigo
			$(rowNode).find('td').each(function(index, td) {
				if(index == 0 || index == 1 || index == 3){
					$(td).addClass('text-center');
				}
				if(index == 4){
					$(td).css('display', 'none');
				}
        	});
			 
		  });
		 
		 // Centrando columnas seleccion, codigo y opcion eliminar
		 $('#tblModulo').find('tr').each(function() {
             $(this).find('td').eq(0).addClass('text-center');
             $(this).find('td').eq(1).addClass('text-center');
             $(this).find('td').eq(3).addClass('text-center');
         });
	}

	function nuevoModulo() {
		$.ajax({
			url : "./nuevoModulo",
			type : "POST",
			dataType : "json",
			data : {	}
		})
		.done(
			function(paramJson) {
				if (paramJson.estadoRespuesta == 'OK') {
					document.getElementById("divModulo").style.display = "inline";
		 			document.getElementById("txtCodigo").disabled = true;
					limpiarText();
					var secuencial = paramJson.parametros.seq;
					document.getElementById("txtCodigo").value = secuencial;

				} else {
					callNotification('error',
							paramJson.mensajeRespuesta, 'Error');
				}

			}).fail(
			function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR
						+ "," + textStatus);
			});
		
	}
		
	function modificarModulo(){
		var codigo = $('input[name="fila"]:checked');
		if(codigo.val()!=null){
			$.ajax({
				url : "./modificarModulo",
				type : "POST",
				dataType : "json",
				data : {	
					codigo :	codigo.val()
				}
			})
			.done(
				function(paramJson) {
					if (paramJson.estadoRespuesta == 'OK') {
						limpiarText();
						document.getElementById("divModulo").style.display = "inline";
			 			document.getElementById("txtCodigo").disabled = true;
			 			document.getElementById("txtCodigo").value = paramJson.parametros.codigo;
			 			document.getElementById("txtNombre").value = paramJson.parametros.nombre;
						document.getElementById("txtRutaImagen").value = paramJson.parametros.rutaImagen;
			 			nomTemp = paramJson.parametros.nombre;
					} else {
						callNotification('error',
								paramJson.mensajeRespuesta, 'Error');
					}

				}).fail(
				function(jqXHR, textStatus, errorThrown) {
					alert("error" + errorThrown + ", " + jqXHR
							+ "," + textStatus);
				});
		}else{
			callNotification('info', "Debe seleccionar un registro de la grilla, por favor verifique", 'Informaci&oacute;n');
		}
	}

	function clearValidation(){
		 //Internal $.validator is exposed through $(form).validate()
		 $('#txtCodigo').focus();
		 var validator = $('#form').validate();
		 //Iterate through named elements inside of the form, and mark them as error free
		 validator.resetForm();//remove error class on name elements and clear history
		 validator.reset();//remove all error and success data
		 
		 $('div.form-group').removeClass('has-error');
		 $('#txtNombre').removeAttr('style');
	}
	
	function limpiarText() {
		clearValidation();
		$('#form')[0].reset();
	}
	
	function validarNombre(){
		var nombre = document.getElementById("txtNombre");
		var pagina = "modulo";
		
		if(nomTemp == nombre.value){
			guardar();
		}else{
			$.ajax({
				url : "./validarNombre",
				type : "POST",
				dataType : "json",
				data : {	
					nombre :	nombre.value,
					pagina : 	pagina
				}
			})
			.done(
				function(paramJson) {
					if (paramJson.estadoRespuesta != 'OK') {
						callNotification('notice', paramJson.mensajeRespuesta, 'Alerta');
					}else{
						guardar();
					}

				})
			.fail(
				function(jqXHR, textStatus, errorThrown) {
					alert("error" + errorThrown + ", " + jqXHR
							+ "," + textStatus);
				});
		}
	}
	
	function subirOrden(){
		var sFila = $('input[name="fila"]:checked');
		if(sFila.val()!=null){
			var divid = sFila.val().split("|");
			if(divid[1] == "1"){
				callNotification('notice', "No se puede subir el n&uacute;mero de orden de este registro.", 'Informaci&oacute;n');
			}else{
				$.ajax({
					url : "./subirOrden",
					type : "POST",
					dataType : "json",
					data : {	
						fila  : 	sFila.val()
					}
				})
				.done(
					function(paramJson) {
						if (paramJson.estadoRespuesta == 'OK') {
							var lstModulo = JSON.parse(paramJson.parametros.lstModulo);
							loadTableModulo(lstModulo);
						} else {
							callNotification('info', paramJson.mensajeRespuesta, 'Informaci&oacute;n');
						}

					})
				.fail(
					function(jqXHR, textStatus, errorThrown) {
						alert("error" + errorThrown + ", " + jqXHR
								+ "," + textStatus);
					});
			}
		}else{
			callNotification('info', "Debe seleccionar un registro de la grilla, por favor verifique", 'Informaci&oacute;n');
		}
	}
	
	function bajarOrden(){
		var sFila = $('input[name="fila"]:checked');
		if(sFila.val()!=null){
			var divid = sFila.val().split("|");
			if(divid[2] == divid[1]){
				callNotification('notice', "No se puede bajar el n&uacute;mero de orden de este registro.", 'Informaci&oacute;n');
			}else{
				$.ajax({
					url : "./bajarOrden",
					type : "POST",
					dataType : "json",
					data : {	
						fila  : 	sFila.val()
					}
				})
				.done(
					function(paramJson) {
						if (paramJson.estadoRespuesta == 'OK') {
							var lstModulo = JSON.parse(paramJson.parametros.lstModulo);
							loadTableModulo(lstModulo);
						} else {
							callNotification('info', paramJson.mensajeRespuesta, 'Informaci&oacute;n');
						}

					})
				.fail(
					function(jqXHR, textStatus, errorThrown) {
						alert("error" + errorThrown + ", " + jqXHR
								+ "," + textStatus);
					});
			}
		}else{
			callNotification('info', "Debe seleccionar un registro de la grilla, por favor verifique", 'Informaci&oacute;n');
		}
	}
	
	function actualizarOrden() {

        $.ajax({
            url: "./actualizarOrden",
            type: "POST",
            dataType: "json",
            data: {
                ipUser: ipUser
            }
        })
            .done(
                function (paramJson) {
                    if (paramJson.estadoRespuesta == 'OK') {
                        callNotification('success', 'Se actualizó correctamente', 'Correcto');
                        var lstModulo = JSON.parse(paramJson.parametros.lstModulo);
                        loadTableModulo(lstModulo);
                    } else {
                        callNotification('info', paramJson.mensajeRespuesta, 'Informaci&oacute;n');
                    }

                })
            .fail(
                function (jqXHR, textStatus, errorThrown) {
                    alert("error" + errorThrown + ", " + jqXHR
                        + "," + textStatus);
                });
    }
	
	getIPs(function(ip){
		console.log(ip);
		ipUser = ip;
	});
		
		
	</script>

</body>
</html>