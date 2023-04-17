import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Bieness.dart';

class Servicios {
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _ADD_BIEN_ACTION = 'ADD_BIEN';
  static const _UPDATE_BIEN_ACTION = 'UPDATE_BIEN';
  static const _DELETE_BIEN_ACTION = 'DELETE_BIEN';

  static Future<List<Bieness>> getBienes() async {
    try {
      var map = Map<String, dynamic>();
      var url = Uri.https('localhost', '/tesvb/bienes.php');
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(url, body: map);
      print('getBienes Response: ${response.body}');
      if (200 == response.statusCode) {
        List<Bieness> list = parseResponse(response.body);
        return list;
      } else {
        return List.empty(growable: true);
      }
    } catch (e) {
      return List.empty(); // return an empty list on exception/error
    }
  }

  static List<Bieness> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Bieness>((json) => Bieness.fromJson(json)).toList();
  }

  static Future<String> addBien(Bieness bien, String text) async {
    try {
      var map = Map<String, dynamic>();
      var url = Uri.https('localhost', '/tesvb/bienes.php');
      map['action'] = _ADD_BIEN_ACTION;
      map['nombre'] = bien.nombre;
      map['caracteristicas'] = bien.caracteristicas;
      map['num_inventario'] = bien.num_inventario;
      map['nick'] = bien.nick;
      map['serie'] = bien.serie;
      map['costo'] = bien.costo;
      map['stock'] = bien.stock;
      map['id_color'] = bien.id_color;
      map['id_tipob'] = bien.id_tipob;
      map['id_tipoadqui'] = bien.id_tipoadqui;
      map['fechaadqui'] = bien.fechaadqui;
      map['condicion'] = bien.condicion;
      map['id_categoria'] = bien.id_categoria;
      map['id_proveedor'] = bien.id_proveedor;
      map['id_modelo'] = bien.id_modelo;
      map['id_estado'] = bien.id_estado;
      map['id_marca'] = bien.id_marca;
      map['created_at'] = bien.created_at;
      map['updated_at'] = bien.updated_at;
      map['factura'] = bien.factura;
      final response = await http.post(url, body: map);
      print('addBien Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return 'error';
      }
    } catch (e) {
      return 'error';
    }
  }

  static Future<String> updateBien(Bieness bien) async {
    try {
      var map = Map<String, dynamic>();
      var url = Uri.https('localhost', '/tesvb/bienes.php');
      map['action'] = _UPDATE_BIEN_ACTION;
      map['id'] = bien.id;
      map['nombre'] = bien.nombre;
      map['caracteristicas'] = bien.caracteristicas;
      map['num_inventario'] = bien.num_inventario;
      map['nick'] = bien.nick;
      map['serie'] = bien.serie;
      map['costo'] = bien.costo;
      map['stock'] = bien.stock;
      map['id_color'] = bien.id_color;
      map['id_tipob'] = bien.id_tipob;
      map['id_tipoadqui'] = bien.id_tipoadqui;
      map['fechaadqui'] = bien.fechaadqui;
      map['condicion'] = bien.condicion;
      map['id_categoria'] = bien.id_categoria;
      map['id_proveedor'] = bien.id_proveedor;
      map['id_modelo'] = bien.id_modelo;
      map['id_estado'] = bien.id_estado;
      map['id_marca'] = bien.id_marca;
      map['created_at'] = bien.created_at;
      map['updated_at'] = bien.updated_at;
      map['factura'] = bien.factura;
      final response = await http.post(url, body: map);
      print('updateBien Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return 'error';
      }
    } catch (e) {
      return 'error';
    }
  }

  static Future<String> deleteBien(String id) async {
    try {
      var map = Map<String, dynamic>();
      var url = Uri.https('localhost', '/tesvb/bienes.php');
      map['action'] = _DELETE_BIEN_ACTION;
      map['id'] = id;
      final response = await http.post(url, body: map);
      print('deleteBien Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return 'error';
      }
    } catch (e) {
      return 'error';
    }
  }
}
