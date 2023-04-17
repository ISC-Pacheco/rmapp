import 'package:flutter/material.dart';
import 'Bieness.dart';
import 'Servicios.dart';

class DataTableBienes extends StatefulWidget {
  DataTableBienes() : super();
  final String title = 'Bieness Data Table';
  @override
  DataTableBienesState createState() => DataTableBienesState();
}

class DataTableBienesState extends State<DataTableBienes> {
  List<Bieness>? _bienes;
  GlobalKey<ScaffoldState>? _scaffoldKey;
  TextEditingController? _nombreController;
  TextEditingController? _caracteristicasController;
  TextEditingController? _num_inventarioController;
  TextEditingController? _nickController;
  TextEditingController? _serieController;
  TextEditingController? _costoController;
  TextEditingController? _stockController;
  TextEditingController? _id_colorController;
  TextEditingController? _id_tipobController;
  TextEditingController? _id_tipoadquiController;
  TextEditingController? _fechaadquiController;
  TextEditingController? _condicionController;
  TextEditingController? _id_categoriaController;
  TextEditingController? _id_proveedorController;
  TextEditingController? _id_modeloController;
  TextEditingController? _id_estadoController;
  TextEditingController? _id_marcaController;
  TextEditingController? _created_atController;
  TextEditingController? _updated_atController;
  TextEditingController? _facturaController;
  Bieness? _selectedBien;
  bool? _isUpdating;
  String? _titleProgress;

  @override
  void initState() {
    super.initState();
    _bienes = [];
    _isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey();
    _nombreController = TextEditingController();
    _caracteristicasController = TextEditingController();
    _num_inventarioController = TextEditingController();
    _nickController = TextEditingController();
    _serieController = TextEditingController();
    _costoController = TextEditingController();
    _stockController = TextEditingController();
    _id_colorController = TextEditingController();
    _id_tipobController = TextEditingController();
    _id_tipoadquiController = TextEditingController();
    _fechaadquiController = TextEditingController();
    _condicionController = TextEditingController();
    _id_categoriaController = TextEditingController();
    _id_proveedorController = TextEditingController();
    _id_modeloController = TextEditingController();
    _id_estadoController = TextEditingController();
    _id_marcaController = TextEditingController();
    _created_atController = TextEditingController();
    _updated_atController = TextEditingController();
    _facturaController = TextEditingController();
    _getBienes();
  }

  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }

  _addBien() {
    //añade un bien
  }

  _getBienes() {
    _showProgress('Loading Bienes...');
    Servicios.getBienes().then((bienes) {
      setState(() {
        _bienes = bienes;
      });
      _showProgress(widget.title); // Reset the title...
      print("Length ${bienes.length}");
    });
  }

  _updateBien(Bieness bien) {
    //actualiza un bien
  }

  _deleteBien(Bieness bien) {
    _showProgress('Deleting Bien...');
    Servicios.deleteBien(bien.id as String).then((result) {
      if ('success' == result) {
        _getBienes(); // Refresh after delete...
      }
    });
  }

  _clearValues() {
    _nombreController!.text = '';
    _caracteristicasController!.text = '';
    _num_inventarioController!.text = '';
    _nickController!.text = '';
    _serieController!.text = '';
    _costoController!.text = '';
    _stockController!.text = '';
    _id_colorController!.text = '';
    _id_tipobController!.text = '';
    _id_tipoadquiController!.text = '';
    _fechaadquiController!.text = '';
    _condicionController!.text = '';
    _id_categoriaController!.text = '';
    _id_proveedorController!.text = '';
    _id_modeloController!.text = '';
    _id_estadoController!.text = '';
    _id_marcaController!.text = '';
    _created_atController!.text = '';
    _updated_atController!.text = '';
    _facturaController!.text = '';
  }

  //IU
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_titleProgress!),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(hintText: 'Nombre'),
            ),
            TextField(
              controller: _caracteristicasController,
              decoration: InputDecoration(hintText: 'Caracteristicas'),
            ),
            TextField(
              controller: _num_inventarioController,
              decoration: InputDecoration(hintText: 'Num_inventario'),
            ),
            TextField(
              controller: _nickController,
              decoration: InputDecoration(hintText: 'Nick'),
            ),
            TextField(
              controller: _serieController,
              decoration: InputDecoration(hintText: 'Serie'),
            ),
            TextField(
              controller: _costoController,
              decoration: InputDecoration(hintText: 'Costo'),
            ),
            TextField(
              controller: _stockController,
              decoration: InputDecoration(hintText: 'Stock'),
            ),
            TextField(
              controller: _id_colorController,
              decoration: InputDecoration(hintText: 'Id_color'),
            ),
            TextField(
              controller: _id_tipobController,
              decoration: InputDecoration(hintText: 'Id_tipob'),
            ),
            TextField(
              controller: _id_tipoadquiController,
              decoration: InputDecoration(hintText: 'Id_tipoadqui'),
            ),
            TextField(
              controller: _fechaadquiController,
              decoration: InputDecoration(hintText: 'Fechaadqui'),
            ),
            TextField(
              controller: _condicionController,
              decoration: InputDecoration(hintText: 'Condicion'),
            ),
            TextField(
              controller: _id_categoriaController,
              decoration: InputDecoration(hintText: 'Id_categoria'),
            ),
            TextField(
              controller: _id_proveedorController,
              decoration: InputDecoration(hintText: 'Id_proveedor'),
            ),
            TextField(
              controller: _id_modeloController,
              decoration: InputDecoration(hintText: 'Id_modelo'),
            ),
            TextField(
              controller: _id_estadoController,
              decoration: InputDecoration(hintText: 'Id_estado'),
            ),
            TextField(
              controller: _id_marcaController,
              decoration: InputDecoration(hintText: 'Id_marca'),
            ),
            TextField(
              controller: _created_atController,
              decoration: InputDecoration(hintText: 'Created_at'),
            ),
            TextField(
              controller: _updated_atController,
              decoration: InputDecoration(hintText: 'Updated_at'),
            ),
            TextField(
              controller: _facturaController,
              decoration: InputDecoration(hintText: 'Factura'),
            ),
            //Botones
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Boton Agregar
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text('ADD'),
                    onPressed: () {
                      _addBien();
                    },
                  ),
                ),
                //Boton Actualizar
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text('UPDATE'),
                    onPressed: () {
                      _updateBien(_selectedBien!);
                    },
                  ),
                ),
                //Boton Eliminar
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text('DELETE'),
                    onPressed: () {
                      _deleteBien(_selectedBien!);
                    },
                  ),
                ),
              ],
            ),
            //Lista
            Expanded(
              child: ListView.builder(
                itemCount: null == _bienes ? 0 : _bienes!.length,
                itemBuilder: (context, index) {
                  Bieness bien = _bienes![index];
                  return Card(
                    child: ListTile(
                      title: Text(bien.nombre!),
                      subtitle: Text(bien.id.toString()),
                      onTap: () {
                        setState(() {
                          _selectedBien = bien;
                          _nombreController!.text = bien.nombre!;
                          _caracteristicasController!.text =
                              bien.caracteristicas!;
                          _num_inventarioController!.text =
                              bien.num_inventario!;
                          _nickController!.text = bien.nick! as String;
                          _serieController!.text = bien.serie!;
                          _costoController!.text = bien.costo as String;
                          _stockController!.text = bien.stock as String;
                          _id_colorController!.text = bien.id_color as String;
                          _id_tipobController!.text = bien.id_tipob as String;
                          _id_tipoadquiController!.text =
                              bien.id_tipoadqui as String;
                          _fechaadquiController!.text = bien.fechaadqui!;
                          _condicionController!.text = bien.condicion as String;
                          _id_categoriaController!.text =
                              bien.id_categoria as String;
                          _id_proveedorController!.text =
                              bien.id_proveedor as String;
                          _id_modeloController!.text = bien.id_modelo as String;
                          _id_estadoController!.text = bien.id_estado as String;
                          _id_marcaController!.text = bien.id_marca as String;
                          _created_atController!.text = bien.created_at!;
                          _updated_atController!.text = bien.updated_at!;
                          _facturaController!.text = bien.factura!;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
