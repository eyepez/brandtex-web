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

					<h2>Mantenimiento de Empresas</h2>
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li><a href="#"> <i class="fa fa-home"></i>
							</a></li>
							<li><span>Mantenimiento de Empresas</span></li>
						</ol>

					</div>
				</header>

				<!-- START: PAGE -->

				<div class="row">

					<div class="col-md-12">
						<section class="panel animated fadeInRight">
							<header class="panel-heading">
								<h2 class="panel-title">LISTA DE EMPRESAS</h2>
							</header>

							<div class="panel-body">
								<div id="tabla">
									<table id="tblEmpresa"
										class="table table-bordered table-striped mb-none">
										<thead>
											<tr>
												<th class="text-center">SEL</th>
												<th class="text-center">CODIGO</th>
												<th class="text-center">TIPO DE DOCUMENTO</th>
												<th class="text-center">NRO DE DOCUMENTO</th>
												<th class="text-center">NOMBRE COMERCIAL</th>
												<th class="text-center">RAZ&Oacute;N SOCIAL</th>
												<th class="text-center">DIRECCI&Oacute;N</th>
												<th class="text-center">REPRESENTANTE</th>
												<th class="text-center">PARTIDA REGISTRAL</th>
												<th class="text-center">CODIGO REFERENCIAL</th>
												<th class="text-center">SIGLA</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
							<footer class="panel-footer">
								<div class="row">
									<div class="center">
										<a id="btnNuevo" class="btn btn-sm btn-primary width-default" onclick="nuevo();"><i class="fa fa-check"> </i> NUEVA</a>
										<a id="btnModificar" class="btn btn-sm btn-primary" onclick="modificar();"><i class="fa fa-refresh"> </i> MODIFICAR</a>
									</div>
								</div>
							</footer>
						</section>
					</div>

					<div class="col-md-12" id="divEmpresa" style="display: none">
						<form  class="form-horizontal" novalidate="novalidate" id="frm" name="frm" method="post" enctype="multipart/form-data">
							<input type="hidden" name="method" value="" /> 

							<section class="panel animated fadeInRight">
								<header class="panel-heading">
									<h2 class="panel-title">DATOS DE LA EMPRESA</h2>

								</header>
								<div class="panel-body">

									<div class="form-group">
										<label class="col-sm-3 control-label">C&Oacute;DIGO <span class="required">*</span></label>
										<div class="col-sm-9">
											<input type="text" id="cod_empr" name="cod_empr" class="form-control"  />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">TIPO DE DOCUMENTO <span class="required">*</span></label>
										<div class="col-sm-9">
											<select id="cbo_tipodocempr" name="cbo_tipodocempr" class="form-control" onchange="cambiarTipoDocumento();">
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">NRO DE DOCUMENTO <span class="required">*</span></label>
										<div class="col-sm-9">
											<input type="text" id="num_docuempr" name="num_docuempr" class="form-control" onkeypress="return soloNumeros(event)" maxlength="8" title="Debe ingresar un n&uacutemero de DNI v&aacutelido, por favor verifique" required />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">NOMBRE COMERCIAL <span class="required">*</span>
										</label>
										<div class="col-sm-9">
											<input type="text" id="des_nombcomerempr" name="des_nombcomerempr" class="form-control" maxlength="100" 
												onkeydown="upperCase(this)" title="Favor, Ingresar un Nombre Comercial." required />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">RAZ&Oacute;N SOCIAL <span class="required">*</span>
										</label>
										<div class="col-sm-9">
											<input type="text" id="des_nombempr" name="des_nombempr" class="form-control" maxlength="100" 
												onkeydown="upperCase(this)" title="Favor, Ingresar un Nombre o Raz&oacute;n Social." required />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">DIRECCI&Oacute;N <span class="required">*</span></label>
										<div class="col-sm-9">
											<input type="text" id="des_direempr" name="des_direempr" class="form-control" maxlength="200" 
												onkeydown="upperCase(this)" title="Favor, Ingresar una Direcci&oacute;n." required />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label">REPRESENTANTE <span class="required">*</span></label>
										<div class="col-sm-9">
											<input type="text" id="des_repreempr" name="des_repreempr" class="form-control" maxlength="50" 
												onkeydown="upperCase(this)" title="Favor ingresar un representante." required />
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label">PARTIDA REGISTRAL <span class="required">*</span></label>
										<div class="col-sm-9">
											<input type="text" id="des_partidaRegistral" name="des_partidaRegistral" class="form-control" onkeypress="return soloNumeros(event)" maxlength="8" 
											  title="Favor ingresar un Partida Registral." required />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label">CODIGO REFERENCIAL <span class="required">*</span></label>
										<div class="col-sm-9">
											<input type="text" id="cod_refempr" name="cod_refempr" class="form-control" maxlength="3"
                                                   onblur="ponerCeros(this)" title="Favor ingresar un Codigo Referencial." required />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label">SIGLA <span class="required">*</span></label>
										<div class="col-sm-9">
											<input type="text" id="sig_empr" name="sig_empr" class="form-control" maxlength="6"
                                                   style="text-transform: uppercase" title="Favor ingresar una Sigla." required />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label">INICIALES DE AREA <span class="required">*</span></label>
										<div class="col-sm-9">
											<input type="text" id="ini_area" name="ini_area" class="form-control" maxlength="6"
												   style="text-transform: uppercase" title="Favor ingresar Area." required />
										</div>
									</div>

									<div class="form-group media-gallery">
										<label class="col-sm-3 control-label">LOGO <span class="required">*</span></label>
										<div class="file-loading col-sm-9 mg-files" style="padding-left: 15px; padding-right: 15px">
											<input id="txtlogoempresa" name="txtlogoempresa" type="file" class="form-control-file" aria-describedby="fileHelp" title="Favor ingresar un logo." accept="image/jpg,image/png,image/jpeg" required>
											<div id="divLogo" class="thumbnail-gallery" style="margin: 0px;">
												<div class="img-thumbnail">
													<img id="imgLogo" class="img-responsive" width="149" height="39" src="#" alt="Logo">
													<input id="hideLogo" type="hidden" name="imgLogo" value="">
													<a id="deleteLogo" rel="tooltip" data-placement="bottom" href="#" data-original-title="Logo"><i class="fa fa-times"></i><span> Eliminar</span></a>
												</div>
											</div>
										</div>
									</div>
									
									<div class="form-group" style="visibility: hidden;   height: 0px;">
										<label class="col-sm-3 control-label">IP USUARIO </label>
										<div class="col-sm-9">
											<input type="text" id="ip_usuario" name="ip_usuario" class="form-control" />
										</div>
									</div>
									
								</div>
								<footer class="panel-footer">
									<div class="row" >
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
	
	var tipoDocTemp = "";
	var numDocTemp = "";
	var codRefTemp = "";
	var validator = null;
	var lstTipoDoc = [];
	
	window.onload = msgSuccessEmpresa;
	//MENSAJE AL INSERTAR NUEVA EMPRESA, LUEGO DE ENVIAR EL FORM
	function msgSuccessEmpresa(){
		var msg = '${msg}';
		console.log(msg);
		if(msg=="true"){
			limpiarText();
			callNotification('success',	'Se ha guardado satisfactoriamente los datos de la empresa', 'Correcto');
			document.getElementById("divEmpresa").style.display = "none";
			var lstEmpresa = '${lstEmpresa}';
			lstTipoDoc = JSON.parse('${lstTipoDoc}');
			var lista = JSON.parse(lstEmpresa);
			loadTableEmpresa(lista);
		}else if(msg=="false"){
			 callNotification('error', "${mensaje}",'Error');
		}
	}
	
	$(document).ready(function() {
		inicializarVariables();
		cargarComponentes();
		
		validator = $('#frm').validate({
				submitHandler : function() {
					validarEmpresa();
					validarCodigoReferencial();
				},
				rules : {
					num_docuempr : {
						minlength : 8,
						required : true
					},
					des_nombcomerempr : {
						minlength : 1,
						required : true
					},
					des_nombempr : {
						minlength : 1,
						required : true
					},
					des_direempr : {
						minlength : 1,
						required : true
					},
					des_repreempr : {
						minlength : 1,
						required : true
					},
					des_partidaRegistral : {
						minlength : 1,
						required : true
					},
					cod_refempr : {
						minlength : 1,
						required : true
					},
					sig_empr : {
						minlength : 1,
						required : true
					}
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
				}
			});

		});
	
		$('#deleteLogo').bind("click", function(e) {
			e.preventDefault();
			
			 $('#txtlogoempresa').val('');
			 $('#imgLogo').attr('src', '#');
			 $('#hideLogo').val('');
			 $('#divLogo').hide();
             $('#txtlogoempresa').show();
		});
	
		$("#txtlogoempresa").bind("change", function () {
			
			//Get reference of FileUpload.
	        var fileUpload = $("#txtlogoempresa")[0];
	 
	        //Check whether the file is valid Image.
	        var regex = new RegExp("([a-zA-Z0-9\s_\\.\-:])+(.jpg|.png|.jpeg)$");
	        if (regex.test(fileUpload.value.toLowerCase())) {
	            //Check whether HTML5 is supported.
	            if (typeof (fileUpload.files) != "undefined") {
	                //Initiate the FileReader object.
	                var reader = new FileReader();
	                //Read the contents of Image File.
	                reader.readAsDataURL(fileUpload.files[0]);
	                reader.onload = function (e) {
	                    //Initiate the JavaScript Image object.
	                    var image = new Image();
	                    //Set the Base64 string return from FileReader as source.
	                    image.src = e.target.result;
	                    image.onload = function () {
	                        //Determine the Height and Width.
	                        var height = this.height;
	                        var width = this.width;
	                        if (height != 39 || width != 149) {
	                        	$("#txtlogoempresa").val("");
	                        	callNotification(
	            						'info',
	            						"Las medidas de la imagen deben ser: ancho <b>149px</b>, alto <b>39px</b>",
	            						'Informaci&oacute;n');
	                            return false;
	                        }
	                        
	                        $('#imgLogo').attr('src', e.target.result);
	                        $('#hideLogo').val(obtenerEncodedDeImagen($('#imgLogo').attr('src')));
	                        $('#txtlogoempresa').hide();
	                        $('#divLogo').show();
	                        
	                        return true;
	                    };
	                }
	            } else {
	            	callNotification(
							'info',
							"Este navegador no soporta HTML5, por favor verifique",
							'Informaci&oacute;n');
	                return false;
	            }
	        } else {
	        	$("#txtlogoempresa")[0].value = "";
	        	callNotification(
						'info',
						"Por favor, cargue una imagen válida (jpg, png, jpeg)",
						'Informaci&oacute;n');
	            return false;
	        }
		});
	

		function inicializarVariables() {
			var tableTest = $('#tblEmpresa').DataTable();
			document.getElementById("divEmpresa").style.display = "none";

			$('#num_docuempr').bind("cut copy paste", function(e) {
				e.preventDefault();
			});
			
             $('#imgLogo').attr('src', '#');
             $('#hideLogo').val('');
             $('#divLogo').hide();
             $('#txtlogoempresa').show();
		}

		function cargarComponentes() {
			$.ajax({
				url : "./cargarComponentesEmpresa",
				type : "POST",
				dataType : "json"
			}).done(
					function(paramJson) {

						if (paramJson.estadoRespuesta == 'OK') {
							lstTipoDoc = JSON.parse(paramJson.parametros.lstTipoDoc);
							loadCboTipoDocumento(lstTipoDoc);
							var lstEmpresa = JSON.parse(paramJson.parametros.lstEmpresa);
							loadTableEmpresa(lstEmpresa);

						} else {
							callNotification('error',
									paramJson.mensajeRespuesta, 'Error');
						}

					}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
			});
		}
		
		function cancelar() {
			limpiarText();
			document.getElementById("divEmpresa").style.display = "none";
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

    function ponerCeros(obj) {
        while (obj.value.length<3)
            obj.value = '0'+obj.value;
    }

		function guardar() {
			console.log("metodo guardar");
			document.frm.action = "./guardarEmpresa";
			document.frm.method.value = "POST";
			document.frm.submit();

		}
		
		function loadCboTipoDocumento(lista) {
			cboTipoDocumento = $('#cbo_tipodocempr');
			if (lstTipoDoc == null) {
				return;
			} else {
				$.each(lstTipoDoc, function(i, item) {
					cboTipoDocumento.append($("<option/>").attr("value",
							item.valor).text(item.llave));
				});
			}
		}

		function loadTableEmpresa(lista) {

			$('#tblEmpresa').dataTable().fnClearTable();
			var tblEmpresa = $('#tblEmpresa').DataTable();

			// Deshabilitando botones
			if(lista.length > 0){
				 $("#btnModificar").removeAttr("disabled");
				 $("#btnEliminar").removeAttr("disabled");
			}else {
				 $("#btnModificar").attr("disabled", true);
				 $("#btnEliminar").attr("disabled", true);
			}

            $.each(lista, function (i, obj) {
                var tipoDocumento = lstTipoDoc.find(function (item) {
                    return item.valor == obj.tipoDocumento;
                });
				var rowNode = tblEmpresa.row
                    .add(['<input type="radio" id="fila" name="fila" value="' + obj.codigo + '">',
										obj.codigo,
										tipoDocumento.llave,
										obj.numDocumento,
										obj.nombreComercial,
										obj.nombre,
                        obj.direccion == null ? "" : obj.direccion,
                        obj.representante == null ? "" : obj.representante,
                        obj.partidaRegistral == null ? "" : obj.partidaRegistral,
                        obj.codigoReferencial == null ? "" : obj.codigoReferencial,
                        obj.sigla == null ? "" : obj.sigla,
                        obj.iniArea == null ? "" : obj.iniArea
                    ]).draw(
								false).node();

				// Centrando columnas seleccion y codigo
                $(rowNode).find('td').each(function (index, td) {
                    if (index == 0 || index == 1) {
						$(td).addClass('text-center');
					}
	        	});
			});
			
		}
		
		function cambiarTipoDocumento() {
			var tipoDoc = $("#cbo_tipodocempr").val();
			$('#num_docuempr').rules('remove', 'minlength');
			switch(tipoDoc){
				case '01':
					$('#num_docuempr').rules('add', {minlength: 8});
					$("#num_docuempr").attr('maxlength','8');
					$("#num_docuempr").attr('title','Debe ingresar un número de DNI válido, por favor verifique');
					break;
				case '02':
					$('#num_docuempr').rules('add', {minlength: 11});
					$("#num_docuempr").attr('maxlength','11');
					$("#num_docuempr").attr('title','Debe ingresar un número de RUC válido, por favor verifique');
			}
		}
		
		function nuevo() {
			$.ajax({
					url : "./nuevaEmpresa",
					type : "POST",
					dataType : "json",
					data : {}
				}).done(
				function(paramJson) {
					if (paramJson.estadoRespuesta == 'OK') {
						document.getElementById("divEmpresa").style.display = "inline";
						document.getElementById("cod_empr").disabled = true;
						limpiarText();
						var secuencial = paramJson.parametros.seq;
						document.getElementById("cod_empr").value = secuencial;
						
						$('#imgLogo').attr('src', '#');
			            $('#hideLogo').val('');
			            $('#divLogo').hide();
			            $('#txtlogoempresa').show();
						
						
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

		function modificar() {
			var codigo = $('input[name="fila"]:checked');
			if (codigo.val() != null) {
				$
						.ajax({
							url : "./modificarEmpresa",
							type : "POST",
							dataType : "json",
							data : {
								codigo : codigo.val()
							}
						})
						.done(
								function(paramJson) {
									if (paramJson.estadoRespuesta == 'OK') {
										
										limpiarText();
										
										document.getElementById("divEmpresa").style.display = "inline";
										document.getElementById("cod_empr").disabled = true;
										document.getElementById("cod_empr").value = codigo
												.val();
										$("#cbo_tipodocempr").val(paramJson.parametros.tipoDocu);
										document.getElementById("num_docuempr").value = paramJson.parametros.numDocu;
										document.getElementById("des_nombcomerempr").value = paramJson.parametros.nombreComercial;
										document.getElementById("des_nombempr").value = paramJson.parametros.nombre;
										document.getElementById("des_direempr").value = retornarCadenaVacia(paramJson.parametros.direccion);
										document.getElementById("des_repreempr").value = retornarCadenaVacia(paramJson.parametros.representante);
										document.getElementById("des_partidaRegistral").value = retornarCadenaVacia(paramJson.parametros.partidaRegistral);
										document.getElementById("cod_refempr").value = retornarCadenaVacia(paramJson.parametros.codigoReferencial);
										document.getElementById("sig_empr").value = retornarCadenaVacia(paramJson.parametros.sigla);
										document.getElementById("ini_area").value = retornarCadenaVacia(paramJson.parametros.iniArea);
										tipoDocTemp = paramJson.parametros.tipoDocu;
										numDocTemp = paramJson.parametros.numDocu;
										codRefTemp = paramJson.parametros.codigoReferencial;
										cambiarTipoDocumento();
										
										if(paramJson.parametros.logo != ""){
											$('#imgLogo').attr('src', 'data:' + guessImageMime(paramJson.parametros.logo) + ';base64,' + paramJson.parametros.logo);
					                        $('#hideLogo').val(obtenerEncodedDeImagen($('#imgLogo').attr('src')));
								            $('#txtlogoempresa').hide();
					                        $('#divLogo').show();
										}else {
											$('#txtlogoempresa').show();
											$('#divLogo').hide();
										}				                        										 
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

		function retornarCadenaVacia(obj){
		    if (obj == null) {
		        return "";
            } else {
		        return obj;
            }
        }
		
		function guessImageMime(data){
		  if(data.charAt(0)=='/'){
		    return "image/jpeg";
		  }else if(data.charAt(0)=='R'){
		    return "image/gif";
		  }else if(data.charAt(0)=='i'){
		    return "image/png";
		  }
		}
		
		function obtenerEncodedDeImagen(src){
			if(src != ""){
				src = src.substring(src.indexOf(",")+1, src.lenght);
			}
			return src
		}


		function eliminar() {
			var codigo = $('input[name="fila"]:checked');

        $.ajax({
            url: "./eliminarEmpresa",
            type: "POST",
            dataType: "json",
            data: {
                codigo: codigo.val()
						}
					})
					.done(
                function (paramJson) {
								if (paramJson.estadoRespuesta == 'OK') {
									callNotification('success',
											'Empresa eliminada', 'Correcto');
									var lstEmpresa = JSON
											.parse(paramJson.parametros.lstEmpresa);
									loadTableEmpresa(lstEmpresa);
									document.getElementById("divEmpresa").style.display = "none";
									cerrarModal();
								} else {
									callNotification('error',
											paramJson.mensajeRespuesta, 'Error');
									cerrarModal();
								}

							}).fail(
            function (jqXHR, textStatus, errorThrown) {
								alert("error" + errorThrown + ", " + jqXHR
										+ "," + textStatus);
							});
		}

    function clearValidation(formElement) {
			 //Internal $.validator is exposed through $(form).validate()
			 $("#cod_empr").focus();
			 var validator = $(formElement).validate();
			 //Iterate through named elements inside of the form, and mark them as error free
			 validator.resetForm();//remove error class on name elements and clear history
			 validator.reset();//remove all error and success data

			 $('div.form-group').removeClass('has-error');
			 $('#num_docuempr').removeAttr('style');
			 $('#des_nombcomerempr').removeAttr('style');
			 $('#des_nombempr').removeAttr('style');
			 $('#des_direempr').removeAttr('style');
			 $('#des_repreempr').removeAttr('style');
        $('#des_partidaRegistral').removeAttr('style');
			 $('#txtlogoempresa').removeAttr('style');
			}

		function limpiarText() {
			var myForm = document.getElementById("frm");
			clearValidation(myForm);
 			$('#frm')[0].reset();
		}

		function soloNumeros(e) {
			var key = window.Event ? e.which : e.keyCode
			return ((key >= 48 && key <= 57) || (key == 8) || (key == 190))
		}

		function validarEmpresa() {
			var tipoDoc = document.getElementById("cbo_tipodocempr");
			var numDoc = document.getElementById("num_docuempr");
        if (numDocTemp != numDoc.value && tipoDocTemp != tipoDoc.value) {
            $.ajax({
                url: "./validarEmpresa",
                type: "POST",
                dataType: "json",
                data: {
                    tipo: tipoDoc.value,
                    numero: numDoc.value
                }
            }).done(
                function (paramJson) {
                    if (paramJson.estadoRespuesta != 'OK') {
                        callNotification('error', paramJson.mensajeRespuesta, 'Error');
                    }
                }).fail(
                function (jqXHR, textStatus, errorThrown) {
                    alert("error" + errorThrown + ", " + jqXHR + ","
                        + textStatus);
                });
        }
    }

    function validarCodigoReferencial() {
        var codRef = document.getElementById("cod_refempr");
        if (codRefTemp == codRef.value) {
				guardar();
			} else {
				$.ajax({
                url: "./validarCodigoReferencial",
                type: "POST",
                dataType: "json",
                data: {
                    codRef: codRef.value
					}
				}).done(
                function (paramJson) {
							if (paramJson.estadoRespuesta != 'OK') {
                        callNotification('notice', paramJson.mensajeRespuesta, 'Error');
							} else {
								guardar();
							}
						}).fail(
                function (jqXHR, textStatus, errorThrown) {
							alert("error" + errorThrown + ", " + jqXHR + ","
									+ textStatus);
						});
			}
		}
	</script>

</body>
</html>