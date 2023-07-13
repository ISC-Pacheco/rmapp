import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rmapp/IUs/bienes_page.dart';
import 'package:rmapp/IUs/qrscan_page.dart';
import 'package:rmapp/IUs/report_page.dart';

class HomePages extends StatefulWidget {
  @override
  State<HomePages> createState() => _HomePageState();
}

class _HomePageState extends State<HomePages> {
  int _paginaActual = 1; //pagina que queremos ver al inicio
  late final Color? shadowColor;
  List<Widget> _paginas = [
    BienesPage(),
    Qrscan(),
    ReportPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Container(
            color: Color.fromARGB(255, 56, 128, 246),
            child: Column(
              children: [
                Container(
                  width: 350,
                  height: 180,
                  margin: const EdgeInsets.only(top: 5.0, bottom: 1.0),
                  child: Image.asset('assets/images/splashs.png'),
                ),
                const Text(
                  '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1,
                  margin: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 55, 23, 234),
                        Color.fromARGB(255, 107, 96, 234),
                      ],
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6078ea).withOpacity(.3),
                        offset: const Offset(0.0, 8.0),
                        blurRadius: 8.0,
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        //llamamos a page_inicio
                        Navigator.of(context).pushNamed('/bienes_page');
                      },
                      child: const Center(
                        child: Text(
                          'Listado de bienes por resguardatario',
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
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1,
                  margin: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 55, 23, 234),
                        Color.fromARGB(255, 107, 96, 234),
                      ],
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6078ea).withOpacity(.3),
                        offset: const Offset(0.0, 8.0),
                        blurRadius: 8.0,
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        //llamamos a page_gestion
                        Navigator.of(context).pushNamed('/qrscan_page');
                      },
                      child: const Center(
                        child: Text(
                          'Escanea',
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
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1,
                  margin: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 55, 23, 234),
                        Color.fromARGB(255, 107, 96, 234),
                      ],
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6078ea).withOpacity(.3),
                        offset: const Offset(0.0, 8.0),
                        blurRadius: 8.0,
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        //llamamos a page_report
                        Navigator.of(context).pushNamed('/report_page');
                      },
                      child: const Center(
                        child: Text(
                          'Reporte de bienes',
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
        ),
        body: Center(
          child: _paginas[_paginaActual],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 45, 149, 241),
          onTap: (int index) {
            setState(() {
              _paginaActual = index;
            });
          },
          currentIndex: _paginaActual,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color.fromRGBO(14, 14, 15, 1),
              ),
              label: 'Resguardos',
              backgroundColor: Color.fromRGBO(14, 14, 15, 1),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_2, color: Color.fromRGBO(14, 14, 15, 1)),
              label: 'Qr Scan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task, color: Color.fromRGBO(14, 14, 15, 1)),
              label: 'Reportes',
            ),
          ],
          selectedItemColor: Color.fromARGB(255, 45, 149, 241),
        ));
  }
}
