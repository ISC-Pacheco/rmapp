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
            Text(
              nobreBien + bienes.bienes![index].nombre,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              descripcion + bienes.bienes![index].caracteristicas,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              numInventario + bienes.bienes![index].num_inventario,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              nick + bienes.bienes![index].nick,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              serie + bienes.bienes![index].serie,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              costo + bienes.bienes![index].costo,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              stock + bienes.bienes![index].stock,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              idColor + bienes.bienes![index].id_color,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              idTipoB + bienes.bienes![index].id_tipob,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              idTipoAdqui + bienes.bienes![index].id_tipoadqui,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              fechaAdqui + bienes.bienes![index].fechadqui,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              condicion + bienes.bienes![index].condicion,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              idCategoria + bienes.bienes![index].id_categoria,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              idProvedor + bienes.bienes![index].id_provedor,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              idModelo + bienes.bienes![index].id_modelo,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              idEstado + bienes.bienes![index].id_estado,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              idMarca + bienes.bienes![index].id_marca,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              fechaCreacion + bienes.bienes![index].created_at,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              fechaActualizacion + bienes.bienes![index].updated_at,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              factura + bienes.bienes![index].factura,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
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
