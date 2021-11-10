package com.brandtex.web.util;

public class ConstantesWeb {

	private ConstantesWeb() { }
	
	/* Configuracion */
	public static final String ARCHIVO_CONFIGURACION = "config";

	/* Mensajes Generales */
	public static final String OK = "OK";
	public static final String ERROR = "ERROR";
	public static final String MENSAJE_NOMBRE_EXISTE = "El nombre que intenta registrar ya existe, por favor verifique";
	public static final String MENSAJE_NOMBRE_EXISTE_EN_EMPRESA = "El nombre que intenta registrar ya existe en la empresa, por favor verifique";

	/* Mensajes - Login */
	public static final String LOGIN_MENSAJE_ERROR = "Error: Lo sentimos, su nombre de usuario y/o clave son incorrectos. Por favor inténtelo de nuevo.";
	public static final String MENSAJE_ERROR = "Ocurrio un error inesperado con ID {0}, informar al area correspondiente.";
	public static final String LOGIN_MENSAJE_SIN_ACCESO = "Usted no cuenta con el perfil requerido para ejecutar el sistema de Configuración y Gestión del GSDIMAGE, por favor comuníquese con el Administrador del Sistema";
	public static final int ID_DETALLE_GENERICO_PAIS_PERU = 191;

	/* Mensajes - Empresa */
	public static final String MENSAJE_RUC_EXISTE = "La empresa que intenta registrar ya existe, por favor verifique";
	public static final String MENSAJE_COD_REF_EMPR_EXISTE = "El código referencial que intenta registrar ya existe para otra empresa, por favor verifique";

	/* Estados */
	public static final String ESTADO_ACTIVO = "1";
	public static final String ESTADO_INACTIVO = "0";
	public static final String ESTADO_CONFIGURADO = "1";
	public static final String ESTADO_NO_CONFIGURADO = "0";

	/* Estados  */
	public static final String SAA_ESTADO_ACTIVO = "A";
	public static final String SAA_ESTADO_INACTIVO = "I";
	
	/* Paginas */
	public static final String PAG_DOCUMENTO = "documento";
	public static final String PAG_CAMPO = "campo";
	public static final String PAG_TIPO_DATO = "tipoDato";
	public static final String PAG_TIPO_IMAGEN = "tipoImagen";
	public static final String PAG_INCIDENCIA_GNRAL = "incidencia";
	public static final String PAG_INCIDENCIA_ESPECIF = "incidenciasEspecificas";
	public static final String PAG_UNIDAD_MEDIDA = "unidadMed";
	public static final String PAG_MODULO = "modulo";
	public static final String PAG_PROCESO = "proceso";
	
	/* Secuenciales */
	public static final String SEQ_EMPRESA = "3";
	public static final String SEQ_MODULO = "3";
	public static final String SEQ_PROCESO = "3";
	public static final String SEQ_ESTADO = "3";
	public static final String SEQ_DOCUMENTO = "3";
	public static final String SEQ_CAMPO = "2";
	public static final String SEQ_TIPO_DATO = "2";
	public static final String SEQ_TIPO_IMAGEN = "2";
	public static final String SEQ_INCIDENCIA = "3";
	public static final String SEQ_UNIDAD_MEDIDA = "2";
	public static final String SEQ_PROYECTO = "3";
	public static final String SEQ_COMPUTADOR = "2";
	public static final String SEQ_ESCANER = "2";
	public static final String SEQ_PARAMETRO = "6";
	public static final String SEQ_CONFIGURACION = "3";
	
	/* Indicadores */
	public static final String IND_RECHAZO_SI= "1";
	public static final String IND_RECHAZO_NO= "0";

	/* Parametros */
	public static final String PARAM_USO_WEB = "W";
	public static final String PARAM_USO_GENERAL = "G";

	public static final String PARAM_IDSISTEMA_SAA = "saa.sistema.id";
	public static final String PARAM_LLAVEPERFILES = "gsdimage.perfiles";
	public static final String PARAM_LLAVETIPOPAGINA = "saa.tipopagina.id";
	public static final String PARAM_LLAVEEMPRESA = "saa.empresa.id";
	
	public static final String PARAM_MEDIOS_TIPO_BUSQ = "TIPO_BUSQUEDA";
	public static final String PARAM_MEDIOS_TIPO_MED = "TIPO_MEDIO";
	
	public static final String PARAM_TIPO_DOCUMENTO = "TIPODOCU_IDEN";

	//LLAVES DE MAPAS
	public static final String LLAVE_MAPA_COD_EMPRESA = "codigoEmpresa";
	public static final String LLAVE_MAPA_COD_PROYECTO = "codigoProyecto";
	public static final String LLAVE_MAPA_COD_TIPODOCU = "codigoTipoDocumento";
	public static final String LLAVE_MAPA_COD_TIPOINCI = "tipoIncidencia";
	public static final String LLAVE_MAPA_COD_TIPBUSQ = "tipoBusqueda";
	

	public static final String TIPO_CAPTURA_OCR = "01";
	
}
