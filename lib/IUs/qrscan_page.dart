import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:rmapp/servicios/constant.dart';
import 'package:http/http.dart' as http;

class Qrscan extends StatefulWidget {
  @override
  _QrscanPage createState() => _QrscanPage();
}

class _QrscanPage extends State<Qrscan> {
  String _scanBarcode = 'Desconocido';

  @override
  void initState() {
    super.initState();
  }

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

  static var url = Uri.parse(APIconstant.base_URL + APIconstant.rutaAsociados);
  TextEditingController qrcontroler = TextEditingController();
  Future<void> getAsociado() async {
    String nick;
    nick = _scanBarcode;
    try {
      final response = await http.post(url, body: {
        "nick": _scanBarcode,
      });
      var data = jsonDecode(response.body);
      if (200 == response.statusCode) {
        //continuar busqueda asociados
        return data;
      } else {
        return data;
      }
    } catch (e) {
      Text("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Builder(builder: (BuildContext context) {
          return Container(
              alignment: Alignment.center,
              child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () => scanQR(),
                        child: Text('Inicio de escaneo de código QR')),
                    ElevatedButton(
                        onPressed: () => startBarcodeScanStream(),
                        child: Text(
                            'Inicio de escaneo de código de barras en secuencia')),
                    Text('Resultado del escaner : $_scanBarcode\n',
                        style: TextStyle(fontSize: 20)),
                  ]));
        })));
  }
}
