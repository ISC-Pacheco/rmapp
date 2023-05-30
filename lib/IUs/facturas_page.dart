import 'package:flutter/material.dart';
import 'package:rmapp/servicios/api_servicios.dart';

import '../rm_models/modelo_factura.dart';

class facturas_page extends StatefulWidget {
  const facturas_page({super.key});

  @override
  State<facturas_page> createState() => _facturas_pageState();
}

class _facturas_pageState extends State<facturas_page> {
  late List<Datum>? _listFacturas = [];
  @override
  void initState() {
    super.initState();
    _getFacturas();
  }

  void _getFacturas() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
