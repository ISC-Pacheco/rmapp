/*
Agregar las rutas de las peticiones que se van a realizar al servidor
 */
class APIconstantServer {
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
  //peticion para cambiar estados
  static String rutaUpdateAnotation = "/rmapp/bienes/UPDATE_ANOTATION.php";
  //peticion crear reporte general
  static String rutaReporteGeneral = "/rmapp/bienes/reportes.php";
}

//para pruebas locales
class APIconstant {
  //IP del pc
  static String base_URL = "http://192.168.244.134";
  //peticion login
  static String rutaLogin = "/bienes/login.php";
  //peticion get bienes materiales
  static String rutagetbienes = "/bienes/GET_ALL.php";
  //peticion reporte de bienes
  static String rutareportebienes = "/bienes/GET_ALL.php";
  //peticion busqueda de bienes
  static String rutaSearch = "/GET_NICK.php?nick=";
  //peticion para facturas
  static String rutaFacturas = "/bienes/factura_bienes.php";
  //peticion para asociados
  static String rutaAsociados = "/bienes/asociados.php";
  //peticion para resguardos
  static String rutaResguardos = "/bienes/GET_RESGUARDOS.php";
  //peticion para cambiar estados
  static String rutaUpdateAnotation = "/bienes/UPDATE_ANOTATION.php";
  //peticion crear reporte general
  static String rutaReporteGeneral =
      "https://bewwednethost.000webhostapp.com/rmapp/bienes/reporte_general.php";
  //peticion crear reporte simple
  static String rutaReporteSimple =
      "https://bewwednethost.000webhostapp.com/rmapp/bienes/reporte_simple.php";
}
