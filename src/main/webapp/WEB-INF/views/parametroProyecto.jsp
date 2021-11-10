<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html class="fixed">
<head>

<!-- Librerias cabecera:start -->
<jsp:include page="plantillas/libreriasCabecera.jsp" />
<!-- Librerias cabecera:end -->

<style type="text/css">
.iframe-container {
	padding-bottom: 60%;
	padding-top: 30px;
	height: 0;
	overflow: hidden;
}

.iframe-container iframe, .iframe-container object, .iframe-container embed
	{
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}
</style>

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

					<h2>PAR&Aacute;METROS DE GESTI&Oacute;N DEL PROYECTO</h2>
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li><a href="#"> <i class="fa fa-home"></i>
							</a></li>
							<li><span>Par&aacute;metros de Gesti&oacute;n del
									Proyecto</span></li>
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

							<div class="panel-body"
								style="padding-bottom: 15px; padding-top: 8px;">
								<div class="form-group">
									<label class="col-md-2 control-label">TIPO DE DOCUMENTO</label>
									<div class="col-md-3" style="width: 75%;">
										<select id="cboTipoDocumento" name="cboTipoDocumento"
											class="form-control" onchange="cambiarTipoDocumento();">
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
								<header class="panel-heading">
									<h2 class="panel-title">PROYECCI&Oacute;N DE DEMANDA DE DIGITALIZACIONES</h2>
								</header>
								<div class="tabs">
									<ul class="nav nav-tabs nav-justify">
										<li class="active"><a href="#w2-demanda"
											data-toggle="tab" class="text-center"> <span
												class="badge hidden-xs">1</span> PROYECCI&Oacute;N DE
												DEMANDA
										</a></li>
										<li><a href="#w2-recepcion" data-toggle="tab"
											class="text-center"> <span class="badge hidden-xs">2</span>
												PROYECCI&Oacute;N DE RECEPCI&Oacute;N
										</a></li>
										<li><a href="#w2-entrega" data-toggle="tab"
											class="text-center"> <span class="badge hidden-xs">3</span>
												PROYECCI&Oacute;N DE ENTREGA
										</a></li>
									</ul>
									<form class="form-horizontal" novalidate="novalidate" id="frm"
										name="frm" method="post">

										<div class="tab-content">
											<div id="w2-demanda" class="tab-pane active">

												<div class="col-sm-12">
													<div class="panel-body">
														<div class="form-group">
															<label class="col-sm-3">UNIDAD DE MEDIDA</label>
															<div class="col-sm-2"></div>


															<label class="col-sm-3">CICLO DE
																PRODUCCI&Oacute;N MENSUAL</label>
															<div class="col-sm-4"></div>

														</div>
													</div>
												</div>

												<section class="panel animated fadeInRight">
													<div class="col-sm-5">

														<div class="panel-body">
															<div class="form-group">
																<label class="col-sm-4 col-md-4 control-label"
																	style="text-align: left;" for="cboLote">LOTE</label>
																<div class="col-sm-7 col-md-5 divCboLote">
																	<select id="cboLote" name="cboLote"
																		class="form-control">
																	</select>
																</div>
																<div class="col-sm-5 col-md-3">
																	<input class="btn btn-sm btn-primary width-default"
																		id="btnNuevaUniMed" name="btnNuevaUniMed"
																		type="button" onclick="nuevoUnidadMed();"
																		value="NUEVA UNIDAD MEDIDA" />
																</div>
															</div>

															<div class="form-group">
																<label class="col-sm-4 col-md-4 control-label"
																	style="text-align: left;" for="cboSubLote">SUBLOTE</label>
																<div class="col-sm-7 col-md-5 divCboSubLote">
																	<select id="cboSubLote" name="cboSubLote"
																		class="form-control">
																	</select>
																</div>
															</div>

															<div class="form-group">
																<label class="col-sm-6 col-md-4 control-label"
																	style="text-align: left;" for="txtDuracionProy">DURACI&Oacute;N
																	DEL PROYECTO</label>
																<div class="col-sm-6 col-md-4">
																	<div style="padding-left: 0px;">
																		<input type="text" id="txtDuracionProy"
																			name="txtDuracionProy"
																			class="form-control soloNumeros" maxlength="3" />
																	</div>
																</div>
																<label class="col-sm-2 col-md-4 control-label"
																	style="text-align: left;" for="txtDuracionProy">MESES</label>
															</div>

															<div class="form-group">
																<label class="col-sm-6 col-md-4 control-label"
																	style="text-align: left;" for="txtProyectada">META
																	TOTAL PROYECTADA</label>
																<div class="col-sm-6 col-md-4">
																	<div style="padding-left: 0px;">
																		<input type="text" id="txtProyectada"
																			name="txtProyectada" class="form-control soloNumeros"
																			maxlength="8" />
																	</div>
																</div>
																<label class="col-sm-2 col-md-4 control-label"
																	style="text-align: left;" for="txtProyectada">IM&Aacute;GENES</label>
															</div>

														</div>

													</div>

													<div class="col-sm-7">
														<div class="panel-body">
															<div class="form-group">
																<label class="col-sm-2 col-md-2 control-label"
																	style="text-align: left;" for="fecInicio">FEC
																	INICIO</label>
																<div class="col-sm-4 col-md-4">
																	<div class="input-group">
																		<span class="input-group-addon"> <i
																			class="fa fa-calendar"></i>
																		</span> <input type="text" class="form-control"
																			id="fecInicio">
																	</div>
																</div>
																<label class="col-sm-2 col-md-2 control-label"
																	style="text-align: left;" for="fecFin">FEC FIN</label>
																<div class="col-sm-4 col-md-4">
																	<div class="input-group">
																		<span class="input-group-addon"> <i
																			class="fa fa-calendar"></i>
																		</span> <input type="text" class="form-control" id="fecFin">
																	</div>
																</div>
															</div>

															<div class="form-group">
																<div class="col-sm-6">
																	<div class="form-group">
																		<label class="col-sm-2 col-md-6 control-label"
																			style="text-align: left;">CANTIDAD DE TURNOS POR DÍA</label>
																		<div class="col-sm-6 col-md-6">
																			<div style="padding-left: 0px;">
																				<select id="cboTurnos" name="cboTurnos"
																					class="form-control">
																					<option value="0" selected>SELECCIONAR</option>
																					<option value="1">1</option>
																					<option value="2">2</option>
																					<option value="3">3</option>
																				</select>
																			</div>
																		</div>
																	</div>
																</div>

																<div class="col-sm-5">
																	<div class="form-group">
																		<div class="form-group">
																			<label class="col-sm-7 control-label"
																				style="text-align: left;">DIAS LABORABLES AL
																				MES</label>
																			<div class="col-sm-5">
																				<input type="text" id="txtDiasLab" name="txtDiasLab" maxlength="2"
																					class="form-control soloNumeros" />
																			</div>
																		</div>

																		<div class="form-group">
																			<label class="col-sm-7 control-label"
																				style="text-align: left;">HORAS LABORABLES POR
																				TURNO</label>
																			<div class="col-sm-5">
																				<input type="text" id="txtHorasLab" maxlength="4"
																					name="txtHorasLab" class="form-control soloNumeros" />
																			</div>
																		</div>

																		<div class="form-group">
																			<label class="col-sm-7 control-label"
																				style="text-align: left;">COSTO POR IMAGEN</label>
																			<div class="col-sm-5">
																				<input type="text" id="txtCosto" name="txtCosto"
																					class="form-control soloNumeros" />
																			</div>
																		</div>


																	</div>
																</div>
															</div>

														</div>
													</div>
												</section>
											</div>




											<div id="w2-recepcion" class="tab-pane">
												<div class="col-sm-12" style="padding-bottom: 15px;">
													<section class="panel animated fadeInRight">
														<div class="panel-body">
															<div class="form-group">
																<label class="col-sm-1 col-md-1 control-label"
																	style="text-align: right;" for="fecMesRecep">MES</label>
																<div class="col-sm-2 col-md-2">
																	<div class="input-group">
																		<span class="input-group-addon"> <i
																			class="fa fa-calendar"></i>
																		</span> <input type="text" class="form-control"
																			id="fecMesRecep">
																	</div>
																</div>
																<label class="col-sm-1 col-md-1 control-label"
																	style="text-align: right;" for="fecAnoRecep">A&Ntilde;O</label>
																<div class="col-sm-2 col-md-2">
																	<div class="input-group">
																		<span class="input-group-addon"> <i
																			class="fa fa-calendar"></i>
																		</span> <input type="text" id="fecAnoRecep"
																			class="form-control">
																	</div>
																</div>

																<label class="col-sm-2 col-md-2 control-label"
																	style="text-align: right;" for="txtMeta">META
																	MENSUAL</label>
																<div class="col-sm-2 col-md-2">
																	<div style="padding-left: 0px;">
																		<input type="text" id="txtMeta" name="txtMeta"
																			class="form-control soloNumeros" />
																	</div>
																</div>
																<label class="col-sm-1 col-md-1 control-label"
																	style="text-align: left;" for="txtMetaRecep">IM&Aacute;GENES</label>
																<a class="btn btn-danger"
																	onclick="agregarProyeccionRecep();"><i
																	class="fa fa-plus"></i></a>
															</div>

															<div class="form-group">
																<div id="tabla">
																	<table id="tblProyRecep"
																		class="table table-bordered table-striped mb-none">
																		<thead>
																			<tr>
																				<th class="text-center" style="width: 10%;">N.</th>
																				<th class="text-center" style="width: 25%;">MES</th>
																				<th class="text-center" style="width: 0%; display: none;" >NUMERO MES</th>
																				<th class="text-center" style="width: 25%;">A&Ntilde;O</th>
																				<th class="text-center" style="width: 25%;">META</th>
																				<th class="text-center" style="width: 15%;">ACCI&Oacute;N</th>
																			</tr>
																		</thead>
																	</table>
																</div>
															</div>

															<div class="form-group">
																<label class="col-sm-6 col-md-10 control-label"
																	style="text-align: right;" for="txtMeta">TOTAL
																	RECIBIDOS</label>
																<div class="col-sm-6 col-md-2">
																	<div style="padding-left: 0px;">
																		<input type="text" id="txtTotalRecep"
																			disabled="disabled" name="txtTotalRecep"
																			class="form-control soloNumeros" />
																	</div>
																</div>
															</div>

															<div class="form-group">
																<label class="col-sm-6 col-md-3 control-label"
																	style="text-align: left;" for="txtMeta">FRECUENCIA
																	DE RECEPCI&Oacute;N</label>
																<div class="col-sm-6 col-md-4">
																	<div style="padding-left: 0px;">
																		<select id="cboFrecuencia" name="cboFrecuencia"
																			class="form-control">
																			<option value="0" selected>SELECCIONAR</option>
																			<option value="1">DIARIA</option>
																			<option value="2">SEMANAL</option>
																			<option value="3">QUINCENAL</option>
																			<option value="4">MENSUAL</option>
																			<option value="5">TRIMESTRAL</option>
																			<option value="6">SEMESTRAL</option>
																			<option value="7">ANUAL</option>
																		</select>
																	</div>
																</div>
															</div>

															<div class="form-group">
																<label class="col-sm-6 col-md-3 control-label"
																	style="text-align: left;" for="txtMeta">CANTIDAD
																	A RECIBIR</label>
																<div class="col-sm-6 col-md-4">
																	<div style="padding-left: 0px;">
																		<input type="text" id="txtCantidadRecep"
																			name="txtCantidadRecep"
																			class="form-control soloNumeros" />
																	</div>
																</div>
															</div>

														</div>
													</section>
												</div>
											</div>






											<div id="w2-entrega" class="tab-pane">
												<div class="col-sm-12" style="padding-bottom: 15px;">
													<section class="panel animated fadeInRight">
														<div class="panel-body">
															<div class="form-group">
																<label class="col-sm-1 col-md-1 control-label"
																	style="text-align: right;" for="fecMesEntre">MES</label>
																<div class="col-sm-2 col-md-2">
																	<div class="input-group">
																		<span class="input-group-addon"> <i
																			class="fa fa-calendar"></i>
																		</span> <input type="text" class="form-control"
																			id="fecMesEntre">
																	</div>
																</div>
																<label class="col-sm-1 col-md-1 control-label"
																	style="text-align: right;" for="fecAnoEntre">A&Ntilde;O</label>
																<div class="col-sm-2 col-md-2">
																	<div class="input-group">
																		<span class="input-group-addon"> <i
																			class="fa fa-calendar"></i>
																		</span> <input type="text" class="form-control"
																			id="fecAnoEntre">
																	</div>
																</div>

																<label class="col-sm-2 col-md-2 control-label"
																	style="text-align: right;" for="txtMetaEntre">META
																	MENSUAL</label>
																<div class="col-sm-2 col-md-2">
																	<div style="padding-left: 0px;">
																		<input type="text" id="txtMetaEntre"
																			name="txtMetaEntre" class="form-control soloNumeros" />
																	</div>
																</div>
																<label class="col-sm-1 col-md-1 control-label"
																	style="text-align: left;" for="txtDuracionProy">IM&Aacute;GENES</label>
																<a class="btn btn-danger"
																	onclick="agregarProyeccionEntre();"><i
																	class="fa fa-plus"></i></a>
															</div>

															<div class="form-group">
																<div id="tabla">
																	<table id="tblProyEntre"
																		class="table table-bordered table-striped mb-none">
																		<thead>
																			<tr>
																				<th class="text-center" style="width: 10%;">N.</th>
																				<th class="text-center" style="width: 25%;">MES</th>
																				<th class="text-center" style="width: 0%; display: none;">NUMERO MES</th>
																				<th class="text-center" style="width: 25%;">A&Ntilde;O</th>
																				<th class="text-center" style="width: 25%;">META</th>
																				<th class="text-center" style="width: 15%;">ACCI&Oacute;N</th>
																			</tr>
																		</thead>
																	</table>
																</div>
															</div>

															<div class="form-group">
																<label class="col-sm-6 col-md-10 control-label"
																	style="text-align: right;" for="txtMeta">TOTAL
																	ENTREGADOS</label>
																<div class="col-sm-6 col-md-2">
																	<div style="padding-left: 0px;">
																		<input type="text" id="txtTotalEntre"
																			disabled="disabled" name="txtTotalEntre"
																			class="form-control soloNumeros" />
																	</div>
																</div>
															</div>

															<div class="form-group">
																<label class="col-sm-6 col-md-4 control-label"
																	style="text-align: left;" for="txtMetaEntre">FRECUENCIA
																	DE ENTREGA</label>
																<div class="col-sm-6 col-md-4">
																	<div style="padding-left: 0px;">
																		<select id="cboFrecuenciaEntre"
																			name="cboFrecuenciaEntre" class="form-control">
																			<option value="0" selected>SELECCIONAR</option>
																			<option value="1">DIARIA</option>
																			<option value="2">SEMANAL</option>
																			<option value="3">QUINCENAL</option>
																			<option value="4">MENSUAL</option>
																			<option value="5">TRIMESTRAL</option>
																			<option value="6">SEMESTRAL</option>
																			<option value="7">ANUAL</option>
																		</select>
																	</div>
																</div>
															</div>

															<div class="form-group">
																<label class="col-sm-6 col-md-4 control-label"
																	style="text-align: left;" for="txtMetaEntre">CANTIDAD
																	A ENTREGAR</label>
																<div class="col-sm-6 col-md-4">
																	<div style="padding-left: 0px;">
																		<input type="text" id="txtCantidadEntre"
																			name="txtCantidadEntre"
																			class="form-control soloNumeros" />
																	</div>
																</div>
															</div>

														</div>
													</section>
												</div>
											</div>

										</div>
									</form>
								</div>
							</div>
						</section>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 animated fadeInRight"
						style="text-align: center;">
						<input id="btnGuardar" class="btn btn-sm btn-primary"
							type="button" onclick="validarCampos();"
							value="GUARDAR CONFIGURACI&Oacute;N " />
					</div>
				</div>
			</section>

			<!-- MODAL NUEVA UNIDAD MEDIDA -->
			<div class="modal fade" tabindex="-1" role="dialog"
				aria-labelledby="mySmallModalLabel" aria-hidden="true"
				id="modalUnidadMedida">
				<div class="modal-block modal-block-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">UNIDAD DE MEDIDA</h4>
						</div>

						<div class="modal-header">
							<section class="panel animated fadeInRight">
								<div class="panel-body">
									<div class="form-group">
										<label class="col-sm-4 control-label"> C&Oacute;DIGO <span
											class="required">*</span></label>
										<div class="col-sm-8">
											<input type="text" id="txtCodigo" name="txtCodigo"
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label"> UNIDAD DE
											MEDIDA <span class="required">*</span>
										</label>
										<div class="col-sm-8">
											<input type="text" id="txtNombre" name="txtNombre"
												class="form-control" maxlength="30"
												onkeydown="upperCase(this)"
												title="Favor, Ingresar una Unidad de Medida" required />
										</div>
									</div>
								</div>
								<footer class="panel-footer">
									<div class="row">
										<div class="center">
											<button type="button" class="btn btn-primary"
												onclick="guardarUnidad();">GUARDAR</button>
											<button type="button" class="btn btn-primary"
												onclick="cerrarModalUnidad();">CANCELAR</button>
										</div>
									</div>
								</footer>
							</section>
						</div>
					</div>
				</div>
			</div>

			<div class="modal fade" tabindex="-1" role="dialog"
				aria-labelledby="mySmallModalLabel" aria-hidden="true"
				id="modalGuardar">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">&iquest;Desea registrar
								la configuraci&oacute;n del par&aacute;metro de gesti&oacute;n?</h4>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								onclick="guardarParametro();">Si</button>
							<button type="button" class="btn btn-primary"
								onclick="cerrarModal();">No</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>

	<!-- END: PAGE -->

	<jsp:include page="plantillas/footer.jsp" />

	</section>


	</div>

	<!-- START: sidebar-->

<%-- 	<jsp:include page="plantillas/sidebar.jsp" /> --%>

	<!-- END: sidebar-->

	</section>


	<!-- START: LIB JS FOOTER-->
	<jsp:include page="plantillas/libreriasPie.jsp" />
	<!-- END: LIB JS FOOTER-->



	<script type="text/javascript">
		var ipUser = null;
		var totalTurnos = 0;
		var accion = null;
	
		$(document).ready(function() {
			inicializarVariables();
			cargarComponentes();
			
			$(".soloNumeros").keydown(function (e) {
		           // Permite: backspace, delete, tab, escape, enter and .
		           if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
		               // Permite: Ctrl+A
		               (e.keyCode == 65 && e.ctrlKey === true) ||
		               // Permite: home, end, left, right
		               (e.keyCode >= 35 && e.keyCode <= 39)) {
		               // solo permitir lo que no este dentro de estas condiciones es un return false
		               return;
		           }
		           // Aseguramos que son numeros
		           if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
		               e.preventDefault();
		           }
		       });

		});

		function inicializarVariables() {
			cboEmpresa = $('#cboEmpresa');
			cboProyecto = $('#cboProyecto');
			cboTipoDocumento = $('#cboTipoDocumento');
			cboLote = $('#cboLote');
			cboSubLote = $('#cboSubLote');
			$("#cboTurnos").val(totalTurnos);

			$('#tblProyRecep').DataTable({
				"scrollY" : "180px",
				"scrollCollapse" : true,
				"paging" : false,
				"searching" : false,
				"info" : false,
				select : 'single'
			});

			$('#tblProyEntre').DataTable({
				"scrollY" : "180px",
				"scrollCollapse" : true,
				"paging" : false,
				"searching" : false,
				"info" : false,
				select : 'single'
			});
			
			$('#fecInicio').datepicker({
				format: 'dd/mm/yyyy',
				language : 'es',
				autoclose : true
			});
			
			$('#fecFin').datepicker({
				format: 'dd/mm/yyyy',
				language : 'es',
				autoclose : true
			});

			$('#fecMesRecep').datepicker({
				format : "MM",
				startView : "months",
				minViewMode : "months",
				autoclose : true,
				language : 'es'
			});

			$('#fecAnoRecep').datepicker({
				format : 'yyyy',
				viewMode : 'years',
				minViewMode : 'years',
				autoclose : true
			});

			$('#fecMesEntre').datepicker({
				format : "MM",
				startView : "months",
				minViewMode : "months",
				autoclose : true,
				language : 'es'
			});

			$('#fecAnoEntre').datepicker({
				format : 'yyyy',
				viewMode : 'years',
				minViewMode : 'years',
				autoclose : true
			});
		}

		function cargarComponentes() {
			$.ajax({
				url : "./cargarComponentesParam",
				type : "POST",
				dataType : "json"
			}).done(
					function(paramJson) {
						if (paramJson.estadoRespuesta == 'OK') {
							var lstEmpresa = JSON
									.parse(paramJson.parametros.lstEmpresa);

							loadComboEmpresa(lstEmpresa);
							loadComboProyecto(null);
							loadComboTipoDocumento(null);
							var lstUnidadMed = JSON.parse(paramJson.parametros.lstUnidadMed);
							loadComboLote(lstUnidadMed);
							loadComboSubLote(lstUnidadMed);
							
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

		function loadComboTipoDocumento(lista) {
			var listTipoDocu = lista;
			cboTipoDocumento = $('#cboTipoDocumento');
			cboTipoDocumento.empty();
			if (listTipoDocu == null) {
				cboTipoDocumento.append($("<option/>").attr("value", "").text(
						"Seleccionar"));
			} else {
				cboTipoDocumento.append($("<option/>").attr("value", "").text(
						"Seleccionar"));
				$.each(listTipoDocu, function(i, item) {
					cboTipoDocumento.append($("<option/>").attr("value",
							listTipoDocu[i].codigo.codigoTipoDocumento).text(
							listTipoDocu[i].tipoDocumento.nombre));
				});
			}
		}
		
		function loadComboLote(lista){
			var listLote = lista;
			cboLote = $('#cboLote');
			cboLote.empty();
			if (listLote == null) {
				cboLote.append($("<option/>").attr("value", "").text("Seleccionar"));
			} else {
				cboLote.append($("<option/>").attr("value", "").text("Seleccionar"));
				$.each(listLote, function(i, item) {
					cboLote.append($("<option/>").attr("value",
							listLote[i].codigo).text(listLote[i].nombre));
				});
			}
		}
		
		function loadComboSubLote(lista){
			var listSubLote = lista;
			cboSubLote = $('#cboSubLote');
			cboSubLote.empty();
			if (listSubLote == null) {
				cboSubLote.append($("<option/>").attr("value", "").text("Seleccionar"));
			} else {
				cboSubLote.append($("<option/>").attr("value", "").text("Seleccionar"));
				$.each(listSubLote, function(i, item) {
					cboSubLote.append($("<option/>").attr("value",
							listSubLote[i].codigo).text(listSubLote[i].nombre));
				});
			}
		}

		function cambiarEmpresa() {
			var cboEmpresa = $("#cboEmpresa");

			$.ajax({
				url : "./cambiarEmpresaParam",
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
							loadComboTipoDocumento(null);
							
						} else {
							callNotification('error',
									paramJson.mensajeRespuesta, 'Error');
						}
					}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
			});
		}

		function cambiarProyecto() {
			var cboEmpresa = $("#cboEmpresa");
			var cboProyecto = $("#cboProyecto");

			$.ajax({
					url : "./cambiarProyectoParam",
					type : "POST",
					dataType : "json",
					data : {
							codigoEmpresa : cboEmpresa.val(),
							codigoProyecto : cboProyecto.val()
						}
					})
					.done(
							function(paramJson) {
								if (paramJson.estadoRespuesta == 'OK') {

									var lstTipoDocumento = JSON
											.parse(paramJson.parametros.lstTipoDocumento);
									loadComboTipoDocumento(lstTipoDocumento);

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

		function cambiarTipoDocumento() {
			var cboEmpresa = $("#cboEmpresa");
			var cboProyecto = $("#cboProyecto");
			var cboTipoDocumento = $("#cboTipoDocumento");

			$.ajax({
				url : "./cambiarTipoDocumentoParam",
				type : "POST",
				dataType : "json",
				data : {
					codigoEmpresa : cboEmpresa.val(),
					codigoProyecto : cboProyecto.val(),
					codigoTipoDocumento : cboTipoDocumento.val()
				}
			}).done(
					function(paramJson) {
						if (paramJson.estadoRespuesta == 'OK') {

							var lstParam = JSON.parse(paramJson.parametros.lstParam);
							if(lstParam !=null && lstParam.length > 0){
								$("#txtDuracionProy").val(lstParam[0].duracionProyecto);
								$("#txtProyectada").val(lstParam[0].metaAnual);
								
								$("#fecInicio").datepicker("setDate", lstParam[0].inicioCiclo);
								$("#fecFin").datepicker("setDate", lstParam[0].finCiclo);
								$("#txtDiasLab").val(lstParam[0].diasLaborados);
								$("#txtHorasLab").val(lstParam[0].horasLaboradas);
								$("#txtCosto").val(lstParam[0].costoImagen);
								$("#cboTurnos").val(lstParam[0].turnos);
								
								$("#cboFrecuencia").val(lstParam[0].frecuenciaRecep);
								$("#txtCantidadRecep").val(lstParam[0].cantidadRecep);
								$("#txtCantidadEntre").val(lstParam[0].cantidadEntre);
								$("#cboFrecuenciaEntre").val(lstParam[0].frecuenciaEntre);
								
								$("div.divCboLote select").val(lstParam[0].unidadLote.codigo);
								$("div.divCboSubLote select").val(lstParam[0].unidadSubLote.codigo);	
								accion = "modificar";
							}else{
								accion = "guardar";
							}
							var lstParamRece = JSON.parse(paramJson.parametros.lstParamRece);
							loadTableRecepcion(lstParamRece);
							$("#txtTotalRecep").val(paramJson.parametros.metaTotalRecep);
							
							var lstParamEntre = JSON.parse(paramJson.parametros.lstParamEntre);
							loadTableEntrega(lstParamEntre);
							$("#txtTotalEntre").val(paramJson.parametros.metaTotalEntre);

						} else {
							callNotification('error',
									paramJson.mensajeRespuesta, 'Error');
						}
					}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
			});
		}
		
		function convertirNumeroAMes(numero){
			if(numero=="01") return "Enero";
			if(numero=="02") return "Febrero";
			if(numero=="03") return "Marzo";
			if(numero=="04") return "Abril";
			if(numero=="05") return "Mayo";
			if(numero=="06") return "Junio";
			if(numero=="07") return "Julio";
			if(numero=="08") return "Agosto";
			if(numero=="09") return "Septiembre";
			if(numero=="10") return "Octubre";
			if(numero=="11") return "Noviembre";
			if(numero=="12") return "Diciembre";
		}

		function loadTableRecepcion(lista){
			$('#tblProyRecep').dataTable().fnClearTable();
			var tblProyRecep = $('#tblProyRecep').DataTable();
			if(lista != null){
				$.each(lista, function(i, obj) {
					var jsonEncode = encodeURIComponent(JSON.stringify(obj));
					var rowNode = tblProyRecep.row.add([
						i+1,
						convertirNumeroAMes(obj.mesRecepcion),
						obj.numMesRecepcion,
						obj.anhoRecepcion,
						obj.metaMensRecepcion,
						'<a class="delete-row"><i class="fa fa-trash-o" onclick="quitarProyeccionRecep(\''+jsonEncode+'\');"></i></a>'
					]).draw(false).node();

					// Centrando columnas seleccion y codigo
					$(rowNode).find('td').each(function(index, td) {
						if(index == 0 || index == 1 || index == 3 || index == 4 || index == 5){
							$(td).addClass('text-center');
						}
						if(index == 2){
							$(td).css('display','none');
						}
					});
					var table = $('#tblProyRecep').DataTable();
					table.order( [ 2, 'asc' ], [ 3, 'asc' ] ).draw();
				});
			}
		}
		
		function loadTableEntrega(lista){
			$('#tblProyEntre').dataTable().fnClearTable();
			var tblProyEntre = $('#tblProyEntre').DataTable();
			if(lista != null){
				$.each(lista, function(i, obj) {
					var jsonEncode = encodeURIComponent(JSON.stringify(obj));
					var rowNode = tblProyEntre.row.add([ 
							i+1,
							convertirNumeroAMes(obj.mesEntrega),
							obj.numMesEntrega,
							obj.anhoEntrega,
							obj.metaMensEntrega,
							'<a class="delete-row"><i class="fa fa-trash-o" onclick="quitarProyeccionEntre(\''+jsonEncode+'\');"></i></a>'
						]).draw(false).node();
					
					// Centrando columnas seleccion y codigo
					$(rowNode).find('td').each(function(index, td) {
						if(index == 0 || index == 1 || index == 3 || index == 4 || index == 5){
							$(td).addClass('text-center');
						}
						if(index == 2){
							$(td).css('display','none');
						}
		        	});
					var table = $('#tblProyEntre').DataTable();
					table.order( [ 2, 'asc' ], [ 3, 'asc' ] ).draw();
				});
			}
		}
		
		function sumar(cant){
			totalTurnos = totalTurnos + cant;
			$("#cboTurnos").val(totalTurnos);
		}
		
		function restar(cant){
			totalTurnos = totalTurnos - cant;
			$("#cboTurnos").val(totalTurnos);
		}
		
		function agregarProyeccionRecep(){
			
			var anho = $('#fecAnoRecep');
			var mes = $('#fecMesRecep');
			var meta = $('#txtMeta');
			var mensaje = "Debe ingresar A&ntilde;o, Mes y Meta mensual, por favor verifique";
			
			if(anho.val() == ""){
				callNotification('notice', mensaje, 'Alerta');
				return;
			}
			if(mes.val() == ""){
				callNotification('notice', mensaje, 'Alerta');
				return;
			}
			if(meta.val() == ""){
				callNotification('notice', mensaje, 'Alerta');
				return;
			}
			
			$.ajax({
				url : "./agregarProyeccionRecep",
				type : "POST",
				dataType : "json",
				data : {
					anho : anho.val(),
					mes : mes.val(),
					meta : meta.val()
				}
			}).done(
					function(paramJson) {
						if (paramJson.estadoRespuesta == 'OK') {

							var lstRecep = JSON.parse(paramJson.parametros.lstRecep);
							loadTableRecepcion(lstRecep);
							
							$("#txtTotalRecep").val(paramJson.parametros.total);

						} else {
							callNotification('error',	paramJson.mensajeRespuesta, 'Error');
						}
			}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
			});
			
		}
		
		function quitarProyeccionRecep(obj){
			var data = JSON.parse(decodeURIComponent(obj));
			var total = $("#txtTotalRecep");
			$.ajax({
				url : "./quitarProyeccionRecep",
				type : "POST",
				dataType : "json",
				data : {
					anho : data.anhoRecepcion,
					mes : data.mesRecepcion,
					meta : data.metaMensRecepcion,
					total : total.val()
				}
			}).done(
					function(paramJson) {
						if (paramJson.estadoRespuesta == 'OK') {
							var lstRecep = JSON.parse(paramJson.parametros.lstRecep);
							loadTableRecepcion(lstRecep);
							$("#txtTotalRecep").val(paramJson.parametros.total);
						} else {
							callNotification('error',	paramJson.mensajeRespuesta, 'Error');
						}
			}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
			});
		}
		
		
		// PROYECCION DE ENTREGA
		function agregarProyeccionEntre(){
			
			var anho = $('#fecAnoEntre');
			var mes = $('#fecMesEntre');
			var meta = $('#txtMetaEntre');
			var mensaje = "Debe ingresar A&ntilde;o, Mes y Meta mensual, por favor verifique";
			
			if(anho.val() == ""){
				callNotification('notice', mensaje, 'Alerta');
				return;
			}
			if(mes.val() == ""){
				callNotification('notice', mensaje, 'Alerta');
				return;
			}
			if(meta.val() == ""){
				callNotification('notice', mensaje, 'Alerta');
				return;
			}
			
			$.ajax({
				url : "./agregarProyeccionEntre",
				type : "POST",
				dataType : "json",
				data : {
					anho : anho.val(),
					mes : mes.val(),
					meta : meta.val()
				}
			}).done(
					function(paramJson) {
						if (paramJson.estadoRespuesta == 'OK') {
							var lstEntre = JSON.parse(paramJson.parametros.lstEntre);
							loadTableEntrega(lstEntre);
							$("#txtTotalEntre").val(paramJson.parametros.total);

						} else {
							callNotification('error',	paramJson.mensajeRespuesta, 'Error');
						}
			}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
			});
			
		}
		
		function quitarProyeccionEntre(obj){
			var data = JSON.parse(decodeURIComponent(obj));
			var total = $("#txtTotalEntre");
			$.ajax({
				url : "./quitarProyeccionEntre",
				type : "POST",
				dataType : "json",
				data : {
					anho : data.anhoEntrega,
					mes : data.mesEntrega,
					meta : data.metaMensEntrega,
					total : total.val()
				}
			}).done(
					function(paramJson) {
						if (paramJson.estadoRespuesta == 'OK') {
							var lstEntre = JSON.parse(paramJson.parametros.lstEntre);
							loadTableEntrega(lstEntre);
							$("#txtTotalEntre").val(paramJson.parametros.total);
						} else {
							callNotification('error',	paramJson.mensajeRespuesta, 'Error');
						}
			}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
			});
		}
		
		function nuevoUnidadMed(){
			$.ajax({
				url : "/gsdimage-web/parametro/nuevoUnidadMed",
				type : "POST",
				dataType : "json",
				data : {}
			})
			.done(
				function(paramJson) {
					if (paramJson.estadoRespuesta == 'OK') {
						$("#modalUnidadMedida").modal('show');
						document.getElementById("txtCodigo").disabled = true;
						var secuencial = paramJson.parametros.seq;
						document.getElementById("txtCodigo").value = secuencial;
					} else {
						$("#modalTipoImagen").modal('hide');
						callNotification('error', paramJson.mensajeRespuesta, 'Error');
					}
				})
			.fail(
				function(jqXHR, textStatus, errorThrown) {
					alert("error" + errorThrown + ", " + jqXHR	+ "," + textStatus);
				});
			
		}
		
		function guardarUnidad(){
			var codigo = document.getElementById("txtCodigo");
			var nombre = document.getElementById("txtNombre");
			$.ajax({
				url : "/gsdimage-web/parametro/guardarUnidadMed",
				type : "POST",
				dataType : "json",
				data : {
					codigo : codigo.value,
					nombre : nombre.value,
					ipUser : ipUser
				}
			})
			.done(
				function(paramJson) {
					if (paramJson.estadoRespuesta == 'OK') {
						var lstUnidadMed = JSON.parse(paramJson.parametros.lstUnidadMed);
						loadComboLote(lstUnidadMed);
						loadComboSubLote(lstUnidadMed);
						document.getElementById("txtNombre"),value = "";
						$("#modalUnidadMedida").modal('hide');
					} else {
						callNotification('error', paramJson.mensajeRespuesta, 'Error');
					}
			}).fail(
			function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR
						+ "," + textStatus);
			});
		}
		
		function cerrarModalUnidad(){
			$("#modalUnidadMedida").modal('hide');
		}
		
		function alertaValidacion(){
			var mensajeError = "Todos los campos de configuraci&oacute;n de los par&aacute;metros del proyecto son obligatorios, por favor verifique";
			callNotification('notice', mensajeError , 'Alerta');
		}

		function diffMonth(date1, date2) {
			var timeDiff = Math.abs(date2.getTime() - date1.getTime());
			var diffMonths = Math.ceil(timeDiff / (1000 * 3600 * 24 * 28));
			return diffMonths;
		}
		
		function validarCampos(){
			var cboEmpresa = $('#cboEmpresa');
			var cboProyecto = $('#cboProyecto');
			var cboTipoDocumento = $('#cboTipoDocumento');
			
			if(cboEmpresa.val() == ""){
				callNotification('notice', "Debe seleccionar una Empresa, por favor verifique", 'Alerta');
				return;
			}
			if(cboProyecto.val() == ""){
				callNotification('notice', "Debe seleccionar un Proyecto, por favor verifique", 'Alerta');
				return;
			}
			if(cboTipoDocumento.val() == ""){
				callNotification('notice', "Debe seleccionar un Tipo de Documento, por favor verifique", 'Alerta');
				return;
			}
			
			var metaTotal = $('#txtProyectada');
			var totalRecep = $('#txtTotalRecep');
			var totalEntre = $('#txtTotalEntre');
			
			if(parseInt(metaTotal.val())  != parseInt(totalRecep.val()) || parseInt(metaTotal.val())  != parseInt(totalEntre.val())){
				callNotification('notice', "La suma de la distribuci&oacute;n mensual debe ser igual a la Meta Proyectada, por favor verifique", 'Alerta');
				return;
			}
			
			// validaciones 1ra pestana
			var cboLote = $('#cboLote');
			if(cboLote[0].selectedIndex == 0){
				alertaValidacion();
				return;
			}
			
			var cboSubLote = $('#cboSubLote');
			if(cboSubLote[0].selectedIndex == 0){
				alertaValidacion();
				return;
			}
			
			var txtDuracionProy = $('#txtDuracionProy');
			if(txtDuracionProy.val() == ""){
				alertaValidacion();
				return;
			}
			
			if(txtDuracionProy.val() <= 0){
				callNotification('notice', "Debe ingresar una duración del proyecto mayor a 0", 'Alerta');
				return;
			}
			
			var txtProyectada = $('#txtProyectada');
			if(txtProyectada.val() == ""){
				alertaValidacion();
				return;
			}
			
			if(txtProyectada.val() <= 0){
				callNotification('notice', "Debe ingresar una cantidad proyectada mayor a 0", 'Alerta');
				return;
			}
			
			var fecInicio = $('#fecInicio').datepicker("getDate");
			if(fecInicio == ""){
				alertaValidacion();
				return;
			}
			
			var fecFin = $('#fecFin').datepicker("getDate");
			if(fecFin == ""){
				alertaValidacion();
				return;
			}
			
			if(fecInicio > fecFin) {
				callNotification('notice', "La fecha Inicio no puede ser mayor que la fecha de fin de proyecto.", 'Alerta');
				return;
			}
			
			if(txtDuracionProy.val() > diffMonth(fecInicio, fecFin)) {
				callNotification('notice', "Debe ingresar una duración del proyecto dentro del ciclo de producción.", 'Alerta');
				return;
			}
			
			var cboTurnos = $('#cboTurnos');
			if(cboTurnos[0].selectedIndex == 0){
				callNotification('notice', "Debe seleccionar por lo menos un turno.", 'Alerta');
				return;
			}
			
			var txtDiasLab = $('#txtDiasLab');
			if(txtDiasLab.val() == ""){
				alertaValidacion();
				return;
			}
			
			if(txtDiasLab.val() <= 0 || txtDiasLab.val() > 30){
				callNotification('notice', "Debe ingresar una cantidad de días laborables entre 1 y 30", 'Alerta');
				return;
			}
			
			var txtHorasLab = $('#txtHorasLab');
			if(txtHorasLab.val() == ""){
				alertaValidacion();
				return;
			}
			
			if(txtHorasLab.val() <= 0 || txtHorasLab.val() > 7){
				callNotification('notice', "Debe ingresar una cantidad de horas laborables entre 1 y 7", 'Alerta');
				return;
			}
			
			var txtCosto = $('#txtCosto');
			if(txtCosto.val() == ""){
				alertaValidacion();
				return;
			}
			
			if(txtCosto.val() <= 0){
				callNotification('notice', "Debe ingresar un valor del costo mayor a 0", 'Alerta');
				return;
			}
			

			// validaciones 2da pestana
//			var fecMesRecep = $('#fecMesRecep');
//			if(fecMesRecep.val() == ""){
//				alertaValidacion();
//				return;
//			}
			
//			var fecAnoRecep = $('#fecAnoRecep');
//			if(fecAnoRecep.val() == ""){
//				alertaValidacion();
//				return;
//			}
			
//			var txtMeta = $('#txtMeta');
//			if(txtMeta.val() == ""){
//				alertaValidacion();
//				return;
//			}
			
			var txtTotalRecep = $('#txtTotalRecep');
			if(txtTotalRecep.val() == ""){
				alertaValidacion();
				return;
			}
			
			if(txtTotalRecep.val() <= 0){
				callNotification('notice', "Debe ingresar una cantidad total a recepcionar mayor a 0", 'Alerta');
				return;
			}
			
			var cboFrecuencia = $('#cboFrecuencia');
			if(cboFrecuencia[0].selectedIndex == 0){
				alertaValidacion();
				return;
			}
			
			var txtCantidadRecep = $('#txtCantidadRecep');
			if(txtCantidadRecep.val() == ""){
				alertaValidacion();
				return;
			}
			
			if(txtCantidadRecep.val() <= 0){
				callNotification('notice', "Debe ingresar una cantidad a recepcionar mayor a 0", 'Alerta');
				return;
			}
			
			
			// validaciones 3ra pestana
//			var fecMesEntre = $('#fecMesEntre');
//			if(fecMesEntre.val() == ""){
//				alertaValidacion();
//				return;
//			}
			
//			var fecAnoEntre = $('#fecAnoEntre');
//			if(fecAnoEntre.val() == ""){
//				alertaValidacion();
//				return;
//			}
			
//			var txtMetaEntre = $('#txtMetaEntre');
//			if(txtMetaEntre.val() == ""){
//				alertaValidacion();
//				return;
//			}
			
			var txtTotalEntre = $('#txtTotalEntre');
			if(txtTotalEntre.val() == ""){
				alertaValidacion();
				return;
			}
			
			if(txtTotalEntre.val() <= 0){
				callNotification('notice', "Debe ingresar una cantidad total a entregar mayor a 0", 'Alerta');
				return;
			}
			
			var cboFrecuenciaEntre = $('#cboFrecuenciaEntre');
			if(cboFrecuenciaEntre[0].selectedIndex == 0){
				alertaValidacion();
				return;
			}
			
			
			var txtCantidadEntre = $('#txtCantidadEntre');
			if(txtCantidadEntre.val() == ""){
				alertaValidacion();
				return;
			}
			
			if(txtCantidadEntre.val() <= 0){
				callNotification('notice', "Debe ingresar una cantidad a entregar mayor a 0", 'Alerta');
				return;
			}
			$("#modalGuardar").modal('show');
			
		}
		
		function cerrarModal(){
			$("#modalGuardar").modal('hide');
		}
		
		function guardarParametro(){
			var cboEmpresa = $('#cboEmpresa');
			var cboProyecto = $('#cboProyecto');
			var cboTipoDocumento = $('#cboTipoDocumento');
			var metaTotal = $('#txtProyectada');
			var totalRecep = $('#txtTotalRecep');
			var totalEntre = $('#txtTotalEntre');
			var cboLote = $('#cboLote');
			var cboSubLote = $('#cboSubLote');
			var txtDuracionProy = $('#txtDuracionProy');
			var txtProyectada = $('#txtProyectada');
			var fecInicio = $('#fecInicio');
			var fecFin = $('#fecFin');
			var txtDiasLab = $('#txtDiasLab');
			var txtHorasLab = $('#txtHorasLab');
			var txtCosto = $('#txtCosto');
			var cboTurnos = $('#cboTurnos');
			var fecMesRecep = $('#fecMesRecep');
			var fecAnoRecep = $('#fecAnoRecep');
			var txtMeta = $('#txtMeta');
			var txtTotalRecep = $('#txtTotalRecep');
			var cboFrecuencia = $('#cboFrecuencia');
			var txtCantidadRecep = $('#txtCantidadRecep');
			var fecMesEntre = $('#fecMesEntre');
			var fecAnoEntre = $('#fecAnoEntre');
			var txtMetaEntre = $('#txtMetaEntre');
			var txtTotalEntre = $('#txtTotalEntre');
			var cboFrecuenciaEntre = $('#cboFrecuenciaEntre');
			var txtCantidadEntre = $('#txtCantidadEntre');
			
			$.ajax({
				url : "./guardarParametro",
				type : "POST",
				dataType : "json",
				data : {
					codigoEmpresa : cboEmpresa.val(),
					codigoProyecto : cboProyecto.val(),
					codigoTipoDocumento : cboTipoDocumento.val(),
					
					comboLote : cboLote.val(),
					comboSubLote : cboSubLote.val(),
					duracProye : txtDuracionProy.val(),
					proyectada : txtProyectada.val(),
					fecInicio : fecInicio.val(),
					fecFin : fecFin.val(),
					diasLab : txtDiasLab.val(),
					horasLab : txtHorasLab.val(),
					costo : txtCosto.val(),
					turnos : cboTurnos.val(),
					
					fecMesRecep : fecMesRecep.val(),
					fecAnoRecep : fecAnoRecep.val(),
					metaRecep : txtMeta.val(),
					totalRecep : txtTotalRecep.val(),
					frecRecep : cboFrecuencia.val(),
					cantRecep : txtCantidadRecep.val(),
					
					fecMesEntre : fecMesEntre.val(),
					fecAnoEntre : fecAnoEntre.val(),
					metaEntre : txtMetaEntre.val(),
					totalEntre : txtTotalEntre.val(),
					frecEntre : cboFrecuenciaEntre.val(),
					cantEntre : txtCantidadEntre.val(),
					accion	:	accion,
					ipUser : ipUser
				}
			})
			.done(
				function(paramJson) {
					if (paramJson.estadoRespuesta == 'OK') {
						cerrarModal();
						callNotification('success', "Se registr&oacute; el Par&aacute;metro del Proyecto", 'Correcto');
					} else {
						callNotification('error', paramJson.mensajeRespuesta, 'Error');
					}
			}).fail(
			function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR
						+ "," + textStatus);
			});
		}
	
	</script>

</body>
</html>