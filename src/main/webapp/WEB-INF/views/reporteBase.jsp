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
				<h2>Reportes</h2>
				<div class="right-wrapper pull-right">
					<ol class="breadcrumbs">
						<li><a href="#"> <i class="fa fa-home"></i>
						</a></li>
						<li><span>Reportes</span></li>
					</ol>
				</div>
			</header>

			<!-- START: PAGE -->

			<div class="row">

				<div class="col-md-12">
					<section class="panel animated fadeInRight">
						<header class="panel-heading">
                            <h2 class="panel-title">${not empty nombreReporte ? nombreReporte : 'Reporte no configurado, comuniquese con el administrador.'}</h2>
						</header>

						<div class="panel-body">
							<div class="row">
								<div class="center">
                                    <c:if test="${not empty urlReporte}">
                                        <iframe src="${urlReporte}"
                                                width="100%" height="500" style="border:none;">
                                        </iframe>
                                    </c:if>
								</div>
							</div>
						</div>
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