import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rmapp/models/bienes.dart';
import 'package:rmapp/servicios/api_servicios.dart';
import 'package:rmapp/servicios/constant.dart';

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

class _BienesPageState extends State<BienesPage> {
  TextEditingController idInventarioController = TextEditingController();
  final tiempodeespera = TiempoDeEspera(milliseconds: 800);
  late Bienes bienes;
  late String title;
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
  TextEditingController num_inventarioController = TextEditingController();
  TextEditingController id_estadoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    num_inventarioController.text;
    id_estadoController.text;
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
        itemCount: bienes.bienes == null ? 0 : bienes.bienes!.length,
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
              nobreBien + bienes.bienes![index].nombre!,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              numInventario + bienes.bienes![index].num_inventario!,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              nick + bienes.bienes![index].nick!,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              serie + bienes.bienes![index].serie!,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              idModelo + bienes.bienes![index].id_modelo!,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              idEstado + bienes.bienes![index].id_estado!,
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
              label: Text(''),
              onPressed: () {
                cambiarEstadoBien(index);
                setEstado(context);
              },
            ),
            SizedBox(
              height: 5.0,
            ),
            TextButton.icon(
              icon: Icon(Icons.cancel),
              label: Text(''),
              onPressed: () {
                cambiarEstadoBien(index);
                setEstado(context);
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

  void cambiarEstadoBien(int index) {
    String nInventario = bienes.bienes![index].num_inventario!;
    num_inventarioController.text = nInventario;
    String nEstado = bienes.bienes![index].id_estado!;
    id_estadoController.text = nEstado;
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
        hintText: 'Filtrar (nombre / Numero de inventario)',
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
            SizedBox(
              height: 10.0,
            ),
            list(),
          ],
        ),
      ),
    );
  }

  void setEstado(BuildContext context) async {
    String numInventario = num_inventarioController.text;
    String idEstado = id_estadoController.text;
    if (numInventario.isNotEmpty && idEstado.isNotEmpty) {
      // Aquí puedes realizar la llamada a la función para enviar los datos al servidor o hacer cualquier otra operación necesaria.
      print("Número de inventario: $numInventario");
      print("ID de estado: $idEstado");
      if (idEstado == "BUENO") {
        id_estadoController.text = "2";
      } else {
        id_estadoController.text = "1";
      }
      var url = Uri.parse(APIconstant.base_URL + APIconstant.rutaCambiarEstado);
      var response = await http.post(url, body: {
        "num_inventario": num_inventarioController.text,
        "id_estado": id_estadoController.text,
      });
      var data = json.decode(response.body);
      if (data == "OK") {
        Navigator.of(context).pushReplacementNamed('/home_page');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Datos actualizados'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sin cambios'),
            duration: Duration(seconds: 2),
          ),
        );
      }
      num_inventarioController.clear();
      id_estadoController.clear();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Campos vacíos'),
            content: Text('Por favor, complete todos los campos.'),
            actions: <Widget>[
              TextButton(
                child: Text('Aceptar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
