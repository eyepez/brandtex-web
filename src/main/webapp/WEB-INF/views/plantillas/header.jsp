 <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
 
<!-- START : HEADER-->

	<div class="logo-container">
		<a href="#" class="logo">
			<img src="<%=request.getContextPath()%>/resources/images/logo-brandtex-small.png" height="35" alt="BrandTex"/>
		</a>
		<div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html" data-fire-event="sidebar-left-opened">
			<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
		</div>
	</div>

	<!-- start: search & user box -->
	<div class="header-right">

		<div id="userbox" class="userbox">
			<a href="#" data-toggle="dropdown">
				<figure class="profile-picture">
					<img src="<%=request.getContextPath()%>/resources/images/!logged-user.jpg" alt="CH" class="img-circle" data-lock-picture="<%=request.getContextPath()%>/recursos/images/!logged-user.jpg" />
				</figure>
				<div class="profile-info">
					<span class="name">
					<c:out value="${usuarioBean.desUsuario}"/>
<%--					<c:out value="${usuarioBean.apellidoPaterno}"/> --%>
<%--					<c:out value="${usuarioBean.apellidoMaterno}"/> --%>
					</span>
				</div>

				<i class="fa custom-caret"></i>
			</a>

			<div class="dropdown-menu">
				<ul class="list-unstyled">
					<li class="divider"></li>
					<li>
						<a role="menuitem" tabindex="-1" href="<%=request.getContextPath()%>/login/cerrarSession"><i class="fa fa-power-off"></i>Salir</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
				<!-- end: search & user box -->
             
<!-- END : HEADER-->