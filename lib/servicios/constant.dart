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
  //peticion para resguardos
  static String rutaResguardos = "/rmapp/bienes/GET_RESGUARDOS.php";
  //peticion para cambiar estados
  static String rutaUpdateAnotation = "/rmapp/bienes/UPDATE_ANOTATION.php";
  //peticion crear reporte general
  static String rutaReporteGeneral =
      "https://bewwednethost.000webhostapp.com/rmapp/bienes/reporte_general.php";
  //peticion crear reporte simple
  static String rutaReporteSimple =
      "https://bewwednethost.000webhostapp.com/rmapp/bienes/reporte_simple.php";
}

//para pruebas locales
class APIconstant {
  //IP del pc
  static String base_URL = "http://192.168.1.168";
  //peticion login
  static String rutaLogin = "/bienes/login.php";
  //peticion get bienes materiales
  static String rutagetbienes = "/bienes/GET_ALL.php";
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
