import 'package:flutter/material.dart';
import 'Bieness.dart';
import 'Servicios.dart';

class DataTableBienes extends StatefulWidget {
  DataTableBienes() : super();
  final String title = 'Bieness Materiales';

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

  //IU
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawer: Drawer(
        child: Container(
          color: Colors.blue[100],
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(top: 50, bottom: 20),
                child: Image.asset('assets/images/splashs.png'),
              ),
              const Text(
                'TESVB',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.grey[100],
                child: const Text("Inicio"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.grey[100],
                child: const Text("Gestionar bien material"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.grey[100],
                child: const Text("Consultar bien material"),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.black87,
                alignment: Alignment.center,
                child: const Text(
                  "Cerrar sesión",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(_titleProgress!),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        //error renderflex overflowed by 421 pixels on the bottom
        height: 1200,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(3.0),
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
            /*//Botones Agregar, Actualizar y Eliminar
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
            ),*/
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
