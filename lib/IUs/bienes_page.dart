import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:requests/requests.dart';
import 'package:http/http.dart' as http;
import 'package:rmapp/rm_models/show_bienes_model.dart';
import 'package:rmapp/servicios/api_servicios.dart';
import 'package:rmapp/rm_models/Bien.dart';

import '../servicios/constant.dart';

class BienesPage extends StatefulWidget {
  const BienesPage({Key? key}) : super(key: key);

  @override
  _BienesPageState createState() => _BienesPageState();
}

//BienesModleo hace referencia al modelo de datos usado para un bien material
class _BienesPageState extends State<BienesPage> {
  late List<BienesModelo> _listBienes = [];
  @override
  void initState() {
    super.initState();
    getBienes();
  }

  Future<List<BienesModelo>>? _listadoBienes;
  Future<List<BienesModelo>?> getBienes() async {
    var url = Uri.parse(APIconstant.base_URL + APIconstant.rutagetbienes);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      print(jsonData);
    } else {
      throw Exception('Falla al cargar los datos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<BienesModelo>>(
          future: _listadoBienes,
          builder: (context, snap) {
            if (snap.hasData) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Se estan cargando los datos'),
                  duration: Duration(seconds: 2),
                ),
              );
              return ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: (context, i) {
                    return Text(snap.data![i].nombre);
                  });
            }
            if (snap.hasError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error al cargar los datos'),
                  duration: Duration(seconds: 2),
                ),
              );
              return const Text('Error al cargar los datos');
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
