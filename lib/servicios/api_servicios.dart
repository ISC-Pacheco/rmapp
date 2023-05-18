import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../rm_models/show_bienes_model.dart';
import 'constant.dart';

class ApiServiciosBienes {
  Future<List<BienesModelo>?> getBienes() async {
    try {
      var url = Uri.parse(APIconstant.base_URL + APIconstant.rutagetbienes);
      var response = await http.get(url);
      return json.decode(response.body);
    } catch (e) {
      log(e.toString());
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
