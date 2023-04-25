import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rmapp/IUs/bienes_page.dart';
import 'package:rmapp/IUs/gestion_page.dart';
import 'package:rmapp/IUs/report_page.dart';
import 'package:rmapp/IUs/search_page.dart';

class HomePages extends StatefulWidget {
  @override
  State<HomePages> createState() => _HomePageState();
}

class _HomePageState extends State<HomePages> {
  int _paginaActual = 0;
  List<Widget> _paginas = [
    BienesPage(),
    GestionPage(),
    SearchPage(),
    ReportPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/gestion_page');
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.blue,
        ),
        drawer: Drawer(
          child: Container(
            color: Color.fromARGB(255, 255, 255, 204),
            child: Column(
              children: [
                Container(
                  width: 350,
                  height: 180,
                  margin: const EdgeInsets.only(top: 5.0, bottom: 1.0),
                  child: Image.asset('assets/images/splashs.png'),
                ),
                const Text(
                  'TESVB',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: InkWell(
                    onTap: () {
                      BienesPage();
                    },
                    child: const Text("Inicio"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: InkWell(
                    onTap: () {
                      GestionPage();
                    },
                    child: const Text("Gestión"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: InkWell(
                    onTap: () {
                      SearchPage();
                    },
                    child: const Text("Consultar bien material"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: InkWell(
                    onTap: () {
                      ReportPage();
                    },
                    child: const Text("Reportes"),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.grey[500],
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      exit(0);
                    },
                    child: const Text(
                      "Cerrar sesión",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text('Bienes materiales'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.qr_code_scanner),
              onPressed: () {
                Navigator.pushNamed(context, 'Escaner');
              },
            ),
          ],
        ),
        body: Center(
          child: _paginas[_paginaActual],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _paginaActual = index;
            });
          },
          currentIndex: _paginaActual,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Gestiona',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Buscar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: 'Reporte',
            ),
          ],
          selectedItemColor: Color.fromARGB(255, 45, 149, 241),
        ));
  }
}
