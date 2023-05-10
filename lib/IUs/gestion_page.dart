import 'package:flutter/material.dart';

import '../Bieness.dart';
import '../Servicios.dart';

class GestionPage extends StatefulWidget {
  GestionPage() : super();
  final String title = 'Bieness Materiales';

  @override
  DataTableBienesState createState() => DataTableBienesState();
}

class DataTableBienesState extends State<GestionPage> {
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
    //_getBienes();
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

  //se crea la tabla de bienes y se integra el scrollview para que se pueda desplazar horizontalmente y verticalmente

  SingleChildScrollView _dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text('NOMBRE'),
            ),
            DataColumn(
              label: Text('CARACTERISTICAS'),
            ),
            DataColumn(
              label: Text('NUM_INVENTARIO'),
            ),
            DataColumn(
              label: Text('NICK'),
            ),
            DataColumn(
              label: Text('SERIE'),
            ),
            DataColumn(
              label: Text('COSTO'),
            ),
            DataColumn(
              label: Text('STOCK'),
            ),
            DataColumn(
              label: Text('ID_COLOR'),
            ),
            DataColumn(
              label: Text('ID_TIPOB'),
            ),
            DataColumn(
              label: Text('ID_TIPOADQUI'),
            ),
            DataColumn(
              label: Text('FECHAADQUI'),
            ),
            DataColumn(
              label: Text('CONDICION'),
            ),
            DataColumn(
              label: Text('ID_CATEGORIA'),
            ),
            DataColumn(
              label: Text('ID_PROVEEDOR'),
            ),
            DataColumn(
              label: Text('ID_MODELO'),
            ),
            DataColumn(
              label: Text('ID_ESTADO'),
            ),
            DataColumn(
              label: Text('ID_MARCA'),
            ),
            DataColumn(
              label: Text('CREATED_AT'),
            ),
            DataColumn(
              label: Text('UPDATED_AT'),
            ),
            DataColumn(
              label: Text('FACTURA'),
            ),
            // Editar
            DataColumn(
              label: Text('EDITAR'),
            ),
            // Eliminar
            DataColumn(
              label: Text('ELIMINAR'),
            ),
          ],
          rows: _bienes!
              .map(
                (bien) => DataRow(cells: [
                  DataCell(
                    Text(bien.nombre.toString()),
                  ),
                  DataCell(
                    Text(bien.caracteristicas.toString()),
                  ),
                  DataCell(
                    Text(bien.num_inventario.toString()),
                  ),
                  DataCell(
                    Text(bien.nick.toString()),
                  ),
                  DataCell(
                    Text(bien.serie.toString()),
                  ),
                  DataCell(
                    Text(bien.costo.toString()),
                  ),
                  DataCell(
                    Text(bien.stock.toString()),
                  ),
                  DataCell(
                    Text(bien.id_color.toString()),
                  ),
                  DataCell(
                    Text(bien.id_tipob.toString()),
                  ),
                  DataCell(
                    Text(bien.id_tipoadqui.toString()),
                  ),
                  DataCell(
                    Text(bien.fechaadqui.toString()),
                  ),
                  DataCell(
                    Text(bien.condicion.toString()),
                  ),
                  DataCell(
                    Text(bien.id_categoria.toString()),
                  ),
                  DataCell(
                    Text(bien.id_proveedor.toString()),
                  ),
                  DataCell(
                    Text(bien.id_modelo.toString()),
                  ),
                  DataCell(
                    Text(bien.id_estado.toString()),
                  ),
                  DataCell(
                    Text(bien.id_marca.toString()),
                  ),
                  DataCell(
                    Text(bien.created_at.toString()),
                  ),
                  DataCell(
                    Text(bien.updated_at.toString()),
                  ),
                  DataCell(
                    Text(bien.factura.toString()),
                  ),
                ]),
              )
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: _dataBody(),
    );
  }
}
