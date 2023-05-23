import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import '../servicios/api_servicios.dart';
import '../rm_models/show_bienes_model.dart';
import '../servicios/constant.dart';
import 'package:http/http.dart' as http;

class ByNick extends StatefulWidget {
  const ByNick({Key? key}) : super(key: key);

  @override
  _NickState createState() => _NickState();
}

class _NickState extends State<ByNick> {
  late List<BienesModelo>? _bienesModelo = [];
  @override
  void initState() {
    super.initState();
    getBien();
  }

  Future<List<BienesModelo>>? _resultadoBienes;
  Future<List<BienesModelo>?> getBien() async {
    var url = Uri.parse(APIconstant.base_URL + APIconstant.rutaSearch);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      print(jsonData);
    } else {
      throw Exception('Falla al obtener los datos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<BienesModelo>>(
          future: _resultadoBienes,
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
