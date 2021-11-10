<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
						
					<h2>Principal</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="#">
										<i class="fa fa-home"></i>
									</a>
								</li>
								<li><span>Principal</span></li>
							</ol>
					
<!-- 							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a> -->
						</div>
					
					
					</header>

					<!-- start: page -->
						
						<div class="row">
							<div class="col-xs-12">
								<section class="panel panel-featured panel-featured-primary animated fadeInRight">
								<header class="panel-heading">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
									</div>

									<h2 class="panel-title">Bienvenido <c:out value="${usuarioBean.desUsuario}"/></h2>
								</header>
							</section>
							</div>
						</div>
						
					<!-- end: page -->
					 <jsp:include page="plantillas/footer.jsp" />
				</section>
			</div>

			<!-- START: sidebar-->

<%--                <jsp:include page="plantillas/sidebar.jsp" /> --%>

              <!-- END: sidebar-->
              
		</section>

	 <!-- START: LIB JS FOOTER-->

               <jsp:include page="plantillas/libreriasPie.jsp" />

         <!-- END: LIB JS FOOTER-->
         
         
	
	</body>
</html>