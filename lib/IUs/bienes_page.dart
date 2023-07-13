import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rmapp/models/bienes.dart';
import 'package:rmapp/servicios/api_servicios.dart';
import 'package:rmapp/servicios/constant.dart';

class BienesPage extends StatefulWidget {
  BienesPage({Key? key}) : super(key: key);

  final String title = "Listado de bienes por resguardatario";

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
  var nBien = "Nombre del bien: ";
  var nInventario = "Numero de inventario: ";
  var nArea = "Area: ";
  var nResguardatario = "Resguardatario: ";
  var nValor = "Valor: ";
  var nUbicacion = "Ubicacion: ";
  var getnumeroinvenrario = "";
  var dCaracteristicas = "Caracteristicas: ";
  var dAnotacion = "Notas: ";

  var funciona;
  var noFunciona;
  TextEditingController num_inventarioController = TextEditingController();
  TextEditingController id_estadoController = TextEditingController();
  TextEditingController idinv = TextEditingController();

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
              nUbicacion + bienes.bienes![index].ubicacion!,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton.icon(
                  icon: Icon(Icons.library_add),
                  label: Text(
                    "Ver más",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Detalles del bien'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                fullrow(index),
                              ],
                            ),
                          ),
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
                    getnumeroinvenrario = bienes.bienes![index].inventario;
                    print(getnumeroinvenrario);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget fullrow(int index) {
    var checknote = bienes.bienes![index].anotacion;
    if (bienes.bienes![index].anotacion == "") {
      checknote = "Sin observaciones";
    }
    return Card(
      color: Color.fromRGBO(234, 228, 228, 0.953),
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

  void cambiarEstadoBien(int index) {
    String nInventario = bienes.bienes![index].inventario!;
    num_inventarioController.text = nInventario;
    //String nEstado = bienes.bienes![index].id_estado!;
    //id_estadoController.text = nEstado;
  }

  //the next widget have a bootom union to text field
  Widget searchTF() {
    return Row(
      children: <Widget>[
        TextButton.icon(
          icon: Icon(Icons.qr_code),
          label: Text(''),
          onPressed: () {
            Navigator.pushNamed(context, '/qrscan_page');
          },
        ),
        Expanded(
          child: TextField(
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
              hintText: 'Buscador',
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
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
      ],
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
      var url =
          Uri.parse(APIconstant.base_URL + APIconstant.rutaUpdateAnotation);
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
