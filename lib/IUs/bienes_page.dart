import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rmapp/rm_models/Bien.dart';
import 'package:http/http.dart' as http;
import 'package:rmapp/rm_models/Bienes.dart';
import '../servicios/constant.dart';

class BienesPage extends StatefulWidget {
  const BienesPage({Key? key}) : super(key: key);

  @override
  _BienesPageState createState() => _BienesPageState();
}

//BienesModleo hace referencia al modelo de datos usado para un bien material
class _BienesPageState extends State<BienesPage> {
  late Future<List<BienMaterial>> _listadoBienes;

  Future<List<BienMaterial>> _getBienes() async {
    var url = Uri.parse(APIconstant.base_URL + APIconstant.rutagetbienes);
    final response = await http.get(url);
    List<BienMaterial> bienes = [];
    if (response.statusCode == 200) {
      String body = utf8.decode(response
          .bodyBytes); //se decodifica el json con utf8 por algun caracter especial
      final jsonData = jsonDecode(body);
      for (var item in jsonData["data"]) {
        print(jsonData);
        bienes.add(BienMaterial(
          item["id"],
          item["nombre"],
          item["caracteristicas"],
          item["numInventario"],
          item["nick"],
          item["serie"],
          item["costo"],
          item["stock"],
          item["idColor"],
          item["idTipob"],
          item["idTipoadqui"],
          item["fechadqui"],
          item["condicion"],
          item["idCategoria"],
          item["idProvedor"],
          item["idModelo"],
          item["idEstado"],
          item["idMarca"],
          item["createdAt"],
          item["updatedAt"],
          item["factura"],
        ));
      }
      return bienes;
      //print(jsonData["data"][0]); //imprime el primer elemento del json por lo que se puede ver la estructura json
    } else {
      throw Exception('Falla al cargar los datos');
    }
  }

  @override
  void initState() {
    super.initState();
    _listadoBienes = _getBienes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Bienes registrados')),
          backgroundColor: Colors.blueGrey,
          toolbarHeight: 0,
        ),
        body: FutureBuilder(
          future: _listadoBienes,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //print(snapshot.data); // imprime informacion que viene en el snapshot
              return ListView(
                children: _listBienes(snapshot.data as List<BienMaterial>),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  List<Widget> _listBienes(List<BienMaterial> data) {
    List<Widget> bienes = [];
    for (var item in data) {
      bienes.add(
        Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(item.nombre),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(item.numInventario),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(item.nick),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(item.serie),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(item.costo),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(item.stock),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(item.idColor),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(item.idTipob),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(item.idTipoadqui),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(item.fechadqui),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(item.condicion),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(item.idCategoria),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(item.idProvedor),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(item.idModelo),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(item.idEstado),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(item.idMarca),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(item.createdAt),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(item.updatedAt),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(item.factura),
              ),
            ],
          ),
        ),
      );
    }
    return bienes;
  }
}
