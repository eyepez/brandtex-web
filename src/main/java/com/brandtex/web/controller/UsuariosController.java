package com.brandtex.web.controller;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/usuarios")
@Scope("request")
public class UsuariosController {

    private static final Logger LOGGER = Logger.getLogger(UsuariosController.class);

    @RequestMapping(value = "/cargarVentana" )
    public String cargarVentana(HttpServletRequest request, Model model) {
        LOGGER.info("Inicio cargarVentana");
        return "usuarios";
    }
}
