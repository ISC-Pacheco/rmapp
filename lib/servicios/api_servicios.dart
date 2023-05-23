import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../rm_models/Bien.dart';
import '../rm_models/Bienes.dart';
import '../rm_models/show_bienes_model.dart';
import 'constant.dart';

class ApiServiciosBienes {
  Future<List<BienesModelo>>? _listadoBienes;
  Future<List<BienesModelo>?> getBienes() async {
    var url = Uri.parse(APIconstant.base_URL + APIconstant.rutagetbienes);
    final response = await http.get(url);
    List<BienesModelo> bienes = [];
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      print(jsonData);
    } else {
      throw Exception('Falla al cargar los datos');
    }
  }
}

class ApiServiciosLogin {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<List<BienesModelo>?> login() async {
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
  Future<List<BienesModelo>?> search() async {
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
