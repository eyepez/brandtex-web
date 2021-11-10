<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!-- START : ASIDE -->

<aside id="sidebar-left" class="sidebar-left">

	<div class="sidebar-header">
		<div class="sidebar-title">
			<span style="color: white;">Opciones</span>
		</div>
		<div class="sidebar-toggle hidden-xs"
			data-toggle-class="sidebar-left-collapsed" data-target="html"
			data-fire-event="sidebar-left-toggle">
			<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
		</div>
	</div>

	<div class="nano">
		<div class="nano-content animated fadeInRight">
			<nav id="menu" class="nav-main" role="navigation">
				<ul class="nav nav-main">
					<li id="P0" onclick="checking('P0')"><a
						href="<%=request.getContextPath()%>/login/cargarPanel"> <i
							class="fa fa-home" aria-hidden="true"></i> <span>Principal</span>
					</a></li>
					${sessionScope.menuHtml}
				</ul>
			</nav>
			<hr class="separator" />
		</div>
	</div>

	<script type="text/javascript">
	function checking(idMenu){
	     setCookie("idMenu", idMenu, 1);
	}
	function checkingExpand(idMenu){
	     setCookie("idMenuExp", idMenu, 1);
	}
	
	</script>

</aside>

<!-- END : ASIDE-->