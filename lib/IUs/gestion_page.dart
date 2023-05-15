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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
