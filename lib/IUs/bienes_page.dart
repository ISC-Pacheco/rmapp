import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:rmapp/servicios/api_servicios.dart';
import 'package:flutter/material.dart';
import 'package:rmapp/models/bienes.dart';
import 'package:http/http.dart' as http;

import '../servicios/constant.dart';

class BienesPage extends StatefulWidget {
  BienesPage({Key? key}) : super(key: key);

  final String title = "Preview de bienes";

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

//referencia al modelo de datos usado para un bien material
class _BienesPageState extends State<BienesPage> {
  // Variable para controlar el tiempo de espera
  final tiempodeespera = TiempoDeEspera(milliseconds: 800);

  // Lista de bienes
  late Bienes bienes;
  late String title;
  //Etiqutas para la presentacion de los datos
  var nobreBien = "Nombre del bien:";
  var descripcion = "Carcteristicas:";
  var numInventario = "Numero de inventario:";
  var nick = "Nick:";
  var serie = "Serie:";
  var costo = "Costo:";
  var stock = "Stock:";
  var idColor = "Color:";
  var idTipoB = "Tipo de bien:";
  var idTipoAdqui = "Tipo de adquisicion:";
  var fechaAdqui = "Fecha de adquisicion:";
  var condicion = "Condicion:";
  var idCategoria = "Categoria:";
  var idProvedor = "Provedor:";
  var idModelo = "Modelo:";
  var idEstado = "Estado:";
  var idMarca = "Marca:";
  var fechaCreacion = "Fecha de creacion:";
  var fechaActualizacion = "Fecha de actualizacion:";
  var factura = "Factura:";
  var funciona;
  var noFunciona;

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
            Text(
              nobreBien + bienes.bienes![index].nombre,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              numInventario + bienes.bienes![index].num_inventario,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              nick + bienes.bienes![index].nick,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              serie + bienes.bienes![index].serie,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              idModelo + bienes.bienes![index].id_modelo,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              idEstado + bienes.bienes![index].id_estado,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            TextButton.icon(
              icon: Icon(Icons.check_circle),
              label: Text('Cambiar estado del bien'),
              onPressed: () {
                Navigator.of(context).pushNamed('/setstate_page');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Redireccionando...'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: Text(
                    "Ver mas",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/all_bienes_page');
                  },
                ),
              ],
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
