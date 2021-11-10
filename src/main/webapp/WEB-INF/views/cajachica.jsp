<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!doctype html>
<html class="fixed">
<head>

    <!-- Librerias cabecera:start -->
    <jsp:include page="plantillas/libreriasCabecera.jsp"/>
    <!-- Librerias cabecera:end -->

</head>

<body>
<section class="body">

    <!-- start: header -->
    <header class="header">
        <jsp:include page="plantillas/header.jsp"/>
    </header>
    <!-- end: header -->

    <div class="inner-wrapper">

        <!-- start: sidebar -->
        <jsp:include page="plantillas/aside.jsp"/>
        <!-- end: sidebar -->

        <section role="main" class="content-body" style="padding-top: 30px;">
            <header id="cabecera" class="page-header animated fadeInLeft">
                <h2>Gesti&oacute;n Caja Chica</h2>
                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li><a href="#"> <i class="fa fa-home"></i>
                        </a></li>
                        <li><span>Gesti&oacute;n Caja Chica</span></li>
                    </ol>
                </div>
            </header>

            <!-- START: PAGE -->
            <div class="row">
                <div class="col-md-12">
                    <section class="panel animated fadeInRight">
                        <div class="panel-body" style="padding-bottom: 8px; padding-top: 15px;">
                            <div class="form-group">
                                <label class="col-md-1 control-label">FECHA INICIO</label>
                                <div class="col-md-2">
                                    <div class="input-group">
                                        <span class="input-group-addon"> <i class="fa fa-calendar"></i></span>
                                        <input type="text" class="form-control" id="fecInicio">
                                    </div>
                                </div>
                                <label class="col-md-1 control-label">FECHA FIN</label>
                                <div class="col-md-2">
                                    <div class="input-group">
                                        <span class="input-group-addon"> <i class="fa fa-calendar"></i></span>
                                        <input type="text" class="form-control" id="fecFin">
                                    </div>
                                </div>
                                <label class="col-md-1 control-label">TIPO GASTO</label>
                                <div class="col-md-2 ">
									<select id="cbo_tipogasto" name="cbo_tipogasto" class="form-control">
									</select>
                                </div>
                                <label class="col-md-1 control-label">TIPO MOVIMIENTO</label>
                                <div class="col-md-2">
                                    <select id="cbo_tipomovimiento" name="cbo_tipomovimiento" class="form-control">
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="panel-body"
                             style="padding-bottom: 15px; padding-top: 8px;">
                            <div class="form-group">
                                <div class="center">
                                    <a id="btn" class="btn btn-sm btn-primary width-default" onclick="buscar();">
										<i class="fa fa-search"> </i> BUSCAR</a>

									<a id="btnNuevo" class="btn btn-sm btn-primary width-default" onclick="nuevo();">
										<i class="fa fa-file"> </i> NUEVO REGISTRO</a>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>

            <div class="row">

                <div class="col-md-12" id="divTabla" style="display: inline">
                    <section class="panel animated fadeInRight">
                        <header class="panel-heading">
                            <h2 class="panel-title">LISTA DE RESULTADOS</h2>
                        </header>

                        <div class="panel-body">
                            <div id="tabla">
                                <table id="tblCajaChica"
                                       class="table table-bordered table-striped mb-none">
                                    <thead>
                                    <tr>
                                        <th class="text-center">FECHA</th>
                                        <th class="text-center">DESCRIPCI&Oacute;N</th>
                                        <th class="text-center">TIPO GASTO</th>
                                        <th class="text-center">RESPONSABLE</th>
                                        <th class="text-center">COMPROBANTE</th>
                                        <th class="text-center">TIPO MOVIMIENTO</th>
										<th class="text-center">OBSERVACI&Oacute;N</th>
										<th class="text-center">NUM PEDIDO</th>
										<th class="text-center">MONTO S/.</th>
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                        <footer class="panel-footer">
                            <div class="row">
                                <div class="center">
                                    <a id="btnExpPdf" class="btn btn-sm btn-primary width-default"
                                       onclick="exportarPDF();"><i class="fa fa-refresh"> </i> EXPORTAR PDF</a>
                                </div>
                            </div>
                        </footer>
                    </section>
                </div>

				<div class="col-md-12" id="divNuevo" style="display: none">
					<form  class="form-horizontal" novalidate="novalidate" id="frm" name="frm">
						<input type="hidden" name="method" value="" />

						<section class="panel animated fadeInRight">
							<header class="panel-heading">
								<h2 class="panel-title">DATOS A REGISTRAR</h2>

							</header>
							<div class="panel-body">

								<div class="form-group">
									<label class="col-sm-3 control-label">DESCRIPCI&Oacute;N <span class="required">*</span></label>
									<div class="col-sm-6">
										<input type="text" id="desMovimiento" name="desMovimiento" class="form-control"  />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">TIPO DE GASTO <span class="required">*</span></label>
									<div class="col-sm-6">
										<select id="cbo_tipogastonew" name="cbo_tipogastonew" class="form-control"></select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">RESPONSABLE <span class="required">*</span></label>
									<div class="col-sm-6">
										<input type="text" id="desResponsable" name="desResponsable" class="form-control" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">COMPROBANTE </label>
									<div class="col-sm-6">
										<input type="text" id="desComprobante" name="desComprobante" class="form-control"  />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">TIPO DE MOVIMIENTO <span class="required">*</span>
									</label>
									<div class="col-sm-6">
										<select id="cbo_tipomovimientonew" name="cbo_tipomovimientonew" class="form-control"></select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">MONTO S/. <span class="required">*</span>
									</label>
									<div class="col-sm-6">
										<input type="text" id="numMonto" name="numMonto" class="form-control"
											   onkeypress="return soloNumeros(event)" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">OBSERVACI&Oacute;N </label>
									<div class="col-sm-6">
										<input type="text" id="desObservacion" name="desObservacion" class="form-control" />
									</div>
								</div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">NUM PEDIDO </label>
                                    <div class="col-sm-6">
                                        <input type="text" id="numPedido" name="numPedido" class="form-control" />
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
    </div>

    <!-- END: PAGE -->
    <jsp:include page="plantillas/footer.jsp"/>

</section>

<!-- START: LIB JS FOOTER-->
<jsp:include page="plantillas/libreriasPie.jsp"/>
<!-- END: LIB JS FOOTER-->

<script type="text/javascript">

	$(document).ready(function () {
		inicializarVariables();
		cargarComponentes();

        validator = $('#frm').validate({
            submitHandler : function() {
                guardar();
            },
            rules : {
                desMovimiento : {
                    minlength : 1,
                    required : true
                },
                cbo_tipogastonew : {
                    minlength : 1,
                    required : true
                },
                desResponsable : {
                    minlength : 1,
                    required : true
                },
                cbo_tipomovimientonew : {
                    minlength : 1,
                    required : true
                },
                numMonto : {
                    minlength : 1,
                    required : true
                },
                desObservacion : {
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

    function inicializarVariables() {
        $('#tblCajaChica').DataTable({
                dom: 'Bfrtip',
                searching: false,
                buttons: [
                    'excel'
                ],
                "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                    console.log("entro");
                    console.log("aData: " +aData[2]);
                    if (aData[5] == "Ingreso") {
                        $('td', nRow).css('background-color', '#FFFF99');
                    } else if (aData[5] == "Egreso") {
                        $('td', nRow).css('background-color', '#FF7F7F').css('color', 'white');
                    }
                }
            }
        );

        $('#fecInicio').datepicker({
            format: 'dd/mm/yyyy',
            language: 'es',
            autoclose: true
        });

        $('#fecFin').datepicker({
            format: 'dd/mm/yyyy',
            language: 'es',
            autoclose: true
        });
    }

    function cargarComponentes() {
		$.ajax({
			url : "./cargarComponentesCajaChica",
			type : "GET",
			dataType : "json"
		}).done(
				function(paramJson) {
					if (paramJson.estadoRespuesta == 'OK') {
						cboTipoGasto = $('#cbo_tipogasto');
						cboTipoGastoNew = $('#cbo_tipogastonew');
						cboTipoMovi = $('#cbo_tipomovimiento');
						cboTipoMoviNew = $('#cbo_tipomovimientonew');
						lstTipoGasto = JSON.parse(paramJson.parametros.lstTipoGasto);
						loadCombo(lstTipoGasto, cboTipoGasto);
						loadCombo(lstTipoGasto, cboTipoGastoNew);
						lstTipoMovimiento = JSON.parse(paramJson.parametros.lstTipoMovimiento);
						loadCombo(lstTipoMovimiento, cboTipoMovi);
						loadCombo(lstTipoMovimiento, cboTipoMoviNew);
						// var lstEmpresa = JSON.parse(paramJson.parametros.lstEmpresa);
						// loadTableEmpresa(lstEmpresa);

					} else {
						callNotification('error',
								paramJson.mensajeRespuesta, 'Error');
					}

				}).fail(function(jqXHR, textStatus, errorThrown) {
			alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
		});
	}

	function loadCombo(listaDatos, combo) {
		if (listaDatos == null) {
			return;
		} else {
			combo.append($("<option/>").attr("value","").text("Seleccionar"));
			$.each(listaDatos, function(i, item) {
				combo.append($("<option/>").attr("value",
						item.idParametroValor).text(item.desParametroValor));
			});
		}
	}

    function loadTable(lista) {

        $('#tblCajaChica').dataTable().fnClearTable();
        var tblCajaChica = $('#tblCajaChica').DataTable();

        $.each(lista, function (i, obj) {
            var rowNode = tblCajaChica.row.add([
                // '<input type="radio" id="fila" name="fila" value="' + obj.idCajachica + '">',
                obj.fecRegistro,
                obj.desMovimiento,
                obj.tipoGasto.desParametroValor,
                obj.desResponsable,
                obj.desComprobante,
                obj.tipoMovimiento.desParametroValor,
                obj.desObservacion,
                obj.numPedido,
                obj.numMonto
            ]).draw(false).node();

            // Centrando columnas seleccion, codigo y orden
            $(rowNode).find('td').each(function (index, td) {
                if (index == 0) {
                    $(td).addClass('text-center');
                }
            });

        });

        // Centrando columnas seleccion y codigo
        $('#tblCajaChica').find('tr').each(function () {
            $(this).find('td').eq(0).addClass('text-center');
        });
    }

    function validarInfo(obj) {
        if (obj == null || obj == 0)
            return "";
        return obj;
    }

    function dateNullSafe(obj) {
        try {
            if (obj.fechaFin == null) {
                return "";
            } else {
                return obj.fechaFin;
            }
        } catch (error) {
            return "";
        }
    }

    function buscar() {
		document.getElementById("divTabla").style.display = "inline";
		document.getElementById("divNuevo").style.display = "none";

        var fecInicio = $('#fecInicio');
        var fecFin = $('#fecFin');
        var cboTipoGasto = $('#cbo_tipogasto');
        var cboTipoMovimiento = $('#cbo_tipomovimiento');
        // if (fecInicio.val() == "" && fecFin.val() == "" && cboTipoGasto.val() == "" && cboTipoMovimiento.val() == "") {
        //     callNotification('notice', "Debe ingresar al menos un criterio de búsqueda, por favor verifique.", 'Alerta');
        //     return;
        // }
        if (fecFin.val() != "" && fecInicio.val() == "") {
            callNotification('notice', "Debe seleccionar una fecha de inicio", 'Alerta');
            return;
        }
        $.blockUI({
            message: '<h3>Procesando</h3>',
            css: {
                border: 'none',
                padding: '15px',
                backgroundColor: '#000',
                '-webkit-border-radius': '10px',
                '-moz-border-radius': '10px',
                opacity: .5,
                color: '#fff'
            }
        });
        $.ajax({
            url: "./buscarCajaChica",
            type: "GET",
            dataType: "json",
            data: {
                fecInicio: fecInicio.val(),
                fecFin: fecFin.val(),
                cboTipoGasto: cboTipoGasto.val(),
				cboTipoMovimiento : cboTipoMovimiento.val()
            }
        }).done(
            function (paramJson) {
                if (paramJson.estadoRespuesta == 'OK') {
                    var lstCajaChica = JSON.parse(paramJson.parametros.lstCajaChica);
                    loadTable(lstCajaChica);
                } else {
                    callNotification('error',
                        paramJson.mensajeRespuesta, 'Error');
                }
                $.unblockUI();
            }).fail(function (jqXHR, textStatus, errorThrown) {
			$.unblockUI();
            alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
        });

    }

    function nuevo() {
		document.getElementById("divTabla").style.display = "none";
		document.getElementById("divNuevo").style.display = "inline";
	}

    function guardar() {
        var desComprobante = $('#desComprobante');
        var desMovimiento = $('#desMovimiento');
        var desObservacion = $('#desObservacion');
        var desResponsable = $('#desResponsable');
        var cboTipoGastoNew = $('#cbo_tipogastonew');
        var cboTipoMoviNew = $('#cbo_tipomovimientonew');
        var numMonto = $('#numMonto');
        var numPedido = $('#numPedido');
        $.ajax({
            url: "./guardarCajaChica",
            type: "POST",
            dataType: "json",
            data: {
                desComprobante: desComprobante.val(),
                desMovimiento: desMovimiento.val(),
                desObservacion: desObservacion.val(),
                desResponsable: desResponsable.val(),
                cboTipoGastoNew: cboTipoGastoNew.val(),
                cboTipoMoviNew: cboTipoMoviNew.val(),
                numMonto: numMonto.val(),
                numPedido:numPedido.val()
                }
            }).done(
                function (paramJson) {
                    if (paramJson.estadoRespuesta == 'OK') {
                        callNotification('success',
                            'Se ha guardado satisfactoriamente los datos',
                            'Correcto');
                        buscar();
                    } else {
                        callNotification('error',
                            paramJson.mensajeRespuesta, 'Error');
                    }
                }).fail(
                    function (jqXHR, textStatus, errorThrown) {
                        alert("error" + errorThrown + ", " + jqXHR
                            + "," + textStatus);
            });
    }
    
    function validarDatosPreSave() {

    }

    function exportarPDF() {
        var fecInicio = $('#fecInicio');
        var fecFin = $('#fecFin');
        var usuario = $('#txtNomUsua');
        var param = {
            'fecInicio': '' + fecInicio.val() +
                '', 'fecFin': '' + fecFin.val() + '' +
                '', 'usuario': '' + usuario.val() + ''
        };
        OpenWindowWithPost("./exportarPDF", "", "", param, "page");
    }

    function soloNumeros(e) {
        var key = window.Event ? e.which : e.keyCode;
        return ((key >= 48 && key <= 57) || (key == 8) || (key == 46))
    }

</script>

</body>
</html>