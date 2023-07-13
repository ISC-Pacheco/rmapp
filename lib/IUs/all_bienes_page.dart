import 'dart:async';
import 'package:rmapp/servicios/api_servicios.dart';
import 'package:flutter/material.dart';
import 'package:rmapp/models/bienes.dart';

class AllBienesPage extends StatefulWidget {
  AllBienesPage({Key? key}) : super(key: key);

  final String title = "Lista de bienes";

  @override
  _BienesPageState createState() => _BienesPageState();
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

class _BienesPageState extends State<AllBienesPage> {
  final tiempodeespera = TiempoDeEspera(milliseconds: 1000);
  var instancia1 = _BienesPageState();

  late Bienes bienes;
  late String title;

  var nBien = "Nombre del bien: ";
  var nInventario = "Numero de inventario: ";
  var nArea = "Area:";
  var nResguardatario = "Resguardatario: ";
  var nValor = "Valor: ";
  var nUbicacion = "Ubicacion: ";
  var dCaracteristicas = "Caracteristicas: ";
  var dAnotacion = "Notas: ";
  var abien = "";

  @override
  void initState() {
    super.initState();
    title = "...";
    bienes = Bienes();
    ApiServiciosBienes.getBienes().then((bienesFromServer) {
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
          trailing:
          Icon(Icons.arrow_forward);
          return fullrow(index);
        },
      ),
    );
  }

  Widget fullrow(int index) {
    var checknote = bienes.bienes![index].anotacion;
    if (bienes.bienes![index].anotacion == "") {
      checknote = "Sin observaciones";
    }
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              nInventario + bienes.bienes![index].inventario!,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              nBien + bienes.bienes![index].descripcion_bien!,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              dCaracteristicas + bienes.bienes![index].caracteristicas!,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              nArea + bienes.bienes![index].areas!,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              nUbicacion + bienes.bienes![index].ubicacion!,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              nResguardatario + bienes.bienes![index].resguardatorio!,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              nValor + bienes.bienes![index].valor!,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              dAnotacion + checknote!,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
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
            const Radius.circular(5.0),
          ),
        ),
        icon: Icon(
          Icons.search,
          color: Colors.black,
        ),
        filled: true,
        fillColor: Colors.white54,
        contentPadding: EdgeInsets.all(15.0),
        hintText: 'Filtrar por nombre o nick',
      ),
      onChanged: (string) {
        tiempodeespera.run(() {
          setState(() {
            title = 'Buscando...';
          });
          ApiServiciosBienes.getBienes().then((bienesFromServer) {
            setState(() {
              bienes = Bienes.filterList(bienesFromServer, string);
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
        backgroundColor: Color.fromARGB(255, 43, 140, 237),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            //searchTF(),
            SizedBox(height: 10.0),
            list(),
          ],
        ),
      ),
    );
  }
}
