<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!doctype html>
<html class="fixed">
<head>

    <!-- Librerias cabecera:start -->
    <jsp:include page="plantillas/libreriasCabecera.jsp"/>
    <!-- Librerias cabecera:end -->

    <style type="text/css">

        .iframe-container {
            padding-bottom: 60%;
            padding-top: 30px;
            height: 0;
            overflow: hidden;
        }

        .iframe-container iframe,
        .iframe-container object,
        .iframe-container embed {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

    </style>

</head>

<body>
<section class="body">

    <!-- start: header -->
    <header class="header">
        <jsp:include page="plantillas/header.jsp"/>
    </header>
    <!-- end: header -->

    <div class="inner-wrapper">

        <!-- start: sidebar -->
        <jsp:include page="plantillas/aside.jsp"/>
        <!-- end: sidebar -->


        <section role="main" class="content-body" style="padding-top: 30px;">
            <header id="cabecera" class="page-header animated fadeInLeft">

                <h2>COTIZACI&Oacute;N </h2>
                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li><a href="#"> <i class="fa fa-home"></i>
                        </a></li>
                        <li><span>Cotizaci&oacute;n</span></li>
                    </ol>

                </div>
            </header>

            <!-- START: PAGE -->
            <form class="form-horizontal" novalidate="novalidate" id="frm"
                  name="frm">
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel animated fadeInRight">
                            <div class="panel-body" style="padding-bottom: 15px; padding-top: 8px;">
                                <div class="form-group">
                                    <label class="col-md-1 control-label">COTIZACI&Oacute;N </label>
                                    <div class="col-md-2">
                                        <input type="text" id="numCotizacion" name="numCotizacion" class="form-control"  />
                                    </div>
                                    <label class="col-md-1 control-label">FECHA</label>
                                    <div class="col-md-2">
                                        <input type="text" id="fecCotizacion" name="fecCotizacion" class="form-control"  />
                                    </div>
                                    <label class="col-md-1 control-label">CLIENTE</label>
                                    <div class="col-md-4 divCboEmpresa">
                                        <select id="cboEmpresa" name="cboEmpresa" class="form-control" ></select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">PRENDA</label>
                                    <div class="col-md-2 divCboPrenda">
                                        <select id="cboPrenda" name="cboPrenda" class="form-control" ></select>
                                    </div>
                                    <label class="col-md-1 control-label">COLOR </label>
                                    <div class="col-md-2">
                                        <input type="text" id="desColor" name="desColor" class="form-control"  />
                                    </div>
                                    <label class="col-md-1 control-label">MODELO</label>
                                    <div class="col-md-4">
                                        <input type="text" id="desModelo" name="desModelo" class="form-control"  />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-1 control-label">TELA </label>
                                    <div class="col-md-2">
                                        <input type="text" id="desTela" name="desTela" class="form-control"  />
                                    </div>
                                    <label class="col-md-1 control-label">DETALLE </label>
                                    <div class="col-md-7">
                                        <input type="text" id="desDetalle" name="desDetalle" class="form-control"  />
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <section class="panel form-wizard animated fadeInRight" id="w2">
                            <div class="panel-body panel-body-nopadding" id="divConfig">
                                <div class="tabs">
                                    <ul class="nav nav-tabs nav-justify">
                                        <li class="active">
                                            <a href="#w2-uno" data-toggle="tab" class="text-center">
                                                <span class="badge hidden-xs"> 1 </span> BORDADO Y TALLAS
                                        </a></li>
                                        <li><a href="#w2-dos" data-toggle="tab" class="text-center">
                                            <span class="badge hidden-xs"> 2 </span> SERVICIOS
                                        </a></li>
                                        <li><a href="#w2-tres" data-toggle="tab" class="text-center">
                                            <span class="badge hidden-xs"> 3 </span> MATERIA PRIMA
                                        </a></li>
                                        <li><a href="#w2-cuatro" data-toggle="tab" class="text-center">
                                            <span class="badge hidden-xs"> 4 </span> COSTOS PRODUCCI&Oacute;N
                                        </a></li>
                                    </ul>

                                    <div class="tab-content">
                                        <div id="w2-uno" class="tab-pane active">

                                            <div class="col-sm-12" style="padding-bottom: 15px;">
                                                <div class="panel-body">
                                                    <div class="form-group">
                                                        <label class="col-md-1 control-label">BORDADO </label>
                                                        <div class="col-md-10">
                                                            <input type="text" id="desBordado" name="desBordado" class="form-control"  />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-4">
                                                <section class="panel animated fadeInRight">
                                                    <div class="panel-body">
                                                        <div class="form-group">
                                                            <label class="col-md-5 control-label"
                                                                   style="text-align: left;" for="cboTalla">TALLA</label>
                                                            <div class="col-md-7">
                                                                <select id="cboTalla" name="cboTalla" class="form-control">
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-md-5 control-label"
                                                                   style="text-align: left;">CANTIDAD</label>
                                                            <div class="col-md-5">
                                                                <input type="text" id="txtCantTalla"
                                                                       name="txtCantTalla" class="form-control"/>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-md-5 control-label"
                                                                   style="text-align: left;">CANTIDAD TOTAL</label>
                                                            <div class="col-md-5">
                                                                <div style="padding-left: 0px;">
                                                                    <input type="text" id="txtCantTotal"
                                                                           name="txtCantTotal"
                                                                           class="form-control" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </section>
                                            </div>

                                            <div class="col-sm-1">
                                                <div class="form-group">
                                                    <div class="col-sm-2" style="padding-top: 0px;">
                                                        <div class="panel-body">
                                                            <div class="row">
                                                                <a class="btn btn-sm aAgregarCab"
                                                                   id="btnAgregarTalla"
                                                                   style="color: #777777; background-color: white; border-color: #dddddd; width: 60px;"
                                                                   onclick="agregarTalla();"> <i
                                                                        class="fa fa-arrow-right"
                                                                        style="font-size: 30px;"> </i><br>Agregar</a>
                                                            </div>
                                                            <div class="row">
                                                                <a class="btn btn-sm " id="btnQuitarTalla"
                                                                   style="color: #777777; background-color: white; border-color: #dddddd; width: 60px; margin-top: 10px;"
                                                                   onclick="quitarTalla();"> <i
                                                                        class="fa fa-arrow-left"
                                                                        style="font-size: 30px;"> </i><br>Quitar</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-sm-6">
                                                <section class="panel animated fadeInRight">
                                                    <header class="panel-heading">
                                                        <h2 class="panel-title">CUADRO DE TALLAS</h2>
                                                    </header>

                                                    <div class="form-group">
                                                        <div class="col-sm-12">
                                                            <div class="panel-body" style="padding-top: 0px;">
                                                                <div id="tablaTalla" class="table-responsive">
                                                                    <table id="tblTalla" class="table table-striped mb-none">
                                                                        <thead>
                                                                        <tr>
                                                                            <th class="text-center">SEL</th>
                                                                            <th class="text-center">TALLA</th>
                                                                            <th class="text-center">CANTIDAD</th>
                                                                        </tr>
                                                                        </thead>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </section>
                                            </div>
                                        </div>

                                        <div id="w2-dos" class="tab-pane">
                                            <div class="col-sm-12">
                                                <div class="panel-body">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label"
                                                               style="text-align: center;" > </label>
                                                        <label class="col-md-2 control-label"
                                                               style="text-align: center;" >PRECIO</label>
                                                        <label class="col-md-2 control-label"
                                                               style="text-align: center;" >COSTO UNITARIO</label>
                                                        <label class="col-md-2 control-label"
                                                               style="text-align: center;" >COSTO TOTAL</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-12">
                                                <section class="panel animated fadeInRight">
                                                    <div class="panel-body" id="divPestDos">
                                                        <div class="form-group">
                                                            <label class="col-md-3 control-label"
                                                                   style="text-align: right;" >MOLDE ESCALADO</label>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtPrecioMolde" name="txtPrecioMolde"
                                                                       class="form-control soloNumeros" maxlength="8"/>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtCostUnitMolde" name="txtCostUnitMolde"
                                                                       class="form-control soloNumeros" maxlength="8"/>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtCostTotalMolde" name="txtCostTotalMolde"
                                                                       class="form-control soloNumeros" maxlength="8"/>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-md-3 control-label"
                                                                   style="text-align: right;">CORTE</label>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtPrecioCorte" name="txtPrecioCorte"
                                                                       class="form-control soloNumeros" maxlength="8"/>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtCostUnitCorte" name="txtCostUnitCorte"
                                                                       class="form-control soloNumeros" maxlength="8"/>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtCostTotalCorte" name="txtCostTotalCorte"
                                                                       class="form-control soloNumeros" maxlength="8"/>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-md-3 control-label"
                                                                   style="text-align: right;">CONFECCI&Oacute;N ACABADO</label>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtPrecioConf" name="txtPrecioConf"
                                                                       class="form-control soloNumeros" maxlength="8"/>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtCostUnitConf" name="txtCostUnitConf"
                                                                       class="form-control soloNumeros" maxlength="8"/>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtCostTotalConf" name="txtCostTotalConf"
                                                                       class="form-control soloNumeros" maxlength="8"/>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-md-3 control-label"
                                                                   style="text-align: right;">BORDADO</label>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtPrecioBordado" name="txtPrecioBordado"
                                                                       class="form-control soloNumeros" maxlength="8"/>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtCostUnitBordado" name="txtCostUnitBordado"
                                                                       class="form-control soloNumeros" maxlength="8"/>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtCostTotalBordado" name="txtCostTotalBordado"
                                                                       class="form-control soloNumeros" maxlength="8"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </section>
                                            </div>

                                            <div class="col-sm-12">
                                                <section class="panel animated fadeInRight">
                                                    <div class="panel-body">
                                                        <div class="form-group">
                                                            <label class="col-md-3 control-label"
                                                                   style="text-align: center;" >TOTALES SIN IGV</label>
                                                            <label class="col-md-2 control-label"
                                                                   style="text-align: center;" ></label>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtCostUnitTotal" name="txtCostUnitTotal"
                                                                       class="form-control soloNumeros" maxlength="8"/>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtCostTotalTotal" name="txtCostTotalTotal"
                                                                       class="form-control soloNumeros" maxlength="8"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </section>
                                            </div>
                                        </div>

                                        <div id="w2-tres" class="tab-pane">
                                            <div class="col-sm-12">
                                                <section class="panel animated fadeInRight">
                                                    <div class="panel-body">
                                                        <div class="form-group">
                                                            <label class="col-md-1 control-label"
                                                                   style="text-align: center;" >PRECIO</label>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtPrecio" name="txtPrecio"
                                                                       class="form-control soloNumeros" maxlength="6"/>
                                                            </div>

                                                            <label class="col-md-1 control-label" >CONSUMO</label>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtConsumo" name="txtConsumo"
                                                                       class="form-control soloNumeros" maxlength="6"/>
                                                            </div>
                                                            <label class="col-md-1 control-label" >UNIDAD</label>
                                                            <div class="col-md-2">
                                                                <select id="cboUnidad" name="cboUnidad" class="form-control">
                                                                </select>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <a class="btn btn-sm btn-primary width-default"
                                                                   id="btnAgregarMP"
                                                                   onclick="nuevoCampoDet();">AGREGAR</a>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-md-1 control-label"
                                                                   style="text-align: center;" >DESCRIPCI&Oacute;N</label>
                                                            <div class="col-md-5">
                                                                <input type="text" id="desDescrMP" name="desDescrMP" class="form-control "/>
                                                            </div>
                                                            <label class="col-md-3 control-label"
                                                                   style="text-align: center;" ></label>
                                                            <div class="col-md-2">
                                                                <a class="btn btn-sm btn-primary width-default"
                                                                   id="btnQuitarMP"
                                                                   onclick="nuevoCampoDet();">ELIMINAR</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </section>
                                            </div>

                                            <div class="col-sm-12">
                                                <section class="panel animated fadeInRight">

                                                    <div class="form-group">
                                                        <div class="col-sm-12">
                                                            <div class="panel-body" style="padding-top: 0px;">
                                                                <div id="TablaMP" class="table-responsive">
                                                                    <table id="tblMP" class="table table-striped mb-none">
                                                                        <thead>
                                                                        <tr>
                                                                            <th class="text-center">SEL</th>
                                                                            <th class="text-center">DESCRIPCI&Oacute;N</th>
                                                                            <th class="text-center">CONSUMO</th>
                                                                            <th class="text-center">UNIDAD</th>
                                                                            <th class="text-center">PRECIO</th>
                                                                            <th class="text-center">COSTO UNITARIO</th>
                                                                            <th class="text-center">COSTO TOTAL</th>
                                                                        </tr>
                                                                        </thead>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </section>
                                            </div>

                                            <div class="col-sm-12">
                                                <section class="panel animated fadeInRight">
                                                    <div class="panel-body">
                                                        <div class="form-group">
                                                            <label class="col-md-5 control-label"
                                                                   style="text-align: center;" >PRECIO MATERIA PRIMA SIN IGV</label>
                                                            <label class="col-md-2 control-label" >COSTO UNIT</label>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtCostUnitMP" name="txtPrecio"
                                                                       class="form-control soloNumeros" maxlength="6"/>
                                                            </div>
                                                            <label class="col-md-1 control-label" >TOTAL</label>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtCostTotalMP" name="txtConsumo"
                                                                       class="form-control soloNumeros" maxlength="6"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </section>
                                            </div>
                                        </div>
                                        <%-- PESTANA 4 COSTOS OPERATIVO--%>
                                        <div id="w2-cuatro" class="tab-pane">
                                            <div class="col-sm-12">
                                                <section class="panel animated fadeInRight">
                                                    <div class="panel-body">
                                                        <div class="form-group">
                                                            <label class="col-md-1 control-label"
                                                                   style="text-align: center;" >PRECIO</label>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtPrecio" name="txtPrecio"
                                                                       class="form-control soloNumeros" maxlength="6"/>
                                                            </div>

                                                            <label class="col-md-1 control-label" >CONSUMO</label>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtConsumo" name="txtConsumo"
                                                                       class="form-control soloNumeros" maxlength="6"/>
                                                            </div>
                                                            <label class="col-md-1 control-label" >UNIDAD</label>
                                                            <div class="col-md-2">
                                                                <select id="cboUnidad" name="cboUnidad" class="form-control">
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-md-2 control-label"
                                                                   style="text-align: left;" >COSTO OPERATIVO</label>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtCostOperConsumo" name="txtCostOperConsumo" class="form-control "/>
                                                            </div>
                                                            <label class="col-md-1 control-label"> </label>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtCostOperPrecio" name="txtCostOperPrecio" class="form-control "/>
                                                            </div>
                                                            <label class="col-md-1 control-label"> </label>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtCostOperCU" name="txtCostOperCU" class="form-control "/>
                                                            </div>
                                                            <label class="col-md-1 control-label"> </label>
                                                            <div class="col-md-2">
                                                                <input type="text" id="txtCostOperCT" name="txtCostOperCT" class="form-control "/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </section>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 animated fadeInRight"
                         style="text-align: center;">
                        <a class="btn btn-sm btn-primary width-default" id="btnGuardar"
                           onclick="preguntar();">GUARDAR COTIZACI&Oacute;N</a>
                    </div>
                </div>
            </form>
        </section>


        <!-- MODAL NUEVO CAMPO -->
        <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true"
             id="modalCampo">
            <div class="modal-block modal-block-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">CAMPOS DEL DOCUMENTO</h4>
                    </div>

                    <div class="modal-header">
                        <section class="panel animated fadeInRight">
                            <div class="panel-body">
                                <div class="form-group" style="display:none">
                                    <label class="col-sm-4 control-label"> C&Oacute;DIGO <span class="required">*</span></label>
                                    <div class="col-sm-8">
                                        <input type="text" id="txtCodigoCampo" name="txtCodigoCampo"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label"> CAMPO <span class="required">*</span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="txtNombreCampo" name="txtNombreCampo"
                                               class="form-control" maxlength="30" title="Favor, Ingresar un Campo."
                                               onkeydown="upperCase(this)" required/>
                                    </div>
                                </div>
                            </div>
                            <footer class="panel-footer">
                                <div class="row">
                                    <div class="center">
                                        <a class="btn btn-sm btn-primary width-default" onclick="guardarCampo();">GUARDAR</a>
                                        <a class="btn btn-sm btn-primary width-default" onclick="cerrarModalCampo();">CANCELAR</a>
                                    </div>
                                </div>
                            </footer>
                        </section>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODAL NUEVO CAMPO DETALLE -->
        <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true"
             id="modalCampoDet">
            <div class="modal-block modal-block-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">CAMPOS DEL DOCUMENTO</h4>
                    </div>

                    <div class="modal-header">
                        <section class="panel animated fadeInRight">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label"> C&Oacute;DIGO <span class="required">*</span></label>
                                    <div class="col-sm-8">
                                        <input type="text" id="txtCodigoCampoDet" name="txtCodigoCampoDet"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label"> CAMPO <span class="required">*</span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="txtNombreCampoDet" name="txtNombreCampoDet"
                                               class="form-control" maxlength="30" title="Favor, Ingresar un Campo."
                                               onkeydown="upperCase(this)" required/>
                                    </div>
                                </div>
                            </div>
                            <footer class="panel-footer">
                                <div class="row">
                                    <div class="center">
                                        <a class="btn btn-sm btn-primary width-default" onclick="guardarCampoDet();">GUARDAR</a>
                                        <a class="btn btn-sm btn-primary width-default" onclick="cerrarModalCampo();">CANCELAR</a>
                                    </div>
                                </div>
                            </footer>
                        </section>
                    </div>
                </div>
            </div>
        </div>


        <!-- MODAL NUEVO TIPO DATO -->
        <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true"
             id="modalTipoDato">
            <div class="modal-block modal-block-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">TIPO DE DATO</h4>
                    </div>

                    <div class="modal-header">
                        <section class="panel animated fadeInRight">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" style="padding-left: 0px;"> ID <span
                                            class="required">*</span></label>
                                    <div class="col-sm-8">
                                        <input type="text" id="txtCodigoTipoDato" name="txtCodigoTipoDato"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" style="padding-left: 0px;"> DESCRIPCI&Oacute;N
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="txtNombreTipoDato" name="txtNombreTipoDato"
                                               class="form-control" maxlength="20"
                                               onkeydown="upperCase(this)" title="Favor, Ingresar un Descripci&oacute;n"
                                               required/>
                                    </div>
                                </div>
                            </div>
                            <footer class="panel-footer">
                                <div class="row">
                                    <div class="center">
                                        <a class="btn btn-sm btn-primary width-default" onclick="guardarTipoDato();">GUARDAR</a>
                                        <a class="btn btn-sm btn-primary width-default"
                                           onclick="cerrarModalTipoDato();">CANCELAR</a>
                                    </div>
                                </div>
                            </footer>
                        </section>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODAL NUEVO TIPO DATO DETALLE-->
        <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true"
             id="modalTipoDatoDet">
            <div class="modal-block modal-block-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">TIPO DE DATO</h4>
                    </div>

                    <div class="modal-header">
                        <section class="panel animated fadeInRight">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" style="padding-left: 0px;"> ID <span
                                            class="required">*</span></label>
                                    <div class="col-sm-8">
                                        <input type="text" id="txtCodigoTipoDatoDet" name="txtCodigoTipoDatoDet"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" style="padding-left: 0px;"> DESCRIPCI&Oacute;N
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="txtNombreTipoDatoDet" name="txtNombreTipoDatoDet"
                                               class="form-control" maxlength="20"
                                               onkeydown="upperCase(this)" title="Favor, Ingresar un Descripci&oacute;n"
                                               required/>
                                    </div>
                                </div>
                            </div>
                            <footer class="panel-footer">
                                <div class="row">
                                    <div class="center">
                                        <a class="btn btn-sm btn-primary width-default" onclick="guardarTipoDatoDet();">GUARDAR</a>
                                        <a class="btn btn-sm btn-primary width-default"
                                           onclick="cerrarModalTipoDato();">CANCELAR</a>
                                    </div>
                                </div>
                            </footer>
                        </section>
                    </div>
                </div>
            </div>
        </div>


        <!-- MODAL NUEVO TIPO IMAGEN -->
        <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true"
             id="modalTipoImagen">
            <div class="modal-block modal-block-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">TIPO DE IMAGEN</h4>
                    </div>

                    <div class="modal-header">
                        <section class="panel animated fadeInRight">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label"> C&Oacute;DIGO <span class="required">*</span></label>
                                    <div class="col-sm-8">
                                        <input type="text" id="txtCodigoTipoImagen" name="txtCodigoTipoImagen"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label"> TIPO DE IMAGEN <span
                                            class="required">*</span>
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="txtNombreTipoImagen" name="txtNombreTipoImagen"
                                               class="form-control" maxlength="20"
                                               onkeydown="upperCase(this)" title="Favor, Ingresar un Tipo de Imagen"
                                               required/>
                                    </div>
                                </div>
                            </div>
                            <footer class="panel-footer">
                                <div class="row">
                                    <div class="center">
                                        <a class="btn btn-sm btn-primary width-default" onclick="guardarTipoImagen();">GUARDAR</a>
                                        <a class="btn btn-sm btn-primary width-default"
                                           onclick="cerrarModalTipoImagen();">CANCELAR</a>
                                    </div>
                                </div>
                            </footer>
                        </section>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODAL LISTA CABECERA -->
        <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true"
             id="modalCabecera">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">No se ha agregado ning&uacute;n campo de digitaci&oacute;n al documento
                            configurado, desea guardar los cambios</h4>
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-sm btn-primary width-default" onclick="guardar();">Si</a>
                        <a class="btn btn-sm btn-primary width-default" onclick="cerrarModal();">No</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODAL LISTA CHECK UNIFORME -->
        <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true"
             id="modalChkUniforme">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">No se ha configurado el Fichero de la plantilla, ni las Zonas de
                            Visualizaci&oacute;n del documento, desea guardar los cambios</h4>
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-sm btn-primary width-default" onclick="guardar();">Si</a>
                        <a class="btn btn-sm btn-primary width-default" onclick="cerrarModal();">No</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODAL LISTA CHECK ALMACENAMIENTO BD -->
        <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true"
             id="modalChkBD">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">No se ha definido un tama&ntilde;o m&aacute;ximo para las p&aacute;ginas
                            que se guardar&aacute;n en la BD, desea guardar los cambios</h4>
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-sm btn-primary width-default" onclick="guardar();">Si</a>
                        <a class="btn btn-sm btn-primary width-default" onclick="cerrarModal();">No</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODAL CONFIRMACION -->
        <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true"
             id="modalConfirmacion">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Desea guardar la Configuraci&oacute;n del Documento</h4>
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-sm btn-primary width-default" onclick="guardarConfiguracion();">Si</a>
                        <a class="btn btn-sm btn-primary width-default" onclick="cerrarModal();">No</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODAL CONFIRMACION -->
        <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true"
             id="modalConfirmacionModificar">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">El documento ya hab&iacute;a sido configurado, cualquier cambio
                            realizado
                            repercutir&aacute; en otros m&oacute;dulos del sistema. Desea confirmar los cambios</h4>
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-sm btn-primary width-default" onclick="modificar();">Si</a>
                        <a class="btn btn-sm btn-primary width-default" onclick="cerrarModal();">No</a>
                    </div>
                </div>
            </div>
        </div>


        <!-- MODAL CONFIRMACION ELIMINAR DETALLE -->
        <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true"
             id="modalEliminarDetalle">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">El documento ya cuenta con campos de detalle configurados, si desmarca
                            la opción se eliminarán los registros</h4>
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-sm btn-primary width-default" onclick="eliminarDetalle();">Si</a>
                        <a class="btn btn-sm btn-primary width-default" onclick="cerrarModalDelDetalle();">No</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODAL ITEMS DEL CAMPO CABECERA -->
        <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true"
             id="modalItems">
            <div class="modal-block modal-block-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">LISTA DE ITEMS</h4>
                    </div>

                    <div class="modal-body">
                        <section class="panel animated fadeInRight">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"> NOMBRE</label>
                                    <div class="col-sm-7">
                                        <input type="text" id="txtNombreItem" name="txtNombreItem" maxlength="200"
                                               onkeydown="upperCase(this)" class="form-control"/>
                                        <input id="hidCodigoCampo" name="hidCodigoCampo" type="hidden"/>
                                        <input id="hidFromTo" name="hidFromTo" type="hidden"/>
                                    </div>
                                    <div class="col-sm-2">
                                        <a class="btn btn-sm btn-primary" onclick="agregarItem()"><i
                                                class="fa fa-plus"> </i></a>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"> ALIAS (Opcional)</label>
                                    <div class="col-sm-7">
                                        <input type="text" id="txtAliasItem" name="txtAliasItem" maxlength="200"
                                               onkeydown="upperCase(this)" class="form-control"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="panel-body" style="padding-top: 0px;">
                                            <div id="tablaParamItems" class="table-responsive">
                                                <table id="tblParamItem" class="table table-striped mb-none">
                                                    <thead>
                                                    <tr>
                                                        <th class="text-center">NOMBRE</th>
                                                        <th class="text-center">ALIAS</th>
                                                        <th class="text-center">OPCION</th>
                                                    </tr>
                                                    </thead>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>

<!-- END: PAGE -->

<jsp:include page="plantillas/footer.jsp"/>

</section>


</div>

<!-- START: sidebar-->

<%-- 	<jsp:include page="plantillas/sidebar.jsp" /> --%>

<!-- END: sidebar-->

</section>


<!-- START: LIB JS FOOTER-->
<jsp:include page="plantillas/libreriasPie.jsp"/>
<!-- END: LIB JS FOOTER-->


<script type="text/javascript">


    var ipUser = null;
    var listaCabecera = null;
    var lstDetalle = null;
    var accion = null;

    function msgSuccessZona() {
        var msg = '${msg}';
        if (msg == "true") {

            var codigoEmpresa = '${codigoEmpresa}';
            $("div.divCboEmpresa select").val(codigoEmpresa);

            var lstProyecto = '${lstProyecto}';
            if (lstProyecto != '') {
                loadComboProyecto(JSON.parse(lstProyecto));
            }

            var codigoProyecto = '${codigoProyecto}';
            $("div.divCboProyecto select").val(codigoProyecto);

            var lstTipoDocumento = '${lstTipoDocumento}';
            if (lstTipoDocumento != '') {
                loadComboTipoDocumento(JSON.parse(lstTipoDocumento));
            }

            var codigoTipoDocu = '${codigoTipoDocu}';
            $("div.divCboTipoDocumento select").val(codigoTipoDocu);

            lstConfig = '${lstConfig}';
            if (lstConfig != '') {
                loadConfig(JSON.parse(lstConfig.replace(/\\/g, "\\\\")));
            }

            listaCabecera = '${lstCabecera}';
            if (listaCabecera != '') {
                loadTableCabecera(JSON.parse(listaCabecera));
            }

            lstDetalle = '${lstDetalle}';
            if (lstDetalle != '') {
                loadTableDetalle(JSON.parse(lstDetalle));
            }

            accion = '${accion}';

        } else if (msg == "false") {
            callNotification('error', "${mensaje}", 'Error');
        } else if (msg == "msgExito") {
            callNotification('success', "Se ha guardado satisfactoriamente la configuraci&oacute;n del documento", 'Correcto');
            $('#txtPlantilla').val("");
            $('#nombrePlantilla').val("");
            $('#divPlantilla').hide();
            $('#divPlantillaUpload').show();
        }
    }

    $(document).ready(function () {

        var nombrePlantilla = '${mapDatos.nombrePlantilla}';
        var base64Plantilla = '${mapDatos.base64Plantilla}';

        cargarPlantilla(nombrePlantilla, base64Plantilla);

        $('#deletePlantilla').bind("click", function (e) {
            e.preventDefault();

            $('#txtPlantilla').val("");
            $('#nombrePlantilla').val("");
            $('#divPlantilla').hide();
            $('#divPlantillaUpload').show();
        });

        inicializarVariables();
        cargarComponentes();

        $(".soloNumeros").keydown(function (e) {
            // Permite: backspace, delete, tab, escape, enter and .
            if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                // Permite: Ctrl+A
                (e.keyCode == 65 && e.ctrlKey === true) ||
                // Permite: home, end, left, right
                (e.keyCode >= 35 && e.keyCode <= 39)) {
                // solo permitir lo que no este dentro de estas condiciones es un return false
                return;
            }
            // Aseguramos que son numeros
            if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                e.preventDefault();
            }
        });

        $('input:radio[name="rdoTipoCaptura"]').change(
            function () {
                if (this.checked && this.value == '1') {
                    mostrar_div();
                } else {
                    ocultar_div();
                }
            });
        habilitarCabecera();
        habilitarDetalle();

        $("#txtPlantilla").bind("change", function () {

            var fileUpload = $("#txtPlantilla")[0];
            var regex = new RegExp("([a-zA-Z0-9\s_\\.\-:{}])+(.jpg|.png|.jpeg|.tif|.tiff|.pdf)$");
            if (regex.test(fileUpload.value.toLowerCase())) {
                if (typeof (fileUpload.files) != "undefined") {
                    var reader = new FileReader();
                    reader.readAsDataURL(fileUpload.files[0]);
                    reader.onload = function (e) {
                        $('#hidePlantilla').val(e.target.result);
                        $('#nombrePlantilla').val(document.getElementById("txtPlantilla").files[0].name);
                        $('#divPlantillaUpload').hide();
                        $('#divPlantilla').show();
                    }
                } else {
                    callNotification(
                        'info',
                        "Este navegador no soporta HTML5, por favor verifique",
                        'Informaci&oacute;n');
                    return false;
                }
            } else {
                callNotification(
                    'info',
                    "Por favor, cargue una plantilla válida (jpg, png, jpeg, tiff, pdf)",
                    'Informaci&oacute;n');
                return false;
            }
        });

    });

    function cargarPlantilla(nombrePlantilla, base64Plantilla) {

        if (nombrePlantilla != "" && base64Plantilla != "") {
            $('#nombrePlantilla').val(nombrePlantilla);
            $('#hidePlantilla').val(base64Plantilla);
            $('#divPlantillaUpload').hide();
            $('#divPlantilla').show();
        } else {
            $('#txtPlantilla').val("");
            $('#nombrePlantilla').val("");
            $('#divPlantilla').hide();
            $('#divPlantillaUpload').show();
        }
    }

    function inicializarVariables() {
        cboEmpresa = $('#cboEmpresa');
        cboProyecto = $('#cboProyecto');
        cboTipoDocumento = $('#cboTipoDocumento');

        $('#tblTalla').DataTable({
            "scrollY": "180px",
            "scrollCollapse": true,
            "paging": false,
            "searching": false,
            "info": false,
            select: 'single'
        });

        $('#tblParamItem').DataTable({
            "scrollY": "180px",
            "scrollCollapse": true,
            "paging": false,
            "searching": false
        });

        $('#tblDetalle').DataTable({
            "scrollY": "180px",
            "autoWidth": true,
            "scrollCollapse": true,
            "paging": false,
            "searching": false,
            "info": false,
            select: 'single'
        });

    }

    function cargarComponentes() {
        console.log("cargarComponentes");
        $.ajax({
            url: "./cargarComponentesConfig",
            type: "POST",
            dataType: "json"
        }).done(
            function (paramJson) {
                if (paramJson.estadoRespuesta == 'OK') {
                    var lstEmpresa = JSON.parse(paramJson.parametros.lstEmpresa);
                    var lstCampo = JSON.parse(paramJson.parametros.lstCampo);
                    var lstTipoDato = JSON.parse(paramJson.parametros.lstTipoDato);
                    var lstTipoImagen = JSON.parse(paramJson.parametros.lstTipoImagen);

                    loadComboEmpresa(lstEmpresa);
                    loadComboProyecto(null);
                    loadComboTipoDocumento(null);
                    loadComboCampo(lstCampo);
                    loadComboTipoDato(lstTipoDato);
                    loadComboTipoImagen(lstTipoImagen);
                    ocultar_div();
                    $('#chkDetalle').prop("checked", false);
                    habilitarDetalle();
                    $("#txtTamanoBD").attr('disabled', true);
                    msgSuccessZona();
                } else {
                    callNotification('error', paramJson.mensajeRespuesta, 'Error');
                }
            }).fail(function (jqXHR, textStatus, errorThrown) {
            alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
        });
    }

    function loadComboEmpresa(lista) {
        var listEmpresa = lista;
        cboEmpresa.append($("<option/>").attr("value", "").text("Seleccionar"));
        $.each(listEmpresa, function (i, item) {
            cboEmpresa.append($("<option/>").attr("value", listEmpresa[i].codigo).text(listEmpresa[i].nombreComercial));
        });
    }

    function loadComboProyecto(lista) {
        var listProyecto = lista;
        cboProyecto = $('#cboProyecto');
        cboProyecto.empty();
        if (listProyecto == null) {
            cboProyecto.append($("<option/>").attr("value", "").text("Seleccionar"));
        } else {
            cboProyecto.append($("<option/>").attr("value", "").text("Seleccionar"));
            $.each(listProyecto, function (i, item) {
                cboProyecto.append($("<option/>").attr("value", listProyecto[i].codigo.codigoProyecto).text(listProyecto[i].nombre));

            });
        }


    }

    function loadComboTipoDocumento(lista) {
        var listTipoDocu = lista;
        cboTipoDocumento = $('#cboTipoDocumento');
        cboTipoDocumento.empty();
        if (listTipoDocu == null) {
            cboTipoDocumento.append($("<option/>").attr("value", "").text("Seleccionar"));
        } else {
            cboTipoDocumento.append($("<option/>").attr("value", "").text("Seleccionar"));
            $.each(listTipoDocu, function (i, item) {
                cboTipoDocumento.append($("<option/>").attr("value", listTipoDocu[i].codigo.codigoTipoDocumento).text(listTipoDocu[i].tipoDocumento.nombre));
            });
        }
    }

    function loadComboCampo(lista) {
        var listCampo = lista;
        cboCampo = $('#cboCampo');
        cboCampo.empty();

        cboCampoDet = $('#cboCampoDet');
        cboCampoDet.empty();

        if (listCampo == null) {
            cboCampo.append($("<option/>").attr("value", "").text("Seleccionar"));
            cboCampoDet.append($("<option/>").attr("value", "").text("Seleccionar"));
        } else {
            cboCampo.append($("<option/>").attr("value", "").text("Seleccionar"));
            $.each(listCampo, function (i, item) {
                cboCampo.append($("<option/>").attr("value", listCampo[i].codigo).text(listCampo[i].nombre));
            });

            cboCampoDet.append($("<option/>").attr("value", "").text("Seleccionar"));
            $.each(listCampo, function (i, item) {
                cboCampoDet.append($("<option/>").attr("value", listCampo[i].codigo).text(listCampo[i].nombre));
            });
        }
    }

    function loadComboTipoDato(lista) {
        var listTipoDato = lista;
        cboTipoDato = $('#cboTipoDato');
        cboTipoDato.empty();

        cboTipoDatoDet = $('#cboTipoDatoDet');
        cboTipoDatoDet.empty();

        if (listTipoDato == null) {
            cboTipoDato.append($("<option/>").attr("value", "").text("Seleccionar"));
            cboTipoDatoDet.append($("<option/>").attr("value", "").text("Seleccionar"));
        } else {
            cboTipoDato.append($("<option/>").attr("value", "").text("Seleccionar"));
            $.each(listTipoDato, function (i, item) {
                cboTipoDato.append($("<option/>").attr("value", listTipoDato[i].codigo).text(listTipoDato[i].nombre));
            });

            cboTipoDatoDet.append($("<option/>").attr("value", "").text("Seleccionar"));
            $.each(listTipoDato, function (i, item) {
                cboTipoDatoDet.append($("<option/>").attr("value", listTipoDato[i].codigo).text(listTipoDato[i].nombre));
            });
        }
    }

    function loadComboTipoImagen(lista) {
        var listTipoImagen = lista;
        cboTipoImagen = $('#cboTipoImagen');
        cboTipoImagen.empty();
        if (listTipoImagen == null) {
            cboTipoImagen.append($("<option/>").attr("value", "").text("Seleccionar"));
        } else {
            cboTipoImagen.append($("<option/>").attr("value", "").text("Seleccionar"));
            $.each(listTipoImagen, function (i, item) {
                cboTipoImagen.append($("<option/>").attr("value", listTipoImagen[i].codigo).text(listTipoImagen[i].nombre));
            });
        }
    }

    function mostrar_div() {
        $('#divTipoOCR').fadeIn(500);
    }

    function ocultar_div() {
        $('#divTipoOCR').slideToggle(800);
    }

    function cambiarEmpresa() {
        var cboEmpresa = $("#cboEmpresa");

        $.ajax({
            url: "./cambiarEmpresa",
            type: "POST",
            dataType: "json",
            data: {
                codigoEmpresa: cboEmpresa.val()
            }
        })
            .done(
                function (paramJson) {
                    if (paramJson.estadoRespuesta == 'OK') {
                        var lstProyecto = JSON.parse(paramJson.parametros.lstProyecto);
                        loadComboProyecto(lstProyecto);
                        //cambiarProyecto();
                    } else {
                        callNotification('error', paramJson.mensajeRespuesta, 'Error');
                    }
                })
            .fail(
                function (jqXHR, textStatus, errorThrown) {
                    alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
                });
    }

    function cambiarProyecto() {
        var cboEmpresa = $("#cboEmpresa");
        var cboProyecto = $("#cboProyecto");

        $.ajax({
            url: "./cambiarProyecto",
            type: "POST",
            dataType: "json",
            data: {
                codigoEmpresa: cboEmpresa.val(),
                codigoProyecto: cboProyecto.val()
            }
        })
            .done(
                function (paramJson) {
                    if (paramJson.estadoRespuesta == 'OK') {

                        var lstTipoDocumento = JSON.parse(paramJson.parametros.lstTipoDocumento);
                        loadComboTipoDocumento(lstTipoDocumento);
                        if (paramJson.parametros.tipoProy == 1) {
                            $("#txtRutaFirmados").attr('disabled', false);
                        } else {
                            $("#txtRutaFirmados").attr('disabled', true);
                        }

                    } else {
                        callNotification('error', paramJson.mensajeRespuesta, 'Error');
                    }
                })
            .fail(
                function (jqXHR, textStatus, errorThrown) {
                    alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
                });
    }

    function cambiarTipoDocumento() {
        var cboEmpresa = $("#cboEmpresa");
        var cboProyecto = $("#cboProyecto");
        var cboTipoDocumento = $("#cboTipoDocumento");

        $.ajax({
            url: "./cambiarTipoDocumento",
            type: "POST",
            dataType: "json",
            data: {
                codigoEmpresa: cboEmpresa.val(),
                codigoProyecto: cboProyecto.val(),
                codigoTipoDocumento: cboTipoDocumento.val()
            }
        })
            .done(
                function (paramJson) {
                    if (paramJson.estadoRespuesta == 'OK') {
                        var lstConfig = JSON.parse(paramJson.parametros.lstConfig);
                        loadConfig(lstConfig);

                        listaCabecera = JSON.parse(paramJson.parametros.lstCabecera);
                        loadTableCabecera(listaCabecera);

                        lstDetalle = JSON.parse(paramJson.parametros.lstDetalle);
                        loadTableDetalle(lstDetalle);

                        cargarPlantilla(paramJson.parametros.nombrePlantilla, paramJson.parametros.base64Plantilla);

                        accion = paramJson.parametros.accion;

                    } else {
                        callNotification('error', paramJson.mensajeRespuesta, 'Error');
                    }
                })
            .fail(
                function (jqXHR, textStatus, errorThrown) {
                    alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
                });
    }

    function cambiarTipoDato() {
        var tipoDato = $("#cboTipoDato option:selected").text();
//		if(tipoDato == "FECHA") {
//			$("#divFormatoFecha").show();
//			$("#divTamanoCampo").hide();
//			$("#txtTamanoCampo").val("10");
//		} else {
//			$("#cboFormatoFecha").val(0);
//			$("#divFormatoFecha").hide();
//			$("#divTamanoCampo").show();
//			$("#txtTamanoCampo").val("");
//		}
        $("#divFormatoFecha").show();
        $("#divTamanoCampo").show();

        if (tipoDato == "COMBOBOX") {
            $("#divFormatoFecha").hide();
            $("#divTamanoCampo").hide();
            $("#txtTamanoCampo").val("10");
        }

        if (tipoDato == "AUTOCOMPLETER") {
            $("#divFormatoFecha").hide();
            $("#divTamanoCampo").hide();
            $("#txtTamanoCampo").val("80");
        }
    }

    function loadConfig(lstConfig) {

        if (lstConfig != null && lstConfig.length > 0) {

            if (lstConfig[0].documentoUniforme == "1") {
                $('#chkUniforme').prop("checked", true);
            } else {
                $('#chkUniforme').prop("checked", false);
            }
            habilitarCabecera();

            if (lstConfig[0].detalleDocumento == "1") {
                $('#chkDetalle').prop("checked", true);
            } else {
                $('#chkDetalle').prop("checked", false);
            }

            $("#chkArrastre").prop("checked", (lstConfig[0].flagArrastre == "01"));

            habilitarDetalle();

            $("#txtRuta").val(lstConfig[0].rutaImagen);
            $("#txtRutaAgrupados").val(lstConfig[0].rutaImagenAgrupada);
            $("#txtRutaFirmados").val(lstConfig[0].rutaImagenFirmada);
            $("#txtPorcentaje").val(lstConfig[0].porcentajeCompresion);
            $("#txtMuestraAsis").val(lstConfig[0].numeroMuestraAsis);
            $("#txtMuestraFeda").val(lstConfig[0].numeroMuestraFeda);
            $("div.divTipoImagen select").val(lstConfig[0].codigoTipoImagen);
            $("#txtTamanoBD").val(lstConfig[0].tamanoMaximo);
            if (lstConfig[0].almacenBD == "1") {
                $('#chkBD').prop("checked", true);
            } else {
                $('#chkBD').prop("checked", false);
            }
            if (lstConfig[0].ajusteImagenVisor == null) {
                $("input[id='rdoAjuste1']").prop("checked", true);
            } else {
                $("input[name='rdoAjusteVisor']").val([lstConfig[0].ajusteImagenVisor]);
            }
            habilitarBD();

        }
    }

    function agregarCabecera() {
        var cboEmpresa = $("#cboEmpresa");
        var cboProyecto = $("#cboProyecto");
        var cboTipoDocumento = $("#cboTipoDocumento");
        var cboCampo = $("#cboCampo");
        var cboTipoDato = $("#cboTipoDato");
        var tamanoCampo = $("#txtTamanoCampo");
        var formatoEntrada = $("#txtFormatoCampo");
        var rdoTipoCaptura = $('input[name=rdoTipoCaptura]:checked', '#frm');
        var cboTipoOCR = $("#cboTipoOCR");

        if (validarCabecera()) {

            $.ajax({
                url: "./agregarCabecera",
                type: "POST",
                dataType: "json",
                data: {
                    codigoEmpresa: cboEmpresa.val(),
                    codigoProyecto: cboProyecto.val(),
                    codigoTipoDocumento: cboTipoDocumento.val(),
                    codigoCampo: cboCampo.val(),
                    codigoTipoDato: cboTipoDato.val(),
                    tamanoCampo: tamanoCampo.val(),
                    formatoEntrada: formatoEntrada.val(),
                    rdoTipoCaptura: rdoTipoCaptura.val(),
                    cboTipoOCR: cboTipoOCR.val()
                }
            })
                .done(
                    function (paramJson) {
                        if (paramJson.estadoRespuesta == 'OK') {

                            listaCabecera = JSON.parse(paramJson.parametros.lstCabecera);
                            loadTableCabecera(listaCabecera);
                            $("#btnQuitarTalla").attr('disabled', false);

                        } else {
                            callNotification('notice', paramJson.mensajeRespuesta, 'Alerta');
                        }
                    })
                .fail(
                    function (jqXHR, textStatus, errorThrown) {
                        alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
                    });

        }

    }

    function agregarItem() {
        var nombreItem = $("#txtNombreItem").val();
        var aliasItem = $("#txtAliasItem").val();

        if (nombreItem != "") {
            $.ajax({
                url: "./agregarItem",
                type: "POST",
                dataType: "json",
                data: {
                    nombreItem: nombreItem,
                    codigoCampo: $("#hidCodigoCampo").val(),
                    fromTo: $("#hidFromTo").val(),
                    aliasItem: aliasItem
                }
            }).done(
                function (paramJson) {
                    if (paramJson.estadoRespuesta == 'OK') {
                        if ($("#hidFromTo").val() == "C") {
                            listaCabecera = JSON.parse(paramJson.parametros.lstCabecera);
                            loadTableCabecera(listaCabecera);
                        } else {
                            lstDetalle = JSON.parse(paramJson.parametros.lstDetalle);
                            loadTableDetalle(lstDetalle);
                        }
                        $("#txtNombreItem").val("");
                        $("#txtAliasItem").val("");
                        loadModalCampoLista(JSON.parse(paramJson.parametros.lstItems), $("#hidCodigoCampo").val(), $("#hidFromTo").val());
                    } else {
                        callNotification('notice', paramJson.mensajeRespuesta, 'Alerta');
                    }
                }).fail(
                function (jqXHR, textStatus, errorThrown) {
                    alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
                });
        }
    }

    function quitarItem(nombreItem) {

        $.ajax({
            url: "./quitarItem",
            type: "POST",
            dataType: "json",
            data: {
                nombreItem: nombreItem,
                codigoCampo: $("#hidCodigoCampo").val(),
                fromTo: $("#hidFromTo").val()
            }
        }).done(
            function (paramJson) {
                if (paramJson.estadoRespuesta == 'OK') {

                    if ($("#hidFromTo").val() == "C") {
                        listaCabecera = JSON.parse(paramJson.parametros.lstCabecera);
                        loadTableCabecera(listaCabecera);
                    } else {
                        lstDetalle = JSON.parse(paramJson.parametros.lstDetalle);
                        loadTableDetalle(lstDetalle);
                    }

                    loadModalCampoLista(JSON.parse(paramJson.parametros.lstItems), $("#hidCodigoCampo").val(), $("#hidFromTo").val());
                } else {
                    callNotification('notice', paramJson.mensajeRespuesta, 'Alerta');
                }
            }).fail(
            function (jqXHR, textStatus, errorThrown) {
                alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
            });
    }

    function validarFiltroPrincipal() {
        var cboEmpresa = $("#cboEmpresa");
        var cboProyecto = $("#cboProyecto");
        var cboTipoDocumento = $("#cboTipoDocumento");

        if (cboEmpresa.val() == "") {
            callNotification('notice', "Debe seleccionar una Empresa. Por favor verifique", 'Alerta');
            return false;
        }

        if (cboProyecto.val() == "") {
            callNotification('notice', "Debe seleccionar un Proyecto. Por favor verifique", 'Alerta');
            return false;
        }

        if (cboTipoDocumento.val() == "") {
            callNotification('notice', "Debe seleccionar un Tipo de Documento. Por favor verifique", 'Alerta');
            return false;
        }

        return true;
    }

    function validarPlantilla() {
        var chkUniforme = $('#chkUniforme').is(':checked');

        if (chkUniforme == true) {
            var plantillaAdjunta = $("#hidePlantilla");
            if (plantillaAdjunta.val() == "") {
                callNotification('notice', "El fichero de la plantilla no ha sido cargado, por favor verifique", 'Alerta');
                return false;
            }
        }

        return true;
    }

    function validarFiltros(cboCampo, cboTipoDato, tamanoCampo, formatoEntrada, rdoTipoCaptura, cboTipoOCR) {
        if (cboCampo.val() == "") {
            callNotification('notice', "Debe seleccionar un Campo", 'Alerta');
            return false;
        }

        if (cboTipoDato.val() == "") {
            callNotification('notice', "Debe seleccionar un Tipo de Dato", 'Alerta');
            return false;
        }

        if (rdoTipoCaptura != "") {
            if (rdoTipoCaptura.val() != "2" && $('select[name=cboTipoDato] option:selected').text() != "COMBOBOX"
                && $('select[name=cboTipoDato] option:selected').text() != "AUTOCOMPLETER") {
                if (tamanoCampo.val() == "") {
                    callNotification('notice', "Debe ingresar un Tama&ntilde;o de Campo", 'Alerta');
                    return false;
                }

                if (tamanoCampo.val() <= 0) {
                    callNotification('notice', "El Tama&ntilde;o del Campo debe ser mayor a 0", 'Alerta');
                    return false;
                }

                if (formatoEntrada.val().length > parseInt(tamanoCampo.val())) {
                    callNotification('notice', "El Tama&ntilde;o del Campo no debe ser menor a la longitud de caracteres de la M&aacute;scara del Campo", 'Alerta');
                    return false;
                }
            }

            if (rdoTipoCaptura.val() == "1") {
                if (cboTipoOCR.val() == "00") {
                    callNotification('notice', "Debe seleccionar un Tipo OCR", 'Alerta');
                    return false;
                }
            }
        }

        return true;
    }

    function validarCabecera() {

        var cboCampo = $("#cboCampo");
        var cboTipoDato = $("#cboTipoDato");
        var tamanoCampo = $("#txtTamanoCampo");
        var formatoEntrada = $("#txtFormatoCampo");
        var rdoTipoCaptura = $('input[name=rdoTipoCaptura]:checked', '#frm');
        var cboTipoOCR = $("#cboTipoOCR");

        if (validarFiltroPrincipal()) {
            if (validarFiltros(cboCampo, cboTipoDato, tamanoCampo, formatoEntrada, rdoTipoCaptura, cboTipoOCR)) {
                return true;
            }
        }
        return false;
    }

    function quitarCabecera() {
        var radioSeleCabe = $('input[name="fila"]:checked');
        if (radioSeleCabe.val() != null) {
            var dataSeleCabe = JSON.parse(decodeURIComponent(radioSeleCabe.val()));
            $.ajax({
                url: "./quitarCabecera",
                type: "POST",
                dataType: "json",
                data: {
                    codigoCampo: dataSeleCabe.campo.codigo,
                    codigoTipoDato: dataSeleCabe.tipoDato.codigo
                }
            })
                .done(
                    function (paramJson) {
                        if (paramJson.estadoRespuesta == 'OK') {

                            var lstCabecera = JSON.parse(paramJson.parametros.lstCabecera);
                            loadTableCabecera(lstCabecera);

                        } else {
                            callNotification('error', paramJson.mensajeRespuesta, 'Error');
                        }
                    })
                .fail(
                    function (jqXHR, textStatus, errorThrown) {
                        alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
                    });
        } else {
            callNotification('notice', "Debe seleccionar un registro de la grilla, por favor verifique", 'Informaci&oacute;n');
        }
    }

    function agregarDetalle() {
        var cboEmpresa = $("#cboEmpresa");
        var cboProyecto = $("#cboProyecto");
        var cboTipoDocumento = $("#cboTipoDocumento");
        var cboCampo = $("#cboCampoDet");
        var cboTipoDato = $("#cboTipoDatoDet");
        var tamanoCampo = $("#txtTamanoCampoDet");
        var formatoEntrada = $("#txtFormatoDet");

        if (validarDetalle()) {

            $.ajax({
                url: "./agregarDetalle",
                type: "POST",
                dataType: "json",
                data: {
                    codigoEmpresa: cboEmpresa.val(),
                    codigoProyecto: cboProyecto.val(),
                    codigoTipoDocumento: cboTipoDocumento.val(),
                    codigoCampo: cboCampo.val(),
                    codigoTipoDato: cboTipoDato.val(),
                    tamanoCampo: tamanoCampo.val(),
                    formatoEntrada: formatoEntrada.val()
                }
            })
                .done(
                    function (paramJson) {
                        if (paramJson.estadoRespuesta == 'OK') {

                            lstDetalle = JSON.parse(paramJson.parametros.lstDetalle);
                            loadTableDetalle(lstDetalle);

                        } else {
                            callNotification('error', paramJson.mensajeRespuesta, 'Error');
                        }
                    })
                .fail(
                    function (jqXHR, textStatus, errorThrown) {
                        alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
                    });

        }

    }

    function validarDetalle() {

        var cboCampo = $("#cboCampoDet");
        var cboTipoDato = $("#cboTipoDatoDet");
        var tamanoCampo = $("#txtTamanoCampoDet");
        var formatoEntrada = $("#txtFormatoDet");

        if (validarFiltroPrincipal()) {
            if (validarFiltros(cboCampo, cboTipoDato, tamanoCampo, formatoEntrada, "", "")) {
                return true;
            }
        }
        return false;
    }

    function quitarDetalle() {
        var radioSelDeta = $('input[name="filaDet"]:checked');
        if (radioSelDeta.val() != null) {
            var dataSeleDeta = JSON.parse(decodeURIComponent(radioSelDeta.val()));
            $.ajax({
                url: "./quitarDetalle",
                type: "POST",
                dataType: "json",
                data: {
                    codigoCampo: dataSeleDeta.campo.codigo,
                    codigoTipoDato: dataSeleDeta.tipoDato.codigo
                }
            })
                .done(
                    function (paramJson) {
                        if (paramJson.estadoRespuesta == 'OK') {

                            lstDetalle = JSON.parse(paramJson.parametros.lstDetalle);
                            loadTableDetalle(lstDetalle);

                        } else {
                            callNotification('error', paramJson.mensajeRespuesta, 'Error');
                        }
                    })
                .fail(
                    function (jqXHR, textStatus, errorThrown) {
                        alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
                    });
        } else {
            callNotification('notice', "Debe seleccionar un registro de la grilla, por favor verifique", 'Informaci&oacute;n');
        }
    }

    function cambiarMatchExcel(codigoCampo) {

        $.ajax({
            url: "./cambiarMatchExcel",
            type: "POST",
            dataType: "json",
            data: {
                codigoCampo: codigoCampo,
                codigoMatchExcel: $('#chkMatchCampo' + codigoCampo).is(':checked') ? true : false
            }
        })
            .done(
                function (paramJson) {
                    if (paramJson.estadoRespuesta != 'OK') {
                        callNotification('notice', paramJson.mensajeRespuesta, 'Alerta');
                    }
                })
            .fail(
                function (jqXHR, textStatus, errorThrown) {
                    alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
                });
    }

    function cambiarArrCab(codigoCampo) {

        $.ajax({
            url: "./cambiarArrCab",
            type: "POST",
            dataType: "json",
            data: {
                codigoCampo: codigoCampo,
                arrastre: $('#chkArrCampo' + codigoCampo).is(':checked') ? true : false
            }
        })
            .done(
                function (paramJson) {
                    if (paramJson.estadoRespuesta != 'OK') {
                        callNotification('notice', paramJson.mensajeRespuesta, 'Alerta');
                    }
                })
            .fail(
                function (jqXHR, textStatus, errorThrown) {
                    alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
                });
    }

    function limpiarArrCabs() {

        $.ajax({
            url: "./limpiarArrCabs",
            type: "POST",
            dataType: "json",
            data: {}
        })
            .done(
                function (paramJson) {
                    if (paramJson.estadoRespuesta != 'OK') {
                        callNotification('notice', paramJson.mensajeRespuesta, 'Alerta');
                    } else {
                        var listaCabecera = JSON.parse(paramJson.parametros.lstCabeceraTemp);
                        loadTableCabecera(listaCabecera);
                    }
                })
            .fail(
                function (jqXHR, textStatus, errorThrown) {
                    alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
                });
    }

    function loadTableCabecera(lista) {
        $('#tblTalla').dataTable().fnClearTable();
        var tblTalla = $('#tblTalla').DataTable();
        $.each(lista, function (i, obj) {
            var jsonEncode = encodeURIComponent(JSON.stringify(obj));
            tblTalla.row.add([
                '<input type="radio" id="fila" name="fila" value="' + jsonEncode + '">',
                obj.campo.nombre,
                obj.tipoDato.nombre,
                obj.tamanoCampo,
                obj.tipoCaptura == "0" ? "DIGITADO" : (obj.tipoCaptura == "1" ? "OCR" : "CLIENTE"),
                obj.zonaVisual == null ? "" : obj.zonaVisual,
                obj.listaParamCamp != null || obj.tipoDato.nombre == "COMBOBOX" || obj.tipoDato.nombre == "AUTOCOMPLETER" ? "<a class='btn btn-sm btn-primary' id='btnNuevoTipoDato' onclick='loadModalCampoLista(" + JSON.stringify(obj.listaParamCamp) + "," + obj.campo.codigo + "," + "\"C\"" + ")'><i class='fa fa-eye'></i></a>" : "",
                $('#chkArrastre').is(':checked') || obj.tipoCaptura == "2" ? "" : "<input type='checkbox' id='chkArrCampo" + obj.campo.codigo + "' onclick='cambiarArrCab(\"" + obj.campo.codigo + "\")'" + (obj.arrastre == true ? "checked" : "") + "/>",
                obj.tipoCaptura != "2" && obj.listaParamCamp == null ? "<input type='checkbox' id='chkMatchCampo" + obj.campo.codigo + "' onclick='cambiarMatchExcel(\"" + obj.campo.codigo + "\")'" + (obj.matchExcel == true ? "checked" : "") + "/>" : ""
            ]).draw(false);
        });
    }

    function loadModalCampoLista(lista, codigoCampo, fromTo) {
        $("#hidCodigoCampo").val(codigoCampo);
        $("#hidFromTo").val(fromTo);
        $('#tblParamItem').dataTable().fnClearTable();
        var tblItemsCamp = $('#tblParamItem').DataTable();

        if (lista != null) {
            $.each(lista, function (i, obj) {
                tblItemsCamp.row.add([
                    obj.valor,
                    obj.desCompleta == null ? "" : obj.desCompleta,
                    "<a class='btn btn-sm btn-primary' id='btnEliminarItem' onclick='quitarItem(\"" + obj.valor + "\")'><i class='fa fa-trash-o'></i></a>",
                ]).draw(false);
            });
        }
        $("#modalItems").modal('show');
    }

    function loadTableDetalle(lista) {
        $('#tblDetalle').dataTable().fnClearTable();
        var tblDetalle = $('#tblDetalle').DataTable();
        $.each(lista, function (i, obj) {
            var jsonEncode = encodeURIComponent(JSON.stringify(obj));
            tblDetalle.row.add([
                '<input type="radio" id="filaDet" name="filaDet" value="' + jsonEncode + '">',
                obj.campo.nombre,
                obj.tipoDato.nombre,
                obj.tamanoCampo,
                obj.listaParamCamp != null || obj.tipoDato.nombre == "COMBOBOX" || obj.tipoDato.nombre == "AUTOCOMPLETER" ? "<a class='btn btn-sm btn-primary' id='btnNuevoTipoDato' onclick='loadModalCampoLista(" + JSON.stringify(obj.listaParamCamp) + "," + obj.campo.codigo + "," + "\"C\"" + ")'><i class='fa fa-eye'></i></a>" : "",
            ]).draw(false);
        });
    }

    function seleccionarZona() {

        var plantillaAdjunta = $("#hidePlantilla");
        if (plantillaAdjunta.val() == "") {
            callNotification('notice', "Debe seleccionar el Fichero de la plantilla, para poder seleccionar la zona de visualizaci&oacute;n de los campos, por favor verifique", 'Alerta');
            return;
        }

        if (listaCabecera == null || listaCabecera.length == 0) {
            callNotification('notice', "No existen campos en la grilla de cabecera para seleccionar las zonas, por favor verifique", 'Alerta');
            return;
        }
        var chkUniforme = $('#chkUniforme').is(':checked');
        var chkDetalle = $('#chkDetalle').is(':checked');
        var chkBD = $('#chkBD').is(':checked');
        var chkArrastre = $('#chkArrastre').is(':checked');
        $("#txtChkUniforme").val(chkUniforme);
        $("#txtChkDetalle").val(chkDetalle);
        $("#txtChkBD").val(chkBD);
        $("#txtChkArrastre").val(chkArrastre);

        document.frm.action = "./cargarVentanaVisor";
        document.frm.method.value = "POST";
        document.frm.submit();
    }


    //Inicio Modal Nuevo Campo
    function nuevoCampo() {
        $("#modalCampo").modal('show');
        document.getElementById("txtCodigoCampo").disabled = true;
        document.getElementById("txtCodigoCampo").value = "";
    }

    function cerrarModalCampo() {
        $("#modalCampo").modal('hide');
        $("#modalCampoDet").modal('hide');
    }

    function guardarCampo() {
        var codEmp = document.getElementById("txtCodigoCampo");
        var nomEmp = document.getElementById("txtNombreCampo");
        $.ajax({
            url: "/gsdimage-web/parametro/guardarCampo",
            type: "POST",
            dataType: "json",
            data: {
                codigo: codEmp.value,
                nombre: nomEmp.value,
                ipUser: ipUser
            }
        })
            .done(
                function (paramJson) {
                    if (paramJson.estadoRespuesta == 'OK') {
                        var lstCampo = JSON.parse(paramJson.parametros.lstCampo);
                        loadComboCampo(lstCampo);
                        $("div.divCampo select").val(codEmp.value);
                        $("#modalCampo").modal('hide');
                    } else {
                        callNotification('error', paramJson.mensajeRespuesta, 'Error');
                    }
                }).fail(
            function (jqXHR, textStatus, errorThrown) {
                alert("error" + errorThrown + ", " + jqXHR
                    + "," + textStatus);
            });
    }

    //Fin Modal Nuevo Campo

    //Inicio Modal Nuevo Campo Detalle
    function nuevoCampoDet() {
        $.ajax({
            url: "/gsdimage-web/parametro/nuevoCampo",
            type: "POST",
            dataType: "json",
            data: {}
        })
            .done(
                function (paramJson) {
                    if (paramJson.estadoRespuesta == 'OK') {
                        $("#modalCampoDet").modal('show');
                        document.getElementById("txtCodigoCampoDet").disabled = true;
                        var secuencial = paramJson.parametros.seq;
                        document.getElementById("txtCodigoCampoDet").value = secuencial;
                    } else {
                        $("#modalCampoDet").modal('hide');
                        callNotification('error', paramJson.mensajeRespuesta, 'Error');
                    }
                })
            .fail(
                function (jqXHR, textStatus, errorThrown) {
                    alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
                });

    }

    function guardarCampoDet() {
        var codEmp = document.getElementById("txtCodigoCampoDet");
        var nomEmp = document.getElementById("txtNombreCampoDet");
        $.ajax({
            url: "/gsdimage-web/parametro/guardarCampo",
            type: "POST",
            dataType: "json",
            data: {
                codigo: codEmp.value,
                nombre: nomEmp.value,
                ipUser: ipUser
            }
        })
            .done(
                function (paramJson) {
                    if (paramJson.estadoRespuesta == 'OK') {
                        var lstCampo = JSON.parse(paramJson.parametros.lstCampo);
                        loadComboCampo(lstCampo);
                        $("div.divCampoDet select").val(codEmp.value);
                        $("#modalCampoDet").modal('hide');
                    } else {
                        callNotification('error', paramJson.mensajeRespuesta, 'Error');
                    }
                }).fail(
            function (jqXHR, textStatus, errorThrown) {
                alert("error" + errorThrown + ", " + jqXHR
                    + "," + textStatus);
            });
    }

    //Fin Modal Nuevo Campo

    //Inicio Modal Nuevo Tipo Dato
    function nuevoTipoDato() {
        $.ajax({
            url: "/gsdimage-web/parametro/nuevoTipoDato",
            type: "POST",
            dataType: "json",
            data: {}
        })
            .done(
                function (paramJson) {
                    if (paramJson.estadoRespuesta == 'OK') {
                        $("#modalTipoDato").modal('show');
                        document.getElementById("txtCodigoTipoDato").disabled = true;
                        var secuencial = paramJson.parametros.seq;
                        document.getElementById("txtCodigoTipoDato").value = secuencial;
                    } else {
                        $("#modalTipoDato").modal('hide');
                        callNotification('error', paramJson.mensajeRespuesta, 'Error');
                    }
                })
            .fail(
                function (jqXHR, textStatus, errorThrown) {
                    alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
                });

    }

    function cerrarModalTipoDato() {
        $("#modalTipoDato").modal('hide');
        $("#modalTipoDatoDet").modal('hide');
    }

    function guardarTipoDato() {
        var codigo = document.getElementById("txtCodigoTipoDato");
        var nombre = document.getElementById("txtNombreTipoDato");
        $.ajax({
            url: "/gsdimage-web/parametro/guardarTipoDato",
            type: "POST",
            dataType: "json",
            data: {
                codigo: codigo.value,
                nombre: nombre.value,
                ipUser: ipUser
            }
        })
            .done(
                function (paramJson) {
                    if (paramJson.estadoRespuesta == 'OK') {
                        var lstTipoDato = JSON.parse(paramJson.parametros.lstTipoDato);
                        loadComboTipoDato(lstTipoDato);
                        $("div.divTipoDato select").val(codigo.value);
                        $("#modalTipoDato").modal('hide');
                    } else {
                        callNotification('error', paramJson.mensajeRespuesta, 'Error');
                    }
                }).fail(
            function (jqXHR, textStatus, errorThrown) {
                alert("error" + errorThrown + ", " + jqXHR
                    + "," + textStatus);
            });
    }

    //Fin Modal Nuevo Tipo Dato

    //Inicio Modal Nuevo Tipo Dato Detalle
    function nuevoTipoDatoDet() {
        $.ajax({
            url: "/gsdimage-web/parametro/nuevoTipoDato",
            type: "POST",
            dataType: "json",
            data: {}
        })
            .done(
                function (paramJson) {
                    if (paramJson.estadoRespuesta == 'OK') {
                        $("#modalTipoDatoDet").modal('show');
                        document.getElementById("txtCodigoTipoDatoDet").disabled = true;
                        var secuencial = paramJson.parametros.seq;
                        document.getElementById("txtCodigoTipoDatoDet").value = secuencial;
                    } else {
                        $("#modalTipoDatoDet").modal('hide');
                        callNotification('error', paramJson.mensajeRespuesta, 'Error');
                    }
                })
            .fail(
                function (jqXHR, textStatus, errorThrown) {
                    alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
                });

    }

    function guardarTipoDatoDet() {
        var codigo = document.getElementById("txtCodigoTipoDatoDet");
        var nombre = document.getElementById("txtNombreTipoDatoDet");
        $.ajax({
            url: "/gsdimage-web/parametro/guardarTipoDato",
            type: "POST",
            dataType: "json",
            data: {
                codigo: codigo.value,
                nombre: nombre.value,
                ipUser: ipUser
            }
        })
            .done(
                function (paramJson) {
                    if (paramJson.estadoRespuesta == 'OK') {
                        var lstTipoDato = JSON.parse(paramJson.parametros.lstTipoDato);
                        loadComboTipoDato(lstTipoDato);
                        $("div.divTipoDatoDet select").val(codigo.value);
                        $("#modalTipoDatoDet").modal('hide');
                    } else {
                        callNotification('error', paramJson.mensajeRespuesta, 'Error');
                    }
                }).fail(
            function (jqXHR, textStatus, errorThrown) {
                alert("error" + errorThrown + ", " + jqXHR
                    + "," + textStatus);
            });
    }

    //Fin Modal Nuevo Tipo Dato Detalle


    //Inicio Modal Nuevo Tipo Imagen
    function nuevoTipoImagen() {
        $.ajax({
            url: "/gsdimage-web/parametro/nuevoTipoImagen",
            type: "POST",
            dataType: "json",
            data: {}
        })
            .done(
                function (paramJson) {
                    if (paramJson.estadoRespuesta == 'OK') {
                        $("#modalTipoImagen").modal('show');
                        document.getElementById("txtCodigoTipoImagen").disabled = true;
                        var secuencial = paramJson.parametros.seq;
                        document.getElementById("txtCodigoTipoImagen").value = secuencial;
                    } else {
                        $("#modalTipoImagen").modal('hide');
                        callNotification('error', paramJson.mensajeRespuesta, 'Error');
                    }
                })
            .fail(
                function (jqXHR, textStatus, errorThrown) {
                    alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
                });

    }

    function cerrarModalTipoImagen() {
        $("#modalTipoImagen").modal('hide');
    }

    function guardarTipoImagen() {
        var codigo = document.getElementById("txtCodigoTipoImagen");
        var nombre = document.getElementById("txtNombreTipoImagen");
        $.ajax({
            url: "/gsdimage-web/parametro/guardarTipoImagen",
            type: "POST",
            dataType: "json",
            data: {
                codigo: codigo.value,
                nombre: nombre.value,
                ipUser: ipUser
            }
        })
            .done(
                function (paramJson) {
                    if (paramJson.estadoRespuesta == 'OK') {
                        var lstTipoImagen = JSON.parse(paramJson.parametros.lstTipoImagen);
                        loadComboTipoImagen(lstTipoImagen);
                        $("div.divTipoImagen select").val(codigo.value);
                        $("#modalTipoImagen").modal('hide');
                    } else {
                        callNotification('error', paramJson.mensajeRespuesta, 'Error');
                    }
                }).fail(
            function (jqXHR, textStatus, errorThrown) {
                alert("error" + errorThrown + ", " + jqXHR
                    + "," + textStatus);
            });
    }

    //Fin Modal Nuevo Tipo Imagen

    function habilitarCabecera() {
        var chkUniforme = $('#chkUniforme').is(':checked');
        if (chkUniforme == false) {
            $("#txtPlantilla").prop('disabled', true);
            $("#btnSelecZona").attr('disabled', true);

            $('#txtPlantilla').val("");
            $('#nombrePlantilla').val("");
            $('#divPlantilla').hide();
            $('#divPlantillaUpload').show();

            if (listaCabecera != null) {
                var i;
                for (i = 0; i < listaCabecera.length; i++) {
                    listaCabecera[i].zonaVisual = "";
                }
                loadTableCabecera(listaCabecera);
            }
        } else {
            $("#txtPlantilla").prop('disabled', false);
            $("#btnSelecZona").attr('disabled', false);
        }
    }

    function habilitarDetalle() {
        var chkDetalle = $('#chkDetalle').is(':checked');
        if (chkDetalle == false) {

            if (lstDetalle != null && lstDetalle.length > 0) {
                $("#modalEliminarDetalle").modal('show');
            }

        } else {
            $("#divPestDos *").prop('disabled', false);
            $("#divDetalle *").prop('disabled', false);
            $("#divTablaDetalle *").prop('disabled', false);
            $("#btnNuevoCampoDet").attr('disabled', false);
            $("#btnNuevoTipoDatoDet").attr('disabled', false);
            $("#btnAgregarDetalle").attr('disabled', false);
            $("#btnQuitarDetalle").attr('disabled', false);
        }
    }

    function eliminarDetalle() {
        $.ajax({
            url: "./eliminarDetalle",
            type: "POST",
            dataType: "json",
            data: {}
        })
            .done(
                function (paramJson) {
                    if (paramJson.estadoRespuesta == 'OK') {

                        lstDetalle = JSON.parse(paramJson.parametros.lstDetalle);
                        loadTableDetalle(lstDetalle);

                        $("#divPestDos *").prop('disabled', true);
                        $("#divDetalle *").prop('disabled', true);
                        $("#divTablaDetalle *").prop('disabled', true);
                        $("#btnNuevoCampoDet").attr('disabled', true);
                        $("#btnNuevoTipoDatoDet").attr('disabled', true);
                        $("#btnAgregarDetalle").attr('disabled', true);
                        $("#btnQuitarDetalle").attr('disabled', true);

                        $("#modalEliminarDetalle").modal('hide');

                    } else {
                        callNotification('notice', paramJson.mensajeRespuesta, 'Alerta');
                    }
                })
            .fail(
                function (jqXHR, textStatus, errorThrown) {
                    alert("error" + errorThrown + ", " + jqXHR + "," + textStatus);
                });

    }

    function cerrarModalDelDetalle() {
        $("#modalEliminarDetalle").modal('hide');
        $('#chkDetalle').prop("checked", true);
    }

    function habilitarBD() {
        var chkBD = $('#chkBD').is(':checked');
        if (chkBD == true) {
            $("#txtTamanoBD").attr('disabled', false);
        } else {
            $("#txtTamanoBD").attr('disabled', true);
        }
    }

    function validarTamano() {
        var tamano = $('#txtTamanoBD');
        if (tamano.val() > 4000000) {
            callNotification('notice', "El Tama&ntilde;o m&aacute;ximo por P&aacute;ginas a guardar en la BD no puede ser mayor a 4096 KB, por favor verifique", 'Alerta');
        }
    }

    function preguntar() {

        if (validarFiltroPrincipal() && validarPlantilla()) {
            var rutaImagen = $('#txtRuta');
            if (rutaImagen.val() == "") {
                callNotification('notice', "Debe ingresar una Ruta para las Im&aacute;genes escaneadas que ser&aacute;n capturadas por el sistema, por favor verifique", 'Alerta');
                return;
            } else {
                var cboTipoImagen = $('#cboTipoImagen');
                if (cboTipoImagen.val() == "") {
                    callNotification('notice', "Debe seleccionar el Tipo de Imagen para los archivos escaneados, por favor verifique", 'Alerta');
                    return;
                } else {
                    var chkBD = $('#chkBD').is(':checked');
                    var txtTamanoBD = $('#txtTamanoBD').val();

                    if (chkBD == true) {
                        if (txtTamanoBD == "") {
                            callNotification('notice', "Debe ingresar el tama&ntilde; m&aacute;ximo de paginaci&oacute;n, por favor verifique", 'Alerta');
                            return;
                        } else {
                            if (txtTamanoBD > 4000000) {
                                callNotification('notice', "El Tama&ntilde;o m&aacute;ximo por P&aacute;ginas a guardar en la BD no puede ser mayor a 4,000 Bytes, por favor verifique", 'Alerta');
                                return;
                            }
                        }
                    }

                    if (listaCabecera.length == 0) {
                        $("#modalCabecera").modal('show');
                        return;
                    } else {
                        var chkUniforme = $('#chkUniforme').is(':checked');
                        if (chkUniforme == true) {
                            var rutaFichero = $("#fileFichero");
                            if (rutaFichero.val() == "") {
                                $("#modalChkUniforme").modal('show');
                                return;
                            }
                        } else {
                            var chkBD = $('#chkBD').is(':checked');
                            if (chkBD == true) {
                                var tamano = $('#txtTamanoBD');
                                if (tamano.val() == "") {
                                    $("#modalChkBD").modal('show');
                                    return;
                                }
                            }
                        }
                    }
                }
            }
            guardar();
        }
    }

    function cerrarModal() {
        $("#modalCabecera").modal('hide');
        $("#modalChkUniforme").modal('hide');
        $("#modalChkBD").modal('hide');
        $("#modalConfirmacion").modal('hide');
    }

    function guardar() {
        $("#modalConfirmacion").modal('show');
    }

    function guardarConfiguracion() {
        if (accion == "modificar") {
            $("#modalConfirmacionModificar").modal('show');
        } else if (accion == "guardar") {
            var cboEmpresa = $("#cboEmpresa");
            var cboProyecto = $("#cboProyecto");
            var cboTipoDocumento = $("#cboTipoDocumento");
            var chkUniforme = $('#chkUniforme').is(':checked');
            var rutaFichero = $("#fileFichero");
            var chkDetalle = $('#chkDetalle').is(':checked');
            var txtRuta = $("#txtRuta");
            var txtRutaAgrupados = $("#txtRutaAgrupados");
            var txtRutaFirmados = $("#txtRutaFirmados");
            var txtPorcentaje = $("#txtPorcentaje");
            var cboTipoImagen = $("#cboTipoImagen");
            var chkBD = $('#chkBD').is(':checked');
            var txtTamanoBD = $("#txtTamanoBD");
            var hidePlantilla = $("#hidePlantilla");
            var nombrePlantilla = $("#nombrePlantilla");
            var chkArrastre = $('#chkArrastre').is(':checked');
            var txtMuestraAsis = $("#txtMuestraAsis");
            var txtMuestraFeda = $("#txtMuestraFeda");
            var ajusteVisor = $("input[name='rdoAjusteVisor']:checked").val();

            $.ajax({
                url: "./guardarConfiguracion",
                type: "POST",
                dataType: "json",
                data: {
                    cboEmpresa: cboEmpresa.val(),
                    cboProyecto: cboProyecto.val(),
                    cboTipoDocumento: cboTipoDocumento.val(),
                    txtChkUniforme: chkUniforme,
                    txtRutaFichero: rutaFichero.val(),
                    txtChkDetalle: chkDetalle,
                    txtRuta: txtRuta.val(),
                    cboTipoImagen: cboTipoImagen.val(),
                    txtChkBD: chkBD,
                    txtTamanoBD: txtTamanoBD.val(),
                    chkArrastre: chkArrastre,
                    hidePlantilla: hidePlantilla.val(),
                    nombrePlantilla: nombrePlantilla.val(),
                    txtRutaAgrupados: txtRutaAgrupados.val(),
                    txtRutaFirmados: txtRutaFirmados.val(),
                    txtPorcentaje: txtPorcentaje.val(),
                    txtMuestraAsis: txtMuestraAsis.val(),
                    txtMuestraFeda: txtMuestraFeda.val(),
                    ajusteVisor: ajusteVisor,
                    ipUser: ipUser
                }
            })
                .done(
                    function (paramJson) {
                        if (paramJson.estadoRespuesta == 'OK') {
                            callNotification('success', "Se ha guardado satisfactoriamente la configuraci&oacute;n del documento", 'Correcto');
                            $("#modalConfirmacion").modal('hide');
                            cerrarModal();
// 							$('#frm')[0].reset();
                            window.location.href = './cargarVentanaConfDocumento';
                        } else {
                            callNotification('error', paramJson.mensajeRespuesta, 'Error');
                        }
                    }).fail(
                function (jqXHR, textStatus, errorThrown) {
                    alert("error" + errorThrown + ", " + jqXHR
                        + "," + textStatus);
                });
        }

    }

    function modificar() {
        $("#modalConfirmacionModificar").modal('hide');
        accion = "guardar";
        guardarConfiguracion();
    }

    function obtenerEncodedDeImagen(src) {
        if (src != "") {
            src = src.substring(src.indexOf(",") + 1, src.lenght);
        }
        return src
    }


</script>

</body>
</html>