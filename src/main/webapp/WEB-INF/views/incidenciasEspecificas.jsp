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

					<h2>Mantenimiento de Incidencias</h2>
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li><a href="#"> <i class="fa fa-home"></i>
							</a></li>
							<li><span>Mantenimiento de Incidencias</span></li>
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

							<div class="panel-body"
								 style="padding-bottom: 15px; padding-top: 8px;">
								<div class="form-group">
									<label class="col-md-2 control-label">TIPO DE INCIDENCIA</label>
									<div class="col-md-3 divcboTipoIncidencia" style="width: 75%;">
										<select id="cboTipoIncidencia" name="cboTipoIncidencia"
												class="form-control" onchange="cambiarTipoIncidencia();">
											<option value="0">Seleccione</option>
											<option value="1">CONTROL CALIDAD INTERNA</option>
											<option value="2">FEDATACIÓN</option>
											<option value="3">CONTROL CALIDAD CLIENTE</option>
										</select>
									</div>
								</div>
								<div class="rigth">
<!-- 									<a id="btnGeneral" class="btn btn-sm btn-primary" onclick="modalInciCateg();"><i class="fa fa-check"> </i> GENERAL</a> -->
						   				<input class="btn btn-sm btn-primary width-default" id="btnGeneral" name="btnGeneral" type="button" onclick="modalInciGeneral();" value="GENERAL" />
						   		</div>
							</div>
						</section>
					</div>
				</div>

				<div class="row">

					<div class="col-md-12">
						<section class="panel animated fadeInRight">
							<header class="panel-heading">
								<h2 class="panel-title">LISTA DE INCIDENCIAS</h2>
							</header>

							<div class="panel-body">
								<div id="tabla">
									<table id="tblIncidencia"
										class="table table-bordered table-striped mb-none">
										<thead>
											<tr>
												<th class="text-center">SEL</th>
												<th class="text-center">C&Oacute;DIGO</th>
												<th class="text-center">INCIDENCIA</th>
												<th class="text-center">GENERA RECHAZO</th>
												<th class="text-center">CATEGORIA</th>												
											</tr>
										</thead>
									</table>
								</div>
							</div>
							<footer class="panel-footer">
								<div class="row">
									<div class="center">
										<a id="btnNuevo" class="btn btn-sm btn-primary width-default" onclick="nuevo();"><i class="fa fa-check"> </i> NUEVA</a>
										<a id="btnModificar" class="btn btn-sm btn-primary width-default" onclick="modificar();"><i class="fa fa-refresh"> </i> MODIFICAR</a>
<!-- 										<a id="btnEliminar" class="btn btn-sm btn-primary width-default" onclick="preguntar();"><i class="fa fa-times"></i> ELIMINAR</a> -->
									</div>
								</div>
							</footer>
						</section>
					</div>

					<div class="col-md-12" id="divIncidencia" style="display: none">
						<form method="post" class="form-horizontal"  id="form" name="form">
							<input type="hidden" name="method" value="" /> 

							<section class="panel animated fadeInRight">
								<header class="panel-heading">
									<h2 class="panel-title">DATOS DE LA INCIDENCIA</h2>

								</header>
								<div class="panel-body">

									<div class="form-group">
										<label class="col-sm-3 control-label">CODIGO<span class="required">*</span></label>
										<div class="col-sm-9">
											<input type="text" id="txtCodigo" name="txtCodigo" class="form-control"  />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label"> INCIDENCIA <span class="required">*</span>
										</label>
										<div class="col-sm-9">
											<input type="text" id="txtDescripcion" name="txtDescripcion" class="form-control" maxlength="100" 
												onkeydown="upperCase(this)" title="Favor, Ingresar un Incidencia" required />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">CATEGORIA<span class="required">*</span></label>
										<div class="col-sm-9">
											<select id="cboIncidenciaGnral" name="cboIncidenciaGnral"
													class="form-control">	
<!-- 													onchange="cambiarIncidenciaGnral();"							 -->
											</select>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-3"></div>
										<div class="checkbox-custom col-sm-3">
											<input type="checkbox" id="chkRechazo"> <label for="chkRechazo">GENERA RECHAZOS</label>
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
				
					<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="modalEliminar">
					  <div class="modal-dialog modal-sm">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					        <h4 class="modal-title" id="myModalLabel">¿Desea eliminar el registro?</h4>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" onclick="eliminar();">Si</button>
					        <button type="button" class="btn btn-primary" onclick="cerrarModal();">No</button>
					      </div>
					    </div>
					  </div>
					</div>
					
					 <!-- MODAL INCIDENCIAS GENERALES -->
						<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel2" aria-hidden="true" id="modalInciGnral">
							<div class="modal-block modal-block-lg">
								<div class="modal-content">
						      		<div class="modal-header">
						        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        		<h4 class="modal-title">LISTA DE INCIDENCIAS GENERALES</h4>
						      		</div>
			
						      		<div class="modal-body">
										<section class="panel animated fadeInRight">
											<div class="panel-body">
												<div class="form-group">
													<div class="col-sm-12">
														<div class="panel-body" style="padding-top: 0px;">
															<div id="tablaInciGnral" class="table-responsive">
																<table id="tblInciGnral" class="table table-striped mb-none">
																	<thead>

																		<tr>
																			<th class="text-center"> <input type="checkbox" onclick="toggle(this);" /> SEL</th>
																			<th class="text-center">CODIGO</th>
																			<th class="text-center">NOMBRE</th>
																			<th class="text-center">CATEGORIA</th>
																		</tr>
																	</thead>
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
										</section>
									</div>
									   <footer class="panel-footer">
											<div class="row">
												<div class="center">
													<a id="btnGuardarInciGnral" class="btn btn-sm btn-primary width-default" onclick="guardarInciGnral();"><i class="fa fa-check"> </i> GUARDAR</a>
												</div>
											</div>
										</footer>
								</div>
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
					txtDescripcion : {
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
		cboEmpresa = $('#cboEmpresa');
		cboProyecto = $('#cboProyecto');
		cboTipoDocumento = $('#cboTipoDocumento');
        cboTipoIncidencia = $('#cboTipoIncidencia');
        cboIncidenciaGnral = $('#cboIncidenciaGnral');
		$('#tblIncidencia').DataTable();
		$('#tblInciGnral').DataTable();
		document.getElementById("divIncidencia").style.display = "none";
	}

	function cargarComponentes() {
		$.ajax({
			url : "./cargarComponentesIncidencia",
			type : "POST",
			dataType : "json"
		}).done(
				function(paramJson) {

					if (paramJson.estadoRespuesta == 'OK') {
						var lstEmpresa = JSON.parse(paramJson.parametros.lstEmpresa);
						var lstIncidencia = JSON.parse(paramJson.parametros.lstIncidencia);
						var lstCategoriaIncidencia = JSON.parse(paramJson.parametros.lstCategoriaIncidencia);
                        loadComboEmpresa(lstEmpresa);
                        loadComboProyecto(null);
                        loadComboTipoDocumento(null);
                        loadComboTipoIncidencia(null);
						loadComboTipoCategoria(lstCategoriaIncidencia);
//						loadTableIncidencia(lstIncidencia);

					} else {
						callNotification('error',
								paramJson.mensajeRespuesta, 'Error');
					}

				}).fail(function(jqXHR, textStatus, errorThrown) {
			alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
		});
	}

	function loadComboEmpresa(lista){
		var listEmpresa= lista;
		cboEmpresa.append($("<option/>").attr("value","").text("Seleccionar"));
		$.each(listEmpresa, function(i, item) {
			cboEmpresa.append($("<option/>").attr("value",listEmpresa[i].codigo).text(listEmpresa[i].nombreComercial));
		});
	}

	function cambiarEmpresa(){
		var cboEmpresa = $("#cboEmpresa");

		$.ajax({
			url : "./cambiarEmpresa",
			type : "POST",
			dataType : "json",
			data : {
				codigoEmpresa : cboEmpresa.val()
			}
		})
			.done(
				function(paramJson) {
					if (paramJson.estadoRespuesta == 'OK') {
						var lstProyecto = JSON.parse(paramJson.parametros.lstProyecto);
						loadComboProyecto(lstProyecto);
						loadComboTipoDocumento(null);
						loadComboTipoIncidencia(null);
                        $('#tblIncidencia').dataTable().fnClearTable();
					} else {
						callNotification('error', paramJson.mensajeRespuesta, 'Error');
					}
				})
			.fail(
				function(jqXHR, textStatus, errorThrown) {
					alert("error" + errorThrown + ", " + jqXHR	+ "," + textStatus);
				});
	}

    function loadComboProyecto(lista){
        var listProyecto= lista;
        cboProyecto = $('#cboProyecto');
        cboProyecto.empty();
        if(listProyecto == null){
            cboProyecto.append($("<option/>").attr("value","").text("Seleccionar"));
        }else {
            cboProyecto.append($("<option/>").attr("value","").text("Seleccionar"));
            $.each(listProyecto, function(i, item) {
                cboProyecto.append($("<option/>").attr("value",listProyecto[i].codigo.codigoProyecto).text(listProyecto[i].nombre));
            });
        }
	}

    function cambiarProyecto(){
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
        })
            .done(
                function(paramJson) {
                    if (paramJson.estadoRespuesta == 'OK') {

                        var lstTipoDocumento = JSON.parse(paramJson.parametros.lstTipoDocumento);
                        loadComboTipoDocumento(lstTipoDocumento);
                        loadComboTipoIncidencia(null);
                        $('#tblIncidencia').dataTable().fnClearTable();

                    } else {
                        callNotification('error', paramJson.mensajeRespuesta, 'Error');
                    }
                })
            .fail(
                function(jqXHR, textStatus, errorThrown) {
                    alert("error" + errorThrown + ", " + jqXHR	+ "," + textStatus);
                });
    }

    function loadComboTipoDocumento(lista){
        var listTipoDocu = lista;
        cboTipoDocumento = $('#cboTipoDocumento');
        cboTipoDocumento.empty();
        if(listTipoDocu == null){
            cboTipoDocumento.append($("<option/>").attr("value","").text("Seleccionar"));
        }else{
            cboTipoDocumento.append($("<option/>").attr("value","").text("Seleccionar"));
            $.each(listTipoDocu, function(i, item) {
                cboTipoDocumento.append($("<option/>").attr("value",listTipoDocu[i].codigo.codigoTipoDocumento).text(listTipoDocu[i].tipoDocumento.nombre));
            });
        }
    }

    function cambiarTipoDocumento(){
        var cboEmpresa = $("#cboEmpresa");
        var cboProyecto = $("#cboProyecto");
        var cboTipoDocumento = $("#cboTipoDocumento");

        $.ajax({
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
                        var lstTipoIncidencia = JSON.parse(paramJson.parametros.lstTipoIncidencia);
                        var lstIncidenciaGnral = JSON.parse(paramJson.parametros.lstIncidenciaGnral);
                        loadComboTipoIncidencia(lstTipoIncidencia);
                        $('#tblIncidencia').dataTable().fnClearTable();
                        loadTableIncidenciaGnral(lstIncidenciaGnral);
//                        var lstIncidencia = JSON.parse(paramJson.parametros.lstIncidencia);
//                        loadTableIncidencia(lstIncidencia);
                    } else {
                        callNotification('error', paramJson.mensajeRespuesta, 'Error');
                    }
                })
            .fail(
                function(jqXHR, textStatus, errorThrown) {
                    alert("error" + errorThrown + ", " + jqXHR	+ "," + textStatus);
                });
    }

    function loadComboTipoIncidencia(lista){
        var lstTipoInci = lista;
        cboTipoIncidencia = $('#cboTipoIncidencia');
        cboTipoIncidencia.empty();
        if(lstTipoInci == null){
            cboTipoIncidencia.append($("<option/>").attr("value","").text("Seleccionar"));
        }else{
            cboTipoIncidencia.append($("<option/>").attr("value","").text("Seleccionar"));
            $.each(lstTipoInci, function(i, item) {
                cboTipoIncidencia.append($("<option/>").attr("value",lstTipoInci[i].llave).text(lstTipoInci[i].valor));
            });
        }
    }

    function cambiarTipoIncidencia(){
        var cboEmpresa = $("#cboEmpresa");
        var cboProyecto = $("#cboProyecto");
        var cboTipoDocumento = $("#cboTipoDocumento");
        var cboTipoIncidencia =  $("#cboTipoIncidencia");

        $.ajax({
            url : "./cambiarTipoIncidencia",
            type : "POST",
            dataType : "json",
            data : {
                codigoEmpresa : cboEmpresa.val(),
                codigoProyecto : cboProyecto.val(),
                codigoTipoDocumento : cboTipoDocumento.val(),
				codigoTipoIncidencia : cboTipoIncidencia.val()
            }
        })
            .done(
                function(paramJson) {
                    if (paramJson.estadoRespuesta == 'OK') {
                        var lstIncidencia = JSON.parse(paramJson.parametros.lstIncidencia);
                        loadTableIncidencia(lstIncidencia);
                    } else {
                        callNotification('error', paramJson.mensajeRespuesta, 'Error');
                    }
                })
            .fail(
                function(jqXHR, textStatus, errorThrown) {
                    alert("error" + errorThrown + ", " + jqXHR	+ "," + textStatus);
                });
	}
    
    function loadComboTipoCategoria(lista){
        var lstTipoInciGnral = lista;	
        cboIncidenciaGnral.append($("<option/>").attr("value","").text("Seleccionar"));
        $.each(lstTipoInciGnral, function(i, item) {
              cboIncidenciaGnral.append($("<option/>").attr("value",lstTipoInciGnral[i].llave).text(lstTipoInciGnral[i].valor));
            });
     }

	function cancelar() {
		limpiarText();
		document.getElementById("divIncidencia").style.display = "none";
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
		var nomEmp = document.getElementById("txtDescripcion");
		var chkRechazo = $('#chkRechazo').is(':checked');
        var cboEmpresa = $("#cboEmpresa");
        var cboProyecto = $("#cboProyecto");
        var cboTipoDocumento = $("#cboTipoDocumento");
        var cboTipoIncidencia =  $("#cboTipoIncidencia");
        var cboIncidenciaGnral = $("#cboIncidenciaGnral");

		$
				.ajax({
					url : "./guardarIncidencia",
					type : "POST",
					dataType : "json",
					data : {
						codigo : codEmp.value,
						nombre : nomEmp.value,
						indRechazo : chkRechazo,
                        codigoEmpresa : cboEmpresa.val(),
                        codigoProyecto : cboProyecto.val(),
                        codigoTipoDocumento : cboTipoDocumento.val(),
                        codigoTipoIncidencia : cboTipoIncidencia.val(),
                        codigoInciGnral: cboIncidenciaGnral.val()
					}
				})
				.done(
						function(paramJson) {

							if (paramJson.estadoRespuesta == 'OK') {

								limpiarText();
								callNotification(
										'success',
										'Se ha guardado satisfactoriamente los datos de la incidencia',
										'Correcto');
								document.getElementById("divIncidencia").style.display = "none";
								var listIncidencia = JSON.parse(paramJson.parametros.lstIncidencia);
								loadTableIncidencia(listIncidencia);
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
	
	function obtenerCodigos() {
		 var val1=[]; 
		 $('input[name="fila"]:checked').each(function() {
		  	val1.push($(this).val());
		 });
		 return val1;
	}
	
	function guardarInciGnral() {

		var codigo = obtenerCodigos();
        var cboEmpresa = $("#cboEmpresa");
        var cboProyecto = $("#cboProyecto");
        var cboTipoDocumento = $("#cboTipoDocumento");

		$
				.ajax({
					url : "./guardarIncidenciaGnralProy",
					type : "POST",
					dataType : "json",
					data : {
						codigo : codigo,
                        codigoEmpresa : cboEmpresa.val(),
                        codigoProyecto : cboProyecto.val(),
                        codigoTipoDocumento : cboTipoDocumento.val()
					}
				})
				.done(
						function(paramJson) {

							if (paramJson.estadoRespuesta == 'OK') {

								limpiarText();
								callNotification(
										'success',
										'Se ha guardado satisfactoriamente los datos de la incidencia',
										'Correcto');
		                        var listIncidenciaGnral = JSON.parse(paramJson.parametros.lstIncidenciaGnral);
		                        loadTableIncidenciaGnral(listIncidenciaGnral);  
// 								document.getElementById("divIncidencia").style.display = "none";
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

	function loadTableIncidencia(lista) {

		$('#tblIncidencia').dataTable().fnClearTable();
		var tblIncidencia = $('#tblIncidencia').DataTable();

		// Deshabilitando botones
		if(lista.length > 0){
			 $("#btnModificar").removeAttr("disabled");
			 $("#btnEliminar").removeAttr("disabled");
		}else {
			 $("#btnModificar").attr("disabled", true);
			 $("#btnEliminar").attr("disabled", true);
		}

		$.each( lista, function(i, obj) {
			var rowNode = tblIncidencia.row.add([ '<input type="radio" id="fila" name="fila" value="'+ obj.codigo  +'">',
										obj.codigo,
										obj.nombre,
										obj.indRechazo == 1 ? 'SI' : 'NO',
										obj.categoriaIncidencia.valor		
										]).draw(false).node();

			// Centrando columnas seleccion, codigo y orden
			$(rowNode).find('td').each(function(index, td) {
				if(index == 0 || index == 1 || index == 2){
					$(td).addClass('text-center');
				}
			});

		});

				// Centrando columnas seleccion y codigo
		$('#tblIncidencia').find('tr').each(function() {
			$(this).find('td').eq(0).addClass('text-center');
			$(this).find('td').eq(1).addClass('text-center');
			$(this).find('td').eq(2).addClass('text-center');
		});
	}

	//TABLA MODAL INCIDENCIAS GENERAL
	
	function loadTableIncidenciaGnral(lista) {

		$('#tblInciGnral').dataTable().fnClearTable();
		var tblIncidenciaGnral = $('#tblInciGnral').DataTable();

		// Deshabilitando botones
		if(lista.length > 0){
			 $("#btnGuardarInciGnral").removeAttr("disabled");
			 $("#btnModificarInciGnral").removeAttr("disabled");
		}else {
			 $("#btnGuardarInciGnral").attr("disabled", true);
			 $("#btnModificarInciGnral").attr("disabled", true);
		}

		$.each( lista, function(i, obj) {
			var rowNode = tblIncidenciaGnral.row.add([ "<input type='checkbox' id='fila' name='fila' value='"+ obj.codigo + "'" + (obj.activo == '01' ? ' checked' : '') + ">",
										obj.codigo,
										obj.nombre,
										obj.categoriaIncidencia.valor
										]).draw(false).node();

			// Centrando columnas seleccion, codigo y orden
			$(rowNode).find('td').each(function(index, td) {
				if(index == 0 || index == 1 || index == 2){
					$(td).addClass('text-center');
				}
			});

		});

		// Centrando columnas seleccion y codigo
		$('#tblInciGnral').find('tr').each(function() {
			$(this).find('td').eq(0).addClass('text-center');
			$(this).find('td').eq(1).addClass('text-center');
			$(this).find('td').eq(2).addClass('text-center');
		});
	}
	

	function nuevo() {
		
        var cboEmpresa = $("#cboEmpresa");
        var cboProyecto = $("#cboProyecto");
        var cboTipoDocumento = $("#cboTipoDocumento");
        var cboTipoIncidencia =  $("#cboTipoIncidencia");
        
        if(validarSeleccionCombo(cboEmpresa, "Empresa")){
            if(validarSeleccionCombo(cboProyecto, "Proyecto")){
                if(validarSeleccionCombo(cboTipoDocumento, "Tipo de Documento")){
                    if(validarSeleccionCombo(cboTipoIncidencia, "Tipo de Incidencia")){

                        $.ajax({
                            url : "./nuevaIncidencia",
                            type : "POST",
                            dataType : "json",
                            data : {
                                codigoEmpresa : cboEmpresa.val(),
                                codigoProyecto : cboProyecto.val(),
                                codigoTipoDocumento : cboTipoDocumento.val(),
                                tipoIncidencia : cboTipoIncidencia.val()	
                            	
                            }
                        })
                            .done(
                                function(paramJson) {
                                    if (paramJson.estadoRespuesta == 'OK') {
                                        document.getElementById("divIncidencia").style.display = "inline";
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
                }
            }
		}
	}

	function modificar() {
		var codigo = $('input[name="fila"]:checked');
        var cboEmpresa = $("#cboEmpresa");
        var cboProyecto = $("#cboProyecto");
        var cboTipoDocumento = $("#cboTipoDocumento");
        var cboTipoIncidencia =  $("#cboTipoIncidencia");

		if (codigo.val() != null) {
			$
					.ajax({
						url : "./modificarIncidencia",
						type : "POST",
						dataType : "json",
						data : {
							codigo : codigo.val(),
                            codigoEmpresa : cboEmpresa.val(),
                            codigoProyecto : cboProyecto.val(),
                            codigoTipoDocumento : cboTipoDocumento.val(),
                            codigoTipoIncidencia : cboTipoIncidencia.val()
						}
					})
					.done(
							function(paramJson) {
								if (paramJson.estadoRespuesta == 'OK') {
									limpiarText();
									document
											.getElementById("divIncidencia").style.display = "inline";
									document.getElementById("txtCodigo").disabled = true;
									document.getElementById("txtCodigo").value = codigo
											.val();
									document
											.getElementById("txtDescripcion").value = paramJson.parametros.nombre;
									if(paramJson.parametros.indRechazo == "0"){
										$('#chkRechazo').prop('checked', false);
									}else{
										$('#chkRechazo').prop('checked', true);
									}
									
									$('#cboIncidenciaGnral').val(paramJson.parametros.categoriaIncidencia.llave);
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
					'info',
					"Debe seleccionar un registro de la grilla, por favor verifique",
					'Informaci&oacute;n');
		}
	}
	
	function eliminar() {
		var codigo = $('input[name="fila"]:checked');

		$
				.ajax({
					url : "./eliminarIncidencia",
					type : "POST",
					dataType : "json",
					data : {
						codigo : codigo.val()
					}
				})
				.done(
						function(paramJson) {
							if (paramJson.estadoRespuesta == 'OK') {
								callNotification('success',
										'Incidencia eliminado', 'Correcto');
								var lstIncidencia = JSON
										.parse(paramJson.parametros.lstIncidencia);
								loadTableIncidencia(lstIncidencia);
								document.getElementById("divIncidencia").style.display = "none";
								cerrarModal();
							} else {
								callNotification('error',
										paramJson.mensajeRespuesta, 'Error');
								cerrarModal();
							}

						}).fail(
						function(jqXHR, textStatus, errorThrown) {
							alert("error" + errorThrown + ", " + jqXHR
									+ "," + textStatus);
						});
	}

	function clearValidation(){
		 //Internal $.validator is exposed through $(form).validate()
		 $('#txtCodigo').focus();
		 var validator = $('#form').validate();
		 //Iterate through named elements inside of the form, and mark them as error free
		 validator.resetForm();//remove error class on name elements and clear history
		 validator.reset();//remove all error and success data

		 $('div.form-group').removeClass('has-error');
		 $('#txtDescripcion').removeAttr('style');
	}

	function limpiarText() {
		clearValidation();
		$('#form')[0].reset();
	}

	function validarNombre() {
		var nombre = document.getElementById("txtDescripcion");
		var cboEmpresa = $("#cboEmpresa");
        var cboProyecto = $("#cboProyecto");
        var cboTipoDocumento = $("#cboTipoDocumento");
        var cboTipoIncidencia =  $("#cboTipoIncidencia");
		var pagina = "incidenciasEspecificas";

		if (nomTemp == nombre.value) {
			guardar();
		} else {
			$.ajax({
				url : "./validarNombre",
				type : "POST",
				dataType : "json",
				data : {
					nombre : nombre.value,
					codigoEmpresa : cboEmpresa.val(),
					codigoProyecto : cboProyecto.val() ,
					codigoTipoDocumento : cboTipoDocumento.val(),
					tipoIncidencia : cboTipoIncidencia.val(),
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

		getIPs(function(ip) {
			console.log(ip);
			ipUser = ip;
		});
		
		// INICIO DE MODAL INCIGENERAL
		function modalInciGeneral(){
			    $("#modalInciGnral").modal('show');
		}
		
		function toggle(source) {
		    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
		    for (var i = 0; i < checkboxes.length; i++) {
		        if (checkboxes[i] != source)
		            checkboxes[i].checked = source.checked;
		    }
		}
	</script>

</body>
</html>