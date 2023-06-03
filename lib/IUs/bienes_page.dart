import 'dart:async';
import 'dart:convert';
import 'package:rmapp/Servicios.dart';
import 'package:rmapp/servicios/api_servicios.dart';
import 'package:flutter/material.dart';
import 'package:rmapp/models/bienes.dart';
import 'package:rmapp/models/bien.dart';
import 'package:http/http.dart' as http;
import '../servicios/constant.dart';

class BienesPage extends StatefulWidget {
  BienesPage({Key? key}) : super(key: key);

  final String title = "Lista de bienes";

  @override
  _BienesPageState createState() => _BienesPageState();
}

//BienesModleo hace referencia al modelo de datos usado para un bien material
class _BienesPageState extends State<BienesPage> {
  // Lista de bienes
  late Bienes bienes;
  late String title;
  // Variable para controlar el estado de la lista de bienes
  @override
  void initState() {
    super.initState();
    title = 'Cargando bienes...';
    // Obtenemos la lista de bienes
    bienes = Bienes();
    ApiServiciosBienes.getBienes().then((bienesFromServer) {
      // Actualizamos la lista de bienes
      setState(() {
        bienes = bienesFromServer;
        title = widget.title;
      });
    });
  }

  Widget list() {
    return Expanded(
      child: ListView.builder(
        itemCount: bienes.bienes == null ? 0 : bienes.bienes?.length,
        itemBuilder: (BuildContext context, int index) {
          return row(index);
        },
      ),
    );
  }

  Widget row(int index) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              bienes.bienes![index].nombre,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              bienes.bienes![index].costo,
              style: TextStyle(
                fontSize: 10.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueGrey,
        //toolbarHeight: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            list(),
          ],
        ),
      ),
    );
  }
}
