package com.brandtex.web.bean;

import java.util.List;

public class OpcionBean {
	private String nombre;
	private String accion;
	private Integer nivel;
	private Integer tipoOpcion;
	private String codigoOpcion;
	private String codigoOpcionPadre;
	private List<OpcionBean> listaOpciones;
	
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getAccion() {
		return accion;
	}

	public void setAccion(String accion) {
		this.accion = accion;
	}

	public Integer getNivel() {
		return nivel;
	}

	public void setNivel(Integer nivel) {
		this.nivel = nivel;
	}

	public String getCodigoOpcion() {
		return codigoOpcion;
	}

	public void setCodigoOpcion(String codigoOpcion) {
		this.codigoOpcion = codigoOpcion;
	}

	public String getCodigoOpcionPadre() {
		return codigoOpcionPadre;
	}

	public void setCodigoOpcionPadre(String codigoOpcionPadre) {
		this.codigoOpcionPadre = codigoOpcionPadre;
	}

	public List<OpcionBean> getListaOpciones() {
		return listaOpciones;
	}

	public void setListaOpciones(List<OpcionBean> listaOpciones) {
		this.listaOpciones = listaOpciones;
	}

	public Integer getTipoOpcion() {
		return tipoOpcion;
	}

	public void setTipoOpcion(Integer tipoOpcion) {
		this.tipoOpcion = tipoOpcion;
	}

}
