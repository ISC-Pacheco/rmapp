import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienes materiales"),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Table(
              border: TableBorder.all(),
              columnWidths: {
                0: FractionColumnWidth(.5),
                1: FractionColumnWidth(.5)
              },
              children: [
                TableRow(children: [
                  Icon(
                    Icons.assignment_outlined,
                    size: 10,
                  ),
                  Text("Cuenta"),
                ]),
                TableRow(children: [
                  Icon(
                    Icons.assignment_late,
                    size: 10,
                  ),
                  Text("Configuracion"),
                ]),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class materiales extends StatelessWidget {
  const materiales({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
