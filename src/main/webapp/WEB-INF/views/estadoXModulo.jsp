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

					<h2>ASIGNACI&Oacute;N DE ESTADOS POR M&Oacute;DULOS</h2>
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li><a href="#"> <i class="fa fa-home"></i>
							</a></li>
							<li><span>Asignaci&oacute;n de Estados por M&oacute;dulo</span></li>
						</ol>

<!-- 						<a class="sidebar-right-toggle" data-open="sidebar-right"><i -->
<!-- 							class="fa fa-chevron-left"></i></a> -->
					</div>
				</header>

				<!-- START: PAGE -->

				<div class="row">

					<div class="col-md-12">
						<section class="panel animated fadeInRight">
						
							<div class="panel-body">
											
								<div class="form-group">
								  
								  <label class="col-md-1 control-label" for="cboTipoDocu">M&Oacute;DULO</label>
									<div class="col-md-3" style="width: 75%;">
										<select id="cboModulo" name="cboModulo" class="form-control" onchange="cambiarEstados();">
	                                 </select>
									</div>
								</div>
							</div>
											
						
							<header class="panel-heading">
								<h2 class="panel-title">ESTADOS DEL LOTE ASIGNADOS AL M&Oacute;DULO</h2>
							</header>

							<div class="panel-body">
								<div id="tabla" class="col-md-11">
									<table id="tblEstado"
										class="table table-bordered table-striped mb-none">
										<thead>
											<tr>
												<th class="text-center">SEL</th>
												<th class="text-center">CODIGO</th>
												<th class="text-center">ESTADO</th>
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
										<a id="btnNuevo" class="btn btn-sm btn-primary width-default" onclick="nuevo();"><i class="fa fa-check"> </i> NUEVO</a>
										<a id="btnModificar" class="btn btn-sm btn-primary" onclick="modificar();"><i class="fa fa-refresh"> </i> MODIFICAR</a>
									</div>
								</div>
							</footer>
								
						</section>
					</div>

					<div class="col-md-12" id="divEstado" style="display: none">
						<form method="post" class="form-horizontal"  id="form" name="form">
							<input type="hidden" name="method" value="" /> 

							<section class="panel animated fadeInRight">
								<header class="panel-heading">
									<h2 class="panel-title">DATOS DEL ESTADO</h2>

								</header>
								<div class="panel-body">

									<div class="form-group">
										<label class="col-sm-3 control-label"> C&Oacute;DIGO <span class="required">*</span></label>
										<div class="col-sm-9">
											<input type="text" id="txtCodigo" name="txtCodigo" class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label"> ESTADO <span class="required">*</span>
										</label>
										<div class="col-sm-9">
											<input type="text" id="txtNombre" name="txtNombre" class="form-control" maxlength="100" onkeydown="upperCase(this)" title="Favor, Ingresar un Estado" required />
										</div>
									</div>

								</div>
								<footer class="panel-footer">
									<div class="row">
										<div class="center">
											<input id="btnGuardar" class="btn btn-sm btn-primary width-default" type="submit" value="GUARDAR">
											<button id="btnCancelar" class="btn btn-sm btn-danger width-default" type="reset" onclick="cancelar();">CANCELAR</button>
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
	var cboModulo = null;
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
			var tableTest = $('#tblEstado').DataTable();
			cboModulo = $('#cboModulo');
		}

		function cargarComponentes() {
			$.ajax({
				url : "./cargarComponentesEstado",
				type : "POST",
				dataType : "json"
			}).done(
					function(paramJson) {

						if (paramJson.estadoRespuesta == 'OK') {

							var lstModulo = JSON
									.parse(paramJson.parametros.lstModulo);
							loadCombo(lstModulo);

							var lstEstado = JSON
									.parse(paramJson.parametros.lstEstado);
							loadTableEstado(lstEstado);

						} else {
							callNotification('error',
									paramJson.mensajeRespuesta, 'Error');
						}

					}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
			});
		}

		function cambiarEstados() {
			limpiarText();
			var cboModulo = $("#cboModulo");
			$.ajax({
						url : "./cambiarEstado",
						type : "POST",
						dataType : "json",
						data : {
							codigoModulo : cboModulo.val()
						}
					})
					.done(
							function(paramJson) {
								if (paramJson.estadoRespuesta == 'OK') {
									var lstEstado = JSON
											.parse(paramJson.parametros.lstEstado);
									loadTableEstado(lstEstado);
                                    document.getElementById("divEstado").style.display = "none";
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

		function loadCombo(lista) {
			var lisModulo = lista;
			cboModulo.append($("<option/>").attr("value", "").text(
					"Seleccionar"));
			$.each(lisModulo, function(i, item) {
				cboModulo.append($("<option/>").attr("value",
						lisModulo[i].codigo).text(lisModulo[i].nombre));
			});
		}
		
		function cancelar() {
			limpiarText();
			document.getElementById("divEstado").style.display = "none";
		}

		function guardar() {

			var txtCodigo = document.getElementById("txtCodigo");
			var txtNombre = document.getElementById("txtNombre");
			var cboModulo = $("#cboModulo");
			var numOrden;
			var radioSeleccionado = $('input[name="fila"]:checked');
			if(radioSeleccionado.val() != null){
				var estadoSeleccionado = JSON.parse(decodeURIComponent(radioSeleccionado.val()));
				numOrden = estadoSeleccionado.numOrden;
			}
			
			if(cboModulo.val() == 0) {
				callNotification('notice', "Debe seleccionar un módulo de la lista, por favor verifique.", 'Informaci&oacute;n');
			} else {
				$.ajax({
					url : "./guardarEstado",
					type : "POST",
					dataType : "json",
					data : {
						codigoEstado : txtCodigo.value,
						codigoModulo : cboModulo.val(),
						nombre : txtNombre.value,
						ipUser : ipUser,
						numOrden : numOrden
					}
				})
				.done(
						function(paramJson) {

							if (paramJson.estadoRespuesta == 'OK') {

								limpiarText();
								callNotification(
										'success',
										'Se ha guardado satisfactoriamente los datos del estado',
										'Correcto');
								document.getElementById("divEstado").style.display = "none";
								var lstEstado = JSON
										.parse(paramJson.parametros.lstEstado);
								loadTableEstado(lstEstado);
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
		}

		function loadTableEstado(lista) {

			$('#tblEstado').dataTable().fnClearTable();
			var tblEstado = $('#tblEstado').DataTable();

			// Deshabilitando botones
			var cboModulo = $("#cboModulo");
			 if(cboModulo.val() == ""){
				 $("#btnNuevo").attr("disabled", true);
				 $("#btnModificar").attr("disabled", true);
				 $("#btnSubir").attr("disabled", true);
				 $("#btnBajar").attr("disabled", true);
				 $("#btnReindexar").attr("disabled", true);
			 }else{
				 $("#btnNuevo").removeAttr("disabled");
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
			 }
			
			$.each(lista,function(i, obj) {
				obj.length = lista.length;
				var jsonEncode = encodeURIComponent(JSON.stringify(obj))
				var rowNode = tblEstado.row
						.add(['<input type="radio" id="fila" name="fila" value="'+ jsonEncode  +'">',
								obj.codigo.codigoEstado, 
								obj.nombre,
								parseInt(obj.codigo.codigoModulo) +' - '+ obj.numOrdenTemp,
								obj.numOrden ]).draw(
								false).node();
				
				// Centrando columnas seleccion, codigo y orden
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
			 $('#tblEstado').find('tr').each(function() {
	             $(this).find('td').eq(0).addClass('text-center');
	             $(this).find('td').eq(1).addClass('text-center');
	             $(this).find('td').eq(3).addClass('text-center');
	         });
		}

		function nuevo() {
			var cboModulo = $("#cboModulo");
			if(cboModulo != null){
				$.ajax({
					url : "./nuevoEstado",
					type : "POST",
					dataType : "json",
					data : {codigoModulo: cboModulo.val()}
				}).done(
					function(paramJson) {
						if (paramJson.estadoRespuesta == 'OK') {
							document.getElementById("divEstado").style.display = "inline";
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
			}else{
				callNotification('notice', "Debe seleccionar un Módulo", 'Informaci&oacute;n');
			}
		}

		function modificar() {
			var radioSeleccionado = $('input[name="fila"]:checked');
			if (radioSeleccionado.val() != null) {
				var estadoSeleccionado = JSON.parse(decodeURIComponent(radioSeleccionado.val()));
				$.ajax({
							url : "./modificarEstado",
							type : "POST",
							dataType : "json",
							data : {
								codigoModulo : estadoSeleccionado.codigo.codigoModulo,
								codigoEstado : estadoSeleccionado.codigo.codigoEstado
							}
						})
						.done(
								function(paramJson) {
									if (paramJson.estadoRespuesta == 'OK') {
										limpiarText();
										document.getElementById("divEstado").style.display = "inline";
										document.getElementById("txtCodigo").disabled = true;
										document.getElementById("txtCodigo").value = paramJson.parametros.codigoEstado;
										document.getElementById("txtNombre").value = paramJson.parametros.nombre;
										nomTemp = paramJson.parametros.nombre;
									} else {
										callNotification('error',
												paramJson.mensajeRespuesta,
												'Error');
									}

								}).fail(
								function(jqXHR, textStatus, errorThrown) {
									alert("error" + errorThrown + ", " + jqXHR
											+ "," + textStatus);
								});
			} else {
				callNotification(
						'notice',
						"Debe seleccionar un registro de la grilla, por favor verifique",
						'Informaci&oacute;n');
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

			if (nomTemp == nombre.value) {
				guardar();
			} else {
				var cboModulo = $("#cboModulo");
				
				$.ajax({
					url : "./validarNombreEstado",
					type : "POST",
					dataType : "json",
					data : {
						codigoModulo : cboModulo.val(),
						nombre : nombre.value
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

		function subirOrden() {
			
			var radioSeleccionado = $('input[name="fila"]:checked');
			if(radioSeleccionado.val() != null){
				var estadoSeleccionado = JSON.parse(decodeURIComponent(radioSeleccionado.val()));
				if(estadoSeleccionado.numOrden == "1"){
					callNotification(
							'notice',
							"No se puede subir el n&uacute;mero de orden de este registro.",
							'Informaci&oacute;n');
				} else {
					$.ajax({
								url : "./subirOrdenEstado",
								type : "POST",
								dataType : "json",
								data : {
									numOrden : estadoSeleccionado.numOrden
								}
							})
							.done(
									function(paramJson) {
										if (paramJson.estadoRespuesta == 'OK') {
											var lstEstado = JSON
													.parse(paramJson.parametros.lstEstado);
											loadTableEstado(lstEstado);
										} else {
											callNotification('info',
													paramJson.mensajeRespuesta,
													'Informaci&oacute;n');
										}

									}).fail(
									function(jqXHR, textStatus, errorThrown) {
										alert("error" + errorThrown + ", "
												+ jqXHR + "," + textStatus);
									});
				}
			} else {
				callNotification(
						'info',
						"Debe seleccionar un registro de la grilla, por favor verifique",
						'Informaci&oacute;n');
			}
		}

		function bajarOrden() {
			var radioSeleccionado = $('input[name="fila"]:checked');
			if(radioSeleccionado.val() != null){
				var estadoSeleccionado = JSON.parse(decodeURIComponent(radioSeleccionado.val()));
				if(estadoSeleccionado.numOrden == estadoSeleccionado.length){
					callNotification(
							'notice',
							"No se puede bajar el n&uacute;mero de orden de este registro.",
							'Informaci&oacute;n');
				} else {
					$.ajax({
						url : "./bajarOrdenEstado",
						type : "POST",
						dataType : "json",
						data : {
							numOrden : estadoSeleccionado.numOrden
						}
					}).done(
							function(paramJson) {
								if (paramJson.estadoRespuesta == 'OK') {
									var lstEstado = JSON
											.parse(paramJson.parametros.lstEstado);
									loadTableEstado(lstEstado);
								} else {
									callNotification('info',
											paramJson.mensajeRespuesta,
											'Informaci&oacute;n');
								}

							}).fail(function(jqXHR, textStatus, errorThrown) {
								alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
							});
				}
			}else{
				callNotification('info', "Debe seleccionar un registro de la grilla, por favor verifique", 'Informaci&oacute;n');
			}
		}

		function actualizarOrden() {

			$.ajax({
				url : "./actualizarOrdenEstado",
				type : "POST",
				dataType : "json",
				data : {
					ipUser : ipUser
				}
			}).done(
					function(paramJson) {
						if (paramJson.estadoRespuesta == 'OK') {
							callNotification('success',
									'Se actualizó correctamente', 'Correcto');
							var lstEstado = JSON.parse(paramJson.parametros.lstEstado);
							loadTableEstado(lstEstado);
						} else {
							callNotification('info',
									paramJson.mensajeRespuesta,
									'Informaci&oacute;n');
						}

					}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
			});
		}

		getIPs(function(ip) {
			console.log(ip);
			ipUser = ip;
		});
	</script>

</body>
</html>