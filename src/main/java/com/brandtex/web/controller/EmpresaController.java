package com.brandtex.web.controller;

import com.brandtex.web.bean.RespuestaBean;
import com.brandtex.web.util.ConstantesWeb;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pe.com.gmd.bpo.util.exception.MensajeExceptionUtil;
import pe.com.gmd.bpo.util.web.JsonUtil;
import pe.com.gmd.bpo.util.web.WebUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

import static java.text.MessageFormat.format;

@Controller
@RequestMapping(value = "/empresa")
@Scope("request")
public class EmpresaController {
	
	private static final Logger LOGGER = Logger.getLogger(EmpresaController.class);
	
//	@Autowired
	//private GEmpresaService gEmpresaService;
	
//	@Autowired
    //private ParametroService parametroService;
	
	@RequestMapping(value = "/cargarVentanaEmpresa" )
	public String cargarVentanaEmpresa(HttpServletRequest request, Model model) {
		LOGGER.info("Inicio cargarVentanaEmpresa");
		return "empresa";
	}
	
	@RequestMapping(value = "/cargarComponentesEmpresa", method = RequestMethod.POST)
	public @ResponseBody String cargarComponentesEmpresa(HttpServletRequest request, Model model){
		RespuestaBean respBean = new RespuestaBean();
		LOGGER.info("Inicio cargarComponentesEmpresa");
		try {
			Map<String, Object> parametros = new HashMap<>();
			Map<String, Object> filtros = new HashMap<>();
            List<String> list = new ArrayList<>();
//            list.add(ConstantesWeb.PARAM_USO_WEB);
//            filtros.put("listApliUso", list);
//            List<Parametro> listaParametros =  parametroService.listar(filtros);
//            listaParametros = listaParametros.stream().filter(x -> x.getTipo().equals(ConstantesWeb.PARAM_TIPO_DOCUMENTO)).collect(Collectors.toList());
//            parametros.put("lstTipoDoc", JsonUtil.convertirObjetoACadenaJson(listaParametros));
//            WebUtil.setSessionAttribute(request, "lstTipoDoc", parametros.get("lstTipoDoc"));
//			List<Empresa> listEmpresas = gEmpresaService.listarEmpresas(parametros);
//			parametros.put("lstEmpresa", JsonUtil.convertirObjetoACadenaJson(listEmpresas));
//			respBean.setParametros(parametros);
			respBean.setEstadoRespuesta(ConstantesWeb.OK);
			
		} catch (Exception e) {
			String[] error = MensajeExceptionUtil.obtenerMensajeError(e);
//			respBean.setEstadoRespuesta(ConstantesWeb.ERROR);
//            respBean.setMensajeRespuesta(format(ConstantesWeb.MENSAJE_ERROR, error[0]));
			LOGGER.error(error[1], e);
		}
		return JsonUtil.convertirObjetoACadenaJson(respBean);
	}
	
	@RequestMapping(value = "/nuevaEmpresa", method = RequestMethod.POST)
	public @ResponseBody String nuevaEmpresa(HttpServletRequest request, Model model){
		LOGGER.info("Inicio nuevaEmpresa");
		RespuestaBean respBean = new RespuestaBean();
		try {
//			int seq = gEmpresaService.obtenerSeqEmpresa();
//			LOGGER.info("Numero Secuencial: " + seq);
			Map<String, Object> parametros = new HashMap<>();
//			String secuencial = GeneralUtil.completarCeros(seq, ConstantesWeb.SEQ_EMPRESA);
//			parametros.put("seq", secuencial);
			respBean.setParametros(parametros);
			respBean.setEstadoRespuesta(ConstantesWeb.OK);
			WebUtil.setSessionAttribute(request, "accion", "guardar");
//			WebUtil.setSessionAttribute(request, "codigo", secuencial);
		} catch (Exception e) {
			String[] error = MensajeExceptionUtil.obtenerMensajeError(e);
			respBean.setEstadoRespuesta(ConstantesWeb.ERROR);
            respBean.setMensajeRespuesta(format(ConstantesWeb.MENSAJE_ERROR, error[0]));
			LOGGER.error(error[1], e);
		}
		return JsonUtil.convertirObjetoACadenaJson(respBean);
	}
	
	@RequestMapping(value = "/modificarEmpresa", method = RequestMethod.POST)
	public @ResponseBody String modificarEmpresa(HttpServletRequest request, Model model){
		LOGGER.info("Inicio modificarEmpresa");
		RespuestaBean respBean = new RespuestaBean();
		try {
			String codigo = request.getParameter("codigo");
//			Empresa empresa = gEmpresaService.obtener(codigo);
			Map<String, Object> parametros = new HashMap<>();
//			parametros.put("tipoDocu", empresa.getTipoDocumento());
//			parametros.put("numDocu", empresa.getNumDocumento());
//			parametros.put("nombreComercial", empresa.getNombreComercial());
//			parametros.put("nombre", empresa.getNombre());
//			parametros.put("direccion", empresa.getDireccion());
//			parametros.put("representante", empresa.getRepresentante());
//            parametros.put("partidaRegistral", empresa.getPartidaRegistral());
//            parametros.put("codigoReferencial", empresa.getCodigoReferencial());
//            parametros.put("sigla", empresa.getSigla());
//            parametros.put("iniArea", empresa.getIniArea());

			String strLogo = "";
//			if(empresa.getImagenLogo() != null){
//				byte[] encoded = Base64.getEncoder().encode(empresa.getImagenLogo());
//				strLogo = new String(encoded);
//			}
			
			parametros.put("logo", strLogo);
			respBean.setParametros(parametros);
			respBean.setEstadoRespuesta(ConstantesWeb.OK);
			
			WebUtil.setSessionAttribute(request, "accion", "modificar");
			WebUtil.setSessionAttribute(request, "codigo", codigo);
			
		} catch (Exception e) {
			String[] error = MensajeExceptionUtil.obtenerMensajeError(e);
			respBean.setEstadoRespuesta(ConstantesWeb.ERROR);
            respBean.setMensajeRespuesta(format(ConstantesWeb.MENSAJE_ERROR, error[0]));
			LOGGER.error(error[1], e);
		}
		return JsonUtil.convertirObjetoACadenaJson(respBean);
	}
	
	@RequestMapping(value = "/guardarEmpresa", method = RequestMethod.POST)
	public String guardarEmpresa(HttpServletRequest request, Model model){
		LOGGER.info("Inicio guardarEmpresa");
		try {
//			Usuario usuario = (Usuario) WebUtil.getSessionAttribute(request, "usuarioBean");
			String accion = (String) WebUtil.getSessionAttribute(request, "accion");
			
//			Empresa empresaBean = new Empresa();
//			empresaBean.setCodigo(WebUtil.getSessionAttribute(request, "codigo").toString() );
//			empresaBean.setTipoDocumento(request.getParameter("cbo_tipodocempr"));
//			empresaBean.setNumDocumento(request.getParameter("num_docuempr"));
//			empresaBean.setNombre(request.getParameter("des_nombempr"));
//			empresaBean.setNombreComercial(request.getParameter("des_nombcomerempr"));
//			empresaBean.setDireccion(request.getParameter("des_direempr"));
//			empresaBean.setRepresentante(request.getParameter("des_repreempr"));
//            empresaBean.setPartidaRegistral(request.getParameter("des_partidaRegistral"));
//            empresaBean.setCodigoReferencial(request.getParameter("cod_refempr"));
//            empresaBean.setSigla(request.getParameter("sig_empr").toUpperCase());
//            empresaBean.setIniArea(request.getParameter("ini_area").toUpperCase());
//			empresaBean.setDireccionIP(WebUtil.devolverIpUsuario(request));
			
			byte[] decoded = Base64.getDecoder().decode(request.getParameter("imgLogo").getBytes());
//			empresaBean.setImagenLogo(decoded);
			
			LOGGER.info("accion: " + accion);
			if(accion!= null && accion.equalsIgnoreCase("modificar")){
//				empresaBean.setUsuarioMod(usuario.getId());
//				empresaBean.setFechaMod(new Date());
//                empresaBean.setDireccionIPMod(WebUtil.devolverIpUsuario(request));
//
//				gEmpresaService.actualizar(empresaBean);
			}else{
//				empresaBean.setUsuarioReg(usuario.getId());
//				empresaBean.setFechaReg(new Date());
//
//				gEmpresaService.insertar(empresaBean);
			}
			model.addAttribute("msg", "true");
			
			Map<String, Object> map = new HashMap<>();
//			List<Empresa> listEmpresas = gEmpresaService.listarEmpresas(map);
//			model.addAttribute("lstEmpresa", JsonUtil.convertirObjetoACadenaJson(listEmpresas));
			
		} catch (Exception e) {
			String[] error = MensajeExceptionUtil.obtenerMensajeError(e);
			model.addAttribute("msg", "false");
            model.addAttribute("mensaje", format(ConstantesWeb.MENSAJE_ERROR, error[0]));
			LOGGER.error(error[1], e);
		}
		
		return "forward:/empresa/cargarVentanaEmpresa/";
	}
	
	@RequestMapping(value = "/eliminarEmpresa", method = RequestMethod.POST)
	public @ResponseBody String eliminarEmpresa(HttpServletRequest request, Model model){
		LOGGER.info("Inicio eliminarEmpresa");
		RespuestaBean respBean = new RespuestaBean();
		try {
//			Empresa empresa = new Empresa();
//			empresa.setCodigo((String) request.getParameter("codigo"));
//			gEmpresaService.eliminar(empresa);
//
			Map<String, Object> parametros = new HashMap<>();
//			List<Empresa> listEmpresas = gEmpresaService.listarEmpresas(parametros);
//			parametros.put("lstEmpresa", JsonUtil.convertirObjetoACadenaJson(listEmpresas));
			respBean.setParametros(parametros);
			respBean.setEstadoRespuesta(ConstantesWeb.OK);
			
		} catch (Exception e) {
			
			String[] error = MensajeExceptionUtil.obtenerMensajeError(e);
			respBean.setEstadoRespuesta(ConstantesWeb.ERROR);
            respBean.setMensajeRespuesta(format(ConstantesWeb.MENSAJE_ERROR, error[0]));
			LOGGER.error(error[1], e);

		}
		return JsonUtil.convertirObjetoACadenaJson(respBean);
	}

	@RequestMapping(value = "/validarEmpresa", method = RequestMethod.POST)
    public @ResponseBody String validarEmpresa(HttpServletRequest request) {
		LOGGER.info("Inicio validarEmpresa");
		RespuestaBean respBean = new RespuestaBean();
		try {
			Map<String, Object> mapEmpr = new HashMap<>();
			mapEmpr.put("tipo", (String) request.getParameter("tipo"));
			mapEmpr.put("documento", (String) request.getParameter("numero"));
//			List<Empresa> lstEmpresa = gEmpresaService.listarEmpresas(mapEmpr);
//            if (lstEmpresa != null && !lstEmpresa.isEmpty()) {
//				respBean.setEstadoRespuesta(ConstantesWeb.ERROR);
//				respBean.setMensajeRespuesta(ConstantesWeb.MENSAJE_RUC_EXISTE);
//                return JsonUtil.convertirObjetoACadenaJson(respBean);
//            }
				respBean.setEstadoRespuesta(ConstantesWeb.OK);
        } catch (Exception e) {
            String[] error = MensajeExceptionUtil.obtenerMensajeError(e);
            respBean.setEstadoRespuesta(ConstantesWeb.ERROR);
            respBean.setMensajeRespuesta(format(ConstantesWeb.MENSAJE_ERROR, error[0]));
            LOGGER.error(error[1], e);
        }
        return JsonUtil.convertirObjetoACadenaJson(respBean);
    }

    @RequestMapping(value = "/validarCodigoReferencial", method = RequestMethod.POST)
    public @ResponseBody String validarCodigoReferencial(HttpServletRequest request) {
        LOGGER.info("Inicio validarCodigoReferencial");
        RespuestaBean respBean = new RespuestaBean();
        try {
            Map<String, Object> mapEmpr = new HashMap<>();
            mapEmpr.put("codigoReferencial", request.getParameter("codRef"));
//            List<Empresa> lstEmpresa = gEmpresaService.listarEmpresas(mapEmpr);
//            if (!GeneralUtil.esNuloOrVacio(lstEmpresa)) {
//                respBean.setEstadoRespuesta(ConstantesWeb.ERROR);
//                respBean.setMensajeRespuesta(ConstantesWeb.MENSAJE_COD_REF_EMPR_EXISTE);
//                return JsonUtil.convertirObjetoACadenaJson(respBean);
//			}
            respBean.setEstadoRespuesta(ConstantesWeb.OK);
		} catch (Exception e) {
			String[] error = MensajeExceptionUtil.obtenerMensajeError(e);
			respBean.setEstadoRespuesta(ConstantesWeb.ERROR);
            respBean.setMensajeRespuesta(format(ConstantesWeb.MENSAJE_ERROR, error[0]));
			LOGGER.error(error[1], e);
		}
		return JsonUtil.convertirObjetoACadenaJson(respBean);
	}

}
