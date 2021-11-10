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

					<h2>Mantenimiento de Dispositivos de Digitalizaci&oacute;n</h2>
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li><a href="#"> <i class="fa fa-home"></i>
							</a></li>
							<li><span>Mantenimiento de Dispositivos de
									Digitalizaci&oacute;n</span></li>
						</ol>

<!-- 						<a class="sidebar-right-toggle" data-open="sidebar-right"><i -->
<!-- 							class="fa fa-chevron-left"></i></a> -->
					</div>
				</header>

				<!-- START: PAGE -->
				
				<div class="row">
					<div class="col-md-12">
						<section class="panel animated fadeInRight">
							<div class="panel-body"
								style="padding-bottom: 8px; padding-top: 15px;">

								<div class="form-group">
									<label class="col-md-2 control-label">EMPRESA</label>
									<div class="col-md-3" style="width: 75%;">
										<select id="cboEmpresa" name="cboEmpresa" class="form-control"
											onchange="cambiarEmpresa();">
										</select>
									</div>
								</div>
							</div>

							<div class="panel-body"
								style="padding-bottom: 8px; padding-top: 8px;">
								<div class="form-group">
									<label class="col-md-2 control-label">PROYECTO</label>
									<div class="col-md-3" style="width: 75%;">
										<select id="cboProyecto" name="cboProyecto"
											class="form-control" onchange="cambiarProyecto();">
										</select>
									</div>
								</div>
							</div>
							
						</section>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<section class="panel form-wizard animated fadeInRight" id="w2">
							<div class="panel-body panel-body-nopadding">
								<div class="tabs">
									<ul class="nav nav-tabs nav-justify">
										<li class="active"><a href="#w2-estacion"
											data-toggle="tab" class="text-center">ESTACI&Oacute;N DE
												TRABAJO </a></li>
										<li><a href="#w2-escaner" data-toggle="tab"
											class="text-center">ESC&Aacute;NER </a></li>
									</ul>
									<form class="form-horizontal" novalidate="novalidate" id="frm"
										name="frm" method="post">
										<div class="tab-content">
											<div id="w2-estacion" class="tab-pane active">
												<!-- INICIO TAB ESTACION DE TRABAJO -->
												<div class="col-md-12">
													<section class="panel animated fadeInRight">
														<header class="panel-heading">
															<h2 class="panel-title">LISTA DE ESTACIONES DE
																TRABAJO</h2>
														</header>

														<div class="panel-body">
															<div id="tabla">
																<table id="tblComputador"
																	class="table table-bordered table-striped mb-none">
																	<thead>
																		<tr>
																			<th class="text-center">SEL</th>
																			<th class="text-center">ID</th>
																			<th class="text-center">NOMBRE DE PC</th>
																			<th class="text-center">MARCA</th>
																			<th class="text-center">MODELO</th>
																			<th class="text-center">SERIE</th>
																			<th class="text-center">DIRECCI&Oacute;N IP</th>
																		</tr>
																	</thead>
																</table>
															</div>
														</div>
														<footer class="panel-footer">
															<div class="row">
																<div class="center">
																	<a id="btnNuevoCompu" class="btn btn-sm btn-primary width-default"
																		onclick="nuevoComputador();" disabled="disabled"><i
																		class="fa fa-check"> </i> NUEVO</a> 
																	<a id="btnModificarCompu" class="btn btn-sm btn-primary"
																		onclick="modificarComputador();" disabled="disabled"><i
																		class="fa fa-refresh"> </i> MODIFICAR</a>
																</div>
															</div>
														</footer>
													</section>
												</div>

												<div class="col-md-12" id="divComputador"
													style="display: none">
													<form method="post" class="form-horizontal"
														novalidate="novalidate" id="frmEstacion"
														name="frmEstacion">
														<input type="hidden" name="method" value="" />

														<section class="panel animated fadeInRight">
															<header class="panel-heading">
																<h2 class="panel-title">DATOS DE LA ESTACI&Oacute;N
																	DE TRABAJO</h2>
															</header>
															<div class="panel-body">

																<div class="form-group">
																	<label class="col-sm-3 control-label"> ID <span
																		class="required">*</span>
																	</label>
																	<div class="col-sm-9">
																		<input type="text" id="txtIDCompu" name="txtIDCompu"
																			class="form-control" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label"> NOMBRE
																		DE PC <span class="required">*</span>
																	</label>
																	<div class="col-sm-9">
																		<input type="text" id="txtNombre" name="txtNombre"
																			class="form-control" maxlength="20"
																			onkeydown="upperCase(this)"/>
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		MARCA<span class="required">*</span>
																	</label>
																	<div class="col-sm-9">
																		<input type="text" id="txtMarcaCompu"
																			name="txtMarcaCompu" class="form-control"
																			maxlength="15" onkeydown="upperCase(this)" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		MODELO<span class="required">*</span>
																	</label>
																	<div class="col-sm-9">
																		<input type="text" id="txtModeloCompu"
																			name="txtModeloCompu" class="form-control"
																			maxlength="15" onkeydown="upperCase(this)" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		SERIE<span class="required">*</span>
																	</label>
																	<div class="col-sm-9">
																		<input type="text" id="txtSerieCompu"
																			name="txtSerieCompu" class="form-control"
																			maxlength="15" onkeydown="upperCase(this)" />
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-3 control-label">
																		DIRECCI&Oacute;N IP<span class="required">*</span>
																	</label>
																	<div class="col-sm-9">
																		<input type="text" id="txtDireccionIPCompu"
																			name="txtDireccionIPCompu" class="form-control"
																			maxlength="15" onkeydown="upperCase(this)" />
																	</div>
																</div>
															</div>
															<footer class="panel-footer">
																<div class="row">
																	<div class="center">
																		<input class="btn btn-sm btn-primary width-default"
																			type="button" onclick="validarCamposCompu();"
																			value="GUARDAR">
																		<button class="btn btn-sm btn-danger width-default"
																			type="reset" onclick="cancelarComputador();">CANCELAR</button>
																	</div>
																</div>
															</footer>
														</section>
														<!-- 													</form> -->
												</div>
												<!-- FIN TAB ESTACION DE TRABAJO -->
											</div>
											<div id="w2-escaner" class="tab-pane">
												<!-- INICIO TAB ESCANER -->
												<div class="col-md-12">
													<section class="panel animated fadeInRight">
														<header class="panel-heading">
															<h2 class="panel-title">LISTA DE ESC&Aacute;NER</h2>
														</header>

														<div class="panel-body">
															<div id="tabla">
																<table id="tblEscaner"
																	class="table table-bordered table-striped mb-none">
																	<thead>
																		<tr>
																			<th class="text-center">SEL</th>
																			<th class="text-center">ID</th>
																			<th class="text-center">MARCA</th>
																			<th class="text-center">MODELO</th>
																			<th class="text-center">SERIE</th>
																			<th class="text-center">DIRECCI&Oacute;N IP</th>
																		</tr>
																	</thead>
																</table>
															</div>
														</div>
														<footer class="panel-footer">
															<div class="row">
																<div class="center">
																	<a id="btnNuevoEscaner" class="btn btn-sm btn-primary width-default"
																		onclick="nuevoEscaner();" disabled="disabled"><i class="fa fa-check">
																	</i> NUEVO</a> 
																	<a id="btnModificarEscaner" class="btn btn-sm btn-primary"
																		onclick="modificarEscaner();" disabled="disabled"><i
																		class="fa fa-refresh"> </i> MODIFICAR</a>
																</div>
															</div>
														</footer>
													</section>
												</div>

												<div class="col-md-12" id="divEscaner" style="display: none">
													<!-- 													<form method="post" class="form-horizontal" id="frmEscaner" name="frmEscaner"> -->
													<input type="hidden" name="method" value="" />

													<section class="panel animated fadeInRight">
														<header class="panel-heading">
															<h2 class="panel-title">DATOS DEL ESC&Aacute;NER</h2>

														</header>
														<div class="panel-body">

															<div class="form-group">
																<label class="col-sm-3 control-label"> ID <span
																	class="required">*</span>
																</label>
																<div class="col-sm-9">
																	<input type="text" id="txtIdEscaner"
																		name="txtIdEscaner" class="form-control" />
																</div>
															</div>
															<div class="form-group">
																<label class="col-sm-3 control-label"> MARCA <span
																	class="required">*</span>
																</label>
																<div class="col-sm-9">
																	<input type="text" id="txtMarca" name="txtMarca"
																		class="form-control" maxlength="20"
																		onkeydown="upperCase(this)" />
																</div>
															</div>
															<div class="form-group">
																<label class="col-sm-3 control-label"> MODELO<span
																	class="required">*</span>
																</label>
																<div class="col-sm-9">
																	<input type="text" id="txtModelo" name="txtModelo"
																		class="form-control" maxlength="20"
																		onkeydown="upperCase(this)" />
																</div>
															</div>
															<div class="form-group">
																<label class="col-sm-3 control-label"> SERIE <span
																	class="required">*</span>
																</label>
																<div class="col-sm-9">
																	<input type="text" id="txtSerie" name="txtSerie"
																		class="form-control" maxlength="20"
																		onkeydown="upperCase(this)" />
																</div>
															</div>
															<div class="form-group">
																<label class="col-sm-3 control-label">
																	DIRECCI&Oacute;N IP<span class="required">*</span>
																</label>
																<div class="col-sm-9">
																	<input type="text" id="txtDireccionIPEscaner"
																		name="txtDireccionIPEscaner" class="form-control"
																		maxlength="20" onkeydown="upperCase(this)" />
																</div>
															</div>
														</div>
														<footer class="panel-footer">
															<div class="row">
																<div class="center">
																	<!-- 																		<input class="btn btn-sm btn-primary width-default" type="submit" value="GUARDAR"> -->
																	<input class="btn btn-sm btn-primary width-default"
																		type="button" onclick="validarCamposEsca();"
																		value="GUARDAR">
																	<button class="btn btn-sm btn-danger width-default"
																		type="reset" onclick="cancelarEscaner();">CANCELAR</button>
																</div>
															</div>
														</footer>
													</section>
													<!-- 													</form> -->
												</div>
												<!-- FIN TAB ESCANER -->
											</div>
										</div>
									</form>
								</div>
							</div>
						</section>
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
		var compuTemp = "";
		var ipCompuTemp = "";
		var escaTemp = "";
		var validator = null;
		var cboEmpresa = null;

		$(document).ready(function() {
			inicializarVariables();
			cargarComponentes();

            $("#txtDireccionIPCompu").keypress(function (key) {
                if ( (key.charCode >= 37 && key.charCode <= 40)
					|| (key.charCode >= 48 && key.charCode <= 57)
                    || (key.charCode == 46 )
                ) {return true;}
                else {return false;}
            });

            $("#txtDireccionIPEscaner").keypress(function (key) {
                if ( (key.charCode >= 37 && key.charCode <= 40)
                    || (key.charCode >= 48 && key.charCode <= 57)
                    || (key.charCode == 46 )
                ) {return true;}
                else {return false;}
            });

		});

		function inicializarVariables() {
			var tblComputador = $('#tblComputador').DataTable();
			var tblEscaner = $('#tblEscaner').DataTable();
			cboEmpresa = $("#cboEmpresa");
			document.getElementById("divComputador").style.display = "none";
			document.getElementById("divEscaner").style.display = "none";
		}
		
		function cambiarProyecto() {
			limpiarTextComputador();
			limpiarTextEscaner();
			$.ajax({
				url : "./cargarComponentesComputador",
				type : "POST",
				dataType : "json",
				data : {
					codigoEmpresa: $("#cboEmpresa").val(),
					codigoProyecto: $("#cboProyecto").val()
				}
			}).done(
					function(paramJson) {

						if (paramJson.estadoRespuesta == 'OK') {

							var lstComputador = JSON
									.parse(paramJson.parametros.lstComputador);
							loadTableComputador(lstComputador);
							var lstEscaner = JSON
									.parse(paramJson.parametros.lstEscaner);
							loadTableEscaner(lstEscaner);

						} else {
							callNotification('error',
									paramJson.mensajeRespuesta, 'Error');
						}

					}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
			});
		}
		
		function cambiarEmpresa() {
			$.ajax({
				url : "../proyecto/cambiarEmpresaParam",
				type : "POST",
				dataType : "json",
				data : {
					codigoEmpresa : cboEmpresa.val()
				}
			}).done(
					function(paramJson) {
						if (paramJson.estadoRespuesta == 'OK') {
							var lstProyecto = JSON
									.parse(paramJson.parametros.lstProyecto);
							loadComboProyecto(lstProyecto);
							cambiarProyecto();
						} else {
							callNotification('error',
									paramJson.mensajeRespuesta, 'Error');
						}
					}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
			});
		}
		
		function loadComboEmpresa(lista) {
			var listEmpresa = lista;
			cboEmpresa.append($("<option/>").attr("value", "").text(
					"Seleccionar"));
			$.each(listEmpresa, function(i, item) {
				cboEmpresa.append($("<option/>").attr("value",
						listEmpresa[i].codigo).text(listEmpresa[i].nombreComercial));
			});
		}

		function loadComboProyecto(lista) {
			var listProyecto = lista;
			cboProyecto = $('#cboProyecto');
			cboProyecto.empty();
			if (listProyecto == null) {
				cboProyecto.append($("<option/>").attr("value", "").text(
						"Seleccionar"));
			} else {
				cboProyecto.append($("<option/>").attr("value", "").text(
						"Seleccionar"));
				$.each(listProyecto, function(i, item) {
					cboProyecto.append($("<option/>").attr("value",
							listProyecto[i].codigo.codigoProyecto).text(
							listProyecto[i].nombre));
				});
			}
		}
		
		function cargarComponentes() {
			$.ajax({
				url : "../proyecto/cargarComponentesParam",
				type : "POST",
				dataType : "json"
			}).done(
					function(paramJson) {
						if (paramJson.estadoRespuesta == 'OK') {
							var lstEmpresa = JSON
									.parse(paramJson.parametros.lstEmpresa);

							loadComboEmpresa(lstEmpresa);
							loadComboProyecto(null);
							
						} else {
							callNotification('error',
									paramJson.mensajeRespuesta, 'Error');
						}
					}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
			});
		}

		function loadTableComputador(lista) {
			var cboProyecto = $("#cboProyecto");
			if(cboProyecto.val() == ""){
				$("#btnNuevoCompu").attr("disabled", true);
				$("#btnModificarCompu").attr("disabled", true);
			}else{
				$("#btnNuevoCompu").removeAttr("disabled");
				if(lista.length > 0){
					$("#btnModificarCompu").removeAttr("disabled");
				}else {
					$("#btnModificarCompu").attr("disabled", true);
				}
			}
			$('#tblComputador').dataTable().fnClearTable();
			var tblComputador = $('#tblComputador').DataTable();

			$.each(lista, function(i, obj) {
				tblComputador.row.add([
					'<input type="radio" id="fila" name="fila" value="'+ obj.codigo.codigoComputador  +'">',
					obj.codigo.codigoComputador,
					obj.nombre,
					obj.marca,
					obj.modelo,
					obj.serie,
					obj.compuDireIP 
				]).draw(false);});

			// Centrando columnas seleccion y codigo
			$('#tblComputador').find('tr').each(function() {
				$(this).find('td').eq(0).addClass('text-center');
				$(this).find('td').eq(1).addClass('text-center');
			});
		}

		function loadTableEscaner(lista) {
			var cboProyecto = $("#cboProyecto");
			if(cboProyecto.val() == ""){
				$("#btnNuevoEscaner").attr("disabled", true);
				$("#btnModificarEscaner").attr("disabled", true);
			}else{
				$("#btnNuevoEscaner").removeAttr("disabled");
				if(lista.length > 0){
					$("#btnModificarEscaner").removeAttr("disabled");
				}else {
					$("#btnModificarEscaner").attr("disabled", true);
				}
			}
			
			$('#tblEscaner').dataTable().fnClearTable();
			var tblEscaner = $('#tblEscaner').DataTable();

			$.each(lista, function(i, obj) {
				tblEscaner.row.add([
					'<input type="radio" id="filaEsca" name="filaEsca" value="'+ obj.codigo.codigoEscaner  +'">',
					obj.codigo.codigoEscaner, 
					obj.marca,
					obj.modelo, 
					obj.serie,
					obj.escanerDireIP 
				]).draw(false); });

			// Centrando columnas seleccion y codigo
			$('#tblEscaner').find('tr').each(function() {
				$(this).find('td').eq(0).addClass('text-center');
				$(this).find('td').eq(1).addClass('text-center');
			});
		}

		/* function loadComboModulo(lista) {
			var lstModulo = lista;
			cboModulo = $('#cboModulo');
			cboModulo.empty();
			cboModulo.append($("<option/>").attr("value", "").text(
					"Seleccionar"));
			if (lstModulo != null) {
				$.each(lstModulo, function(i, item) {
					var jsonEncode = encodeURIComponent(JSON.stringify(item));
					cboModulo.append($("<option/>").attr("value",
							lstModulo[i].codigo).text(lstModulo[i].nombre));
				});
			}
		} */

		function validarCamposCompu() {
			var nombreCompu = $("#txtNombre");
			var ipComputador = $("#txtDireccionIPCompu");
			var marcaCompu = $("#txtMarcaCompu");
			var modeloCompu = $("#txtModeloCompu");
			var serieCompu = $("#txtSerieCompu");
			
			if(nombreCompu.val() == "" || ipComputador.val() == "" || marcaCompu.val() == "" || modeloCompu.val() == "" || serieCompu.val() == ""){
				callNotification('notice', "Debe completar todos los campos, por favor verifique.", 'Alerta');
				return;
			}
			
			var regex = new RegExp("^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$");
			if(!regex.test(ipComputador.val().toLowerCase())) {
				callNotification('notice', "Debe ingresar una estructura de IP correcta (ejm: 1.0.0.1)", 'Alerta');
				return;
			}
			
			validarComputador();
		}

		function validarComputador() {
			var nombre = document.getElementById("txtNombre").value;
			var ipComputador = document.getElementById("txtDireccionIPCompu").value;
            cboEmpresa = $("#cboEmpresa");
            cboProyecto = $("#cboProyecto");
			
			if (compuTemp == nombre) {
				if(ipCompuTemp == ipComputador) {
					guardarComputador();
					return;
				}
				else
					nombre = "";
			}
			else if(ipCompuTemp == ipComputador)
				ipComputador = "";
			
			$.ajax({
				url : "./validarComputador",
				type : "POST",
				dataType : "json",
				data : {
					nombre : nombre,
					ipComputador : ipComputador,
					codigoEmpresa : cboEmpresa.val(),
					codigoProyecto : cboProyecto.val()
				}
			}).done(
					function(paramJson) {
						if (paramJson.estadoRespuesta != 'OK') {
							callNotification('notice',
									paramJson.mensajeRespuesta, 'Alerta');
						} else {
							guardarComputador();
						}

					}).fail(
					function(jqXHR, textStatus, errorThrown) {
						alert("error" + errorThrown + ", " + jqXHR + ","
								+ textStatus);
					});	
		}

		function guardarComputador() {

			var codigoComputador = $("#txtIDCompu");
			var codigoEmpresa = $("#cboEmpresa");
			var codigoProyecto = $("#cboProyecto");
			var nombreCompu = $("#txtNombre");
			var marca = $("#txtMarcaCompu");
			var modelo = $("#txtModeloCompu");
			var serie = $("#txtSerieCompu");
			var ipComputador = $("#txtDireccionIPCompu");

			$.ajax({
						url : "./guardarComputador",
						type : "POST",
						dataType : "json",
						data : {
							codigoComputador : codigoComputador.val(),
							codigoEmpresa : codigoEmpresa.val(),
							codigoProyecto : codigoProyecto.val(),
							nombre : nombreCompu.val(),
							marca : marca.val(),
							modelo : modelo.val(),
							serie : serie.val(),
							ipCompu : ipComputador.val(),
							ipUser : ipUser
						}
					})
					.done(
							function(paramJson) {
								if (paramJson.estadoRespuesta == 'OK') {
									limpiarTextComputador();
									callNotification(
											'success',
											'Se ha guardado satisfactoriamente los datos de la Estacion de Trabajo',
											'Correcto');
									document.getElementById("divComputador").style.display = "none";
									var lstComputador = JSON
											.parse(paramJson.parametros.lstComputador);
									loadTableComputador(lstComputador);

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

		function nuevoComputador() {
			$
					.ajax({
						url : "./nuevoComputador",
						type : "POST",
						dataType : "json",
						data : {}
					})
					.done(
							function(paramJson) {
								if (paramJson.estadoRespuesta == 'OK') {
									document.getElementById("divComputador").style.display = "inline";
									document.getElementById("txtIDCompu").disabled = true;
									limpiarTextComputador();
									var secuencial = paramJson.parametros.seq;
									document.getElementById("txtIDCompu").value = secuencial;

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

		function modificarComputador() {
			var codigoComputador = $('input[name="fila"]:checked');
			if (codigoComputador.val() != null) {
				$
						.ajax({
							url : "./modificarComputador",
							type : "POST",
							dataType : "json",
							data : {
								codigoComputador : codigoComputador.val(),
								codigoEmpresa : $("#cboEmpresa").val(),
								codigoProyecto : $("#cboProyecto").val()
							}
						})
						.done(
								function(paramJson) {
									if (paramJson.estadoRespuesta == 'OK') {
										document
												.getElementById("divComputador").style.display = "inline";
										document.getElementById("txtIDCompu").disabled = true;
										document.getElementById("txtIDCompu").value = codigoComputador
												.val();
										document.getElementById("txtNombre").value = paramJson.parametros.nombre;
										document.getElementById("txtMarcaCompu").value = paramJson.parametros.marca;
										document.getElementById("txtModeloCompu").value = paramJson.parametros.modelo;
										document.getElementById("txtSerieCompu").value = paramJson.parametros.serie;
										document.getElementById("txtDireccionIPCompu").value = paramJson.parametros.ipComputador;
										compuTemp = paramJson.parametros.nombre;
										ipCompuTemp = paramJson.parametros.ipComputador;
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
						'info',
						"Debe seleccionar un registro de la grilla, por favor verifique",
						'Informaci&oacute;n');
			}
		}

		function cancelarComputador() {
			limpiarTextComputador();
			document.getElementById("divComputador").style.display = "none";
		}

		function clearValidation(formElement) {
			$("#cod_empr").focus();
			var validator = $(formElement).validate();
			validator.resetForm();
			validator.reset();

			$('div.form-group').removeClass('has-error');
			$('#txtNombre').removeAttr('style');
			$('#txtMarcaCompu').removeAttr('style');
			$('#txtModeloPCompu').removeAttr('style');
			$('#txtSerieCompu').removeAttr('style');
			$('#txtDireccionIPCompu').removeAttr('style');

			$('#txtMarca').removeAttr('style');
			$('#txtModelo').removeAttr('style');
			$('#txtSerie').removeAttr('style');
			$('#txtDireccionIPEscaner').removeAttr('style');
		}

		function limpiarTextComputador() {
			document.getElementById("txtIDCompu").value = "";
			document.getElementById("txtNombre").value = "";
			document.getElementById("txtMarcaCompu").value = "";
			document.getElementById("txtModeloCompu").value = "";
			document.getElementById("txtSerieCompu").value = "";
			document.getElementById("txtDireccionIPCompu").value = "";
		}

		function cancelarEscaner() {
			limpiarTextEscaner();
			document.getElementById("divEscaner").style.display = "none";
		}

		function limpiarTextEscaner() {
			document.getElementById("txtIdEscaner").value = "";
			document.getElementById("txtMarca").value = "";
			document.getElementById("txtModelo").value = "";
			document.getElementById("txtSerie").value = "";
			document.getElementById("txtDireccionIPEscaner").value = "";
		}

		function nuevoEscaner() {
			$.ajax({
				url : "./nuevoEscaner",
				type : "POST",
				dataType : "json",
				data : {}
			})
			.done(function(paramJson) {
				if (paramJson.estadoRespuesta == 'OK') {
					document.getElementById("divEscaner").style.display = "inline";
					document.getElementById("txtIdEscaner").disabled = true;
					limpiarTextEscaner();
					var secuencial = paramJson.parametros.seq;
					document.getElementById("txtIdEscaner").value = secuencial;
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

		function validarCamposEsca() {
			var marca = $("#txtMarca");
			var modelo = $("#txtModelo");
			var serie = $("#txtSerie");
			var ipEscaner = $("#txtDireccionIPEscaner");
			
			if(marca.val() == "" || modelo.val() == "" || serie.val() == "" || ipEscaner.val() == "") {
				callNotification('notice', "Debe completar todos los campos, por favor verifique.", 'Alerta');
				return;
			}
			
			validarEscaner();
		}

		function validarEscaner() {
			var serie = document.getElementById("txtSerie");
			if (escaTemp == serie.value) {
				guardarEscaner();
			} else {
				$.ajax({
					url : "./validarEscaner",
					type : "POST",
					dataType : "json",
					data : {
						serie : serie.value
					}
				}).done(
						function(paramJson) {
							if (paramJson.estadoRespuesta != 'OK') {
								callNotification('notice',
										paramJson.mensajeRespuesta, 'Alerta');
							} else {
								guardarEscaner();
							}

						}).fail(
						function(jqXHR, textStatus, errorThrown) {
							alert("error" + errorThrown + ", " + jqXHR + ","
									+ textStatus);
						});
			}
		}

		function guardarEscaner() {

			var codigoEscaner = $("#txtIdEscaner");
			var marca = $("#txtMarca");
			var modelo = $("#txtModelo");
			var serie = $("#txtSerie");
			var ipEscaner = $("#txtDireccionIPEscaner");

			$.ajax({
						url : "./guardarEscaner",
						type : "POST",
						dataType : "json",
						data : {
							codigoEscaner : codigoEscaner.val(),
							marca : marca.val(),
							modelo : modelo.val(),
							serie : serie.val(),
							ipEscaner : ipEscaner.val(),
							ipUser : ipUser,
							codigoProyecto : $("#cboProyecto").val(),
							codigoEmpresa : $("#cboEmpresa").val()
						}
					})
					.done(
							function(paramJson) {
								if (paramJson.estadoRespuesta == 'OK') {
									limpiarTextEscaner();
									callNotification(
											'success',
											'Se ha guardado satisfactoriamente los datos del Escaner',
											'Correcto');
									document.getElementById("divEscaner").style.display = "none";
									var lstEscaner = JSON
											.parse(paramJson.parametros.lstEscaner);
									loadTableEscaner(lstEscaner);

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

		function modificarEscaner() {
			var codigoEscaner = $('input[name="filaEsca"]:checked');
			if (codigoEscaner.val() != null) {
				$
						.ajax({
							url : "./modificarEscaner",
							type : "POST",
							dataType : "json",
							data : {
								codigoEscaner : codigoEscaner.val(),
								codigoEmpresa : $("#cboEmpresa").val(),
								codigoProyecto : $("#cboProyecto").val()
							}
						})
						.done(
								function(paramJson) {
									if (paramJson.estadoRespuesta == 'OK') {
										document.getElementById("divEscaner").style.display = "inline";
										document.getElementById("txtIdEscaner").disabled = true;
										document.getElementById("txtIdEscaner").value = codigoEscaner
												.val();
										document.getElementById("txtMarca").value = paramJson.parametros.marca;
										document.getElementById("txtModelo").value = paramJson.parametros.modelo;
										document.getElementById("txtSerie").value = paramJson.parametros.serie;
										document
												.getElementById("txtDireccionIPEscaner").value = paramJson.parametros.ipEscaner;

										escaTemp = paramJson.parametros.serie;
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
						'info',
						"Debe seleccionar un registro de la grilla, por favor verifique",
						'Informaci&oacute;n');
			}
		}

		getIPs(function(ip) {
			console.log(ip);
			ipUser = ip;
		});
	</script>

</body>
</html>