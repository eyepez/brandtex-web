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

					<h2>Mantenimiento de Tipos de Documento</h2>
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li><a href="#"> <i class="fa fa-home"></i>
							</a></li>
							<li><span>Mantenimiento de Tipos de Documento</span></li>
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
								<h2 class="panel-title">LISTA DE TIPOS DE DOCUMENTO</h2>
							</header>

							<div class="panel-body">
								<div id="tabla">
									<table id="tblDocumento"
										class="table table-bordered table-striped mb-none">
										<thead>
											<tr>
												<th class="text-center">SEL</th>
												<th class="text-center">C&Oacute;DIGO</th>
												<th class="text-center">TIPO DOCUMENTO</th>
												<th class="text-center">SIGLA</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
							<footer class="panel-footer">
								<div class="row">
									<div class="center">
										<a id="btnNuevo" class="btn btn-sm btn-primary width-default" onclick="nuevo();"><i class="fa fa-check"> </i> NUEVA</a>
										<a id="btnModificar" class="btn btn-sm btn-primary" onclick="modificar();"><i class="fa fa-refresh"> </i> MODIFICAR</a>
									</div>
								</div>
							</footer>
						</section>
					</div>

					<div class="col-md-12" id="divDocumento" style="display: none">
						<form method="post" class="form-horizontal"  id="form" name="form">
							<input type="hidden" name="method" value="" /> 

							<section class="panel animated fadeInRight">
								<header class="panel-heading">
									<h2 class="panel-title">DATOS DEL TIPO DE DOCUMENTO</h2>

								</header>
								<div class="panel-body">

									<div class="form-group">
										<label class="col-sm-3 control-label"> C&Oacute;DIGO <span class="required">*</span></label>
										<div class="col-sm-9">
											<input type="text" id="txtCodigo" name="txtCodigo" class="form-control"/>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label"> TIPO DOCUMENTO <span class="required">*</span>
										</label>
										<div class="col-sm-9">
											<input type="text" id="txtNombre" name="txtNombre" class="form-control" maxlength="200" onkeydown="upperCase(this)" title="Favor, Ingresar un Documento." required />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label"> SIGLA TIPO DOCUMENTO <span class="required">*</span>
										</label>
										<div class="col-sm-9">
											<input type="text" id="txtSigla" name="txtSigla" class="form-control" maxlength="12" onkeydown="upperCase(this)" title="Favor, Ingresar una Sigla de Tipo Documento." required />
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

			$("#txtNombre").keypress(function (key) {
                if ( (key.charCode >= 37 && key.charCode <= 40) || (key.charCode >= 48 && key.charCode <= 57)
                    || (key.charCode >= 96 && key.charCode <= 105)
                ) return true;
				if ( (key.charCode < 97 || key.charCode > 122)//letras mayusculas
					&& (key.charCode < 65 || key.charCode > 90) //letras minusculas
					&& (key.charCode != 45) //retroceso
					&& (key.charCode != 241) //ñ
					&& (key.charCode != 209) //Ñ
					&& (key.charCode != 32) //espacio
					&& (key.charCode != 225) //á
					&& (key.charCode != 233) //é
					&& (key.charCode != 237) //í
					&& (key.charCode != 243) //ó
					&& (key.charCode != 250) //ú
					&& (key.charCode != 193) //Á
					&& (key.charCode != 201) //É
					&& (key.charCode != 205) //Í
					&& (key.charCode != 211) //Ó
					&& (key.charCode != 218) //Ú
				) return false;
			});

		});

		function inicializarVariables() {
			var tableTest = $('#tblDocumento').DataTable();
			document.getElementById("divDocumento").style.display = "none";
		}

		function cargarComponentes() {
			$.ajax({
				url : "./cargarComponentesTipoDocumento",
				type : "POST",
				dataType : "json"
			}).done(
					function(paramJson) {

						if (paramJson.estadoRespuesta == 'OK') {

							var lstDocumento = JSON
									.parse(paramJson.parametros.lstDocumento);
							loadTableDocumento(lstDocumento);

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
			document.getElementById("divDocumento").style.display = "none";
		}

		function preguntar() {
			var codigo = $('input[name="fila"]:checked');
			if (codigo.val() != null) {
				$("#modalEliminar").modal('show');
			} else {
				callNotification(
						'info',
						"Debe seleccionar un registro de la grilla, por favor verifique",
						'Informaci&oacute;n');
			}
		}

		function cerrarModal() {
			$("#modalEliminar").modal('hide');
		}

		function guardar() {

			var codEmp = document.getElementById("txtCodigo");
			var nomEmp = document.getElementById("txtNombre");
			var sigEmp = document.getElementById("txtSigla");

			$
					.ajax({
						url : "./guardarDocumento",
						type : "POST",
						dataType : "json",
						data : {
							codigo : codEmp.value,
							nombre : nomEmp.value,
							sigla : sigEmp.value
						}
					})
					.done(
							function(paramJson) {
								if (paramJson.estadoRespuesta == 'OK') {
									limpiarText();
									callNotification(
											'success',
											'Se ha guardado satisfactoriamente los datos del Tipo Documento',
											'Correcto');
									document.getElementById("divDocumento").style.display = "none";
									var lstDocumento = JSON
											.parse(paramJson.parametros.lstDocumento);
									loadTableDocumento(lstDocumento);
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

		function loadTableDocumento(lista) {

			$('#tblDocumento').dataTable().fnClearTable();
			var tblDocumento = $('#tblDocumento').DataTable();

			// Deshabilitando botones
			if(lista.length > 0){
				 $("#btnModificar").removeAttr("disabled");
				 $("#btnEliminar").removeAttr("disabled");
			}else {
				 $("#btnModificar").attr("disabled", true);
				 $("#btnEliminar").attr("disabled", true);
			}
			
			$.each(lista, function(i, obj) {
				var rowNode = tblDocumento.row
						.add(['<input type="radio" id="fila" name="fila" value="'+ obj.codigo  +'">',
							obj.codigo, obj.nombre, obj.sigla ])
						.draw(false).node();
				
				// Centrando columnas seleccion y codigo
				$(rowNode).find('td').each(function(index, td) {
					if(index == 0 || index == 1){
						$(td).addClass('text-center');
					}
	        	});
			});
		}

		function nuevo() {
			$.ajax({
				url : "./nuevoDocumento",
				type : "POST",
				dataType : "json",
				data : {}
			})
			.done(
					function(paramJson) {
						if (paramJson.estadoRespuesta == 'OK') {
							document.getElementById("divDocumento").style.display = "inline";
							document.getElementById("txtCodigo").disabled = true;
							limpiarText();
							var secuencial = paramJson.parametros.seq;
							document.getElementById("txtCodigo").value = secuencial;
						} else {
							callNotification('error', paramJson.mensajeRespuesta, 'Error');
						}
					}).fail(
					function(jqXHR, textStatus, errorThrown) {
						alert("error" + errorThrown + ", " + jqXHR
								+ "," + textStatus);
					});
		}

		function modificar() {
			var codigo = $('input[name="fila"]:checked');
			if (codigo.val() != null) {
				$
						.ajax({
							url : "./modificarDocumento",
							type : "POST",
							dataType : "json",
							data : {
								codigo : codigo.val()
							}
						})
						.done(
								function(paramJson) {
									if (paramJson.estadoRespuesta == 'OK') {
										limpiarText();
										document.getElementById("divDocumento").style.display = "inline";
										document.getElementById("txtCodigo").disabled = true;
										document.getElementById("txtCodigo").value = codigo.val();
										document.getElementById("txtNombre").value = paramJson.parametros.nombre;
										document.getElementById("txtSigla").value = paramJson.parametros.sigla;
										nomTemp = paramJson.parametros.nombre;
									} else {
										callNotification('error', paramJson.mensajeRespuesta, 'Error');
									}
								}).fail(
								function(jqXHR, textStatus, errorThrown) {
									alert("error" + errorThrown + ", " + jqXHR
											+ "," + textStatus);
								});

			} else {
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

		function validarNombre() {
			var nombre = document.getElementById("txtNombre");
			var pagina = "documento";

			if (nomTemp == nombre.value) {
				guardar();
			} else {
				$.ajax({
					url : "./validarNombre",
					type : "POST",
					dataType : "json",
					data : {
						nombre : nombre.value,
						pagina : pagina
					}
				}).done(
						function(paramJson) {
							if (paramJson.estadoRespuesta != 'OK') {
								callNotification('notice',
										paramJson.mensajeRespuesta, 'Alerta');
							} else {
								guardar();
							}

						}).fail(
						function(jqXHR, textStatus, errorThrown) {
							alert("error" + errorThrown + ", " + jqXHR + ","
									+ textStatus);
						});
			}
		}
	</script>

</body>
</html>