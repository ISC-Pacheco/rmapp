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

class ApiServiciosUpdateAnotation {
  TextEditingController num_inventarioController = TextEditingController();
  TextEditingController noteEditingController = TextEditingController();
  void updateEstado() async {
    try {
      var url =
          Uri.parse(APIconstant.base_URL + APIconstant.rutaUpdateAnotation);
      var response = await http.post(url, body: {
        "inventario": num_inventarioController.text,
        "anotacion": noteEditingController.text,
      });
      var data = jsonDecode(response.body);
    } catch (e) {
      log(e.toString());
    }
  }
}
