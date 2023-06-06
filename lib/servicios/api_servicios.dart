import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rmapp/models/bien.dart';
import 'package:rmapp/models/bienes.dart';
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
