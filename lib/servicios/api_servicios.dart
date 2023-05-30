import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rmapp/rm_models/Bien.dart';
import 'package:rmapp/rm_models/modelo_factura.dart';
import '../rm_models/show_bienes_model.dart';
import 'constant.dart';

class ApiServiciosBienes {
  Future<List<BienMaterial>>? _listadoBienes;
  Future<List<BienMaterial>?> getBienes() async {
    var url = Uri.parse(APIconstant.base_URL + APIconstant.rutagetbienes);
    final response = await http.get(url);
    if (response.statusCode == 200) {
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

class ApiServiciosFacturas {
  Future<List<Datum>?> getFacturas() async {
    var url = Uri.parse(APIconstant.base_URL + APIconstant.rutaFacturas);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<Datum> _modeloF = facturaGeneralFromJson(response.body);
      return _modeloF;
    } else {
      throw Exception('Falla al cargar los datos');
    }
  }
}
