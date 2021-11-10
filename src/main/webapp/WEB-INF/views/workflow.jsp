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

					<h2>CONFIGURACI&Oacute;N DE WORKFLOW POR PROYECTO</h2>
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li><a href="#"> <i class="fa fa-home"></i>
							</a></li>
							<li><span>Configuraci&oacute;n de Proyecto por
									Proyecto</span></li>
						</ol>

<!-- 						<a class="sidebar-right-toggle" data-open="sidebar-right"><i -->
<!-- 							class="fa fa-chevron-left"></i></a> -->
					</div>
				</header>

				<!-- START: PAGE -->

				<div class="row">
				<form  action="" class="form-horizontal"  id="form" name="form">
					<div class="col-md-12">
						<section class="panel animated fadeInRight">
							<div class="panel-body">

								<div class="form-group">
									<label class="col-md-2 control-label" for="cboTipoDocu">EMPRESA</label>
									<div class="col-md-3" style="width: 75%;">
										<select id="cboEmpresa" name="cboEmpresa" class="form-control"d	onchange="cambiarEmpresa();">
										</select>
									</div>
								</div>
							</div>
							
							<div class="panel-body">

								<div class="form-group">

									<label class="col-md-2 control-label">PROYECTO</label>
									<div class="col-md-3" style="width: 75%;">
										<select id="cboProyecto" name="cboProyecto" class="form-control" onchange="cambiarProyecto();">
										</select>
									</div>
								</div>
							</div>
						</section>
					</div>
				</form>
				</div>

				<div class="row">
					<div class="col-md-6">
						<section class="panel animated fadeInRight">

							<header class="panel-heading">
								<h2 class="panel-title">LISTA DE PROCESOS</h2>
							</header>

							<div class="panel-body">
								<div id="tabla">
									<table id="tblProceso"
										class="table table-bordered table-striped mb-none">
										<thead>
											<tr>
												<th class="text-center">M&Oacute;DULO</th>
												<th class="text-center">PROCESO</th>
												<th class="text-center">&Oacute;RDEN</th>
												<th class="text-center">ACCI&Oacute;N</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</section>
					</div>
					
					<div class="col-md-6">
						<section class="panel animated fadeInRight">

							<header class="panel-heading">
								<h2 class="panel-title">WORKFLOW ASIGNADO AL PROYECTO</h2>
							</header>

							<div class="panel-body">
								<div id="tabla">
									<table id="tblWorkflow"
										class="table table-bordered table-striped mb-none">
										<thead>
											<tr>
												<th class="text-center">M&Oacute;DULO</th>
												<th class="text-center">PROCESO</th>
												<th class="text-center">&Oacute;RDEN</th>
												<th class="text-center">ACCI&Oacute;N</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</section>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 animated fadeInRight" style="text-align: center;">
						<button id="btnGuardar" class="btn btn-sm btn-primary" onclick="guardar();">GUARDAR ASIGNACI&Oacute;N</button> 
					</div>
				</div>
			</section>
		</div>


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
	
	var cantList = parseInt("0");
	
	$(document).ready(function() {
		inicializarVariables();
	    cargarComponentes();
	} );
	
	function inicializarVariables(){
		cboEmpresa = $('#cboEmpresa');
		cboProyecto = $('#cboProyecto');
		$('#tblProceso').DataTable();
	    $('#tblWorkflow').DataTable();
	    $("#btnGuardar").attr("disabled", true);
	}
	
	function cargarComponentes(){
		$.ajax({
			url : "./cargarComponentesWorkflow",
			type : "POST",
			dataType : "json"
		})
		.done(
			function(paramJson) {

				if (paramJson.estadoRespuesta == 'OK') {
					var lstEmpresa = JSON.parse(paramJson.parametros.lstEmpresa);
					loadComboEmpresa(lstEmpresa);
					
					loadComboProyecto(null);
					
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
	
	function loadComboEmpresa(lista){
		var listEmpresa= lista;
        cboEmpresa.append($("<option/>").attr("value","").text("Seleccionar"));
        $.each(listEmpresa, function(i, item) {
        	cboEmpresa.append($("<option/>").attr("value",listEmpresa[i].codigo).text(listEmpresa[i].nombreComercial)); 
        });
	}
	
	function loadComboProyecto(lista){
		var listProyecto= lista;
		cboProyecto = $('#cboProyecto');
		cboProyecto.empty();
		if(listProyecto == null){
			cboProyecto.append($("<option/>").attr("value","").text("Seleccionar"));	
		}else{
			cboProyecto.append($("<option/>").attr("value","").text("Seleccionar"));
	        $.each(listProyecto, function(i, item) {
	        	cboProyecto.append($("<option/>").attr("value",listProyecto[i].codigo.codigoProyecto).text(listProyecto[i].nombre)); 
	        });
		}
	}
	
	function loadTableProceso(lista){
		 $('#tblProceso').dataTable().fnClearTable();
		 var tblProceso = $('#tblProceso').DataTable(); 
		 $.each(lista,function(i,obj){
			 var jsonEncode = encodeURIComponent(JSON.stringify(obj));
			 var rowNode = tblProceso.row.add( [
				   obj.modulo.nombre,
				   obj.nombre,
				   obj.modulo.numOrden + ' - ' + obj.numOrden,
				   '<a  onclick="agregar(\''+jsonEncode+'\');"><i class="fa fa-arrow-right" > </i></a>'
				   ] ).draw( false ).node();
			
			// Centrando columnas orden y accion
			$(rowNode).find('td').each(function(index, td) {
				if(index == 2 || index == 3){
					$(td).addClass('text-center');
				}
        	});
	    });
		var table = $('#tblProceso').DataTable();
		table.order( [ 2, 'asc' ] ).draw();
	}
	
	function loadTableWorkflow(lista){
		 $('#tblWorkflow').dataTable().fnClearTable();
		 var tblWorkflow = $('#tblWorkflow').DataTable(); 
		 
		 if(lista.length > 0){
				$("#btnGuardar").removeAttr("disabled");
			}else {
				$("#btnGuardar").attr("disabled", true);
			}
		 
		 $.each(lista,function(i,obj){
			 var jsonEncode = encodeURIComponent(JSON.stringify(obj));
			 var rowNode = tblWorkflow.row.add( [
				   obj.modulo.nombre,
				   obj.proceso.nombre,
				   obj.modulo.numOrden+' - '+obj.proceso.numOrden,
				   '<a onclick="quitar(\''+jsonEncode+'\');"><i class="fa fa-arrow-left" > </i></a>'
				   ] ).draw( false ).node();
			 
			// Centrando columnas orden y accion
			$(rowNode).find('td').each(function(index, td) {
				if(index == 2 || index == 3){
					$(td).addClass('text-center');
				}
        	});
		  });
		 var table = $('#tblWorkflow').DataTable();
		 table.order( [ 2, 'asc' ] ).draw();
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
					$('#tblProceso').dataTable().fnClearTable();
					$('#tblWorkflow').dataTable().fnClearTable();
					$("#btnGuardar").attr("disabled", true);
				} else {
					callNotification('error', paramJson.mensajeRespuesta, 'Error');
				}
			})
		.fail(
			function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR	+ "," + textStatus);
			});
	}
	
	function cambiarProyecto(){
		var cboEmpresa = $("#cboEmpresa");
		var cboProyecto = $("#cboProyecto");
		
		$.ajax({
			url : "./cambiarProyectoWorkflow",
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
					
					var lstWorkflow = JSON.parse(paramJson.parametros.lstWorkflow);
					loadTableWorkflow(lstWorkflow);
					cantList = parseInt(lstWorkflow.length);
					
					var lstProcModu = JSON.parse(paramJson.parametros.lstProcModu);
					loadTableProceso(lstProcModu);
					
				} else {
					callNotification('error', paramJson.mensajeRespuesta, 'Error');
				}
			})
		.fail(
			function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR	+ "," + textStatus);
			});
	}
	
	function agregar(obj){
		var cboEmpresa = $("#cboEmpresa");
		var cboProyecto = $("#cboProyecto");
		var procesoSelected = JSON.parse(decodeURIComponent(obj));
		
		$.ajax({
			url : "./agregarAWorkflow",
			type : "POST",
			dataType : "json",
			data : {
				codigoProceso : procesoSelected.codigo.codigoProceso,
				codigoModulo : procesoSelected.codigo.codigoModulo,
				codigoEmpresa : cboEmpresa.val(),
				codigoProyecto : cboProyecto.val()
			}
		})
		.done(
			function(paramJson) {
				if (paramJson.estadoRespuesta == 'OK') {
					var lstWorkflow = JSON.parse(paramJson.parametros.lstWorkflow);
					loadTableWorkflow(lstWorkflow);
					
					var lstProcModu = JSON.parse(paramJson.parametros.lstProcModu);
					loadTableProceso(lstProcModu);
					cantList = parseInt(cantList) + 1;
				} else {
					callNotification('error', paramJson.mensajeRespuesta, 'Error');
				}
			})
		.fail(
			function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR	+ "," + textStatus);
			});
	}
	
	function quitar(obj){
		var cboEmpresa = $("#cboEmpresa");
		var cboProyecto = $("#cboProyecto");
		var workflowSelected = JSON.parse(decodeURIComponent(obj));
		
		$.ajax({
			url : "./eliminarDeWorkflow",
			type : "POST",
			dataType : "json",
			data : {
				codigoProceso : workflowSelected.codigo.codigoProceso,
				codigoModulo : workflowSelected.codigo.codigoModulo,
				codigoEmpresa : cboEmpresa.val(),
				codigoProyecto : cboProyecto.val()
			}
		})
		.done(
			function(paramJson) {
				if (paramJson.estadoRespuesta == 'OK') {
					var lstWorkflow = JSON.parse(paramJson.parametros.lstWorkflow);
					loadTableWorkflow(lstWorkflow);
					
					var lstProcModu = JSON.parse(paramJson.parametros.lstProcModu);
					loadTableProceso(lstProcModu);
					 $("#btnGuardar").attr("disabled", false);
					cantList = parseInt(cantList) - 1;
				} else {
					callNotification('error', paramJson.mensajeRespuesta, 'Error');
				}
			})
		.fail(
			function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR	+ "," + textStatus);
			});
	}
	
	function guardar(){
		var cboEmpresa = $("#cboEmpresa");
		var cboProyecto = $("#cboProyecto");
		if(parseInt(cantList) >= 3){
			$.ajax({
				url : "./guardarWorkflow",
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
							callNotification('success', "La Configuraci&oacute;n se ha guardado satisfactoriamente", 'Correcto');
						} else {
							callNotification('error', paramJson.mensajeRespuesta, 'Error');
						}
					})
					.fail(
					function(jqXHR, textStatus, errorThrown) {
						alert("error" + errorThrown + ", " + jqXHR	+ "," + textStatus);
					});
		}else{
			callNotification('notice', "Debe asignar como m&iacute;nimo 03 procesos para el workflow del proyecto, por favor verifique", 'Alerta')
		}
	}
	</script>

</body>
</html>