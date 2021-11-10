<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html class="fixed">
<head>

<!-- Librerias cabecera:start -->
<jsp:include page="plantillas/libreriasCabecera.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/selectize/selectize.css" />
	<!--<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">-->
	<!-- <link rel="stylesheet" href="/resources/demos/style.css">-->
<%--	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>
<%--	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>
<!-- Librerias cabecera:end -->
<!-- 
<style type="text/css">

.iframe-container {
    padding-bottom: 60%;
    padding-top: 30px; height: 0; overflow: hidden;
}

.iframe-container iframe,
.iframe-container object,
.iframe-container embed {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}

</style> -->

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

					<h2>CONFIGURACI&Oacute;N  GENERACI&Oacute;N DE MEDIOS</h2>
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li><a href="#"> <i class="fa fa-home"></i>
							</a></li>
							<li><span>Configuraci&oacute;n Generaci&oacute;n de Medios</span></li>
						</ol>

					</div>
				</header>

				<!-- START: PAGE -->
				<div class="row">
					<div class="col-md-12">
						<section class="panel animated fadeInRight">
							<div class="panel-body"
								style="padding-bottom: 8px; padding-top: 15px;">

								<div class="form-group">
									<label class="col-md-2 control-label" for="cboEmpresa">EMPRESA</label>
									<div class="col-md-3 divCboEmpresa" style="width: 75%;">
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
									<div class="col-md-3 divCboProyecto" style="width: 75%;">
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
									<div class="col-md-3 divCboTipoDocumento" style="width: 75%;">
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
					<div class="col-lg-12" >
						<form  class="form-horizontal" novalidate="novalidate" id="frm" name="frm" method="post">
							<input type="hidden" name="method" value="" /> 
					
							<section class="panel animated fadeInRight">
								<header class="panel-heading">
									<h2 class="panel-title">TIPO MEDIO PORTADOR</h2>
								</header>
								<div class="panel-body" style="padding-bottom: 15px;">
									
									<div class="form-group">
									   <div class="col-sm-4">
											<label class="col-md-4 control-label" for="cboTipoMedio">TIPO DE MEDIO: </label>
													<div class="col-md-4 divTipoMedio">
														<select id="cboTipoMedio" name="cboTipoMedio" class="form-control" onchange= "cambiarTipoMedio();">
														</select>
													</div>
									  </div>
									   <div class="col-sm-3">
											<label class="col-md-4 control-label" for="txtCapacidad">CAPACIDAD (MB): </label>
												   <div class="col-sm-5" >
													 <input type="text" id="txtCapacidad" name="txtCapacidad" class="form-control" maxlength="50"
													 onkeydown="upperCase(this)" disabled="disabled"/>
												   </div>
									   </div>
									   <div class="col-sm-5">
											<label class="col-md-4 control-label" for="txtTamano">TAMAÑO EN MEDIO(MB): </label>
												   <div class="col-sm-4">
													 <input type="text" id="txtTamano" name="txtTamano" class="form-control" onkeypress="return soloNumeros(event)"
													 onkeydown="upperCase(this)" title="Favor, Ingresar el tamaño que se ocupara en el medio." required />
												   </div>
									   </div>
									</div>
									
								</div>
								
								
							</section>
						</form>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-12" id="divCamposMetadata">
						<form  class="form-horizontal" novalidate="novalidate" id="frm1" name="frm1" method="post">
							<input type="hidden" name="method" value="" /> 
					
							<section class="panel animated fadeInRight">
								<header class="panel-heading">
									<h2 class="panel-title">CAMPOS PARA METADATA</h2>
								</header>
								<div class="col-sm-12" style="padding-bottom: 15px;">
								</div>
								<div class="panel-body">
									<div class="container">
										<div class="row">
											<div class="col-sm-4">
												
												<div class="form-group">
													<label class="col-md-3 control-label" for="cboCampoCab">CAMPO: </label>
														<div class="col-sm-7 col-md-5 divCampo">
																	<select id="cboCampoCab" name="cboCampoCab"
																		class="form-control">
																	</select>
																</div>
												</div>
												
												<div class="form-group">
													 <label class="col-md-3 control-label" for="txtTamGrilla">TAMAÑO GRILLA: </label>
										               <div class="col-sm-3">
													     <input type="text" id="txtTamGrilla" name="txtTamGrilla" class="form-control" onkeypress="return soloNumeros(event)"  
													     onkeydown="upperCase(this)" title="Favor, Ingresar el tamaño de grilla." required />
										               </div>
												</div>
												
												<div class="form-group">
													 <label class="col-md-3 control-label" for="cboTipoBusq">TIPO DE B&Uacute;SQUEDA: </label>
														<div class="col-md-4 ">
															<select id="cboTipoBusq" name="cboTipoBusq" class="form-control">
															</select>
														</div>
												</div>
												<div class="col-sm-12" style="padding-bottom: 15px;">							
													<div class="panel-body">
														<div class="form-group">
														   <div class="col-sm-4">
																<div class="checkbox-custom">
																	<input id="txtChkVisible" name="txtChkVisible" type="hidden" />
																	<input type="checkbox" checked="checked" 
																	id="chkVisible"> <label for="chkVisible">VISIBLE</label>
																</div>
														  </div>
														   <div class="col-sm-4">
														        <div class="checkbox-custom">
																	<input id="txtChkIndice" name="txtChkIndice" type="hidden" />
																	<input type="checkbox" type="hidden" 
																						id="chkIndice"> <label for="chkIndice">INDICE</label>
																</div>
														   </div>
														</div>
													</div>
								                </div>
												<div class="form-group">
													<label class="col-md-3 control-label" for="cboTipoBusq">CAMPO PADRE: </label>
													<div class="col-sm-7 col-md-5 divCampo">
														<select id="cboCampoCabPadre" name="cboCampoCabPadre" class="form-control">
														</select>
													</div>
												</div>
												
						              		</div>
											
											<div class="col-sm-1">
												<div class="form-group">
													<div class="col-sm-2" style="padding-top: 0px;">
														<div class="panel-body">
																<div class="row">
																	<a class="btn btn-sm aAgregarCab" id="btnAgregarDetalle"
																	style="color: #777777; background-color: white; border-color: #dddddd; width: 60px;"
																	onclick="agregarCampoMeta();"> <i class="fa fa-arrow-right"
																	style="font-size: 30px;"> </i><br>Agregar</a>
																</div>
																<div class="row">
																   <a class="btn btn-sm " id="btnQuitarDetalle"
																	style="color: #777777; background-color: white; border-color: #dddddd; width: 60px; margin-top: 10px;"
																	onclick="quitarCampoMeta();"> <i class="fa fa-arrow-left"
																	style="font-size: 30px;"> </i><br>Quitar</a>
																</div>
														</div>
													</div>
												</div>
											</div>
										  <div class="col-sm-6">
										  
													<section class="panel animated fadeInRight">
														<header class="panel-heading">
															<h2 class="panel-title">DETALLE CAMPOS DE METADATA</h2>
														</header>

														<div class="form-group">
															<div class="col-sm-12">
																<div class="panel-body" style="padding-top: 0px;">
																	<div id="tablaDetalle" class="table-responsive">
																		<table id="tblDetalle"
																			class="table table-striped mb-none">
																			<thead>
																				<tr>
																					<th class="text-center">SEL</th>
																					<th class="text-center">CAMPO</th>
																					<th class="text-center">TAMAÑO</th>
																					<th class="text-center">B&Uacute;SQUEDA</th>
																					<th class="text-center">VISIBLE</th>
																					<th class="text-center">INDICE</th>
																					<th class="text-center">CAMPO PADRE</th>
																				</tr>
																			</thead>
																		</table>
																	</div>
																</div>
															</div>
														</div>
													</section>
												</div>		
												
										</div>
									</div>
								</div>
			   			 </section>
						</form>
					</div>
				</div>

			<div class="row">
				
					<div class="col-sm-12">
						<section class="panel animated fadeInRight">
							<div class="panel-body panel-body-nopadding" id="divConfigRutas">
								<header class="panel-heading">
									<h2 class="panel-title">CONFIGURACI&Oacute;N DEL VISOR</h2>
								</header>
								<div class="panel-body">
									<div class="form-group">
										<label class="col-sm-2 col-xs-12" for="select-state">RENOMBRE:</label>
										<div class="col-sm-6 col-xs-12" style="padding-left: 0px">							
										<select id="select-state"  multiple>
											<option value="" >Seleccione campo...</option>
										</select>
										</div>  
									</div>	
									<div class="form-group">
										<label class="col-sm-2 col-xs-12" for="select-grupo">ALIAS:</label>
										<div class="col-sm-3 col-xs-12" style="padding-left: 0px">
											<select id="select-grupo"  multiple>
												<option value="" >Creacion de Lista...</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 col-xs-12" style="text-align: left;">REQUIERE ID </label>
										<div class="col-sm-3 col-xs-12" style="padding-left: 0px">
											<div class="radio-custom radio-primary">
												<input type="radio" id="rdoCap1" name="rdoConfirmacion"
													   checked="checked" value="1"> <label for="rdoCap1">SI</label>
											</div>
											<div class="radio-custom radio-primary">
												<input type="radio" id="rdoCap2" name="rdoConfirmacion"
													   value="0"> <label for="rdoCap2">NO</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 col-xs-12 control-label"
											   style="text-align: left;" for="txtRutaGene">RUTA DE
											GENERACI&Oacute;N</label>
										<div class="col-sm-3 col-xs-12" style="padding-left: 0px;">
											<input type="text" id="txtRutaGene" name="txtRutaGene"
												   class="form-control" maxlength="50"/>
										</div>
									</div>
									
<%--									<div class="form-group">--%>
<%--										<label class="col-sm-2 col-xs-12 control-label"--%>
<%--											   style="text-align: left" for="txtRutaArchiMedios">RUTA DE ARCHIVOS VISOR</label>--%>
<%--										<div class="col-sm-3 col-xs-12" style="padding-left: 0px">--%>
<%--											<input type="text" id="txtRutaArchiMedios" name="txtRutaArchiMedios"--%>
<%--											class="form-control" maxlength="50"/>--%>
<%--										</div>--%>
<%--									</div>--%>

									<div class="form-group">
										<label class="col-sm-2 col-xs-12" style="text-align: left;">TIPO VISOR </label>
										<div class="col-sm-3 col-xs-12" style="padding-left: 0px">
											<div class="radio-custom radio-primary">
												<input type="radio" id="rdoTipoVisor1" name="rdoTipoVisor"
													   checked="checked" value="1"> <label for="rdoTipoVisor1">VISOR EMBEBIDO</label>
											</div>
											<div class="radio-custom radio-primary">
												<input type="radio" id="rdoTipoVisor2" name="rdoTipoVisor"
													   value="2"> <label for="rdoTipoVisor2">VISOR ADOBE</label>
											</div>
											<div class="radio-custom radio-primary">
												<input type="radio" id="rdoTipoVisor3" name="rdoTipoVisor"
													   value="3"> <label for="rdoTipoVisor3">VISOR ARBOL</label>
											</div>
											<div class="radio-custom radio-primary">
												<input type="radio" id="rdoTipoVisor4" name="rdoTipoVisor"
													   value="4"> <label for="rdoTipoVisor4">VISOR OCR</label>
											</div>
										</div>
									</div>
								</div>								
							</div>
						</section>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12 animated fadeInRight"
						style="text-align: center;">
							<a class="btn btn-sm btn-primary width-default" id="btnGuardar"
								onclick="preguntar();">GUARDAR ASIGNACI&Oacute;N</a>
					</div>
				</div>
			</section>
		</div>
	</section>
	
            <!-- MODAL CONFIRMACION -->
			<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="modalConfirmacion">
			  <div class="modal-dialog modal-sm">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title">Desea guardar la Configuraci&oacute;n para la generaci&oacute;n de medios</h4>
			      </div>
			      <div class="modal-footer">
					  <a class="btn btn-sm btn-primary width-default" onclick="guardarConfiguracion();">Si</a>
					  <a class="btn btn-sm btn-primary width-default" onclick="cerrarModal();">No</a>
			      </div>
			    </div>
			  </div>
			</div>

			<!-- MODAL CONFIRMACION -->
			<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="modalConfirmacionModificar">
			  <div class="modal-dialog modal-sm">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title">La configuraci&oacute;n ya hab&iacute;a sido guardada. Desea confirmar los cambios</h4>
			      </div>
			      <div class="modal-footer">
					  <a class="btn btn-sm btn-primary width-default" onclick="modificar();">Si</a>
					  <a class="btn btn-sm btn-primary width-default" onclick="cerrarModalModi();">No</a>
			      </div>
			    </div>
			  </div>
			</div>

    

	<!-- END: PAGE -->

	<jsp:include page="plantillas/footer.jsp" />


	<!-- START: LIB JS FOOTER-->
	<jsp:include page="plantillas/libreriasPie.jsp" />
	<script src="<%=request.getContextPath()%>/resources/vendor/selectize/selectize.min.js"></script>
	<!-- END: LIB JS FOOTER-->

<script type="text/javascript">
	
	var accion = null;
	var lstCampo = null;

/* INICIO FUNCIONES AUTOCOMPLETE */
	$(document).ready(function() {
		inicializarVariables();
		cargarComponentes();
	});
	
	$("#select-state").selectize({
	    delimiter: ',',
	    persist: false
	});

	$("#select-grupo").selectize({
		delimiter: ',',
		persist: false
	});
		
	function actListaAutocomplete(listCampo, lstTamanio){
		$("#select-state").selectize()[0].selectize.destroy();
		$('#select-state').find('option').remove();
		
		$.each(listCampo, function(i, item) {
			$("#select-state").append("<option value=" + item.campo.codigo + ">" + item.campo.nombre + "</option>")
		});
		
		$("#select-state").selectize({
		    delimiter: ',',
		    persist: false
		});

		/* INI REGISTRAR LOS CODIGOS PARA LA BASE DE DATOS*/
		function validacionCodigos() {
	 		var values = $("#select-state")[0].selectize.getValue().toString();
            var arregloAlias = [];
			var sum = 0;
			var arregloItem = [];
			arregloItem = values.split(",");
			$.each(arregloItem, function(a,item1) {
				$.each(lstTamanio, function(i,item) {
					if (item.campo.codigo == arregloItem[a]){
						sum = sum + parseInt(item.tamanoCampo);
                        var alias = $("#select-state")[0].selectize.options[item.campo.codigo];
						arregloAlias.push(alias);
                        actListaAutocompleteAlias(arregloAlias);
						return false;
					}
				});
			});
			if (sum <= 256){
				var res = values;
			}else{
				var selectize = $("#select-state")[0].selectize;
				var items = selectize.items.slice(0);
			    selectize.removeItem(items[items.length-1]);
				selectize.refreshOptions();
				callNotification('error',
						"Sobrepaso cantidad de caracteres permitida", 'Error');
			}
		}

		 $("#select-state")[0].selectize.on('change', function(){
			validacionCodigos();
		});
		/* FIN REGISTRAR LOS CODIGOS PARA LA BASE DE DATOS*/
	}
     /* INI GENERACION DE LA NUEVA LISTA ALIAS*/
	function actListaAutocompleteAlias(lista){
		$("#select-grupo").selectize()[0].selectize.destroy();
		$('#select-grupo').find('option').remove();

        $.each(lista, function(i, item) {
            $("#select-grupo").append("<option value=" + item.value + ">" + item.text + "</option>")
        });

        $("#select-grupo").selectize({
            delimiter: ',',
            persist: false
        });
	}
    /* FIN GENERACION DE LA NUEVA LISTA ALIAS*/
	
/* FIN FUNCIONES AUTOCOMPLETE */

	function inicializarVariables() {
		cboEmpresa = $('#cboEmpresa');
		cboProyecto = $('#cboProyecto');
		cboTipoDocumento = $('#cboTipoDocumento');

		$('#tblEstrucutraAlfre').DataTable({
			"scrollY" : "180px",
			"scrollCollapse" : true,
			"paging" : false,
			"searching" : false,
			"info" : false,
			select : 'single'
		});

		$('#tblDetalle').DataTable({
			"scrollY" : "180px",
			"autoWidth" : true,
			"scrollCollapse" : true,
			"paging" : false,
			"searching" : false,
			"info" : false,
			select : 'single'
		});
	}

	function cargarComponentes() {
		console.log("cargarComponentes");
		$.ajax({
			url : "./cargarComponentesConfig",
			type : "POST",
			dataType : "json"
		}).done(function(paramJson) {
			if (paramJson.estadoRespuesta == 'OK') {
				var lstEmpresa = JSON.parse(paramJson.parametros.lstEmpresa);

				loadComboEmpresa(lstEmpresa);
				loadComboProyecto(null);
				loadComboTipoDocumento(null);
				loadComboTipoMedio(null);
				loadComboTipoBusqueda(null);
				loadComboCampo(null);

			} else {
				callNotification('error', paramJson.mensajeRespuesta, 'Error');
			}
		}).fail(function(jqXHR, textStatus, errorThrown) {
			alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
		});
	}

	function loadComboEmpresa(lista) {
		var listEmpresa = lista;
		cboEmpresa.append($("<option/>").attr("value", "").text("Seleccionar"));
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

	function cambiarEmpresa() {
		var cboEmpresa = $("#cboEmpresa");
		$.ajax({
			url : "./cambiarEmpresa",
			type : "POST",
			dataType : "json",
			data : {
				codigoEmpresa : cboEmpresa.val()
			}
		}).done(function(paramJson) {
			if (paramJson.estadoRespuesta == 'OK') {
				limpiar();
				var lstProyecto = JSON.parse(paramJson.parametros.lstProyecto);
				loadComboProyecto(lstProyecto);
				cambiarProyecto();
			} else {
				callNotification('error', paramJson.mensajeRespuesta, 'Error');
			}
		}).fail(function(jqXHR, textStatus, errorThrown) {
			alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
		});
	}

	function cambiarProyecto() {
		var cboEmpresa = $("#cboEmpresa");
		var cboProyecto = $("#cboProyecto");

		$.ajax({
			url : "./cambiarProyecto",
			type : "POST",
			dataType : "json",
			data : {
				codigoEmpresa : cboEmpresa.val(),
				codigoProyecto : cboProyecto.val()
			}
		}).done(
				function(paramJson) {
					if (paramJson.estadoRespuesta == 'OK') {
						limpiar();
						var lstTipoDocumento = JSON
								.parse(paramJson.parametros.lstTipoDocumento);
						loadComboTipoDocumento(lstTipoDocumento);

					} else {
						callNotification('error', paramJson.mensajeRespuesta,
								'Error');
					}
				}).fail(function(jqXHR, textStatus, errorThrown) {
			alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
		});
	}

	function cambiarTipoDocumento() {
		var cboEmpresa = $("#cboEmpresa");
		var cboProyecto = $("#cboProyecto");
		var cboTipoDocumento = $("#cboTipoDocumento");

		$
				.ajax({
					url : "./cambiarTipoDocumento",
					type : "POST",
					dataType : "json",
					data : {
						codigoEmpresa : cboEmpresa.val(),
						codigoProyecto : cboProyecto.val(),
						codigoTipoDocumento : cboTipoDocumento.val()
					}
				})
				.done(
						function(paramJson) {
							if (paramJson.estadoRespuesta == 'OK') {
								limpiar();
								var lstConfig = JSON.parse(paramJson.parametros.lstConfMedios);
								var lstTipoBusqueda = JSON.parse(paramJson.parametros.listaTipos);
								var lstTipoMedio = JSON.parse(paramJson.parametros.listaMedio);

								loadComboTipoMedio(lstTipoMedio);
								loadComboTipoBusqueda(lstTipoBusqueda);

								lstCampo = JSON.parse(paramJson.parametros.lstCabecera);
								
								loadComboCampo(lstCampo);
								
								lstTamanio = JSON.parse(paramJson.parametros.lstTamanio);

								actListaAutocomplete(lstCampo,lstTamanio);

								loadConfig(lstConfig);

								lstDetalle = JSON.parse(paramJson.parametros.lstConfMediosDet);
								loadTableDetalle(lstDetalle);

								accion = paramJson.parametros.accion;

							} else {
								callNotification('error',
										paramJson.mensajeRespuesta, 'Error');
							}
						}).fail(
						function(jqXHR, textStatus, errorThrown) {
							alert("error" + errorThrown + ", " + jqXHR + ","
									+ textStatus);
						});
	}
	
	function loadComboCampo(lista) {
		var listCampo = lista;
		cboCampo = $('#cboCampoCab');
		cboCampo.empty();
		cboCampoPadre = $('#cboCampoCabPadre');
		cboCampoPadre.empty();

		if (listCampo == null) {
			cboCampo.append($("<option/>").attr("value", "").text("Seleccionar"));
			cboCampoPadre.append($("<option/>").attr("value", "").text("Seleccionar"));
		} else {
			cboCampo.append($("<option/>").attr("value", "").text("Seleccionar"));
			cboCampoPadre.append($("<option/>").attr("value", "").text("Seleccionar"));
			$.each(listCampo, function(i, item) {
				cboCampo.append($("<option/>").attr("value", item.campo.codigo).text(item.campo.nombre));
				cboCampoPadre.append($("<option/>").attr("value", item.campo.codigo).text(item.campo.nombre));
			});
		}
	}

	function cambiarTipoMedio() {
		var cboTipoMedio = $("#cboTipoMedio");
		var txtCapacidad = $("#txtCapacidad");

		$.ajax({
			url : "./cambiarTipoMedio",
			type : "POST",
			dataType : "json",
			data : {
				cboTipoMedio : cboTipoMedio.val()
			}
		}).done(function(paramJson) {
			if (paramJson.estadoRespuesta == 'OK') {

				var lstTipoMedio = JSON.parse(paramJson.parametros.listaMedio);
				$("#txtCapacidad").val(lstTipoMedio.desCompleta.split('|')[1]);

			} else {
				callNotification('error', paramJson.mensajeRespuesta, 'Error');
			}
		}).fail(function(jqXHR, textStatus, errorThrown) {
			alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
		});
	}

	function loadComboTipoMedio(lista) {
		var listTipoMedio = lista;
		cboTipoMedio = $('#cboTipoMedio');
		cboTipoMedio.empty();

		if (listTipoMedio == null) {
			cboTipoMedio.append($("<option/>").attr("value", "").text("Seleccionar"));
		} else {
			cboTipoMedio.append($("<option/>").attr("value", "").text("Seleccionar"));
			$.each(listTipoMedio, function(i, item) {
				cboTipoMedio.append($("<option/>").attr("value",
						listTipoMedio[i].DES_VALOR).text(
						listTipoMedio[i].DES_COMPLETA.split('|')[0]));
			});

		}
	}

	function loadComboTipoBusqueda(lista) {
		var listTipoBusqueda = lista;
		cboTipoBusq = $('#cboTipoBusq');
		cboTipoBusq.empty();

		if (listTipoBusqueda == null) {
			cboTipoBusq.append($("<option/>").attr("value", "").text(
					"Seleccionar"));
		} else {
			cboTipoBusq.append($("<option/>").attr("value", "").text(
					"Seleccionar"));
			$.each(listTipoBusqueda, function(i, item) {
				cboTipoBusq.append($("<option/>").attr("value",
						listTipoBusqueda[i].DES_VALOR).text(
						listTipoBusqueda[i].DES_COMPLETA));
			});
		}
	}

	function loadConfig(lstConfMedios) {
        var $radioIdGrupo = $("input[name='rdoConfirmacion']");
        var $radioTipoVisor = $("input[name='rdoTipoVisor']");
		if (lstConfMedios != null && lstConfMedios.length > 0) {
            $("#cboTipoMedio").val(lstConfMedios[0].tipoMedio);
            cambiarTipoMedio();
            $("#txtTamano").val(lstConfMedios[0].tamanoMedio);
            $("#txtRutaGene").val(lstConfMedios[0].rutaGeneracion);
            // $("#txtRutaArchiMedios").val(lstConfMedios[0].rutaArchivoGeneracion);
            $("#values").val(lstConfMedios[0].formatoReNombre);
            $("#valuesAlias").val(lstConfMedios[0].codigoAlias);
            $radioIdGrupo.filter('[value='+lstConfMedios[0].indicadorIdGrupo+']').prop('checked', true);
			$radioTipoVisor.filter('[value='+lstConfMedios[0].indicadorTipoVisor+']').prop('checked', true);
            /* INI POBLAR INPUT SELECTIZE RENOMBRE*/
            var insertar = lstConfMedios[0].formatoReNombre;

            if (insertar != null){
                var control = $("#select-state")[0].selectize;
                var arregloItem = [];
                arregloItem = insertar.split("_");

                for(var i = 0; i < arregloItem.length; i++){
                    control.addItem(arregloItem[i]);
                    control.refreshItems();
                }
            }

            var alias = lstConfMedios[0].codigoAlias;
			if (alias != null){
				var controlAlias = $("#select-grupo")[0].selectize;
				var arregloItemAlias = [];
				arregloItemAlias = alias.split("_");

				for(var i = 0; i < arregloItemAlias.length; i++){
					controlAlias.addItem(arregloItemAlias[i]);
					controlAlias.refreshItems();
				}
			}

            /* FIN POBLAR INPUT SELECTIZE RENOMBRE*/
		} else {
			$("#txtTamano").val("");
			$("#txtCapacidad").val("");
			$("#txtRutaGene").val("");
			// $("#txtRutaArchiMedios").val("");
            $radioIdGrupo.filter('[value=1]').prop('checked', true);
            $radioTipoVisor.filter('[value=1]').prop('checked', true);
		}
	}

	function agregarCampoMeta() {
		var cboEmpresa = $("#cboEmpresa");
		var cboProyecto = $("#cboProyecto");
		var cboTipoDocumento = $("#cboTipoDocumento");
		var cboCampoCab = $("#cboCampoCab");
		var tamañoGrilla = $("#txtTamGrilla");
		var cboTipoBusq = $("#cboTipoBusq");
		var chkVisible = $('#chkVisible').is(':checked');
		var chkIndice = $('#chkIndice').is(':checked');
		var cboCampoCabPadre = $("#cboCampoCabPadre");

		if (validarCampoMet()) {
			$.ajax({
				url : "./agregarCampoMeta",
				type : "POST",
				dataType : "json",
				data : {
					codigoEmpresa : cboEmpresa.val(),
					codigoProyecto : cboProyecto.val(),
					codigoTipoDocumento : cboTipoDocumento.val(),
					codigoCampo : cboCampoCab.val(),
					tamañoGrilla : tamañoGrilla.val(),
					tipoBusqueda : cboTipoBusq.val(),
					campVisible : chkVisible,
					campIndice : chkIndice,
					codigoCampoPadre : cboCampoCabPadre.val()
				}
			})
			.done(
				function(paramJson) {
					if (paramJson.estadoRespuesta == 'OK') {
						lstDetalle = JSON.parse(paramJson.parametros.lstDetalleTemp);
						loadTableDetalle(lstDetalle);
						limpiarCamposMeta();
					} else {
						callNotification('error',
								paramJson.mensajeRespuesta, 'Error');
					}
				})
			.fail(
				function(jqXHR, textStatus, errorThrown) {
					alert("error" + errorThrown + ", " + jqXHR
							+ "," + textStatus);
				});
		}
	}

	function validarCampoMet() {

		var cboCampoCab = $("#cboCampoCab");
		var tamañoGrilla = $("#txtTamGrilla");
		var cboTipoBusq = $("#cboTipoBusq");
		var chkVisible = $('#chkVisible').is(':checked');
		var chkIndice = $('#chkIndice').is(':checked');

		if (validarFiltroPrincipal()) {
			if (validarFiltros(cboCampoCab, tamañoGrilla, cboTipoBusq,
					chkVisible, chkIndice)) {
				return true;
			}
		}
		return false;
	}

	function quitarCampoMeta() {
		var radioSelDeta = $('input[name="filaDet"]:checked');
		if (radioSelDeta.val() != null) {
			var dataSeleDeta = JSON
					.parse(decodeURIComponent(radioSelDeta.val()));
			$.ajax({
				url : "./quitarCampoMeta",
				type : "POST",
				dataType : "json",
				data : {
					codigoCampo : dataSeleDeta.listaCamp[0].codigo,
				}
			}).done(
					function(paramJson) {
						if (paramJson.estadoRespuesta == 'OK') {

							lstDetalle = JSON
									.parse(paramJson.parametros.lstDetalle);
							loadTableDetalle(lstDetalle);
						} else {
							callNotification('error',
									paramJson.mensajeRespuesta, 'Error');
						}
					}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
			});
		} else {
			callNotification(
					'notice',
					"Debe seleccionar un registro de la grilla, por favor verifique",
					'Informaci&oacute;n');
		}
	}

	function loadTableDetalle(lista) {
		$('#tblDetalle').dataTable().fnClearTable();
		var tblDetalle = $('#tblDetalle').DataTable();
		$
				.each(
						lista,
						function(i, obj) {
							var jsonEncode = encodeURIComponent(JSON
									.stringify(obj));
							tblDetalle.row
									.add(
											[
													'<input type="radio" id="filaDet" name="filaDet" value="'+ jsonEncode +'">',
													obj.listaCamp[0].nombre,
													obj.tamanoGrilla,
													obj.listaParam[0].desCompleta,
													obj.indicadorVisible == true ? "SI" :"NO",
													obj.indicadorIndice == true ? "SI" : "NO",
													obtenerNombreCampo(obj.codigoCampoPadre)]
											)
									.draw(false);
						});
	}

	function obtenerNombreCampo(codigo) {
		for (var i = 0; i < lstCampo.length; i++){
			if (lstCampo[i].campo.codigo == codigo){
				return lstCampo[i].campo.nombre;
			}
		}
		return "";
	}

	function preguntar() {

		if (validarFiltroPrincipal()) {
			var tipoMedio = $('#cbotipoMedio');
			if (tipoMedio.val() == "") {
				callNotification(
						'notice',
						"Debe seleccionar el Tipo de Medio, por favor verifique",
						'Alerta');
				return;
			} else {

				var txtTamanio = $('#txtTamano').val();

				if (txtTamanio.length <= 0) {
					callNotification(
							'notice',
							"Debe ingresar el tama&ntilde;o que ocupar&aacute el medio portador, por favor verifique",
							'Alerta');
					return;
				} else {
					if (parseInt(txtTamanio) == 0) {
						callNotification(
								'notice',
								"El Tama&ntilde;o que ocupar&aacute no puede ser igual a cero, por favor verifique",
								'Alerta');
						return;
					} else {
						var txtCapacidad = parseInt($('#txtCapacidad').val());
						if (parseInt(txtTamanio) > txtCapacidad) {
							callNotification(
									'notice',
									"El Tama&ntilde;o que ocupar&aacute el medio no debe superar la capacidad del disco, por favor verifique",
									'Alerta');
							return;
						} else {
							var rutaMedios = $('#txtRutaGene');
							if (rutaMedios.val() == "") {
								callNotification(
										'notice',
										"Debe ingresar la ruta donde se realizar&aacute la generaci&oacute;n de Medios",
										'Alerta');
								return;
							// } else {
							// 	var rutaArchMedios = $('#txtRutaArchiMedios');
							// 	if (rutaArchMedios.val() == "") {
							// 		callNotification(
							// 				'notice',
							// 				"Debe ingresar la ruta de los archivos adjuntos que contendr&aacute el medio portador, por favor verifique",
							// 				'Alerta');
							// 		return;
							// 	}
							}
						}

					}
				}
			}
			guardar();
		}
	}

	function guardarConfiguracion() {
		if (accion == "modificar") {
			cerrarModal();
			$("#modalConfirmacionModificar").modal('show');
		} else if (accion == "guardar") {
			var cboEmpresa = $("#cboEmpresa");
			var cboProyecto = $("#cboProyecto");
			var cboTipoDocumento = $("#cboTipoDocumento");
			var cboTipoMedio = $("#cboTipoMedio");
			var tamanoMedio = $("#txtTamano");
			var txtRuta = $("#txtRutaGene");
			// var txtRutaAgrupados = $("#txtRutaArchiMedios");
			var values = $("#select-state")[0].selectize.getValue().toString().replace(/,/g, "_");
			var valuesAlias = $("#select-grupo")[0].selectize.getValue().toString().replace(/,/g, "_");
			var indReqIdGrupo = $("input[name='rdoConfirmacion']:checked").val();
			var indTipoVisor = $("input[name='rdoTipoVisor']:checked").val();

			$
					.ajax({
						url : "./guardarConfiguracion",
						type : "POST",
						dataType : "json",
						data : {
							cboEmpresa : cboEmpresa.val(),
							cboProyecto : cboProyecto.val(),
							cboTipoDocumento : cboTipoDocumento.val(),
							cboTipoMedio : cboTipoMedio.val(),
							txtTamaño : tamanoMedio.val(),
							txtRutaGene : txtRuta.val(),
							// txtRutaArchiMedios : txtRutaAgrupados.val(),
							values : values,
							valuesAlias : valuesAlias,
							indIdGrupo : indReqIdGrupo,
							indTipoVisor : indTipoVisor
						}
					})
					.done(
							function(paramJson) {
								if (paramJson.estadoRespuesta == 'OK') {
									$("#modalConfirmacion").modal('hide');
									cerrarModal();
									$("#cboEmpresa").val("");
									$("#cboProyecto").val("");
									$("#cboTipoDocumento").val("");
									limpiar();
									// 							$('#frm')[0].reset();
									callNotification(
											'success',
											"Se ha guardado satisfactoriamente la configuraci&oacute;n para la generaci&oacute;n de medios.",
											'Correcto');
									accion = paramJson.parametros.accion;
									// 							window.location.href = './cargarVentanaConfiguracionMedios';
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

	function cerrarModal() {
		$("#modalConfirmacion").modal('hide');
	}
	
	function cerrarModalModi() {
		$("#modalConfirmacionModificar").modal('hide');
	}

	function guardar() {
		$("#modalConfirmacion").modal('show');
	}

	function validarFiltroPrincipal() {
		var cboEmpresa = $("#cboEmpresa");
		var cboProyecto = $("#cboProyecto");
		var cboTipoDocumento = $("#cboTipoDocumento");

		if (cboEmpresa.val() == "") {
			callNotification('notice',
					"Debe seleccionar una Empresa. Por favor verifique",
					'Alerta');
			return false;
		}

		if (cboProyecto.val() == "") {
			callNotification('notice',
					"Debe seleccionar un Proyecto. Por favor verifique",
					'Alerta');
			return false;
		}

		if (cboTipoDocumento.val() == "") {
			callNotification(
					'notice',
					"Debe seleccionar un Tipo de Documento. Por favor verifique",
					'Alerta');
			return false;
		}

		return true;
	}

	function validarFiltros(cboCampoCab, tamañoGrilla, cboTipoBusq, chkVisible,
			chkIndice) {
		if (cboCampoCab.val() == "") {
			callNotification('notice', "Debe seleccionar un Campo", 'Alerta');
			return false;
		}

		if (isNaN(tamañoGrilla.val())) {
			callNotification(
					'notice',
					"Debe ingresar solo n&uacute;meros para tama&ntilde;o de grilla",
					'Alerta');
			return false;
		}

		if (tamañoGrilla.val() <= 0) {
			callNotification('notice',
					"El Tama&ntilde;o de grilla debe ser mayor a 0", 'Alerta');
			return false;
		}

		if (cboTipoBusq.val() == "") {
			callNotification('notice',
					"Debe seleccionar un Tipo de B&uacute;queda", 'Alerta');
			return false;
		}

		if (chkVisible == false && chkIndice == true) {
			callNotification('notice',
					"No puede seleccionar un campo no visible como Indice",
					'Alerta');
			return false;
		}
		return true;
	}

	function modificar() {
		$("#modalConfirmacionModificar").modal('hide');
		accion = "guardar";
		guardarConfiguracion();
	}

	function limpiar() {
		$("#cboTipoMedio").val("");
		$('#tblDetalle').dataTable().fnClearTable();
		loadComboTipoMedio(null);
		loadComboTipoBusqueda(null);
		loadComboCampo(null);
		$("#values").val("");
		$("#txtTamano").val("");
		$("#txtCapacidad").val("");
		$("#txtRutaGene").val("");
		// $("#txtRutaArchiMedios").val("");
		$("#select-state")[0].selectize.clear();
		$("#select-state")[0].selectize.clearOptions();
		$("#select-grupo")[0].selectize.clear();
		$("#select-grupo")[0].selectize.clearOptions();
	}
	function limpiarCamposMeta() {
		$("#txtTamGrilla").val("");
		$("#cboCampoCab").val("");
		$("#cboTipoBusq").val("");
		$("#cboCampoCabPadre").val("");
	}
					
</script>

 </body>
</html>
	