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

					<h2>MONITOREAR REPLICAS</h2>
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li><a href="#"> <i class="fa fa-home"></i>
							</a></li>
							<li><span>Monitorear replicas</span></li>
						</ol>

<!-- 						<a class="sidebar-right-toggle" data-open="sidebar-right"><i -->
<!-- 							class="fa fa-chevron-left"></i></a> -->
					</div>
				</header>

				<!-- START: PAGE -->

				<div class="row">
					<form method="post" class="form-horizontal"  id="form" name="form">
					<div class="col-md-12">
						<section class="panel animated fadeInRight">
						<div class="panel-body">
							<div class="form-group">
												  
												  <label class="col-md-1 control-label" for="cboTipoDocu">ESTADOS:</label>
													<div class="col-md-3">
														<select id="cboEstado" name="cboEstado"  class="form-control mb-md">
														    <option value="0">TODOS...</option>
														    <option value="PROCESADO">PROCESADO</option>
														    <option value="PROCESANDO">EN PROCESO</option>
															<option value="RECIBIDOS">RECIBIDO</option>
															<option value="ACTUALIZADO">ACTUALIZADO</option>
															<option value="ERROR">ERROR</option>
														</select>
													</div>
												  
												<label class="col-md-1 control-label" id="titulo">PROCESO:</label>
												<div class="col-md-4" id="divFecha">
													<div class="input-group" >
														<span class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</span>
														<input type="text" id="txtFechaInicio" name="txtFechaInicio" data-plugin-datepicker title=" " class="form-control" required>
													 
															<span class="input-group-addon">AL</span>
														
														<span class="input-group-addon">
																	<i class="fa fa-calendar"></i>
														</span>
														<input type="text" id="txtFechaFin" name="txtFechaFin" data-plugin-datepicker title=" " class="form-control" required>
													
													</div>
												</div>
												
												<label class="col-md-1 control-label" ></label>
												<div class="col-md-3" >
													<button class="btn btn-sm btn-primary" id="btnBuscar" onclick="buscarReplicas();">BUSCAR</button>
													<a id="btnModalJson" class="mb-xs mt-xs mr-xs modal-with-zoom-anim btn btn-default hide" href="#modalJson">BUSCAR</a>
													<a id="btnCerrarModalJson" class="btn btn-default modal-dismiss hide" href="#modalJson">CERRAR</a> 
												</div>	
												
													
							</div>
							</div>
							
							<header class="panel-heading">
								<h2 class="panel-title">LISTA DE REPLICAS</h2>
							</header>

							<div class="panel-body">
								<div id="tabla">
									<table id="tblReplica"
										class="table table-bordered table-striped mb-none">
										<thead>
											<tr>
												<th class="text-center">C&Oacute;DIGO</th>
												<th class="text-center">EMPRESA</th>
												<th class="text-center">PROYECTO</th>
												<th class="text-center">FEC. REPLICACION</th>
												<th class="text-center">ESTADO</th>
												<th class="text-center">CANTIDAD</th>
												<th class="text-center">DATA</th>
												<th class="text-center">OBSERVACION</th>
												<th class="text-center">USUARIO ENVIO</th>
												<th class="text-center">FEC. REGISTRO</th>
												<th class="text-center">OPCIONES</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
							
						</section>
						
					</div>
					</form>
				</div>
			
			</section>
			
		</div>
		
<!-- 		MODALES -->
		
			<div id="modalJson" class="zoom-anim-dialog modal-block modal-block-primary mfp-hide">
										<section class="panel panel-primary">
											<header class="panel-heading">
												<h2 class="panel-title">Actualizar Data Json</h2>
											</header>
<!-- 											novalidate="novalidate" -->
								<form id="frmCertificado" method="post" action="javascript:actualizarJson()" autocomplete="off" class="form-horizontal mb-lg" >
								<input type="hidden" name="clave" id="clave" disabled="disabled">
											
											<div class="panel-body">
													
													<div class="form-group">
														<label class="col-md-1 control-label" for="idCentral">Central:</label>
														<div class="col-md-12">
															<input type="text" class="form-control input-sm" name="idCentral" id="idCentral"  required disabled="disabled">
														</div>
													</div>
													<div class="form-group">
														<label class="col-md-1 control-label" id="lblJson" for="code_js">Json:</label>
														<div class="col-md-12">
															<textarea class="form-control" rows="12" id="code_js" name="code_js" >
															</textarea>
														</div>
													</div>
													
											</div>
											<footer class="panel-footer">
												<div class="row">
													<div class="col-md-12 text-right">
														<button class="btn btn-primary" id="btnActualizar">Actualizar</button>
														<a href="#" class="btn btn-default" onclick="cerrarModal();">Cancelar</a>
													</div>
												</div>
											</footer>
										</form>	
										</section>
									</div>

		<!-- END: PAGE -->

		<jsp:include page="plantillas/footer.jsp" />

	</section>

	<!-- START: sidebar-->

<%-- 	<jsp:include page="plantillas/sidebar.jsp" /> --%>

	<!-- END: sidebar-->


	<!-- START: LIB JS FOOTER-->
	<jsp:include page="plantillas/libreriasPie.jsp" />
	<!-- END: LIB JS FOOTER-->



	<script type="text/javascript">
	
	var editor = null;
	
	function buscarReplicas(){
		
		var estado = $("#cboEstado").val();
		var inicio = $("#txtFechaInicio").val();
		var fin = $("#txtFechaFin").val();
		
		$("#btnBuscar").attr("disabled", true);
		
		$.ajax({
			url : "./buscarReplicas",
			type : "POST",
			dataType : "json",
			data : {
				estado : estado,
				inicio : inicio,
				fin : fin
			}
		}).done(function(paramJson) {
				if (paramJson.estadoRespuesta == 'OK') {					
					var lstReplicas = JSON.parse(paramJson.parametros.lstReplicas);
					loadTableReplica(lstReplicas);
					$("#btnBuscar").attr("disabled", false);
				} else {
					callNotification('error', paramJson.mensajeRespuesta, 'Error');
				}

		}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
		});
	}
	
	function actualizarJson(){
		
		var idCentral = document.getElementById('idCentral').value;
		var data = document.getElementById('code_js').value;
		var clave = document.getElementById('clave').value;
		
		$("#btnActualizar").attr("disabled", true);
		
		$.ajax({
			url : "./actualizarJson",
			type : "POST",
			dataType : "json",
			data : {
				idCentral : idCentral,
				data : data,
				clave : clave
			}
		}).done(function(paramJson) {
				if (paramJson.estadoRespuesta == 'OK') {
					$("#btnActualizar").attr("disabled", false);
					callNotification('success', paramJson.mensajeRespuesta, 'Correcto');
					buscarReplicas();
				} else {
					callNotification('error', paramJson.mensajeRespuesta, 'Error');
				}

		}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
		});
	}
	
	
	function loadTableReplica(lista){
		$('#tblReplica').dataTable().fnClearTable();
		 var tblReplica = $('#tblReplica').DataTable(); 
		 
		 $.each(lista,function(i,obj){
			 var observacion=obj.observacion;
			 
			 if( typeof observacion === 'undefined' || observacion === null ){
				 observacion = "NINGUNA";
			 }
			 
			 var rowNode = tblReplica.row.add( [
				   obj.codigoCentral,
				   obj.codigoEmpresa,
				   obj.codigoProyecto,
				   obj.fechaReplicacion,
				   obj.estado,
				   obj.cantidadRegistros,
				   "<div align='center'><a href=\"#\" class=\"delete-row\" title=\"Ver Json\" onclick=\"verJson('"+ obj.codigoCentral + "');\" > Ver Data Json</a></div>",
				   observacion,
				   obj.usuarioRegistro,
				   obj.fechaReg,
				   '<a class="delete-row"><i class="fa fa-paper-plane" onclick="reprocesar('+obj.codigoCentral+');"></i></a>'
				   ] ).draw( false ).node();
			 
				$(rowNode).find('td').each(function(index, td) {
						$(td).addClass('align-middle text-center');
	        	});
		    
		});
		 
	}
	
	function reprocesar(idCentral){
		
		$.ajax({
			url : "./actualizarEnvio",
			type : "POST",
			dataType : "json",
			data : {
				idCentral : idCentral
			}
		}).done(function(paramJson) {
				if (paramJson.estadoRespuesta == 'OK') {
					callNotification('success', paramJson.mensajeRespuesta, 'Correcto');
					buscarReplicas();
				} else {
					callNotification('error', paramJson.mensajeRespuesta, 'Error');
				}

		}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
		});
	}
	
	function verJson(idCentral){
		
		$.ajax({
			url : "./obtenerData",
			type : "POST",
			dataType : "json",
			data : {
				idCentral : idCentral
			}
		}).done(function(paramJson) {
				if (paramJson.estadoRespuesta == 'OK') {					
					document.getElementById('idCentral').value = idCentral;
					document.getElementById('code_js').innerHTML = "";
					document.getElementById('clave').value = paramJson.parametros.clave;

					var dataJson=JSON.parse(paramJson.parametros.data);
					document.getElementById('code_js').value = JSON.stringify(dataJson,null,"\t");

					editor = CodeMirror.fromTextArea(document.getElementById("code_js"), {
						  mode: "application/json",
						  styleActiveLine: true,
						  lineNumbers: true,
						  lineWrapping: true,
						  theme : 'monokai'
						});

					editor.refresh();

					$("#btnModalJson").click();
					document.getElementById("code_js").click();
				} else {
					callNotification('error', paramJson.mensajeRespuesta, 'Error');
				}

		}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
		});
		
	}
	
	function cerrarModal(){
		 editor.toTextArea();
		 
		var objBoton = document.getElementById('btnCerrarModalJson');
		 if (objBoton){
			 objBoton.click();   
		}
	}
	

	$('#tblReplica').dataTable().fnClearTable();
	var tblReplica = $('#tblReplica').DataTable();
	
	 $('#txtFechaInicio').datepicker({
		 format: "dd/mm/yyyy",
	     language: 'es'
		});
		
		$('#txtFechaFin').datepicker({
			format: "dd/mm/yyyy",
		     language: 'es'
		});
	
	</script>

</body>
</html>