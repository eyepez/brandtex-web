package com.brandtex.web.controller;

import com.brandtex.core.domain.Paginas;
import com.brandtex.core.domain.ParametroValor;
import com.brandtex.core.domain.Usuarios;
import com.brandtex.core.service.PaginasService;
import com.brandtex.core.service.ParametroValorService;
import com.brandtex.core.service.UsuariosService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pe.com.gmd.bpo.util.date.FechaUtil;
import pe.com.gmd.bpo.util.exception.MensajeExceptionUtil;
import pe.com.gmd.bpo.util.web.JsonUtil;
import pe.com.gmd.bpo.util.web.WebUtil;
import com.brandtex.web.bean.OpcionBean;
import com.brandtex.web.bean.RespuestaBean;
import com.brandtex.web.bean.UsuarioBean;
import com.brandtex.web.util.ConstantesWeb;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

import static java.text.MessageFormat.format;

@Controller
@RequestMapping(value = "/login")
@Scope("request")
public class LoginController {

    private static final Logger LOGGER = Logger.getLogger(LoginController.class);

    @Autowired
    private UsuariosService usuariosService;

    @Autowired
    private ParametroValorService parametroValorService;

    @Autowired
    private PaginasService paginasService;

    RespuestaBean respuestaBean = new RespuestaBean();

	@RequestMapping(value = "/inicioSesion")
	public String irInicioSesion() {
		LOGGER.info("Inicio inicioSesion");
		return "login";
	}

	@RequestMapping(value = "/autenticarUsuario", method = RequestMethod.POST)
	public @ResponseBody String autenticarUsuario(HttpServletRequest request, Model model) {
		LOGGER.info("Inicio autenticarUsuario");
		String mensajeError = "";
		RespuestaBean beanRespuesta = new RespuestaBean();
		String contrasena = "";
		boolean usuarioPermiso = false;

        try {
            Usuarios entidadUsuarioPantalla = JsonUtil.convertirCadenaJsonAObjeto(request.getParameter("usuario"),
                    Usuarios.class);
            Usuarios entidadUsuarioBaseDatos = usuariosService.obtenerLoginUsuario(entidadUsuarioPantalla);
            if (entidadUsuarioBaseDatos != null) {
                if (entidadUsuarioPantalla.getDesClave().equals(entidadUsuarioBaseDatos.getDesClave())) {

                    if (validarPerfil(request, entidadUsuarioBaseDatos)) {
                        prepararSesionCorrecta(beanRespuesta, request, entidadUsuarioBaseDatos);
                    } else {
                        beanRespuesta.setEstadoRespuesta(ConstantesWeb.ERROR);
                        beanRespuesta.setMensajeRespuesta(ConstantesWeb.LOGIN_MENSAJE_SIN_ACCESO);
                    }
                    usuarioPermiso = true;
                } else {
                    usuarioPermiso = false;
                }
            }

            if (!usuarioPermiso) {
                Integer cantidadSesionesFallidas = request.getSession().getAttribute("cantidadSesionesFallidas") == null ? 0 : (Integer) request.getSession().getAttribute("cantidadSesionesFallidas");
                Map<String, Object> parametros = new HashMap<>();
                request.getSession().setAttribute("cantidadSesionesFallidas", ++cantidadSesionesFallidas);
                parametros.put("cantidadSesionesFallidas", cantidadSesionesFallidas);
                beanRespuesta.setEstadoRespuesta(ConstantesWeb.ERROR);
                beanRespuesta.setMensajeRespuesta(ConstantesWeb.LOGIN_MENSAJE_ERROR);
                beanRespuesta.setParametros(parametros);
            }
        } catch (Exception exception) {
            String[] error = MensajeExceptionUtil.obtenerMensajeError(exception);
            mensajeError = format(ConstantesWeb.MENSAJE_ERROR, error[0]);
            beanRespuesta.setMensajeRespuesta(mensajeError);
            LOGGER.error(error[1], exception);
        }
        LOGGER.info("Fin autenticarUsuario");
        return JsonUtil.convertirObjetoACadenaJson(beanRespuesta);
    }

    private boolean validarPerfil(HttpServletRequest request, Usuarios entidadUsuarioPantalla) {
        LOGGER.info("Inicio validarPerfil");
        boolean bPerfil = false;

        try {
            List<ParametroValor> listaPerfiles = parametroValorService.obtenerParametrosPorLlave(8);
            for (ParametroValor perfil : listaPerfiles) {
                if (entidadUsuarioPantalla.getIdPerfil() == perfil.getIdParametroValor()) {
                    bPerfil = true;
                    WebUtil.setSessionAttribute(request, "idPerfil", perfil.getIdParametroValor());
                    WebUtil.setSessionAttribute(request, "perfil", perfil.getDesParametroValor());
                    break;
                }
            }
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
        }
        return bPerfil;
    }

    @RequestMapping(value = "/cargarPanel")
    public String cargarPanel(HttpServletRequest request, Model model) {
        LOGGER.info("Inicio cargarPanel");
        String paginaRetorno = "login";
        try {
            int idPerfil = (int) WebUtil.getSessionAttribute(request, "idPerfil");
            cargarOpcionesMenu(request, idPerfil);
            paginaRetorno = "principal";

        } catch (Exception exception) {
            LOGGER.error("Error en cargarPanel", exception);
        }

        return paginaRetorno;
    }

    @RequestMapping(value = "/cerrarSession")
    public String accionCerrarSesion(HttpServletRequest request) {
        return "login";
    }

    @RequestMapping(value = "/cargarVentanaSinAcceso")
    public String cargarVentanaSinAcceso() {
        return "error/sinAcceso";
    }

    private void prepararSesionCorrecta(RespuestaBean beanRespuesta, HttpServletRequest request,
                                        Usuarios entidadUsuarioBaseDatos) throws Exception {
        LOGGER.info("Inicio prepararSesionCorrecta");
        WebUtil.setSessionAttribute(request, "fecha", FechaUtil.obtenerFechaStr());
        int year = Calendar.getInstance().get(Calendar.YEAR);
        WebUtil.setSessionAttribute(request, "year", year);
        WebUtil.setSessionAttribute(request, "usuarioBean", entidadUsuarioBaseDatos);
        beanRespuesta.setMensajeRespuesta(null);
        beanRespuesta.setEstadoRespuesta(ConstantesWeb.OK);
    }

    private void cargarOpcionesMenu(HttpServletRequest request, Integer idPerfil) {
        LOGGER.info("Inicio cargarOpcionesMenu");
        String mensajeError = "";
        try {
            List<Paginas> listaPaginas = paginasService.listarPaginasPorPerfil(idPerfil.toString());
            OpcionBean opcionBean = null;
            UsuarioBean usuarioBean = new UsuarioBean();
            usuarioBean.setListaOpciones(new ArrayList<OpcionBean>());
            for (Paginas pagina : listaPaginas) {
                opcionBean = new OpcionBean();
                opcionBean.setNombre(pagina.getDesNombre());
                opcionBean.setNivel(pagina.getNumNivel());
                opcionBean.setAccion(pagina.getDesRuta());
                opcionBean.setCodigoOpcion(String.valueOf(pagina.getIdPagina()));
                opcionBean.setCodigoOpcionPadre(String.valueOf(pagina.getIdPadre()));
                usuarioBean.getListaOpciones().add(opcionBean);
            }
            request.getSession().setAttribute("listaOpciones",
                    JsonUtil.convertirObjetoACadenaJson(usuarioBean.getListaOpciones()));
            request.getSession().setAttribute("menuHtml",
                    this.generarMenu(usuarioBean.getListaOpciones(), request));request.getSession().getAttribute("listaOpciones");
            request.getSession().setAttribute("idPerfil", idPerfil);
        } catch (Exception exception) {
            String[] error = MensajeExceptionUtil.obtenerMensajeError(exception);
            mensajeError = format(ConstantesWeb.MENSAJE_ERROR, error[0]);
            respuestaBean.setMensajeRespuesta(mensajeError);
            LOGGER.error(error[1], exception);
        }
        LOGGER.info("Fin cargarOpcionesMenu");

    }

    private String generarMenu(List<OpcionBean> listaOpciones, HttpServletRequest request) {
        LOGGER.info("Inicio generaMenu");
        List<OpcionBean> nuevaListaOpciones = new ArrayList<>();
        OpcionBean opcionPadre = null;
        for (int indice = 0; indice < listaOpciones.size(); indice++) {
            OpcionBean opcionBean = listaOpciones.get(indice);

            if (opcionBean.getNivel().intValue() == 0) {
                nuevaListaOpciones.add(opcionBean);
                opcionPadre = opcionBean;
            } else {
                if (opcionPadre != null) {
                    if (!opcionPadre.getCodigoOpcion().equals(opcionBean.getCodigoOpcion()))
                        opcionPadre = obtenerPadre(opcionBean.getCodigoOpcionPadre(), listaOpciones);
                    if (opcionPadre.getListaOpciones() == null)
                        opcionPadre.setListaOpciones(new ArrayList<OpcionBean>());
                    opcionPadre.getListaOpciones().add(opcionBean);
                }
            }
        }

        StringBuilder menuHTML = new StringBuilder();

        // Se inicia a partir del indice P1 para dejar el P0 para la opcion de Principal
        for (int i = 0; i < nuevaListaOpciones.size(); i++) {
            OpcionBean opcionBean1 = nuevaListaOpciones.get(i);

            String iPrimerNivel = "P" + (i + 1);
            menuHTML.append("<li id='" + iPrimerNivel + "' class='nav-parent'>");
            menuHTML.append("<a> <i class='fa fa-table' aria-hidden='true'></i> <span>" + opcionBean1.getNombre() + "</span></a>");

            if (opcionBean1.getListaOpciones() != null && !opcionBean1.getListaOpciones().isEmpty()) {
                menuHTML.append("<ul class='nav nav-children'>");

                int n = 1;
                for (OpcionBean subMenu : opcionBean1.getListaOpciones()) {

                    String iSegundoNivel = "P" + (i + 1) + "-M" + n;
                    menuHTML.append("<li id='" + iSegundoNivel + "' onclick=\"checkingExpand('" + iSegundoNivel + "')\" ");
                    if (subMenu.getListaOpciones() != null && !opcionBean1.getListaOpciones().isEmpty()) {
                        menuHTML.append("class='nav-parent'> <a>" + subMenu.getNombre() + "</a>");
                        menuHTML.append("<ul class='nav nav-children'>");
                        int sn = 1;
                        for (OpcionBean subMenu2 : subMenu.getListaOpciones()) {

                            String iTercerNivel = "P" + (i + 1) + "-M" + n + "-" + sn;
                            menuHTML.append("<li id='" + iTercerNivel + "' onclick=\"checking('" + iTercerNivel + "')\"><a href='" + request.getContextPath() + subMenu2.getAccion() + "'>" + subMenu2.getNombre() + "</a></li>");
                            sn++;
                        }

                        menuHTML.append("</ul>");
                    } else {
                        menuHTML.append("><a href= '" + request.getContextPath() + subMenu.getAccion() + "'>" + subMenu.getNombre() + "</a>");
                    }
                    menuHTML.append("</li>");
                    n++;
                }

                menuHTML.append("</ul>");
            }
            menuHTML.append("</li>");
        }
        System.out.println(menuHTML.toString());
        return menuHTML.toString();
    }

    public OpcionBean obtenerPadre(String codigo, List<OpcionBean> lista) {
        for (OpcionBean opcionBean : lista) {
            if (opcionBean.getCodigoOpcion().equals(codigo)) {
                return opcionBean;
            }
        }
        return null;
    }

}
