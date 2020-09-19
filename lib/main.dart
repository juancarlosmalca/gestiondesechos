import 'dart:async';
import 'package:GPGIDCovid19/pantallas/inicio.dart';
import 'package:flutter/material.dart';
import 'package:GPGIDCovid19/pantallas/informacion.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pantallas/principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}
 class MyHomePageState extends State<MyApp> {
   Widget _rootpage= Inicio();
   Future<Widget> getRootPage() async {
    final prefs = await SharedPreferences.getInstance();
    final nombre = prefs.getString('nombre');
    print("nombre");
    print(nombre);
    if (nombre == null) {
       return Inicio();
    } else {
      return Principal();
    }
  }
   @override
    void initState() {
      super.initState();
      getRootPage().then((Widget page){
        setState((){
          print(getRootPage().toString());
          _rootpage=page;
        });
      });
    }
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        initialRoute: '/',
        routes: {
          // Cuando naveguemos hacia la ruta "/", crearemos el Widget FirstScreen
          '/informacion': (context) => informacion(),
          '/principal': (context) => Principal(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //backgroundColor: Color(0xFFf7f7f7),
        home: _rootpage,
      );
    }
  }

class _Opcion1 extends StatefulWidget {
  @override
  Opcion1 createState() => Opcion1();
}

class Opcion1 extends State<_Opcion1> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
            () =>
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (BuildContext context) => Inicio())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
            'assets/imagenes/logomsp.png', width: 250, height: 250),
      ),
    );
  }
}

