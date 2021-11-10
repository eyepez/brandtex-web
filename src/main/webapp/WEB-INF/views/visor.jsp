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


			<section role="main" class="content-body"
				style="padding-top: 30px; height: 700px;">
				<header id="cabecera" class="page-header animated fadeInLeft">

					<h2>Visor Documento</h2>
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li><a href="#"> <i class="fa fa-home"></i>
							</a></li>
							<li><span>Visor Documento</span></li>
						</ol>

					</div>
				</header>

				<!-- START: PAGE -->

				<div class="row">
					<div class="col-md-12" id="divVisor">
						<form method="post" class="form-horizontal" id="frm" name="frm">


							<div class="col-md-3" style="z-index: 200;">
								<section class="panel">
									<header class="panel-heading">
										<h2 class="panel-title">ESTRUCTURA DEL DOC.</h2>
									</header>
									<div class="panel-body">
										<div class="panel-group" id="pnlCampos">
										</div>
									</div>
									<footer class="panel-footer">
										<div class="row">
											<div class="center">
												<a id="btnGuardarSelec" class="btn btn-sm btn-primary" onclick="guardarSeleccion();">GUARDAR SELECCI&Oacute;N</a>
												<br>
												<a id="btnRetornar" class="btn btn-sm btn-primary width-default" style="margin-top: 5px;" onclick="retornar();">RETORNAR</a>
											</div>
										</div>
									</footer>
								</section>
							</div>

							<div class="col-md-9">
								<section class="panel"
									style="margin-bottom: 5px;">
									<header class="panel-heading">
										<h2 class="panel-title">IMAGEN DE LA PLANTILLA DEL
											DOCUMENTO</h2>
									</header>
								</section>
								<div style="background: #4c4d4e; padding: 10px 10px;" class="panel-body">
									<div id="visorToolBar" class="row" style="width: 100%; padding-left:15px; padding-bottom:10px;">
										<a id="btnZoomIn" class="btn btn-default" onclick="zoomInDocumento();"><i class="fa fa-plus"></i></a> 
										
										<a id="btnZoomOut" class="btn btn-default" onclick="zoomOutDocumento();"><i class="fa fa-minus"></i></a> 
										
										<a id="btnAjustar" class="btn btn-default" onclick="ajustarDocumento();"><i class="fa fa-compress"></i></a>
									</div>
									<div id="contentImgPlantilla" class="dragscroll droppable" style="overflow: auto; height: 650px; width: 100%;" onwheel="zoomWheel(event)">
										<img id="imagenPlantilla" name="imagenPlantilla" alt="Plantilla" src="" style="display: none;">
									</div>
								</div>
							</div>

						</form>
					</div>
					<!-- MODAL CONFIRMACION -->
					<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="modalPregunta">
					  <div class="modal-dialog modal-sm">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					        <h4 class="modal-title" id="myModalLabel">Desea guardar la los cambios realizados</h4>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" onclick="guardarSeleccion();">Si</button>
					        <button type="button" class="btn btn-primary" onclick="cerrarModal();">No</button>
					      </div>
					    </div>
					  </div>
					</div>
				</div>

				<!-- END: PAGE -->
			</section>

<%-- 			<jsp:include page="plantillas/footer.jsp" /> --%>


		</div>
	</section>

	<!-- START: sidebar-->

<%-- 	<jsp:include page="plantillas/sidebar.jsp" /> --%>

	<!-- END: sidebar-->



	<!-- START: LIB JS FOOTER-->
	<jsp:include page="plantillas/libreriasPie.jsp" />
	<!-- END: LIB JS FOOTER-->

	<script type="text/javascript">
		var campos = [];
		var imgAreas = [];
		var contexto = '<%=request.getContextPath()%>';
		var currentMousePos = { x: -1, y: -1 };
		var listaDatosZona = new Array();
		var flagRetorno = false;
		
		$(document).ready(function() {
			
			var archivoJpeg = '${mapDatos.imagenTemp}';
			if(archivoJpeg != ""){
				$("#imagenPlantilla").attr('src', 'data:image/jpeg;base64,' + archivoJpeg);
				$("#imagenPlantilla").show();
			}else{
				$("#imagenPlantilla").hide();
			}
			
			var lstCabecera = '${lstCabecera}';
			var lista = JSON.parse(lstCabecera);
			$.each(lista,function(i,obj){
				var campoCabecera = new Object();
				campoCabecera.codigo = lista[i].campo.codigo;
				campoCabecera.nombre = lista[i].campo.nombre;
				campoCabecera.zonaVisual = lista[i].zonaVisual;
				campoCabecera.x = lista[i].x;
				campoCabecera.y = lista[i].y;
				campoCabecera.height = lista[i].height;
				campoCabecera.width = lista[i].width;
				campos.push(campoCabecera);
			});
			
			loadCampos(campos);
			
			
			$(".droppable").mousemove(function(e){
				var offset = $("#imagenPlantilla").offset();
				currentMousePos.x = event.pageX - offset.left;
				currentMousePos.y = event.pageY - offset.top;
			}).tooltip();
							
			$('#imagenPlantilla').selectAreas({
				minSize: [10, 10],
				onChanged : debugQtyAreas,
				allowSelect: false,
				maxAreas: campos.length,
				onLoaded: selectAreaLoaded
			});
			
			$(".draggable").draggable({
			    revert: true
			  });
			
			$(".droppable").droppable({
				drop: function (event, ui) {
					// Se agrega una zona según el campo que fue arrastrado
					var dataArea = new String ($(ui.draggable).attr('data'));
					var areaOptions = {
						x: currentMousePos.x,
						y: currentMousePos.y,
						width: 145,
						height: 50,
						data: dataArea
					};
					
					$("#imagenPlantilla").selectAreas('add', areaOptions);
					
					// Luego de agregar la zona se oculta el icono draggable
					var objArea = JSON.parse(decodeURIComponent(dataArea));
					$('img#drag_' + objArea.codigo).hide();
					
			    }
			  });
		});
		
		function selectAreaLoaded(){
			cargarZonas(campos, "campos");
			ajustarDocumento();
		}
		
		function escalarZonas(currWidth, currHeight) {
			/*Se obtienen las áreas cargadas con posiciones actualizadas
			para escalarlas*/
			imgAreas = $('#imagenPlantilla').selectAreas('areas');
			$('#imagenPlantilla').selectAreas('reset');
			$.each(imgAreas,function(i, obj) {
				var objAux = getScaledZone(obj, currWidth, currHeight);
				obj.x = objAux.x;
				obj.y = objAux.y;
				obj.width = objAux.width;
				obj.height = objAux.height;
			});
		}
		
		function getScaledZone(origZone, originalWidth, originaHeight) {
			/*Se obtiene un ratio de escala el cuál se multiplica con las dimensiones actuales de la zona para sumar o restarle
			a las nuevas dimensiones de la imágen y así escalarlo*/
			var currentImage = document.getElementById("imagenPlantilla");
			var factScalarWidth = (originalWidth - currentImage.width) / originalWidth;
			var factScalarHeight = (originaHeight - currentImage.height) / originaHeight;
			
			var zoneX = Math.round(origZone.x - (origZone.x * factScalarWidth));
			var zoneWidth = Math.round(origZone.width - (origZone.width * factScalarWidth));
			var zoneY = Math.round(origZone.y - (origZone.y * factScalarHeight));
			var zoneHeight = Math.round(origZone.height - (origZone.height * factScalarHeight));
			
			return {x : zoneX, y : zoneY, width : zoneWidth, height : zoneHeight}; 
		}
		
		function getOriginalZone(origZone, originalWidth, originaHeight) {
			/*Se obtiene un ratio de escala que se utiliza para dividirlo con las dimensiones actuales de la zona y así escalarlo a sus
			dimensiones originales*/
			var currentImage = document.getElementById("imagenPlantilla");
			var factScalarWidth = (originalWidth - currentImage.width) / originalWidth;
			var factScalarHeight = (originaHeight - currentImage.height) / originaHeight;
			
			var zoneX = Math.round(origZone.x / (1 - factScalarWidth));
			var zoneWidth = Math.round(origZone.width / (1 - factScalarWidth));
			var zoneY = Math.round(origZone.y / (1 - factScalarHeight));
			var zoneHeight = Math.round(origZone.height / (1 - factScalarHeight));
			
			return {x : zoneX, y : zoneY, width : zoneWidth, height : zoneHeight}; 
		}
		
		function resizeSelectAreas(){
			/*Actualiza las dimensiones de lo divs del plugin select-areas
			si se realiza zoomIn, zoomOut o un ajuste*/
			var currentImage = document.getElementById("imagenPlantilla");
			var zoneMain = document.getElementById("zoneMain");
			var zoneOne = document.getElementById("zoneOne");
			var zoneTwo = document.getElementById("zoneTwo");
			
			zoneMain.style.width = currentImage.width + "px";
        	zoneMain.style.height = currentImage.height + "px";
        	zoneOne.style.width = currentImage.width + "px";
        	zoneOne.style.height = currentImage.height + "px";
        	zoneTwo.style.width = currentImage.width + "px";
        	zoneTwo.style.height = currentImage.height + "px";
		}
		
		function ajustarDocumento() {
			var currentImage = document.getElementById("imagenPlantilla");
			var contentImage = document.getElementById("contentImgPlantilla");
			var currWidth = currentImage.width;
	        var currHeight = currentImage.height;
	        /*Se obtiene el ancho del contenedor de la imágen y
	        se calcula un alto de acuerdo a las dimensiones reales de la imágen utilizando el ancho del contenedor.
	        Se valida si la imágen es vertical u horizontal para realizar el mismo cálculo con el ancho.*/
			var newWidth = contentImage.offsetWidth - 30;
	        var newHeight = Math.round((newWidth * currentImage.naturalHeight) / currentImage.naturalWidth);
	        if(newHeight > contentImage.offsetHeight) {
	            newHeight = contentImage.offsetHeight - 30;
	            newWidth = Math.round((newHeight * currentImage.naturalWidth) / currentImage.naturalHeight); 
	        }
	        
	        currentImage.style.width = newWidth + "px";
	        currentImage.height = newHeight;
	        resizeSelectAreas();
	        currentImage.removeAttribute("height");
	        escalarZonas(currWidth, currHeight);
			cargarZonas(imgAreas, "areas");	
		}
		
		function zoomInDocumento() {
			/*Se aumenta el ancho en 100 y el alto se recalcula debido a que se tiene de propiedad position: absolute.
			También se pone un límite de aumento de zoom de 2500px*/
			var currentImage = document.getElementById("imagenPlantilla");			
	        var currWidth = currentImage.width;
	        var currHeight = currentImage.height;
	        
	        if(currWidth >= 2500) return false;
	        else {
	        	currentImage.style.width = (currWidth + 100) + "px";
	        	resizeSelectAreas();
	        	escalarZonas(currWidth, currHeight);
	        	cargarZonas(imgAreas, "areas");
	        }
		}
		
		function zoomOutDocumento() {
			/*Se reduce el ancho en 100 y el alto se recalcula debido a que se tiene de propiedad position: absolute.
			También se pone un límite de reducción de zoom de 300px*/
			var currentImage = document.getElementById("imagenPlantilla");
	        var currWidth = currentImage.width;
	        var currHeight = currentImage.height;
	        
	        if(currWidth <= 300) return false;
			else {
				currentImage.style.width = (currWidth - 100) + "px";
				resizeSelectAreas();
				escalarZonas(currWidth, currHeight);
				cargarZonas(imgAreas, "areas");
	        }
		}
		
		function zoomWheel(event) {
			if(!event.shiftKey)
				return false;
			
			if(event.deltaY < 0)
				zoomInDocumento();
			else
				zoomOutDocumento();
		}
		
		function cargarZonas(lista, action){
			if(lista != null && lista.length > 0){
				$.each(lista,function(i, obj) {
					//Para saber qué setear si viene la listaCabecera o la lista de áreas del plugin
					var jsonEncode = (action == "campos" ? encodeURIComponent(JSON.stringify(obj)) : obj.data);
					if(obj.zonaVisual != null && obj.zonaVisual != "" || action == "areas"){
						var areaOptions = {
							x: obj.x,
							y: obj.y,
							width: obj.width,
							height: obj.height,
							data: jsonEncode
						};
						$('img#imagenPlantilla').selectAreas('add', areaOptions);
						// Luego de agregar la zona se oculta el icono draggable
						var objArea = JSON.parse(decodeURIComponent(jsonEncode));
						$('img#drag_' + objArea.codigo).hide();
					}
				});
			}
		}

		// Log the quantity of selections
		function debugQtyAreas (event, id, areas) {
			// Se muestra la zona en el panel del campo respectivo
			if(areas[id] !== undefined && areas[id].data != ""){
				var objArea = JSON.parse(decodeURIComponent(areas[id].data));
				areas[id].x = Math.round(areas[id].x);
				areas[id].y = Math.round(areas[id].y);
				areas[id].height = Math.round(areas[id].height);
				areas[id].width = Math.round(areas[id].width);
				$('#sec_' + objArea.codigo).find('.panel-body').html('x: <b>'+areas[id].x+'</b>, y: <b>'+areas[id].y+'</b>, alto: <b>'+areas[id].height+'</b>, ancho: <b>'+areas[id].width+'</b>');
				refrescarZonas(areas);
			}
		};
		
		function refrescarZonas(areas){
			// Limpiando arreglo
			listaDatosZona.splice(0,listaDatosZona.length);
			var currentImage = document.getElementById("imagenPlantilla");
			if(areas != null && areas.length > 0){
				$.each(areas,function(i, obj) {
					var objArea = JSON.parse(decodeURIComponent(areas[i].data));
					var auxArea = getOriginalZone(obj, currentImage.naturalWidth, currentImage.naturalHeight);
					listaDatosZona[i] = objArea.codigo +"|"+ auxArea.x +"|"+ auxArea.y +"|"+ auxArea.height +"|"+ auxArea.width;
				});
			}
			
		}
		
		function loadCampos(lista) {
			// Se carga un panel por cada campo de la lista
			$.each(lista,function(i, obj) {
				var panel = '<section class="panel panel-accordion-none" id=sec_'+ obj.codigo +'><header class="panel-heading"><h2 class="panel-title"></h2><div class="panel-actions"></div></header><div class="panel-body"></div></section>'
				$('#pnlCampos').append(panel);
				var jsonEncode = encodeURIComponent(JSON.stringify(obj))
				$('#sec_' + obj.codigo).find('.panel-actions').append('<img id="drag_' + obj.codigo + '" class="appear-animation pull-left fadeIn appear-animation-visible right draggable" data="' + jsonEncode + '" src="' + contexto + '/resources/images/drag_zone.png">');
				$('#sec_' + obj.codigo).find('.panel-title').append(obj.nombre);
				if(obj.zonaVisual != null && obj.zonaVisual != ""){
					$('#sec_' + obj.codigo).find('.panel-body').html('x: <b>'+obj.x+'</b>, y: <b>'+obj.y+'</b>, alto: <b>'+obj.height+'</b>, ancho: <b>'+obj.width+'</b>');
				}else{
					// El valor cambiará una vez que se haya arrastrado el icono draggable a la zona droppable
					$('#sec_' + obj.codigo).find('.panel-body').html('Sin Zona');	
				}
			});
		}
		
		function guardarSeleccion(){			
			
			var jsonString = JSON.stringify(listaDatosZona);
			
			$.ajax({
				url : "./guardarSeleccion",
				type : "POST",
				dataType : "json",
				data : {
					listaZona : jsonString
				}
			}).done(
					function(paramJson) {
						if (paramJson.estadoRespuesta == 'OK') {
							callNotification('success', "Se guardo con &eacute;xito las zonas", 'Correcto');
							flagRetorno = true;
						} else {
							callNotification('error', paramJson.mensajeRespuesta, 'Error');
						}
			}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
			});
		}
		
		function retornar(){
			if (flagRetorno == false) {
				callNotification('notice', "Por favor, debe guardar la selección, antes de retornar a la pantalla anterior.", 'Alerta');
			} else {
				document.frm.action = "./retornoVentanaConfig";
				document.frm.method.value = "POST";
				document.frm.submit();
			}
		}
		
		function cerrarModal(){
			$("#modalPregunta").modal('hide');
		}
		
		function preguntar(){
			$("#modalPregunta").modal('show');
		}		
		
	</script>

</body>
</html>