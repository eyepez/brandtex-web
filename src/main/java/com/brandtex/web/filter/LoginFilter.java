package com.brandtex.web.filter;

import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.brandtex.core.domain.Usuarios;

public class LoginFilter implements Filter{
    
    private String loginPage = "login/inicioSesion";
    private String timeoutPage = "login/cargarVentanaSinAcceso";
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain){
    	try {
			
    		  if ((request instanceof HttpServletRequest) && (response instanceof HttpServletResponse)) {
            	HttpServletRequest httpServletRequest = (HttpServletRequest) request;
                HttpServletResponse httpServletResponse = (HttpServletResponse) response;

                String requestPath = httpServletRequest.getRequestURI();
                boolean loginVal=false;
  
                if(!requestPath.endsWith("inicioSesion/")){

                	if(requestPath.endsWith("/")){
                		  String url=httpServletRequest.getServletPath().substring(0, httpServletRequest.getServletPath().length()-1);
                		 httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+url);
                         return;
                	 }
                	loginVal = requestPath.contains("inicioSesion") || requestPath.endsWith("autenticarUsuario") //|| requestPath.endsWith("verificarPathUrl")
                            || requestPath.endsWith(".css") || requestPath.endsWith(".js") || requestPath.endsWith(".png") || requestPath.endsWith(".jpg")
                            || requestPath.contains(".woff")
                            || requestPath.contains(".swf")
                            || requestPath.contains("generarCaptcha")
                            || requestPath.endsWith("accionCerrarSesion") || requestPath.endsWith(".nanoscroller.js.map");
                }



                boolean isAjaxRequest = httpServletRequest.getHeader("accept").contains("application/json");

                if (!loginVal) {

                    Usuarios usuarioEntidad = (Usuarios) httpServletRequest.getSession().getAttribute("usuarioBean");

                    if(usuarioEntidad==null){
                        isAjaxRequest = httpServletRequest.getHeader("accept").contains("application/json");
                        if(!isAjaxRequest){
                            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/" + loginPage);
                            return;
                        }else{
                            return;
                        }
                    }else{
                        HttpServletResponse resp = (HttpServletResponse) response;
                        resp.setHeader("Expires", "Tue, 03 Jul 2001 06:00:00 GMT");
                        resp.setHeader("Last-Modified", new Date().toString());
                        resp.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0, post-check=0, pre-check=0");
                        resp.setHeader("Pragma", "no-cache");
                    }
                }else{
                	 boolean allowFilterChain= redirectToAvoidJsessionId((HttpServletRequest)request, (HttpServletResponse) response);
                	 if(!allowFilterChain){
                		 String[] param=requestPath.split(";jsessionid=");
                		 httpServletResponse.sendRedirect(param[0]);
                         return;
                	 }
                }

            }
            filterChain.doFilter(request, response);
    		
		} catch (Exception e) {
			e.getMessage();
		}
      
    }
    
    public static boolean redirectToAvoidJsessionId(HttpServletRequest req, HttpServletResponse res) {
		String requestURI = req.getRequestURI().toUpperCase();
		if (requestURI.indexOf(";JSESSIONID=") > 0) {
				return false;
		}
		return true;
	}

    @Override
    public void destroy() {
        
    }

    public String getLoginPage() {
        return loginPage;
    }

    public void setLoginPage(String loginPage) {
        this.loginPage = loginPage;
    }

    public String getTimeoutPage() {
        return timeoutPage;
    }

    public void setTimeoutPage(String timeoutPage) {
        this.timeoutPage = timeoutPage;
    }

}
