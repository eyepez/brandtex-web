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

					<h2>ASIGNACI&Oacute;N DE PROYECTOS POR USUARIOS</h2>
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li><a href="#"> <i class="fa fa-home"></i>
							</a></li>
							<li><span>Asignaci&oacute;n de Proyectos por
									Usuarios</span></li>
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
									<label class="col-md-2 control-label" for="cboEmpresa">EMPRESA</label>
									<div class="col-md-3" style="width: 75%;">
										<select id="cboEmpresa" name="cboEmpresa" class="form-control" onchange="cambiarProyectos();" >
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label" for="cboProyecto">PROYECTOS</label>
									<div class="col-md-3" style="width: 75%;">
										<select id="cboProyecto" name="cboProyecto" class="form-control" onchange="cambiarUsuarios();" >
										</select>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
									<div class="panel-body">
			
										<div class="form-group">
												<label class="col-md-2 control-label">USUARIO</label>
												<div class="col-md-3" style="width: 75%;">
													<select data-plugin-selectTwo id="cboUsuario" name="cboUsuario" class="form-control populate placeholder">
													</select>
												</div>
												<a class="btn btn-danger" onclick="agregarUsuario();"><i class="fa fa-plus"></i></a>
										</div>
										
									</div>
								</div>
							</div>

							<header class="panel-heading">
								<h2 class="panel-title">LISTA DE USUARIOS ASIGNADOS AL PROYECTO</h2>
							</header>

							<div class="panel-body">
								<div id="tabla">
									<table id="tblUsuario"
										class="table table-bordered table-striped mb-none">
										<thead>
											<tr>
												<th class="text-center">C&Oacute;DIGO</th>
												<th class="text-center">USUARIO</th>
												<th class="text-center">NOMBRE COMPLETO</th>
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
	var usuarioTemp;
	
	$(document).ready(function() {
		inicializarVariables();
	    cargarComponentes();
	    
	} );
	
	function inicializarVariables(){
		cboEmpresa = $('#cboEmpresa');
		cboProyecto = $('#cboProyecto');
		cboUsuario = $('#cboUsuario');
		$('#tblUsuario').DataTable();
		$("#btnGuardar").attr("disabled", true);
	}
	
	function cargarComponentes(){
		$.ajax({
			url : "./cargarComponentes",
			type : "POST",
			dataType : "json"
		})
		.done(
			function(paramJson) {

				if (paramJson.estadoRespuesta == 'OK') {
					var lstEmpresa = JSON.parse(paramJson.parametros.lstEmpresa);
					loadCombo(lstEmpresa);
					
					var lstUsuario = JSON.parse(paramJson.parametros.lstUsuario);
					loadComboUsuario(lstUsuario);
					
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
		var combo = $("#cboEmpresa");
		$.ajax({
			url : "./cambiarProyecto",
			type : "POST",
			dataType : "json",
			data : {
				codigoEmpresa 		: combo.val()
			}
		})
		.done(
			function(paramJson) {
				if (paramJson.estadoRespuesta == 'OK') {
					var lstProyecto = JSON.parse(paramJson.parametros.lstProyecto);
					loadComboProyecto(lstProyecto);
					
					var lstUsuario = JSON.parse(paramJson.parametros.lstUsuario);
					loadTableUsuario(lstUsuario);
					
				} else {
					callNotification('error', paramJson.mensajeRespuesta, 'Error');
				}
			})
		.fail(
			function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR	+ "," + textStatus);
			});
	}
	
	function cambiarUsuarios(){
		var empresa = $("#cboEmpresa");
		var proyecto = $("#cboProyecto");
		$.ajax({
			url : "./cambiarUsuario",
			type : "POST",
			dataType : "json",
			data : {
				codigoProyecto 		: proyecto.val(),
				codigoEmpresa		: empresa.val()
			}
		})
		.done(
			function(paramJson) {
				if (paramJson.estadoRespuesta == 'OK') {
					var lstUsuario = JSON.parse(paramJson.parametros.lstUsuario);
					loadTableUsuario(lstUsuario);
					
				} else {
					callNotification('error', paramJson.mensajeRespuesta, 'Error');
				}
			})
		.fail(
			function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR	+ "," + textStatus);
			});
	}
	
	function loadTableUsuario(lista){
		$('#tblUsuario').dataTable().fnClearTable();
		 var tblUsuario = $('#tblUsuario').DataTable(); 
		 
		// Deshabilitando botones
		 if(lista.length > 0){
			 $("#btnGuardar").removeAttr("disabled");
		 }else {
			 $("#btnGuardar").attr("disabled", true);
		 }
		 
		 $.each(lista,function(i,obj){
			 var rowNode = tblUsuario.row.add( [
				   obj.codigo.codigoUsuario,
				   obj.loginUsuario,
				   obj.nombreUsuario,
				   '<a class="delete-row"><i class="fa fa-trash-o" onclick="preguntar('+obj.codigo.codigoUsuario+');"></i></a>'
				   ] ).draw( false ).node();
			 
			// Centrando columnas codigo y opcion eliminar
			$(rowNode).find('td').each(function(index, td) {
				if(index == 0 || index == 3){
					$(td).addClass('text-center');
				}
        	});
		    
		});
		 
	}
	
	function loadComboUsuario(lista){
		var lstUsuario= lista;
        $.each(lstUsuario, function(i, item) {
        	cboUsuario.append($("<optgroup label=" + lstUsuario[i].listaPerfiles[0].descripcion + ">"));
        	cboUsuario.append($("<option/>").attr("value",lstUsuario[i].id).text(lstUsuario[i].nombre + ' ' + lstUsuario[i].apellidoPaterno + ' ' + lstUsuario[i].apellidoMaterno));
        	cboUsuario.append($("</optgroup>"));
        });
	}
	
	function loadComboProyecto(lista){
		var lstProyecto = lista;
		cboProyecto = $('#cboProyecto');
		cboProyecto.empty();
		cboProyecto.append($("<option/>").attr("value","").text("Seleccionar"));
		$.each(lstProyecto, function(i, item) {
			cboProyecto.append($("<option/>").attr("value",lstProyecto[i].codigo.codigoProyecto).text(lstProyecto[i].nombre));
		});
	}
	
	function loadCombo(lista){
		var lisEmpresa= lista;
        cboEmpresa.append($("<option/>").attr("value","").text("Seleccionar"));
        $.each(lisEmpresa, function(i, item) {
        	cboEmpresa.append($("<option/>").attr("value",lisEmpresa[i].codigo).text(lisEmpresa[i].nombreComercial)); 
        });
	}
	
	
	function eliminar(){
		
		console.log("codigo " + usuarioTemp);
		$.ajax({
			url : "./eliminarUsuario",
			type : "POST",
			dataType : "json",
			data : {
				codigoUsuario : usuarioTemp
			}
		})
		.done(
			function(paramJson) {
				if (paramJson.estadoRespuesta == 'OK') {
					callNotification('success', 'Usuario eliminado','Correcto');
					cerrarModal();
					
					var lstUsuario = JSON.parse(paramJson.parametros.lstUsuario);
					loadTableUsuario(lstUsuario);
					$("#btnGuardar").attr("disabled", false);
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
	
	function preguntar(codigo){
		usuarioTemp = codigo;
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
	
	function agregarUsuario(){
		var cboUsuario = $("#cboUsuario");
		var cboEmpresa = $("#cboEmpresa");
		var cboProyecto = $("#cboProyecto");
		if(cboEmpresa.val()==""){
			callNotification('notice', "Debe seleccionar una Empresa. Por favor, verifique.", 'Alerta');
		}else if(cboProyecto.val()==""){
			callNotification('notice', "Debe seleccionar un Proyecto. Por favor, verifique.", 'Alerta');
		}else if ($("#select2-chosen-1").text().trim() == ""){ 
			callNotification('notice', "Debe seleccionar un Usuario. Por favor, verifique.", 'Alerta');
		} else {
				$.ajax({
					url : "./agregarUsuario",
					type : "POST",
					dataType : "json",
					data : {
						codigoUsuario : cboUsuario.val()
					}
				})
				.done(
					function(paramJson) {
						if (paramJson.estadoRespuesta == 'OK') {
							var lstUsuario = JSON.parse(paramJson.parametros.lstUsuario);
							loadTableUsuario(lstUsuario);
						} else {
							callNotification('error', paramJson.mensajeRespuesta, 'Error');
						}
				})
				.fail(
					function(jqXHR, textStatus, errorThrown) {
						alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
				});
		}
	}
	
	function guardar(empresa, proyecto){

			$.ajax({
				url : "./guardarProyXUsua",
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

						callNotification('success','La asignaci&oacute;n se ha realizado satisfactoriamente','Correcto');
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