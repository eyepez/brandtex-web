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
								 style="padding-bottom: 15px; padding-top: 8px;">
								<div class="form-group">
									<label class="col-md-2 control-label">CATEGORIA</label>
									<div class="col-md-3 divcboIncidenciaGnral" style="width: 75%;">
										<select id="cboIncidenciaGnral" name="cboIncidenciaGnral"
												class="form-control" onchange="cambiarIncidenciaGnral();">								
										</select>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>

				<div class="row">

					<div class="col-md-12">
						<section class="panel animated fadeInRight">
							<header class="panel-heading">
								<h2 class="panel-title">LISTA DE INCIDENCIAS GENERALES</h2>
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

					<div class="col-md-12" id="divIncidenciaGnral" style="display: none">
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
        cboIncidenciaGnral = $('#cboIncidenciaGnral');
		var tableTest = $('#tblIncidencia').DataTable();
		document.getElementById("divIncidenciaGnral").style.display = "none";
	}

	function cargarComponentes() {
		$.ajax({
			url : "./cargarComponentesIncidenciaGnral",
			type : "POST",
			dataType : "json"
		}).done(
				function(paramJson) {

					if (paramJson.estadoRespuesta == 'OK') {
						var lstIncidenciaGeneral = JSON.parse(paramJson.parametros.lstIncidenciaGnral);
// 						loadTableIncidenciaGnral(lstIncidenciaGeneral);
						loadComboTipoCategoria(lstIncidenciaGeneral);
						cambiarIncidenciaGnral();
					} else {
						callNotification('error',
								paramJson.mensajeRespuesta, 'Error');
					}

				}).fail(function(jqXHR, textStatus, errorThrown) {
			alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
		});
	}

    function loadComboTipoCategoria(lista){
        var lstTipoInciGnral = lista;	
        cboIncidenciaGnral.append($("<option/>").attr("value","").text("Seleccionar"));
        $.each(lstTipoInciGnral, function(i, item) {
              cboIncidenciaGnral.append($("<option/>").attr("value",lstTipoInciGnral[i].llave).text(lstTipoInciGnral[i].valor));
            });
        }
        
	
    function cambiarIncidenciaGnral(){
		limpiarText();
        var cboIncidenciaGnral =  $("#cboIncidenciaGnral");
        $.ajax({
            url : "./cambiarIncidenciaGnral",
            type : "POST",
            dataType : "json",
            data : {
            	cboIncidenciaGnral : cboIncidenciaGnral.val()
            }
        })
            .done(
                function(paramJson) {
                    if (paramJson.estadoRespuesta == 'OK') {
                        var lstIncidenciaGnral = JSON.parse(paramJson.parametros.lstIncidenciaGnral);
                        loadTableIncidenciaGnral(lstIncidenciaGnral);                      
                    } else {
                        callNotification('error', paramJson.mensajeRespuesta, 'Error');
                    }
                })
            .fail(
                function(jqXHR, textStatus, errorThrown) {
                    alert("error" + errorThrown + ", " + jqXHR	+ "," + textStatus);
                });
	}	


	function cancelar() {
		limpiarText();
		document.getElementById("divIncidenciaGnral").style.display = "none";
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

		var codInci = document.getElementById("txtCodigo");
		var nomInci = document.getElementById("txtDescripcion");
		var chkRechazo = $('#chkRechazo').is(':checked');
        var cboIncidenciaGnral =  $("#cboIncidenciaGnral");

		$
				.ajax({
					url : "./guardarIncidenciaGnral",
					type : "POST",
					dataType : "json",
					data : {
						codigo : codInci.value,
						nombre : nomInci.value,
						indRechazo : chkRechazo,
                        codigoInciGnral : cboIncidenciaGnral.val()
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
								document.getElementById("divIncidenciaGnral").style.display = "none";
								var listIncidenciaGnral = JSON.parse(paramJson.parametros.lstIncidenciaGnral);
								loadTableIncidenciaGnral(listIncidenciaGnral);
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

	function loadTableIncidenciaGnral(lista) {

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

	function nuevo() {

                    if(validarSeleccionCombo(cboIncidenciaGnral, "Tipo de Categoria")){

                        $.ajax({
                            url : "./nuevaIncidenciaGnral",
                            type : "POST",
                            dataType : "json",
                            data : {}
                        })
                            .done(
                                function(paramJson) {
                                    if (paramJson.estadoRespuesta == 'OK') {
                                        document.getElementById("divIncidenciaGnral").style.display = "inline";
                                        document.getElementById("txtCodigo").disabled = true;
                                        limpiarText();
//                                         document.getElementById("divDocumento").style.display = "none";
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

	function modificar() {
		var codigo = $('input[name="fila"]:checked');
//         var cboIncidenciaGnral =  $("#cboIncidenciaGnral");

		if (codigo.val() != null) {
			$
					.ajax({
						url : "./modificarIncidenciaGnral",
						type : "POST",
						dataType : "json",
						data : {
							codigo : codigo.val(),
//                             codigoInciGnral : cboIncidenciaGnral.val()
						}
					})
					.done(
							function(paramJson) {
								if (paramJson.estadoRespuesta == 'OK') {
									limpiarText();
									document.getElementById("divIncidenciaGnral").style.display = "inline";
									document.getElementById("txtCodigo").disabled = true;
									document.getElementById("txtCodigo").value = codigo.val();
									document.getElementById("txtDescripcion").value = paramJson.parametros.nombre;
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
					url : "./eliminarIncidenciaGnral",
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
								var lstIncidenciaGnral = JSON
										.parse(paramJson.parametros.lstIncidenciaGnral);
								loadTableIncidenciaGnral(lstIncidenciaGnral);
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
        var cboIncidenciaGnral =  $("#cboIncidenciaGnral");
		var pagina = "incidencia";

		if (nomTemp == nombre.value) {
			guardar();
		} else {
			$.ajax({
				url : "./validarNombre",
				type : "POST",
				dataType : "json",
				data : {
					nombre : nombre.value,
					tipoIncidencia : cboIncidenciaGnral.val(),
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
	</script>

</body>
</html>