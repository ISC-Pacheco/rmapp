import 'dart:async';
import 'package:rmapp/servicios/api_servicios.dart';
import 'package:flutter/material.dart';
import 'package:rmapp/models/bienes.dart';

import 'package:flutter/material.dart';
import 'dart:async';

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

  late Bienes bienes;
  late String title;

  var nobreBien = "Nombre del bien:";
  var descripcion = "Características:";
  var numInventario = "Número de inventario:";
  var nick = "Nick:";
  var serie = "Serie:";
  var costo = "Costo:";
  var stock = "Stock:";
  var idColor = "Color:";
  var idTipoB = "Tipo de bien:";
  var idTipoAdqui = "Tipo de adquisición:";
  var fechaAdqui = "Fecha de adquisición:";
  var condicion = "Condición:";
  var idCategoria = "Categoría:";
  var idProvedor = "Proveedor:";
  var idModelo = "Modelo:";
  var idEstado = "Estado:";
  var idMarca = "Marca:";
  var fechaCreacion = "Fecha de creación:";
  var fechaActualizacion = "Fecha de actualización:";
  var factura = "Factura:";
  var funciona;
  var noFunciona;

  @override
  void initState() {
    super.initState();
    title = 'Cargando bienes...';
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
            SizedBox(height: 5.0),
            SizedBox(height: 5.0),
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
            searchTF(),
            SizedBox(height: 10.0),
            list(),
          ],
        ),
      ),
    );
  }
}
