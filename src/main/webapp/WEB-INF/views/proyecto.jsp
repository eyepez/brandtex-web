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

					<h2>ASIGNACI&Oacute;N DE PROYECTOS POR EMPRESAS</h2>
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li><a href="#"> <i class="fa fa-home"></i>
							</a></li>
							<li><span>Asignaci&oacute;n de Proyectos por Empresas</span></li>
						</ol>
					</div>
				</header>

				<!-- START: PAGE -->

				<div class="row">

					<div class="col-md-12">
						<section class="panel animated fadeInRight">
						
							<div class="panel-body">
											
								<div class="form-group">
								  
								  <label class="col-md-1 control-label" for="cboEmpresa">EMPRESA</label>
									<div class="col-md-3" style="width: 75%;">
										<select id="cboEmpresa" name="cboEmpresa" class="form-control" onchange="cambiarProyectos();">
	                                 </select>
									</div>
								</div>
							</div>
											
						
							<header class="panel-heading">
								<h2 class="panel-title">PROYECTOS ASIGNADOS A LA EMPRESA</h2>
							</header>

							<div class="panel-body">
								<div id="tabla">
									<table id="tblProyecto"
										class="table table-bordered table-striped mb-none">
										<thead>
											<tr>
												<th class="text-center">SEL</th>
												<th class="text-center">C&Oacute;DIGO</th>
												<th class="text-center">PROYECTO</th>
												<th class="text-center">DESCRIPCI&Oacute;N</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
							<footer class="panel-footer">
								<div class="row">
									<div class="center">
										<a id="btnNuevo" class="btn btn-sm btn-primary width-default" onclick="nuevo();"><i class="fa fa-check"> </i> NUEVO</a>
										<a id="btnModificar" class="btn btn-sm btn-primary width-default" onclick="modificar();"><i class="fa fa-refresh"> </i> MODIFICAR</a>
									</div>
								</div>
							</footer>
						</section>
					</div>

					<div class="col-md-12" id="divProyecto" style="display: none">
						<form method="post" class="form-horizontal"  id="form" name="form">
							<input type="hidden" name="method" value="" /> 

							<section class="panel animated fadeInRight">
								<header class="panel-heading">
									<h2 class="panel-title">DATOS DEL PROYECTO</h2>

								</header>
								<div class="panel-body">

									<div class="form-group">
										<label class="col-sm-3 control-label"> C&Oacute;DIGO <span class="required">*</span></label>
										<div class="col-sm-9">
											<input type="text" id="txtCodigo" name="txtCodigo" class="form-control"  />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label"> PROYECTO <span class="required">*</span>
										</label>
										<div class="col-sm-9">
											<input type="text" id="txtNombre" name="txtNombre" class="form-control" maxlength="100" 
												onkeydown="upperCase(this)" title="Favor, Ingresar un Proyecto" required />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label"> DESCRIPCI&Oacute;N <span class="required">*</span></label>
										<div class="col-sm-9">
											<input type="text" id="txtDescripcion" name="txtDescripcion" class="form-control" maxlength="200" 
												onkeydown="upperCase(this)" title="Favor, Ingresar una Descripci&oacute;n." required />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label"> TIPO DE PROYECTO <span class="required">*</span></label>
										<div class="col-sm-3">
											<div class="radio-custom radio-primary">
												<input type="radio" id="rdoCap2" name="rdoTipoLegal" value="0">
                                                <label for="rdoCap2">SIN VALOR LEGAL</label>
											</div>
                                            <div class="radio-custom radio-primary">
                                                <input type="radio" id="rdoCap1" name="rdoTipoLegal" value="1">
                                                <label for="rdoCap1">CON VALOR LEGAL</label>
                                            </div>
										</div>
										<label class="col-sm-3 control-label"> OCR <span class="required">*</span></label>
										<div class="col-sm-3">
											<div class="radio-custom radio-primary">
												<input type="radio" id="rdoOcr2" name="rdoTipoOcr" value="01">
												<label for="rdoOcr2">SIN OCR</label>
											</div>
											<div class="radio-custom radio-primary">
												<input type="radio" id="rdoOcr1" name="rdoTipoOcr" value="02">
												<label for="rdoOcr1">CON OCR</label>
											</div>
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
	var cboEmpresa = null;
	var nomTemp = "";
	
	$(document).ready(function() {
		inicializarVariables();
		cargarComponentes();
		
		$('#form').validate(
				 {
				 submitHandler: function() {
					 validarNombre();
				 },
				  rules: {
					txtNombre: {
				      minlength: 1,
				      required: true
				    },
				    txtDescripcion: {
					      minlength: 1,
					      required: true
					},
				  },
				  highlight: function(element) {
					$(element).css({"border-color": "#d2322d"}).closest('.form-group').addClass('has-error');
				  },
				  unhighlight: function(element) {
				        $(element).css({"border-color": "#cccccc"}).closest('.form-group').removeClass('has-error');
				    },
				 });
		
		
	});
	
	function inicializarVariables(){
		var tableTest= $('#tblProyecto').DataTable();
		document.getElementById("divProyecto").style.display = "none";
		cboEmpresa = $('#cboEmpresa');
	}
	
	function cargarComponentes(){
		$.ajax({
			url : "./cargarComponentesProyecto", 
			type : "POST",
			dataType : "json"
		})
		.done(
			function(paramJson) {

				if (paramJson.estadoRespuesta == 'OK') {

					var lstEmpresa = JSON.parse(paramJson.parametros.lstEmpresa);
					loadCombo(lstEmpresa);
					
					var lstProyecto = JSON.parse(paramJson.parametros.lstProyecto);
					loadTableProyecto(lstProyecto);

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
		limpiarText();
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
					loadTableProyecto(lstProyecto);
				} else {
					callNotification('error', paramJson.mensajeRespuesta, 'Error');
				}
			})
		.fail(
			function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR	+ "," + textStatus);
			});
	}
	
	function loadCombo(lista){
		var lisEmpresa= lista;
        cboEmpresa.append($("<option/>").attr("value","").text("Seleccionar"));
        $.each(lisEmpresa, function(i, item) {
        	cboEmpresa.append($("<option/>").attr("value",lisEmpresa[i].codigo).text(lisEmpresa[i].nombreComercial)); 
        });
	}
	
	function cancelar(){
		limpiarText();
		document.getElementById("divProyecto").style.display = "none";
	}
	
	function guardar() {

		var codEmp = document.getElementById("txtCodigo");
		var nomEmp = document.getElementById("txtNombre");
		var dirEmp = document.getElementById("txtDescripcion");
		var empresa	= $("#cboEmpresa");
		var tipoProyecto = $("input[name='rdoTipoLegal']:checked").val();
		var tipoOcr = $("input[name='rdoTipoOcr']:checked").val();
		
		if(!cboEmpresa.val() == ""){
			$.ajax({
				url : "./guardarProyecto",
				type : "POST",
				dataType : "json",
				data : {
					codigo 		: codEmp.value,
					nombre 		: nomEmp.value,
					descripcion	: dirEmp.value,
					empresa		: empresa.val(),
                    tipoProyecto: tipoProyecto,
					tipoOcr		: tipoOcr,
					ipUser 		: ipUser
				}
			})
			.done(
				function(paramJson) {

					if (paramJson.estadoRespuesta == 'OK') {

						limpiarText();
						callNotification('success','Se ha guardado satisfactoriamente los datos del proyecto','Correcto');
						document.getElementById("divProyecto").style.display = "none";
						var lstProyecto = JSON.parse(paramJson.parametros.lstProyecto);
						loadTableProyecto(lstProyecto);
						var objBoton = document.getElementById('btnCancelar');
						 if (objBoton){
							 objBoton.click();   
						}	
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
			callNotification('notice', "Debe seleccionar una Empresa, por favor verifique", 'Informaci&oacute;n');
		}
	}
	
	function loadTableProyecto(lista){
		 
		 $('#tblProyecto').dataTable().fnClearTable();
		 var tblProyecto = $('#tblProyecto').DataTable(); 
		 
		 // Deshabilitando botones
		 var cboEmpresa = $("#cboEmpresa");
		 if(cboEmpresa.val() == ""){
			 $("#btnNuevo").attr("disabled", true);
			 $("#btnModificar").attr("disabled", true);
		 }else{
			 $("#btnNuevo").removeAttr("disabled");
			 if(lista.length > 0){
				 $("#btnModificar").removeAttr("disabled");
			 }else {
				 $("#btnModificar").attr("disabled", true);
			 }
		 }
		 
		 $.each(lista,function(i,obj){
			 
			var rowNode = tblProyecto.row.add( [
				   '<input type="radio" id="fila" name="fila" value="'+ obj.codigo.codigoProyecto  +'">',
				   obj.codigo.codigoProyecto,
				   obj.nombre,
				   obj.descripcion
				   ] ).draw( false ).node();
			
			// Centrando columnas seleccion y codigo
			$(rowNode).find('td').each(function(index, td) {
				if(index == 0 || index == 1){
					$(td).addClass('text-center');
				}
        	});
			
			
		  });
			
	}

	function nuevo() {
		var cboEmpresa = $("#cboEmpresa");
		if(cboEmpresa != null){
			$.ajax({
				url : "./nuevoProyecto",
				type : "POST",
				dataType : "json",
				data : {	codigoEmpresa : cboEmpresa.val() }
			})
			.done(
				function(paramJson) {
					if (paramJson.estadoRespuesta == 'OK') {
						document.getElementById("divProyecto").style.display = "inline";
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
			callNotification('notice', "Debe seleccionar una Empresa", 'Alerta');
		}
	}
		
	function modificar(){
		var filaProyecto = $('input[name="fila"]:checked');
		var cboEmpresa	= $("#cboEmpresa");
		
		if(!cboEmpresa.val() == ""){
			if(filaProyecto.val()!=null){
				$.ajax({
					url : "./modificarProyecto",
					type : "POST",
					dataType : "json",
					data : {	
						codigoProyecto 	:	filaProyecto.val(),
						codigoEmpresa	:	cboEmpresa.val()
					}
				})
				.done(
					function(paramJson) {
						if (paramJson.estadoRespuesta == 'OK') {
							limpiarText();
							document.getElementById("divProyecto").style.display = "inline";
				 			document.getElementById("txtCodigo").disabled = true;
				 			document.getElementById("txtCodigo").value = filaProyecto.val();
				 			document.getElementById("txtNombre").value = paramJson.parametros.nombre; 
				 			document.getElementById("txtDescripcion").value = paramJson.parametros.descripcion;
                            $("input[name='rdoTipoLegal']").val([paramJson.parametros.tipoProyecto]);
							$("input[name='rdoTipoOcr']").val([paramJson.parametros.tipoOcr]);
				 			nomTemp = paramJson.parametros.nombre;
						} else {
							callNotification('error', paramJson.mensajeRespuesta, 'Error');
						}

					}).fail(
					function(jqXHR, textStatus, errorThrown) {
						alert("error" + errorThrown + ", " + jqXHR
								+ "," + textStatus);
					});
			}else{
				callNotification('info', "Debe seleccionar un registro de la grilla, por favor verifique", 'Informaci&oacute;n');
			}
		}else{
			callNotification('info', "Debe seleccionar una Empresa, por favor verifique", 'Informaci&oacute;n');
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
		 $('#txtDescripcion').removeAttr('style');
	}
	
	function limpiarText() {
		clearValidation();
		$('#form')[0].reset();
	}
	
	function validarNombre(){
		var nombre = document.getElementById("txtNombre");
		var codEmpresa = $("#cboEmpresa").val();
		
		if(nomTemp == nombre.value){
			guardar();
		}else{
			$.ajax({
				url : "./validarNombre",
				type : "POST",
				dataType : "json",
				data : {	
					codEmpresa: codEmpresa,
					nombre :	nombre.value
				}
			})
			.done(
				function(paramJson) {
					if (paramJson.estadoRespuesta != 'OK') {
						callNotification('notice', paramJson.mensajeRespuesta, 'Alerta');
					}else{
						guardar();
					}

				})
			.fail(
				function(jqXHR, textStatus, errorThrown) {
					alert("error" + errorThrown + ", " + jqXHR
							+ "," + textStatus);
				});
		}
	}

    getIPs(function(ip){
    	console.log(ip);
    	ipUser = ip;
    });
		
	</script>

</body>
</html>