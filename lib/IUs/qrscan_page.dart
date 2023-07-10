import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:rmapp/models/bienes.dart';
import 'package:rmapp/servicios/api_servicios.dart';
import 'package:http/http.dart' as http;

import '../servicios/constant.dart';

class Qrscan extends StatefulWidget {
  @override
  _QrscanPage createState() => _QrscanPage();
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

class _QrscanPage extends State<Qrscan> {
  bool showTextField =
      false; // Variable para controlar la visibilidad del TextField
  TextEditingController num_inventarioController = TextEditingController();
  TextEditingController qrscanController = TextEditingController();
  String noteText = ''; // Texto inicial del hintText
  TextEditingController noteEditingController = TextEditingController();
  String _scanBarcode = '';
  bool showSearch = false;
  bool isListVisible = false;
  List<String> numerosInventario = [];

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancelar', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancelar', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Falla al obtener la versión de la plataforma.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
      qrscanController.text = _scanBarcode;
    });
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancelar', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Falla en la versión de plataforma.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Future updateAnotation() async {
    if (noteEditingController.text == "" ||
        num_inventarioController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Se requiere informacion'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    } else {
      try {
        var url =
            Uri.parse(APIconstant.base_URL + APIconstant.rutaUpdateAnotation);
        var response = await http.post(url, body: {
          "inventario": num_inventarioController.text,
          "anotacion": noteEditingController.text
        });
        var data = jsonDecode(response.body);
        if (data == "OK") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Nota guardada'),
              duration: Duration(seconds: 3),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al guardar nota'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  final tiempodeespera = TiempoDeEspera(milliseconds: 1000);

  // Lista de bienes
  late Bienes bienes;
  late String title;
  //flags
  var nBien = "Nombre del bien:";
  var nInventario = "Numero de inventario:";
  var nArea = "Area:";
  var nResguardatario = "Resguardatario:";
  var nValor = "Valor:";
  var note = "";
  var bycontrol = "";

  // Variable para controlar el estado de la lista de bienes
  @override
  void initState() {
    super.initState();
    qrscanController.text = _scanBarcode;
    qrscanController.addListener(() {
      String searchString = qrscanController.text;
      tiempodeespera.run(() {
        setState(() {
          title = '';
        });
        ApiServiciosBienes.getBienes().then((bienesFromServer) {
          setState(() {
            bienes = Bienes.filterList(bienesFromServer, searchString);
            isListVisible = bienes.bienes != null &&
                bienes.bienes!.isNotEmpty; // Establece isListVisible
          });
        });
      });
    });
    title = '';
    // Obtenemos la lista de bienes
    bienes = Bienes();
    ApiServiciosBienes.getBienes().then((bienesFromServer) {
      // Actualizamos la lista de bienes
      setState(() {
        bienes = bienesFromServer;
      });
    });
  }

  Widget list() {
    if (!isListVisible) {
      return SizedBox.shrink();
    }

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
              nInventario + bienes.bienes![index].inventario,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              nBien + bienes.bienes![index].descripcion_bien,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              nResguardatario + bienes.bienes![index].resguardatorio,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              nArea + bienes.bienes![index].areas,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextButton.icon(
                  onPressed: () {
                    //descripcion del lugar donde se encontro no requerida
                    setState(() {
                      numerosInventario.add(bienes.bienes![index].inventario);
                      print(numerosInventario);
                    });
                  },
                  icon: Icon(
                    Icons.check,
                    color: Colors.blue,
                  ),
                  label: Text(
                    'Area correcta',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    //descripcion del lugar donde se encontro requerida
                    setState(() {
                      showTextField = true;
                      //noteText = '¿Donde lo encontraste?';
                      numerosInventario.add(bienes.bienes![index].inventario);
                      bycontrol = bienes.bienes![index].inventario;
                      num_inventarioController.text = bycontrol;
                      noteEditingController.text = noteText; //para la funcion
                      print("$numerosInventario \n $note");
                    });
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.orange,
                  ),
                  label: Text(
                    'Area incorrecta',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
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

  void cambiarEstadoBien(int index) {
    String getnInventario = bienes.bienes![index].inventario!;
    num_inventarioController.text = nInventario;
  }

  Widget searchTF() {
    if (!showSearch) {
      return SizedBox.shrink();
    }

    return TextField(
      controller: qrscanController,
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
      ),
    );
  }

  Widget noteTF() {
    if (!showTextField) {
      return SizedBox.shrink();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: TextField(
            controller: noteEditingController,
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
              hintText: "¿Donde lo encontraste?",
            ),
            maxLines: null,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          child: TextButton.icon(
            onPressed: () {
              bycontrol = num_inventarioController.text;
              print(bycontrol);
              note = noteEditingController.text;
              updateAnotation();
              print(note);
              setState(() {
                showTextField = false;
              });
            },
            icon: Icon(
              Icons.save,
              color: Colors.blue,
            ),
            label: Text(
              'Guardar',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
    //save buttom
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Qr Scan"),
        ),
        body: Builder(builder: (BuildContext context) {
          return Container(
            alignment: Alignment.center,
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.2,
                  margin: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 55, 23, 234),
                        Color.fromARGB(255, 107, 96, 234),
                      ],
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6078ea).withOpacity(.3),
                        offset: const Offset(0.0, 8.0),
                        blurRadius: 8.0,
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      scanQR();
                      setState(() {
                        showSearch = false;
                      });
                    },
                    child: const Center(
                      child: Text(
                        'Escanear QR',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                searchTF(),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                noteTF(),
                SizedBox(
                  height: 10.0,
                ),
                list(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
