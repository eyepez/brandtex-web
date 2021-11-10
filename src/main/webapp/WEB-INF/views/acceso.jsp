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
				<h2>Accesos de Usuario</h2>
				<div class="right-wrapper pull-right">
					<ol class="breadcrumbs">
						<li><a href="#"> <i class="fa fa-home"></i>
						</a></li>
						<li><span>Accesos de Usuario</span></li>
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
								<label class="col-md-1 control-label">USUARIO</label>
								<div class="col-md-3 ">
									<input type="text" id="txtNomUsua" name="txtNomUsua" class="form-control">
								</div>
							</div>
						</div>

						<div class="panel-body"
							 style="padding-bottom: 15px; padding-top: 8px;">
							<div class="form-group">
								<div class="center">
									<a id="btn" class="btn btn-sm btn-primary width-default" onclick="buscar();"><i class="fa fa-check"> </i> BUSCAR</a>
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
							<h2 class="panel-title">LISTA DE ACCESOS</h2>
						</header>

						<div class="panel-body">
							<div id="tabla">
								<table id="tblAcceso"
									   class="table table-bordered table-striped mb-none">
									<thead>
									<tr>
										<th class="text-center"> </th>
										<%--<th class="text-center">ID</th>--%>
										<th class="text-center">FECHA INICIO</th>
										<th class="text-center">FECHA FIN</th>
										<th class="text-center">USUARIO</th>
										<th class="text-center">DIRECCI&Oacute;N IP</th>
										<th class="text-center">ACCI&Oacute;N</th>
									</tr>
									</thead>
								</table>
							</div>
						</div>
						<footer class="panel-footer">
							<div class="row">
								<div class="center">
									<a id="btnExpPdf" class="btn btn-sm btn-primary width-default" onclick="exportarPDF();"><i class="fa fa-refresh"> </i> EXPORTAR PDF</a>
								</div>
							</div>
						</footer>
					</section>
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

    function inicializarVariables() {
        $('#tblAcceso').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'excel'
                ]
            }
        );

        $('#fecInicio').datepicker({
            format: 'dd/mm/yyyy',
            language : 'es',
            autoclose : true
        });

        $('#fecFin').datepicker({
            format: 'dd/mm/yyyy',
            language : 'es',
            autoclose : true
        });
    }

    $(document).ready(function() {
        inicializarVariables();
    });

    function loadTableAccesos(lista) {

        $('#tblAcceso').dataTable().fnClearTable();
        var tblAcceso = $('#tblAcceso').DataTable();

        $.each( lista, function(i, obj) {
            var rowNode = tblAcceso.row.add([ '<input type="radio" id="fila" name="fila" value="'+ obj.codigo  +'">',
//                obj.codigo,
                obj.fechaInicio,
                dateNullSafe(obj),
                obj.codigoUsuario,
                obj.direccionIP,
                obtenerEstado(obj.tipoRegistro)
            ]).draw(false).node();

            // Centrando columnas seleccion, codigo y orden
            $(rowNode).find('td').each(function(index, td) {
                if(index == 0){
                    $(td).addClass('text-center');
                }
            });

        });

        // Centrando columnas seleccion y codigo
        $('#tblAcceso').find('tr').each(function() {
            $(this).find('td').eq(0).addClass('text-center');
        });
    }

    function dateNullSafe(obj) {
        try {
            if (obj.fechaFin == null) {
                return "";
            } else {
                return obj.fechaFin;
            }
		} catch (error){
            return "";
		}
    }

    function buscar(){
        var fecInicio = $('#fecInicio');
        var fecFin = $('#fecFin');
        var usuario = $('#txtNomUsua');
        if (fecInicio.val()== "" && fecFin.val()=="" && usuario.val()==""){
            callNotification('notice', "Debe ingresar al menos un criterio de búsqueda, por favor verifique.", 'Alerta');
            return;
        }
        if (fecFin.val() != "" && fecInicio.val() == ""){
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
            url : "./buscarAccesosUsuario",
            type : "POST",
            dataType : "json",
            data : {
                fecInicio : fecInicio.val(),
                fecFin :    fecFin.val(),
                usuario :   usuario.val()
            }
        }).done(
            function(paramJson) {

                if (paramJson.estadoRespuesta == 'OK') {
                    var lstAccesos = JSON.parse(paramJson.parametros.lstAccesos);
                    loadTableAccesos(lstAccesos);

                } else {
                    callNotification('error',
                        paramJson.mensajeRespuesta, 'Error');
                }
                $.unblockUI();
            }).fail(function(jqXHR, textStatus, errorThrown) {
            alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
        });

    }

    function obtenerEstado(codTipoRegistro) {
		if (codTipoRegistro == '01') return "ACCESO CORRECTO";
		if (codTipoRegistro == '02') return "USUARIO NO EXISTE";
		if (codTipoRegistro == '03') return "CONTRASEÑA INCORRECTA";
		if (codTipoRegistro == '04') return "USUARIO BLOQUEADO";
		if (codTipoRegistro == '05') return "USUARIO INACTIVO";
		if (codTipoRegistro == '06') return "SESION CERRADA";
    }

    function exportarPDF() {
        var fecInicio = $('#fecInicio');
        var fecFin = $('#fecFin');
        var usuario = $('#txtNomUsua');
        var param = {'fecInicio' : ''+ fecInicio.val() +
        '' , 'fecFin' : ''+fecFin.val()+'' +
        '' , 'usuario' : ''+usuario.val()+''};
        OpenWindowWithPost("./exportarPDF", "",  "", param,"page");
    }

</script>

</body>
</html>