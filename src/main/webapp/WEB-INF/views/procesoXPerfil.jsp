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

					<h2>ASIGNACI&Oacute;N DE PROCESO POR PERFILES</h2>
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li><a href="#"> <i class="fa fa-home"></i>
							</a></li>
							<li><span>Asignaci&oacute;n de Procesos por Perfiles</span></li>
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
									<label class="col-md-2 control-label" for="cboPerfil">PERFIL</label>
									<div class="col-md-3" style="width: 75%;">
										<select id="cboPerfil" name="cboPerfil" class="form-control" onchange="cambiarPerfil();">
										</select>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
									<div class="panel-body">
										<div class="form-group">
											<label class="col-md-2 control-label" for="cboModulo">M&Oacute;DULO</label>
											<div class="col-md-3" style="width: 75%;">
												<select id="cboModulo" name="cboModulo" class="form-control" onchange="cambiarModulo();" >
												</select>
											</div>
										</div>
									
										<div class="form-group">
												<label class="col-md-2 control-label">PROCESO</label>
												<div class="col-md-3" style="width: 75%;">
													<select id="cboProceso" name="cboProceso" class="form-control">
													</select>
												</div>
												<a class="btn btn-danger" onclick="agregarProceso();"><i class="fa fa-plus"></i></a>
										</div>
										
									</div>
								</div>
							</div>

							<header class="panel-heading">
								<h2 class="panel-title">PROCESOS ASIGNADOS AL PERFIL</h2>
							</header>

							<div class="panel-body">
								<div id="tabla">
									<table id="tblPerfil"
										class="table table-bordered table-striped mb-none">
										<thead>
											<tr>
												<th class="text-center">M&Oacute;DULO</th>
												<th class="text-center">PROCESO</th>
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
						<button id="btnGuardarAsignacion" class="btn btn-sm btn-primary" onclick="validarCampos();">GUARDAR ASIGNACI&Oacute;N</button> 
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
	var procesoPerfilSeleccionado;
	
	$(document).ready(function() {
		inicializarVariables();
	    cargarPerfil();
	    cargarModulo();
	    cargarProceso();
	    
	} );
	
	function inicializarVariables(){
		cboPerfil = $('#cboPerfil');
		cboModulo = $('#cboModulo');
		cboProceso = $('#cboProceso');
		$("#btnGuardarAsignacion").attr("disabled", true);
		$('#tblPerfil').DataTable({
		    "order": []
		  });
	}
	
	function cargarPerfil(){
		var perfil = $("#cboPerfil");
		
		$.ajax({
			url : "./cargarPerfil",
			type : "POST",
			dataType : "json",
			data : {
				codigoPerfil : perfil.val()
			}
		})
		.done(
			function(paramJson) {
				if (paramJson.estadoRespuesta == 'OK') {
					var lstPerfil = JSON.parse(paramJson.parametros.lstPerfil);
					loadComboPerfil(lstPerfil);
				} else {
					callNotification('error', paramJson.mensajeRespuesta, 'Error');
				}
			})
		.fail(
			function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR	+ "," + textStatus);
			});
	}
	
	function cargarModulo(){
		$.ajax({
			url : "./cargarModulo",
			type : "POST",
			dataType : "json"
		})
		.done(
			function(paramJson) {
				if (paramJson.estadoRespuesta == 'OK') {
					var lstModulo = JSON.parse(paramJson.parametros.lstModulo);
					loadComboModulo(lstModulo);
				} else {
					callNotification('error', paramJson.mensajeRespuesta, 'Error');
				}
			}).fail(
			function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR
						+ "," + textStatus);
			});
	}
	
	function cargarProceso(){
		cboProceso = $('#cboProceso');
		cboProceso.empty();
		cboProceso.append($("<option/>").attr("value","").text("Seleccionar"));
	}
	
	function cambiarPerfil(){
		$("#cboModulo option[value='']").prop('selected', true);
		$('#tblPerfil').dataTable().fnClearTable();
	}
	
	function cambiarModulo(){
		var modulo = $("#cboModulo");
		var perfil = $("#cboPerfil");
		if(modulo.val() == ""){
			loadComboProceso(null);
			listarProcesoXPerfil();
		}else{
			$.ajax({
				url : "./cambiarModulo",
				type : "POST",
				dataType : "json",
				data : {
					codigoModulo 		: modulo.val(),
					codigoPerfil		: perfil.val()
				}
			})
			.done(
				function(paramJson) {
					if (paramJson.estadoRespuesta == 'OK') {
						var lstProceso = JSON.parse(paramJson.parametros.lstProceso);
						loadComboProceso(lstProceso);
						
						var lstProcXPerf = JSON.parse(paramJson.parametros.lstProcXPerf);
						loadTablePerfil(lstProcXPerf);
					} else {
						callNotification('error', paramJson.mensajeRespuesta, 'Error');
					}
				})
			.fail(
				function(jqXHR, textStatus, errorThrown) {
					alert("error" + errorThrown + ", " + jqXHR	+ "," + textStatus);
				});
		}
		
	}
	
	function listarProcesoXPerfil(){
		var perfil = $("#cboPerfil");
		
		$.ajax({
			url : "./listarProcesoXPerfil",
			type : "POST",
			dataType : "json",
			data : {
				codigoPerfil		: perfil.val()
			}
		})
		.done(
			function(paramJson) {
				if (paramJson.estadoRespuesta == 'OK') {
					var lstProcXPerf = JSON.parse(paramJson.parametros.lstProcXPerf);
					loadTablePerfil(lstProcXPerf);
				} else {
					callNotification('error', paramJson.mensajeRespuesta, 'Error');
				}
			})
		.fail(
			function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR	+ "," + textStatus);
			});
	}
	
	function loadTablePerfil(lista){
		 $('#tblPerfil').dataTable().fnClearTable();
		 var tblPerfil = $('#tblPerfil').DataTable(); 
		 
		 console.log(lista.length);
		 
		 // Deshabilitando botones
		 if(lista.length > 0){
			 $("#btnGuardarAsignacion").removeAttr("disabled");
		 }else {
			 $("#btnGuardarAsignacion").attr("disabled", true);
		 }
		 $.each(lista,function(i,obj){
				var jsonEncode = encodeURIComponent(JSON.stringify(obj))
				var rowNode = tblPerfil.row.add( [
					   obj.proceso.modulo.nombre,
					   obj.proceso.nombre,
					   '<a class="delete-row"><i class="fa fa-trash-o" onclick="preguntar(\''+jsonEncode+'\');"></i></a>'
					   ] ).draw( false ).node();
			 
				// Centrando columna eliminar
				$(rowNode).find('td').each(function(index, td) {
					if(index == 2){
						$(td).addClass('text-center');
					}
	        	});
		    });
		 
	}
	
	function loadComboPerfil(lista){
		var lisPerfil= lista;
        cboPerfil.append($("<option/>").attr("value","").text("Seleccionar"));
        $.each(lisPerfil, function(i, item) {
        	cboPerfil.append($("<option/>").attr("value",lisPerfil[i].id).text(lisPerfil[i].nombre)); 
        });
	}
	
	function loadComboModulo(lista){
		var lstModulo= lista;
		cboModulo = $('#cboModulo');
		cboModulo.empty();
		cboModulo.append($("<option/>").attr("value","").text("Seleccionar"));
        $.each(lstModulo, function(i, item) {
        	cboModulo.append($("<option/>").attr("value",lstModulo[i].codigo).text(lstModulo[i].nombre));
        });
	}
	
	function loadComboProceso(lstProceso){
		cboProceso = $('#cboProceso');
		cboProceso.empty();
		cboProceso.append($("<option/>").attr("value","").text("Seleccionar"));
		if(lstProceso != null){
			$.each(lstProceso, function(i, item) {
				cboProceso.append($("<option/>").attr("value",lstProceso[i].codigo.codigoProceso).text(lstProceso[i].nombre));
			});			
		}
	}
	
	
	function eliminar(){
		
		$.ajax({
			url : "./eliminarProceso",
			type : "POST",
			dataType : "json",
			data : {
				codigoModulo : procesoPerfilSeleccionado.codigo.codigoModulo,
				codigoProceso : procesoPerfilSeleccionado.codigo.codigoProceso
			}
		})
		.done(
			function(paramJson) {
				if (paramJson.estadoRespuesta == 'OK') {
					callNotification('success', 'Proceso eliminado','Correcto');
					cerrarModal();
					
					var lstProcXPerf = JSON.parse(paramJson.parametros.lstProcXPerf);
					loadTablePerfil(lstProcXPerf);
					$("#btnGuardarAsignacion").removeAttr("disabled");
					 
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
		procesoPerfilSeleccionado = JSON.parse(decodeURIComponent(obj));
		$("#modalEliminar").modal('show');
	}
	
	function cerrarModal(){
		$("#modalEliminar").modal('hide');
	}
	
	function validarCampos(){
		var perfil = $("#cboPerfil");
		if(perfil.val()==""){
			$("#cboPerfil").focus().select();
			return false;
		}
		
		var modulo = $("#cboModulo");
		if(modulo.val()==""){
			$("#cboModulo").focus().select();
			callNotification('notice', "Debe seleccionar un M&oacute;dulo. Verifique.", 'Alerta');
			return false;
		}
		
		guardar(perfil.val());
	}
	
	function agregarProceso(){
		var perfil = $("#cboPerfil");
		var modulo = $("#cboModulo");
		var proceso = $("#cboProceso");
		
		if(perfil.val() == ""){
			callNotification('notice', "Debe seleccionar un Perfil. Por favor verifique.", 'Alerta');
		}else{
			if(modulo.val() == ""){
				callNotification('notice', "Debe seleccionar un M&oacute;dulo. Por favor verifique.", 'Alerta');
			}else{
				if(proceso.val() == ""){
					callNotification('notice', "Debe seleccionar un Proceso. Por favor verifique.", 'Alerta');
				}else{
					$.ajax({
						url : "./agregarProceso",
						type : "POST",
						dataType : "json",
						data : {
							codigoPerfil 	: perfil.val(),
							codigoModulo	: modulo.val(),
							codigoProceso	: proceso.val()
						}
					})
					.done(
						function(paramJson) {
							if (paramJson.estadoRespuesta == 'OK') {
								var lstProcXPerf = JSON.parse(paramJson.parametros.lstProcXPerf);
								loadTablePerfil(lstProcXPerf);
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
	
	function guardar(perfil){

			var cboModulo = $("#cboModulo");
		
			$.ajax({
				url : "./guardarProcXPerfil",
				type : "POST",
				dataType : "json",
				data : {
					codigoPerfil : perfil,
					codigoModulo : cboModulo.val()
				}
			})
			.done(
				function(paramJson) {
					if (paramJson.estadoRespuesta == 'OK') {
						callNotification('success','La asignaci&oacute;n se ha realizado satisfactoriamente','Correcto');
					} else {
						callNotification('error', paramJson.mensajeRespuesta, 'Error');
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