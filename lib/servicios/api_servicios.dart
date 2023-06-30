import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rmapp/models/index.dart';
import 'constant.dart';

class ApiServiciosBienes {
  static var url = Uri.parse(APIconstant.base_URL + APIconstant.rutagetbienes);
  static Future<Bienes> getBienes() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        return parseBienes(response.body);
      } else {
        return Bienes();
      }
    } catch (e) {
      print("Error ${e.toString()}");
      return Bienes();
    }
  }

  static Bienes parseBienes(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Bien> bienes =
        parsed.map<Bien>((json) => Bien.fromJson(json)).toList();
    Bienes b = Bienes();
    b.bienes = bienes;
    return b;
  }
}

class ApiServiciosLogin {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<List<Resguardo>?> login() async {
    try {
      var url = Uri.parse(APIconstant.base_URL + APIconstant.rutaLogin);
      var response = await http.post(url, body: {
        "username": usernameController.text,
        "password": passwordController.text
      });
      var data = jsonDecode(response.body);
    } catch (e) {
      log(e.toString());
    }
  }
}

class ApiServiciosEstados {
  TextEditingController num_inventarioController = TextEditingController();
  TextEditingController id_estadoController = TextEditingController();
  Future<List<Resguardo>?> Estado() async {
    try {
      var url = Uri.parse(APIconstant.base_URL + APIconstant.rutaLogin);
      var response = await http.post(url, body: {
        "num_inventario": num_inventarioController.text,
        "id_estado": id_estadoController.text
      });
      var data = jsonDecode(response.body);
    } catch (e) {
      log(e.toString());
    }
  }
}

class ApiServiciosBusqueda {
  TextEditingController searchController = TextEditingController();
  Future<List<Resguardo>?> search() async {
    try {
      var url = Uri.parse(APIconstant.base_URL + APIconstant.rutaSearch);
      var response = await http.post(url, body: {
        "nick": searchController.text,
      });
      var data = jsonDecode(response.body);
    } catch (e) {
      log(e.toString());
    }
  }
}

class ApiServiciosResguardos {
  static var url = Uri.parse(APIconstant.base_URL + APIconstant.rutaResguardos);
  static Future<Resguardos> getResguardos() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        return parseResguardos(response.body);
      } else {
        return Resguardos();
      }
    } catch (e) {
      print("Error ${e.toString()}");
      return Resguardos();
    }
  }

  static Resguardos parseResguardos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Resguardo> resguardos =
        parsed.map<Resguardo>((json) => Resguardo.fromJson(json)).toList();
    Resguardos r = Resguardos();
    r.resguardos = resguardos;
    return r;
  }
}

class ApiServiciosQR {
  TextEditingController qrController = TextEditingController();
  Future<List<Resguardo>?> qr() async {
    try {
      var url = Uri.parse(APIconstant.base_URL + APIconstant.rutaCambiarEstado);
      var response = await http.post(url, body: {
        "num_inventario": qrController.text,
      });
      var data = jsonDecode(response.body);
    } catch (e) {
      log(e.toString());
    }
  }
}

class ApiServiciosEstad {
  TextEditingController id_estadoControler = TextEditingController();
  TextEditingController num_inventarioControler = TextEditingController();
  void updateEstado() async {
    try {
      var url = Uri.parse(APIconstant.base_URL + APIconstant.rutaCambiarEstado);
      var response = await http.post(url, body: {
        "id_estado": id_estadoControler.text,
        "num_inventario": num_inventarioControler.text,
      });
      var data = jsonDecode(response.body);
    } catch (e) {
      log(e.toString());
    }
  }
}
