import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GPGIDCovid19/constantes.dart';
import 'package:GPGIDCovid19/paginas_desechos/desechos1.dart';
import 'package:http/http.dart';

class Juego extends StatefulWidget {
  @override
  _Juego createState() => _Juego();
}
class _Juego extends State<Juego> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  StreamController _streamControllerReserva;
  Stream _streamviajes;

  _opciones(String codigo) async {
    Response respuestaviaje =
    await get("http://ejemplo.warmibusiness.com/rest/opciones.php?id_test=$codigo");
    var jsonData = json.decode(respuestaviaje.body);
    //print(jsonData.toString());
    return jsonData;
  }

  _buscar() async {
    try {
      Response respuesta = await get(
          "http://ejemplo.warmibusiness.com/rest/test.php");
      // var jsonData =json.decode(respuesta.body);
      _streamControllerReserva.add(json.decode(respuesta.body));
    } catch (e){
      _scaffoldKey.currentState.hideCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Problemas con la cocnexion, intentelo más tardes"),
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            _scaffoldKey.currentState.hideCurrentSnackBar();
          },
        ),
      ));
    }
  }
// Declare this variable


  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  var selectedRadio = 0;
  var selectedRadioTile = 0;

  @override
  void initState() {
    super.initState();
    _streamControllerReserva = StreamController();
    _streamviajes = _streamControllerReserva.stream;

  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,

      appBar: AppBar(
        title: Text('Test'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _buscar();
                  },
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    margin: EdgeInsets.only(bottom: 16),
                    width: size.width - 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(38.5),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 33,
                          color: Color(0xFFD3D3D3).withOpacity(.84),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Spacer(),
                        Text(
                          "Empezar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: kBlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * .25 - 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        color: Colors.amber,
                        height: 500,
                        child: StreamBuilder(
                          stream: _streamviajes,
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            print(snapshot.data);
                            if (snapshot.data != null) {
                              return ListView.separated(
                                separatorBuilder: (context, index) => Divider(color: Colors.black12),
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    subtitle: Container(
                                      color: Colors.green,
                                      height: 150,
                                      child: FutureBuilder(
                                          future: _opciones(snapshot.data[index]["id_test"].toString()),
                                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                                            if (snapshot.hasData) {
                                              //print("snapshot.data");
                                              //print(snapshot.data);
                                              return ListView.separated(
                                                  separatorBuilder: (context, index) => Divider(color: Colors.black12),
                                                  itemCount: snapshot.data.length,
                                                itemBuilder: (BuildContext context, int index) {
                                                    return RadioListTile (
                                                      value: 2,
                                                      groupValue: selectedRadioTile,
                                                      subtitle: Text("Radio 2 Subtitle"),
                                                      onChanged: (val) {
                                                        print("Radio Tile pressed $val");
                                                        setSelectedRadioTile(val);
                                                      },
                                                      activeColor: Colors.red,
                                                      secondary: OutlineButton(
                                                        child: Text("Say Hi"),
                                                        onPressed: () {
                                                          print("Say Hello");
                                                        },
                                                      ),
                                                      selected: false,
                                                      title: Text(
                                                        snapshot.data[index]["descripcion"].toString(),
                                                      ),
                                                    );
                                                },
                                              );
                                            } else {
                                              return Center(
                                                child: CircularProgressIndicator(),
                                              );
                                            }
                                          }),
                                    ),
                                    title: Text(
                                      snapshot.data[index]["pregunta"]
                                          .toString(),
                                      style: TextStyle(fontSize: 11),
                                    ),

                                    onTap: () {

                                    },
                                  );
                                },
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),

                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  int id_opciones;
  String descripcion;
  int id_test;

  User({this.id_opciones, this.descripcion, this.id_test});
  User.fromJson(Map json)
      : id_opciones = json['id_opciones'],
        descripcion = json['descripcion'],
        id_test = json['id_test'];

  Map toJson() {
    return {'id': id_opciones, 'name': descripcion, 'email': id_test};
  }
}