import 'dart:convert';
import 'package:GPGIDCovid19/main.dart';
import 'package:GPGIDCovid19/pantallas/principal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GPGIDCovid19/constantes.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Inicio extends StatefulWidget {
  @override
  _Inicio createState() => _Inicio();
}
SharedPreferences localStorage;
TextEditingController nombreCtrl = new TextEditingController();
TextEditingController provinciaCtrl = new TextEditingController();

Future<void>saved(String value) async{
final prefs=await SharedPreferences.getInstance();
await prefs.setString('nombre', value);
}
save() async{
  localStorage.setString('nombre', nombreCtrl.text.toString());
//localStorage.setString('provincia', provinciaCtrl.text.toString());
//localStorage.setString('genero', generoCtrl.text.toString());
}
class _Inicio extends State<Inicio> {
  GlobalKey<FormState> keyForm = new GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String dropdownValue = 'Chimborazo';
  var band = 0;
  int _radioValue = 0;
  String url = "http://ejemplo.warmibusiness.com/rest/usuario.php";

  Future<String>  enviardatos(String nombre, String ciudad, String provincia,
      String genero, String parroquia, int edad, String clave) async {
    Map data = {
      "nombre": "${nombre}",
      "ciudad": "${ciudad}",
      "provincia": "${provincia}",
      "parroquia": "${parroquia}",
      "genero": "${genero}",
      "edad": edad,
      "contrasenia": "${clave}"
    };
    String body = jsonEncode(data);
    print(body);
    http.Response respuesta = await http.post(
      url,
      headers: {"Content-Type": "text/html; charset=UTF-8"},
      body: body,
    );
    print(respuesta.statusCode);
    if (respuesta.statusCode == 200) {
      saved(nombre);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text("Usuario registrado"),
          content:
          Text("Gracias por registrarse"),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Principal();
                      },
                    ),
                  );


                  },
                child: Text("OK")),
          ],
        ),
      );
      /*Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/principal');*/
      return respuesta.body;

    }
  }


  TextEditingController generoCtrl = new TextEditingController();
  TextEditingController edadCtrl = new TextEditingController();
  TextEditingController emailCtrl = new TextEditingController();

  var _genero;
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          _genero = "Femenino";
          break;
        case 1:
          _genero = "Masculino";
          break;
      }
    });
  }

  String validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "El nombre es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "El nombre debe de ser a-z y A-Z";
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Ingrese la edad";
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * .30 - 100,
                      right: 50,
                      left: 50,
                      bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Form(
                          key: keyForm,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: TextFormField(
                                  enabled: true,
                                  controller: nombreCtrl,
                                  decoration: new InputDecoration(
                                    labelText: 'Nombre:',
                                  ),
                                  validator: validateName,
                                  style: new TextStyle(
                                      fontSize: 12.0,
                                      height: 1.0,
                                      color: Colors.black),
                                ),
                              ),
                              Container(
                                child: TextFormField(
                                  controller: edadCtrl,
                                  decoration: new InputDecoration(
                                    labelText: 'Edad',
                                  ),
                                  validator: validateMobile,
                                  style: new TextStyle(
                                      fontSize: 12.0,
                                      height: 1.0,
                                      color: Colors.black),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Género: ",
                                    style: new TextStyle(
                                        fontSize: 12.0,
                                        height: 1.0,
                                        color: Colors.black54),
                                  ),
                                  new Radio(
                                    value: 0,
                                    groupValue: _radioValue,
                                    onChanged: _handleRadioValueChange,
                                  ),
                                  new Text(
                                    'Femenino',
                                    style: new TextStyle(
                                        fontSize: 10.0,
                                        height: 1.0,
                                        color: Colors.black54),
                                  ),
                                  new Radio(
                                    value: 1,
                                    groupValue: _radioValue,
                                    onChanged: _handleRadioValueChange,
                                  ),
                                  new Text(
                                    'Masculino',
                                    style: new TextStyle(
                                        fontSize: 10.0,
                                        height: 1.0,
                                        color: Colors.black54),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Provincia: ",
                                    style: new TextStyle(
                                        fontSize: 12.0,
                                        height: 1.0,
                                        color: Colors.black54),
                                  ),
                                  DropdownButton<String>(
                                    hint: new Text('Seleccione'),
                                    value: dropdownValue,
                                    icon: Icon(Icons.arrow_drop_down),
                                    iconSize: 24,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        dropdownValue = newValue;
                                      });
                                    },
                                    items: <String>[
                                      'Chimborazo',
                                      'Tungurahua',
                                      'Cotopaxi',
                                      'Pichincha'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      GestureDetector(
                        onTap: () {
                          print("pulsando");

                          if (keyForm.currentState.validate()) {

                            print("validado");
                            enviardatos(
                                    nombreCtrl.text,
                                    "ciudad",
                                dropdownValue,
                                    _genero,
                                    "parroquia",
                                int.parse(edadCtrl.text),
                                    "clave");
                            print("Enviando registro");
                              //keyForm.currentState.reset();

                          } else {
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text('Campos requeridos'),
                              duration: Duration(seconds: 5),
                              action: SnackBarAction(
                                label: 'OK',
                                onPressed: () {
                                  _scaffoldKey.currentState
                                      .hideCurrentSnackBar();
                                },
                              ),
                            ));
                          }

                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
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
                          child: Text(
                            "Continuar",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: kBlackColor,
                            ),
                          ),
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
