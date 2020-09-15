import 'dart:convert';
import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}
class _RegisterPageState extends State<Registro> {
  GlobalKey<FormState> keyForm = new GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _email;
  String _clave;
  bool _isregistering = false;
  bool boxValue = false;
  _resgister() async {
    if (_isregistering) return;
    setState(() {
      _isregistering = true;
    });
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Registrando Usuario'),
      duration: Duration(seconds: 5),
    ));

    final form = keyForm.currentState;
    if (!form.validate()) {
      _scaffoldKey.currentState.hideCurrentSnackBar();
      setState(() {
        _isregistering = false;
      });
      return;
    }
    form.save();
    save();
    try {
      //await FirebaseAuth.instance.createUserWithEmailAndclave(email: _email, clave: _clave);
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Usuario Registrado'),
        duration: Duration(seconds: 5),
      ));
      Navigator.of(context).pushReplacementNamed('/Principal');
    } catch (e) {
      _scaffoldKey.currentState.hideCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
            e.message + 'ERROR al registrar Usuario: Intentelo mas tarde!'),
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            _scaffoldKey.currentState.hideCurrentSnackBar();
          },
        ),
      ));
    } finally {
      setState(() {
        _isregistering = false;
      });
    }
  }
var _genero;
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          _genero = "Masculino";
          break;
        case 1:
          _genero = "Femenino";
          break;
      }
    });
  }


  Future<String> enviardatos(String nombre, String provincia, String genero,
      String edad, String email) async {
    Map data = {
      "NombreUsuario": "${nombre}",
      "provinciaUsuario": "${provincia}",
      "generoUsuario": "${genero}",
      "EmailUsuario": "${email}",
      "edadUsuario": "${edad}}"
    };
    String body = jsonEncode(data);
/*
    var respuesta= await http.post(url, headers: <String, String>{"Content-Type": "application/json"}, body: body,);
    if(respuesta.statusCode==201){
      return respuesta.body;
    }
    return "A ocurrido un error en el registro, intentelo nuevamente";
*/
  }

  /* String urls="http://informacion.somee.com/api/Destinos";
  Future<String> creaedestino(String nombre) async{
    var respuest= await http.post(urls, headers: <String, String>{"Content-Type": "application/json",},
      body: jsonEncode({"NombreDestino": nombre}),);
    print(respuest.body);
    print("Usuario en registro");
    return respuest.body;

  }*/
  int _radioValue = 0;

  TextEditingController nombreCtrl = new TextEditingController();
  TextEditingController provinciaCtrl = new TextEditingController();
  TextEditingController generoCtrl = new TextEditingController();
  TextEditingController edadCtrl = new TextEditingController();
  TextEditingController emailCtrl = new TextEditingController();


  //final heards = Heard('images/registro.jpg','Registro', 'Es importante su registro');
  @override
  Widget build(BuildContext context) {
    //nombreCtrl.text="Nombre: Juan Carlos ";
    return Scaffold(
        key: _scaffoldKey,
        body: new CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            title: Text("data"),
            backgroundColor: Colors.black,
            expandedHeight: 150.0,
            floating: true,
            pinned: true,
            snap: true,
            /*flexibleSpace: FlexibleSpaceBar(
                  background: MyFlexiableAppBar(),
                ),*/
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Container(
                //color: Colors.red,
                margin: new EdgeInsets.all(20.0),
                child: new Form(
                  key: keyForm,
                  child: formUI(),
                ),
              ),
            ]),
          ),
        ]));
  }

  Widget formUI() {
    return Column(
      children: <Widget>[
        Container(
          height: 60,
          child: TextFormField(
            enabled: true,
            controller: nombreCtrl,
            decoration: new InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.blue[900],
                size: 15,
              ),
              labelText: 'Nombre:',
            ),
            maxLength: 30,
            validator: validateName,
            style:
                new TextStyle(fontSize: 12.0, height: 1.0, color: Colors.black),
          ),
        ),

        Divider(),
        Text("Género"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Radio(
              value: 0,
              groupValue: _radioValue,
              onChanged: _handleRadioValueChange,
            ),
            new Text('Femenino'),
            new Radio(
              value: 1,
              groupValue: _radioValue,
              onChanged: _handleRadioValueChange,
            ),
            new Text('Masculino'),
          ],
        ),
        Container(
          height: 60,
          child: TextFormField(
            controller: edadCtrl,
            decoration: new InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.calendar_today),
              labelText: 'Edad',
            ),
            //keyboardType: TextInputType.phone,
            maxLength: 10,
            validator: validateMobile,
            style:
                new TextStyle(fontSize: 12.0, height: 1.0, color: Colors.black),
          ),
        ),
        Container(
          height: 60,
          child: TextFormField(
            controller: provinciaCtrl,
            decoration: new InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.location_on),
              labelText: 'Provincia: ',
            ),
            maxLength: 30,
            validator: validateprovincia,
            style:
            new TextStyle(fontSize: 12.0, height: 1.0, color: Colors.black),
          ),
        ),
        Container(
          height: 60,
          child: TextFormField(
            controller: emailCtrl,
            decoration: new InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
              labelText: 'Email',
            ),
            keyboardType: TextInputType.emailAddress,
            maxLength: 32,
            validator: validateEmail,
            style:
                new TextStyle(fontSize: 12.0, height: 1.0, color: Colors.black),
            onSaved: (validateEmail) {
              setState(() {
                _email = validateEmail;
              });
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            //save();
            _resgister();
            //Navigator.pushNamed(context, '/Principal');
            // Navigator.of(context).pop();
          },
          child: Container(
            margin: new EdgeInsets.only(
                left: 1.0, right: 1.0, bottom: 2.0, top: 30.0),
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              gradient: LinearGradient(colors: [
                Color(0xFF203573),
                Color(0xFF000000),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Text("Continuar",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
            padding: EdgeInsets.only(top: 10, bottom: 10),
          ),
        )
      ],
    );
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

  String validateprovincia(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "El provincia es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "El provincia debe de ser a-z y A-Z";
    }
    return null;
  }

  String validategenero(String value) {
    String pattern = r'(^[0-9])';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "La genero es necesaria";
    } else if (!regExp.hasMatch(value)) {
      return "La genero debe de ser a-z y A-Z";
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

  String validateEmail(String value) {
    _scaffoldKey.currentState.hideCurrentSnackBar();

    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('El correo es necesario'),
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            _scaffoldKey.currentState.hideCurrentSnackBar();
          },
        ),
      ));
      return "El correo es necesario";
    } else if (!regExp.hasMatch(value)) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Correo invalido'),
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            _scaffoldKey.currentState.hideCurrentSnackBar();
          },
        ),
      ));
      return "Correo invalido";
    } else {
      return null;
    }
  }

  save() {
    if (keyForm.currentState.validate()) {
      print("Nombre ${nombreCtrl.text}");
      print("provincia ${provinciaCtrl.text}");
      print("genero ${generoCtrl.text}");
      print("edad ${edadCtrl.text}");
      //print("Correo ${emailCtrl.text}");

      if (enviardatos(nombreCtrl.text, provinciaCtrl.text, generoCtrl.text, edadCtrl.text,
          emailCtrl.text) !=
          null) {
        print("Registro Exitoso");
        //keyForm.currentState.reset();
      } else {
        print("vaciar form ");
      }
    }
  }
}
