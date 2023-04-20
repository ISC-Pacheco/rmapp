import 'dart:async';
import 'dart:convert';
import 'package:mysql1/mysql1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'DataTableBienes.dart';

void main() => runApp(RmApp());

String? rm_username;

class RmApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RmApp',
        home: LoginPage(),
        routes: <String, WidgetBuilder>{
          '/DataTableBienes': (BuildContext context) => DataTableBienes(),
          '/login_page': (BuildContext context) => LoginPage(),
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

  Future<List> login() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
        host: 'localhost', port: 3306, user: 'root', db: "prueba_tec"));
    final response = await http.post(conn as Uri, body: {
      "rm_username": usernameController.text,
      "rm_password": passwordController.text,
    });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        mensaje = "Usuario o contraseña incorrectos";
      });
    } else {
      if (datauser[0]['rm_username'] == usernameController.text) {
        Navigator.of(context).pushReplacementNamed('/home_pages');
      }
      setState(() {
        usernameController = datauser[0]['rm_username'];
      });
    }
    return datauser;
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          right: 32.0,
                        ),
                        child: const Text(
                          'Olvidaste tu contraseña?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.0,
                          ),
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
                            login(); //llamamos a la funcion login
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
