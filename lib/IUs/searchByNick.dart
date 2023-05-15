import 'dart:developer';
import 'package:flutter/material.dart';
import '../servicios/api_servicios.dart';
import '../rm_models/show_bienes_model.dart';

class ByNick extends StatefulWidget {
  const ByNick({Key? key}) : super(key: key);

  @override
  _NickState createState() => _NickState();
}

class _NickState extends State<ByNick> {
  late List<BienesModelo>? _bienesModelo = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _bienesModelo = await ApiServiciosBienes().getBienes()!;
    Future.delayed(const Duration(seconds: 1))
        .then(((value) => setState(() {})));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados de la búsqueda'),
      ),
      body: BienesModelo == null || BienesModelo != null
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
                          Text(_bienesModelo![index].nombre),
                          Text(_bienesModelo![index].caracteristicas),
                          Text(_bienesModelo![index].numInventario),
                          Text(_bienesModelo![index].nick),
                          Text(_bienesModelo![index].serie),
                          Text(_bienesModelo![index].costo),
                          Text(_bienesModelo![index].stock),
                          Text(_bienesModelo![index].idColor),
                          Text(_bienesModelo![index].idTipob),
                          Text(_bienesModelo![index].idTipoadqui),
                          Text(_bienesModelo![index].fechadqui.toString()),
                          Text(_bienesModelo![index].condicion),
                          Text(_bienesModelo![index].idCategoria),
                          Text(_bienesModelo![index].idProvedor),
                          Text(_bienesModelo![index].idModelo),
                          Text(_bienesModelo![index].idEstado),
                          Text(_bienesModelo![index].idMarca),
                          Text(_bienesModelo![index].createdAt.toString()),
                          Text(_bienesModelo![index].updatedAt.toString()),
                          Text(_bienesModelo![index].factura),
                        ],
                      ),
                    ],
                  ),
                );
              }),
    );
  }
}
