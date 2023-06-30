import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rmapp/IUs/all_bienes_page.dart';
import 'package:rmapp/IUs/gestion_page.dart';
import 'package:rmapp/IUs/setstate_page.dart';
import 'package:rmapp/servicios/constant.dart';
import 'IUs/bienes_page.dart';
import 'IUs/home_page.dart';
import 'IUs/qrscan_page.dart';
import 'IUs/report_page.dart';
import 'IUs/search_page.dart';

void main() async => runApp(RmApp());

String? rm_username;
String? rm_password;

class RmApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RmApp',
        home: LoginPage(),
        routes: <String, WidgetBuilder>{
          '/home_page': (BuildContext context) => HomePages(),
          '/login_page': (BuildContext context) => LoginPage(),
          '/bienes_page': (BuildContext context) => BienesPage(),
          '/gestion_page': (BuildContext context) => GestionPage(),
          '/report_page': (BuildContext context) => ReportPage(),
          '/search_page': (BuildContext context) => SearchPage(),
          '/qrscan_page': (BuildContext context) => Qrscan(),
          '/all_bienes_page': (BuildContext context) => AllBienesPage(),
          '/setstate_page': (BuildContext context) => setstatepage(),
        });
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String mensaje = '';

  Future login(BuildContext cont) async {
    if (usernameController.text == "" || passwordController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ingrese usuario y contraseña'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    } else {
      var url = Uri.parse(APIconstant.base_URL + APIconstant.rutaLogin);
      var response = await http.post(url, body: {
        "rm_username": usernameController.text,
        "rm_password": passwordController.text,
      });

      var data = json.decode(response.body);
      if (data == "Completado") {
        Navigator.of(cont).pushReplacementNamed('/home_page');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Bienvenido'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Usuario o contraseña incorrectos'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  //Desarrollo de la interfaz de la pagina de login

  @override
  Widget build(BuildContext) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/fondo.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 125.0),
                width: 250.0,
                height: 250.0,
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image(
                    width: 175,
                    height: 175,
                    image: AssetImage('assets/images/profile.png'),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      padding: const EdgeInsets.only(
                        top: 4.0,
                        left: 16.0,
                        right: 16.0,
                        bottom: 4.0,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5.0,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          hintText: 'Usuario',
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      margin: const EdgeInsets.only(top: 32),
                      padding: const EdgeInsets.only(
                        top: 4.0,
                        left: 16.0,
                        right: 16.0,
                        bottom: 4.0,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5.0,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          hintText: 'Contraseña',
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 3,
                      margin: const EdgeInsets.only(
                        top: 10.0,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF17ead9),
                            Color(0xFF6078ea),
                          ],
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50.0)),
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
                            login(context); /*llamamos a la home page*/
                          },
                          child: const Center(
                            child: Text(
                              'Iniciar Sesión',
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
