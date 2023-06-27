/*
Agregar las rutas de las peticiones que se van a realizar al servidor
 */
class APIconstant {
  //IP o url del servidor
  static String base_URL = "http://192.168.1.103";
  //peticion login
  static String rutaLogin = "/tesvb/login.php";
  //peticion get bienes materiales
  static String rutagetbienes = "/tesvb/GET_ALL.php";
  //peticion reporte de bienes
  static String rutareportebienes = "/tesvb/GET_ALL.php";
  //peticion busqueda de bienes
  static String rutaSearch = "/tesvb/GET_NICK.php?nick=";
  //peticion para facturas
  static String rutaFacturas = "/tesvb/factura_bienes.php";
  //peticion para asociados
  static String rutaAsociados = "/tesvb/asociados.php";
  //peticion para resguardos
  static String rutaResguardos = "/tesvb/GET_RESGUARDOS.php";
  //peticion para cambiar estados
  static String rutaCambiarEstado = "/tesvb/UPDATE_ESTADO.php";
}
