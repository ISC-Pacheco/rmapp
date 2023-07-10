import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rmapp/IUs/bienes_page.dart';
import 'package:rmapp/servicios/constant.dart';

class setstatepage extends StatefulWidget {
  const setstatepage({Key? key}) : super(key: key);

  @override
  State<setstatepage> createState() => SetStatePage();
}

class SetStatePage extends State<setstatepage> {
  //Controladores para los campos de texto
  TextEditingController num_inventarioController = TextEditingController();
  TextEditingController id_estadoController = TextEditingController();
  Future setstate(BuildContext cont) async {
    if (num_inventarioController.text == "" || id_estadoController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ingrese datos'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    } else {
      var url =
          Uri.parse(APIconstant.base_URL + APIconstant.rutaUpdateAnotation);
      var response = await http.post(url, body: {
        "num_inventario": num_inventarioController.text,
        "id_estado": id_estadoController.text,
      });
      var data = json.decode(response.body);
      if (data == "OK") {
        Navigator.of(cont).pushReplacementNamed('/home_page');
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
    }
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmar cambios'),
      ),
      body: Form(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 1.2,
                        margin: const EdgeInsets.only(
                          top: 10.0,
                        ),
                        padding: const EdgeInsets.only(
                          top: 4.0,
                          left: 16.0,
                          right: 16.0,
                          bottom: 4.0,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: num_inventarioController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.library_books,
                              color: Colors.black,
                            ),
                            hintText: 'Ingrese el numero de inventario',
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 1.2,
                        margin: const EdgeInsets.only(
                          top: 10.0,
                        ),
                        padding: const EdgeInsets.only(
                          top: 4.0,
                          left: 16.0,
                          right: 16.0,
                          bottom: 4.0,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: id_estadoController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.update,
                              color: Colors.black,
                            ),
                            hintText: '(1 para Bien / 2 para Mal / 3 Regular)',
                          ),
                        ),
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
                              Color(0xFF17ead9),
                              Color(0xFF6078ea),
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
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              setstate(context); /*llamamos a setstate*/
                            },
                            child: const Center(
                              child: Text(
                                'Actualizar estado',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
