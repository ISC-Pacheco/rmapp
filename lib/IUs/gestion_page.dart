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
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              //reporteMensual(context); /*llamamos a reporte mensual*/
            },
            child: const Center(
              child: Text(
                'Reporte mensual',
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
    );
  }
}
