import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:rmapp/IUs/gestion_page.dart';
import 'package:rmapp/models/resguardos.dart';
import 'package:rmapp/servicios/api_servicios.dart';
import 'package:rmapp/servicios/constant.dart';
import 'package:http/http.dart' as http;

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
  String _scanBarcode = '';

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Falla al obtener la version de la plataforma.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Falla en la version de plataforma.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  final tiempodeespera = TiempoDeEspera(milliseconds: 1000);

  // Lista de resguardos
  late Resguardos resguardos;
  late String title;
  //flags
  var nobreBien = "Material: ";
  var resguardador = "Responsable: ";
  var cantidad = "Cantidad: ";
  var fecha = "Numero de inventario: ";

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
              fecha + resguardos.resguardos![index].Fecha,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              nobreBien + resguardos.resguardos![index].nombre,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              cantidad + resguardos.resguardos![index].Cantidad,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              resguardador + resguardos.resguardos![index].resguardo,
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
            const Radius.circular(
              5.0,
            ),
          ),
        ),
        filled: true,
        fillColor: Colors.white54,
        contentPadding: EdgeInsets.all(15.0),
        hintText: 'Compara tus datos ingresa num de inventario',
      ),
      onChanged: (string) {
        tiempodeespera.run(() {
          setState(() {
            title = 'Buscando...';
          });
          ApiServiciosResguardos.getResguardos().then((resguardosFromServer) {
            setState(() {
              resguardos = Resguardos.filterList(resguardosFromServer, string);
            });
          });
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(title: Text("Qr Scan")),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50.0)),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF6078ea).withOpacity(.3),
                            offset: const Offset(0.0, 8.0),
                            blurRadius: 8.0,
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () => scanQR(),
                        child: const Center(
                          child: Text(
                            "Inicio de escaneo de código QR",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      child: Text('Resultado del escaner:\n$_scanBarcode\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextButton.icon(
                      icon: Icon(Icons.update),
                      label: Text('Click si desea cambiar el estado del bien'),
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
                    Container(
                      child: list(),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      child: searchTF(),
                    ),
                  ],
                ),
              );
            })));
  }
}
