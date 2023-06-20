import 'dart:async';
import 'package:rmapp/servicios/api_servicios.dart';
import 'package:flutter/material.dart';
import 'package:rmapp/models/bienes.dart';

class BienesPage extends StatefulWidget {
  BienesPage({Key? key}) : super(key: key);

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

//referencia al modelo de datos usado para un bien material
class _BienesPageState extends State<BienesPage> {
  final tiempodeespera = TiempoDeEspera(milliseconds: 1000);

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
              bienes.bienes![index].caracteristicas,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              bienes.bienes![index].num_inventario,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              bienes.bienes![index].nick,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              bienes.bienes![index].serie,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              bienes.bienes![index].costo,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              bienes.bienes![index].stock,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
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
