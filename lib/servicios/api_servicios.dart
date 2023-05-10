import 'dart:developer';

import 'package:http/http.dart' as http;
import '../rm_models/show_bienes_model.dart';
import 'constant.dart';

class ApiServiciosBienes {
  Future<List<BienesModelo>?> getBienes() async {
    try {
      var url = Uri.parse(APIconstant.base_URL + APIconstant.rutagetbienes);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<BienesModelo>? _bienes = bienesModeloFromJson(response.body);
        return _bienes;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
