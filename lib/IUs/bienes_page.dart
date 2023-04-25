import 'package:flutter/material.dart';
import 'package:requests/requests.dart';

class BienesPage extends StatefulWidget {
  const BienesPage({Key? key}) : super(key: key);

  @override
  State<BienesPage> createState() => _BienesPageState();
}

class _BienesPageState extends State<BienesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Bienes Page')),
      body: Center(child: Text('Bienes Page')),
    );
  }
}
