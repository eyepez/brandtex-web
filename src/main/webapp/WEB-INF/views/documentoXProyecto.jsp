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

					<h2>ASIGNACI&Oacute;N DE DOCUMENTOS POR PROYECTOS</h2>
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li><a href="#"> <i class="fa fa-home"></i>
							</a></li>
							<li><span>Asignaci&oacute;n de Documentos por Proyectos</span></li>
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
									<label class="col-md-2 control-label" for="cboEmpresa">EMPRESA</label>
									<div class="col-md-3" style="width: 75%;">
										<select id="cboEmpresa" name="cboEmpresa" class="form-control" onchange="cambiarProyectos();" >
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label" for="cboProyecto">PROYECTOS</label>
									<div class="col-md-3" style="width: 75%;">
										<select id="cboProyecto" name="cboProyecto" class="form-control" onchange="cargarDocProy();" >
										</select>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
									<div class="panel-body">
			
										<div class="form-group">
												<label class="col-md-2 control-label">DOCUMENTO</label>
												<div class="col-md-3" style="width: 75%;">
													<select id="cboDocumento" name="cboDocumento" class="form-control">
													</select>
												</div>
												<a class="btn btn-danger" onclick="agregarDocumento();"><i class="fa fa-plus"></i></a>
										</div>
										
									</div>
								</div>
							</div>

							<header class="panel-heading">
								<h2 class="panel-title">DOCUMENTOS ASIGNADOS AL PROYECTO</h2>
							</header>

							<div class="panel-body">
								<div id="tabla">
									<table id="tblDocumento"
										class="table table-bordered table-striped mb-none">
										<thead>
											<tr>
												<th class="text-center">C&Oacute;DIGO</th>
												<th class="text-center">DOCUMENTO</th>
												<th class="text-center">IND. CONFIG.</th>
												<th class="text-center">ELIMINAR</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</section>
					</div>
					</form>
				</div>
				<div class="row">
					<div class="col-sm-12 animated fadeInRight" style="text-align: center;">
						<button class="btn btn-sm btn-primary" id="btnGuardar" onclick="validarCampos();">GUARDAR ASIGNACI&Oacute;N</button> 
					</div>
				</div>
			</section>
			
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
	
	var ipUser = null;
	var documentoTemp;
	
	$(document).ready(function() {
		inicializarVariables();
	    cargarComponentesDocXProy();
	} );
	
	function inicializarVariables(){
		cboEmpresa = $('#cboEmpresa');
		cboProyecto = $('#cboProyecto');
		cboDocumento = $('#cboDocumento');
		$('#tblDocumento').DataTable();
		$("#btnGuardar").attr("disabled", true);
	}
	
	function cargarComponentesDocXProy(){
		$.ajax({
			url : "./cargarComponentesDocXProy",
			type : "POST",
			dataType : "json"
		})
		.done(
			function(paramJson) {

				if (paramJson.estadoRespuesta == 'OK') {
					var lstEmpresa = JSON.parse(paramJson.parametros.lstEmpresa);
					loadCombo(lstEmpresa);
					
					var lstDocumento = JSON.parse(paramJson.parametros.lstDocumento);
					loadComboDocumento(lstDocumento);
					
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
	
	function cambiarProyectos(){
		var cboEmpresa = $("#cboEmpresa");
		$.ajax({
			url : "./cambiarProyecto",
			type : "POST",
			dataType : "json",
			data : {
				codigoEmpresa 		: cboEmpresa.val()
			}
		})
		.done(
			function(paramJson) {
				if (paramJson.estadoRespuesta == 'OK') {
					var lstProyecto = JSON.parse(paramJson.parametros.lstProyecto);
					loadComboProyecto(lstProyecto);
					$('#tblDocumento').dataTable().fnClearTable();
				} else {
					callNotification('error', paramJson.mensajeRespuesta, 'Error');
				}
			})
		.fail(
			function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR	+ "," + textStatus);
			});
	}
	
	function cargarDocProy(){
		var cboEmpresa = $("#cboEmpresa");
		var cboProyecto = $("#cboProyecto");
		$.ajax({
			url : "./cargarDocProy",
			type : "POST",
			dataType : "json",
			data : {
				codigoProyecto 		: cboProyecto.val(),
				codigoEmpresa		: cboEmpresa.val()
			}
		})
		.done(
			function(paramJson) {
				if (paramJson.estadoRespuesta == 'OK') {
					var lstDocumento = JSON.parse(paramJson.parametros.lstDocumento);
					loadTableDocumento(lstDocumento);
					
				} else {
					callNotification('error', paramJson.mensajeRespuesta, 'Error');
				}
			})
		.fail(
			function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR	+ "," + textStatus);
			});
	}
	
	function loadTableDocumento(lista){
		$('#tblDocumento').dataTable().fnClearTable();
		 var tblDocumento = $('#tblDocumento').DataTable();

		// Deshabilitando botones
		if(lista.length > 0){
			$("#btnGuardar").removeAttr("disabled");
		}else {
			$("#btnGuardar").attr("disabled", true);
		}

		 $.each(lista,function(i,obj){
			 var jsonEncode = encodeURIComponent(JSON.stringify(obj))
			 var rowNode =  tblDocumento.row.add( [
				   obj.codigo.codigoTipoDocumento,
				   obj.tipoDocumento.nombre,
				   obj.estadoConfiguracion == "0" ? 'No' : 'Si',
				   '<a class="delete-row"><i class="fa fa-trash-o" onclick="preguntar(\''+jsonEncode+'\');"></i></a>'
				   ] ).draw( false ).node();
			 
			// Centrando columnas codigo, ind config. y eliminar
			$(rowNode).find('td').each(function(index, td) {
				if(index == 0 || index == 2 || index == 3){
					$(td).addClass('text-center');
				}
        	});
			
		 });
	}
	
	function loadComboDocumento(lista){
		var lstDocumento= lista;
		cboDocumento.append($("<option/>").attr("value","").text("Seleccionar"));
        $.each(lstDocumento, function(i, item) {
			var jsonEncode = encodeURIComponent(JSON.stringify(item));
			cboDocumento.append($("<option/>").attr("value", jsonEncode ).text(lstDocumento[i].nombre));
        });
	}
	
	function loadComboProyecto(lista){
		var lstProyecto = lista;
		cboProyecto = $('#cboProyecto');
		cboProyecto.empty();
		cboProyecto.append($("<option/>").attr("value","").text("Seleccionar"));
		if(lista != null){
			$.each(lstProyecto, function(i, item) {
				cboProyecto.append($("<option/>").attr("value",lstProyecto[i].codigo.codigoProyecto).text(lstProyecto[i].nombre));
			});
		}
	}
	
	function loadCombo(lista){
		var lisEmpresa= lista;
        cboEmpresa.append($("<option/>").attr("value","").text("Seleccionar"));
        $.each(lisEmpresa, function(i, item) {
        	cboEmpresa.append($("<option/>").attr("value",lisEmpresa[i].codigo).text(lisEmpresa[i].nombreComercial)); 
        });
	}
	
	
	function eliminar(){
		
		console.log("codigo " + documentoTemp);
		$.ajax({
			url : "./eliminarDocumento",
			type : "POST",
			dataType : "json",
			data : {
				codigoTipoDocumento : documentoTemp.codigo.codigoTipoDocumento
			}
		})
		.done(
			function(paramJson) {
				if (paramJson.estadoRespuesta == 'OK') {
					callNotification('success', 'Documento eliminado','Correcto');
					cerrarModal();
					
					var lstDocumento = JSON.parse(paramJson.parametros.lstDocumento);
					loadTableDocumento(lstDocumento);
					$("#btnGuardar").removeAttr("disabled");
				} else {
					callNotification('error', paramJson.mensajeRespuesta, 'Error');
					cerrarModal();
				}

		})
		.fail(
			function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
		});
	}
	
	function preguntar(obj){
		documentoTemp = JSON.parse(decodeURIComponent(obj));
		$("#modalEliminar").modal('show');
	}
	
	function cerrarModal(){
		$("#modalEliminar").modal('hide');
	}
	
	function validarCampos(){
		var empresa = $("#cboEmpresa");
		if(empresa.val()==""){
			$("#cboEmpresa").focus().select();
			return false;
		}
		
		var proyecto = $("#cboProyecto");
		if(proyecto.val()==""){
			return false
		}
		
		guardar(empresa.val(), proyecto.val());
	}
	
	function agregarDocumento(){
		var cboDocumento = $("#cboDocumento");
		var cboEmpresa = $("#cboEmpresa");
		var cboProyecto = $("#cboProyecto");
		
		if(cboEmpresa.val() == ""){
			callNotification('notice', "Debe seleccionar un Empresa. Verifique.", 'Alerta');
		}else{
			if(cboProyecto.val() == ""){
				callNotification('notice', "Debe seleccionar un Proyecto. Verifique.", 'Alerta');
			}else{
				if(cboDocumento.val() == ""){
					callNotification('notice', "Debe seleccionar un Documento. Verifique.", 'Alerta');
				}else{
					var documento = JSON.parse(decodeURIComponent(cboDocumento.val()));
					$.ajax({
						url : "./agregarDocumento",
						type : "POST",
						dataType : "json",
						data : {
							codigoTipoDocumento : documento.codigo,
							codigoEmpresa	: cboEmpresa.val(),
							codigoProyecto	: cboProyecto.val(),
							nombreTipoDocumento : documento.nombre
						}
					})
					.done(
						function(paramJson) {
							if (paramJson.estadoRespuesta == 'OK') {
								var lstDocumento = JSON.parse(paramJson.parametros.lstDocumento);
								loadTableDocumento(lstDocumento);
							} else {
								callNotification('notice', paramJson.mensajeRespuesta, 'Alerta');
							}
					})
					.fail(
						function(jqXHR, textStatus, errorThrown) {
							alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
					});
				}
			}	
		}
	}
	
	function guardar(empresa, proyecto){

			$.ajax({
				url : "./guardarDocXProy",
				type : "POST",
				dataType : "json",
				data : {
					codigoProyecto 		: proyecto,
					codigoEmpresa		: empresa
				}
			})
			.done(
				function(paramJson) {

					if (paramJson.estadoRespuesta == 'OK') {

						callNotification('success','Se ha guardado satisfactoriamente los datos del proyecto','Correcto');
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
	
    getIPs(function(ip){
    	console.log(ip);
    	ipUser = ip;
    });
	
	</script>

</body>
</html>