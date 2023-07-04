import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

/*
Agregar las rutas de las peticiones que se van a realizar al servidor
 */
class APIconstant {
  //IP o url del servidor
  static String base_URL = "https://bewwednethost.000webhostapp.com";
  //peticion login
  static String rutaLogin = "/rmapp/bienes/login.php";
  //peticion get bienes materiales
  static String rutagetbienes = "/rmapp/bienes/GET_ALL.php";
  //peticion reporte de bienes
  static String rutareportebienes = "/rmapp/bienes/GET_ALL.php";
  //peticion busqueda de bienes
  static String rutaSearch = "/tesvb/GET_NICK.php?nick=";
  //peticion para facturas
  static String rutaFacturas = "/tesvb/factura_bienes.php";
  //peticion para asociados
  static String rutaAsociados = "/tesvb/asociados.php";
  //peticion para resguardos
  static String rutaResguardos = "/rmapp/bienes/GET_RESGUARDOS.php";
  //peticion para cambiar estados
  static String rutaCambiarEstado = "/rmapp/bienes/UPDATE_ESTADO.php";
}
