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
    _getBienes();
  }

  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }

  _getBienes() {
    _showProgress('Loading Bienes...');
    Servicios.getBienes().then((bienes) {
      setState(() {
        _bienes = bienes;
      });
      _showProgress(widget.title);
      print("Length ${bienes.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
