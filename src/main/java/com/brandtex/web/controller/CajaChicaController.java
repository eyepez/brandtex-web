package com.brandtex.web.controller;

import com.brandtex.core.domain.CajaChica;
import com.brandtex.core.domain.ParametroValor;
import com.brandtex.core.service.CajaChicaService;
import com.brandtex.core.service.ParametroValorService;
import com.brandtex.web.bean.RespuestaBean;
import com.brandtex.web.util.ConstantesWeb;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pe.com.gmd.bpo.util.exception.MensajeExceptionUtil;
import pe.com.gmd.bpo.util.web.JsonUtil;

import javax.servlet.http.HttpServletRequest;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.text.MessageFormat.format;

@Controller
@RequestMapping(value = "/cajachica")
@Scope("request")
public class CajaChicaController {

    private static final Logger LOGGER = Logger.getLogger(CajaChicaController.class);

    @Autowired
    private ParametroValorService parametroValorService;

    @Autowired
    private CajaChicaService cajaChicaService;

    @RequestMapping(value = "/cargarVentana")
    public String cargarVentana(HttpServletRequest request, Model model) {
        LOGGER.info("Inicio cargarVentana");
        return "cajachica";
    }

    @RequestMapping(value = "/cargarComponentesCajaChica", method = RequestMethod.GET)
    public @ResponseBody
    String cargarComponentes(HttpServletRequest request, Model model) {
        RespuestaBean respBean = new RespuestaBean();
        LOGGER.info("Inicio cargarComponentesEmpresa");
        try {
            Map<String, Object> parametros = new HashMap<>();
            List<ParametroValor> lstTipoGasto = parametroValorService.obtenerParametrosPorLlave(5);
            parametros.put("lstTipoGasto", JsonUtil.convertirObjetoACadenaJson(lstTipoGasto));
            List<ParametroValor> lstTipoMovimiento = parametroValorService.obtenerParametrosPorLlave(6);
            parametros.put("lstTipoMovimiento", JsonUtil.convertirObjetoACadenaJson(lstTipoMovimiento));
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

    @RequestMapping(value = "/buscarCajaChica", method = RequestMethod.GET)
    public @ResponseBody
    String buscar(HttpServletRequest request, Model model) {
        RespuestaBean respBean = new RespuestaBean();
        LOGGER.info("Inicio buscarCajaChica");
        Map<String, Object> parametros = new HashMap<>();
        try {
            Map<String, Object> filtro = new HashMap<>();
            if (!StringUtils.isEmpty(request.getParameter("fecInicio")))
                filtro.put("fecInicio", request.getParameter("fecInicio"));
            if (!StringUtils.isEmpty(request.getParameter("fecFin")))
                filtro.put("fecFin", request.getParameter("fecFin"));
            if (!StringUtils.isEmpty(request.getParameter("cboTipoGasto")))
                filtro.put("cboTipoGasto", request.getParameter("cboTipoGasto"));
            if (!StringUtils.isEmpty(request.getParameter("cboTipoMovimiento")))
                filtro.put("cboTipoMovimiento", request.getParameter("cboTipoMovimiento"));
            List<CajaChica> lstCajaChica = cajaChicaService.listarCajaChica(filtro);
            parametros.put("lstCajaChica", JsonUtil.convertirObjetoACadenaJson(lstCajaChica));
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

    @RequestMapping(value = "/guardarCajaChica", method = RequestMethod.POST)
    public @ResponseBody String guardar(HttpServletRequest request, Model model){
        LOGGER.info("Inicio guardar");
        RespuestaBean respBean = new RespuestaBean();
        try {
            CajaChica cc = new CajaChica();
            cc.setDesComprobante(request.getParameter("desComprobante"));
            cc.setDesMovimiento(request.getParameter("desMovimiento"));
            cc.setDesObservacion(request.getParameter("desObservacion"));
            cc.setDesResponsable(request.getParameter("desResponsable"));
            cc.setIdTipGasto(Integer.parseInt(request.getParameter("cboTipoGastoNew")));
            cc.setTipoGasto(new ParametroValor());
            cc.getTipoGasto().setIdParametroValor(Integer.parseInt(request.getParameter("cboTipoGastoNew")));
            cc.setIdTipMovimiento(Integer.parseInt(request.getParameter("cboTipoMoviNew")));
            cc.setNumMonto(new BigDecimal(request.getParameter("numMonto").toString()));
            cc.setNumPedido(request.getParameter("numPedido"));
            cajaChicaService.insertarCajaChica(cc);
            respBean.setEstadoRespuesta(ConstantesWeb.OK);
        } catch (Exception e){
            String[] error = MensajeExceptionUtil.obtenerMensajeError(e);
            String mensajeError = format(ConstantesWeb.MENSAJE_ERROR, error[0]);
            respBean.setEstadoRespuesta(ConstantesWeb.ERROR);
            respBean.setMensajeRespuesta(mensajeError);
            LOGGER.error(error[1], e);
        }

        return JsonUtil.convertirObjetoACadenaJson(respBean);
    }
}
