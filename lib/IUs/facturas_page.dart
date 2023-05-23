import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rmapp/rm_models/modelo_factura.dart';
import 'package:rmapp/servicios/api_servicios.dart';
import 'package:rmapp/servicios/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class facturas_page extends StatefulWidget {
  const facturas_page({super.key});

  @override
  State<facturas_page> createState() => _facturas_pageState();
}

class _facturas_pageState extends State<facturas_page> {
  late List<Datum> _listFacturas = [];
  @override
  void initState() {
    super.initState();
    getFacturas();
  }

  Future<List<Datum>>? _listadoFacturas;
  Future<List<Datum>?> getFacturas() async {
    var url = Uri.parse(APIconstant.base_URL + APIconstant.rutaFacturas);
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
      body: FutureBuilder<List<Datum>>(
          future: _listadoFacturas,
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
                    return Text(snap.data![i].bienMaterial);
                  });
            }
            if (snap.hasError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error al cargar los datos'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
