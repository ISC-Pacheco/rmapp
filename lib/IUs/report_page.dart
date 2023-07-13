import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:rmapp/servicios/constant.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  Future<void> generarReporteGeneral(BuildContext context) async {
    var timestam = DateTime.now();
    // Obtener la URL del servidor
    var url = Uri.parse(
        APIconstant.rutaReporteGeneral); // Reemplaza con la URL del servidor

    // Realizar la solicitud HTTP para obtener el contenido del PDF
    var response = await http.get(url);

    // Verificar el estado de la respuesta HTTP
    if (response.statusCode == 200) {
      // Obtener el contenido del PDF
      var pdfContent = response.bodyBytes;

      // Obtener el directorio de almacenamiento externo
      var directorio = await getExternalStorageDirectory();

      // Crear una ruta única para el archivo PDF
      var nombreArchivo = 'reporte-$timestam.pdf';
      var rutaCompleta = '${directorio!.path}/$nombreArchivo';

      // Escribir el contenido del PDF en un archivo en la ruta especificada
      var archivoPDF = File(rutaCompleta);
      await archivoPDF.writeAsBytes(pdfContent);

      print('PDF guardado en: $rutaCompleta');

      // Mostrar un Snackbar para indicar la ruta de guardado
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('PDF guardado en: $rutaCompleta'),
          duration: Duration(seconds: 9),
        ),
      );
    } else {
      // Mostrar un Snackbar en caso de error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al descargar el PDF'),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

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
              onPressed: () => generarReporteGeneral(context),
              child: Text('Generar reporte general'),
            ),
          ],
        ),
      ),
    );
  }
}
