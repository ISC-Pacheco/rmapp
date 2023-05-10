import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> pdfreport() async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Center(
        child: pw.Text('pdf!'),
      ),
    ),
  );

  final file = File('reporte.pdf');
  await file.writeAsBytes(await pdf.save());
}

class PlantillaPDF {
  final pdf = pw.Document();

  Future<void> main() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text('Los datos obtenidos apareceran aquí!'),
        ),
      ),
    );

    final file = File('example.pdf');
    await file.writeAsBytes(await pdf.save());
  }
}
