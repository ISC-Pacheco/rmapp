import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:rmapp/doclabel/plantilla_pdf.dart';
import 'package:rmapp/doclabel/previewpdf.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reportes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                //ReportScreen(); // esta llama a la wea esa
              },
              child: Text('Generar reporte general'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //final pdf = PdfTemplate.generateSimpleReport();
              },
              child: Text('Generar reporte simple'),
            ),
          ],
        ),
      ),
    );
  }
}
