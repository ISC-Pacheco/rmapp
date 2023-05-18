import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:requests/requests.dart';
import 'package:http/http.dart' as http;
import 'package:rmapp/servicios/api_servicios.dart';
import 'package:rmapp/rm_models/show_bienes_model.dart';

import '../servicios/constant.dart';

class BienesPage extends StatefulWidget {
  const BienesPage({Key? key}) : super(key: key);

  @override
  _BienesPageState createState() => _BienesPageState();
}

class _BienesPageState extends State<BienesPage> {
  late List<BienesModelo>? _bienesModelo = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    Future<List<BienesModelo>?> getBienes() async {
      var url = Uri.parse(APIconstant.base_URL + APIconstant.rutagetbienes);
      var response = await http.get(url);
      return json.decode(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Bienes Page')),
      body: _bienesModelo == null || _bienesModelo!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _bienesModelo!.length,
              itemBuilder: (context, index) {
                return Card(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Nombre: ${_bienesModelo![index].nombre}'),
                        Text(
                            'Características: ${_bienesModelo![index].caracteristicas}'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                            'Numero de inventario: ${_bienesModelo![index].numInventario}'),
                        Text('Nick: ${_bienesModelo![index].nick}'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Serie: ${_bienesModelo![index].serie}'),
                        Text('Costo ${_bienesModelo![index].costo}}'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Stock: ${_bienesModelo![index].stock}'),
                        Text('id color: ${_bienesModelo![index].idColor}'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('id tipo: ${_bienesModelo![index].idTipob}'),
                        Text(
                            'id tipo adquisicion: ${_bienesModelo![index].idTipoadqui}'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                            'Fecha de adquicion: ${_bienesModelo![index].fechadqui}'),
                        Text('Condicion: ${_bienesModelo![index].condicion}'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                            'id categoria: ${_bienesModelo![index].idCategoria}'),
                        Text(
                            'id provedor: ${_bienesModelo![index].idProvedor}'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('id modelo: ${_bienesModelo![index].idModelo}'),
                        Text('id estado: ${_bienesModelo![index].idEstado}'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('id marca: ${_bienesModelo![index].idMarca}'),
                        Text('Creado el: ${_bienesModelo![index].createdAt}'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                            'Actualizado el: ${_bienesModelo![index].updatedAt}'),
                        Text('Factura: ${_bienesModelo![index].factura}'),
                      ],
                    ),
                  ],
                ));
              }),
    );
  }
}
