import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rmapp/servicios/api_servicios.dart';

import '../Bieness.dart';
import '../Servicios.dart';
import '../models/resguardos.dart';

class GestionPage extends StatefulWidget {
  GestionPage({Key? key}) : super(key: key);

  final String title = "Lista de resguardos";

  @override
  DataTableBienesState createState() => DataTableBienesState();
}

class TiempoDeEspera {
  late final int milliseconds;
  late VoidCallback action;
  Timer? _timer;

  TiempoDeEspera({required this.milliseconds});
  run(VoidCallback action) {
    if (null != _timer) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class DataTableBienesState extends State<GestionPage> {
  final tiempodeespera = TiempoDeEspera(milliseconds: 1000);

  // Lista de resguardos
  late Resguardos resguardos;
  late String title;
  // Variable para controlar el estado de la lista de resguardos
  @override
  void initState() {
    super.initState();
    title = 'Cargando resguardos...';
    // Obtenemos la lista de resguardos
    resguardos = Resguardos();
    ApiServiciosResguardos.getResguardos().then((bienesFromServer) {
      // Actualizamos la lista de resguardos
      setState(() {
        resguardos = bienesFromServer;
        title = widget.title;
      });
    });
  }

  Widget list() {
    return Expanded(
      child: ListView.builder(
        itemCount:
            resguardos.resguardos == null ? 0 : resguardos.resguardos?.length,
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
              resguardos.resguardos![index].nombre,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              resguardos.resguardos![index].Fecha,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              resguardos.resguardos![index].Cantidad,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              resguardos.resguardos![index].resguardo,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              resguardos.resguardos![index].registro,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              resguardos.resguardos![index].registro,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              resguardos.resguardos![index].actualizacion,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchTF() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(
              5.0,
            ),
          ),
        ),
        filled: true,
        fillColor: Colors.white54,
        contentPadding: EdgeInsets.all(15.0),
        hintText: 'Filtrar por nombre o material',
      ),
      onChanged: (string) {
        tiempodeespera.run(() {
          setState(() {
            title = 'Buscando...';
          });
          ApiServiciosResguardos.getResguardos().then((resguardosFromServer) {
            setState(() {
              resguardos = Resguardos.filterList(resguardosFromServer, string);
              title = widget.title;
            });
          });
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromARGB(255, 56, 128, 246),
        //toolbarHeight: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            searchTF(),
            SizedBox(
              height: 10.0,
            ),
            list(),
          ],
        ),
      ),
    );
  }
}
