import 'package:GPGIDCovid19/pantallas/juego.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GPGIDCovid19/paginas_desechos/desechos.dart';
import 'package:GPGIDCovid19/constantes.dart';
import 'package:GPGIDCovid19/paginas_solucion/solucion.dart';
import 'package:GPGIDCovid19/pantallas/Videos.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Principal extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Principal> {
  deletedata() async {
    final prefs = await SharedPreferences.getInstance();
    final nombre = prefs.getString('nombre');
    print("nombre");
    print(nombre);
    if (nombre == null) {
      print("nombre");
      print(nombre);
    } else {
      prefs.remove("nombre");
    }
  }
  GlobalKey<FormState> keyForm = new GlobalKey();

  String dropdownValue = 'Chimborazo';
  var band=0;
  int _radioValue = 0;

  TextEditingController nombreCtrl = new TextEditingController();
  TextEditingController provinciaCtrl = new TextEditingController();
  TextEditingController generoCtrl = new TextEditingController();
  TextEditingController edadCtrl = new TextEditingController();
  TextEditingController emailCtrl = new TextEditingController();

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
  createDialog(BuildContext context){
    TextEditingController nombreCtrl = new TextEditingController();
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("data"),
        content: TextFormField(
          enabled: true,
          controller: nombreCtrl,
          decoration: new InputDecoration(
            labelText: 'Nombre:',
          ),
          validator: validateName,
          style: new TextStyle(fontSize: 12.0, height: 1.0, color: Colors.black),
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("CANCELAR")),
          FlatButton(
              onPressed: () {
              },
              child: Text("RESTABLECER")),
        ],

      );
    });
    
  }

  _registro() {
    print("intenta");
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
        content: Form(
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
              style: new TextStyle(fontSize: 12.0, height: 1.0, color: Colors.black),
            ),
          ),
          Container(
            child: TextFormField(
              controller: edadCtrl,
              decoration: new InputDecoration(
                labelText: 'Edad',
              ),
              validator: validateMobile,
              style: new TextStyle(fontSize: 12.0, height: 1.0, color: Colors.black),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Género: ",
                style: new TextStyle(fontSize: 12.0, height: 1.0, color: Colors.black54),
              ),
              new Radio(
                value: 0,
                groupValue: _radioValue,
                onChanged: _handleRadioValueChange,
              ),
              new Text('Femenino',
                style: new TextStyle(fontSize: 10.0, height: 1.0, color: Colors.black54),
              ),
              new Radio(
                value: 1,
                groupValue: _radioValue,
                onChanged: _handleRadioValueChange,
              ),
              new Text('Masculino',
                style: new TextStyle(fontSize: 10.0, height: 1.0, color: Colors.black54),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Provincia: ",
                style: new TextStyle(fontSize: 12.0, height: 1.0, color: Colors.black54),
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
                items: <String>['Chimborazo', 'Tungurahua', 'Cotopaxi', 'Pichincha']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
        )
        ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("CANCELAR")),
              FlatButton(
                  onPressed: () {
                  },
                  child: Text("RESTABLECER")),
            ],
      )
      );
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(

                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(
                        top: size.height * .12,
                        left: size.width * .1,
                        right: size.width * .02),
                    height: size.height * .48,
                    decoration: BoxDecoration(
                      //color: Colors.blue,
                      image: DecorationImage(
                        image: AssetImage("assets/imagenes/bg.png"),
                        fit: BoxFit.fitWidth,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: BookInfo(
                      size: size,
                    )),
                Padding(
                  padding: EdgeInsets.only(top: size.height * .48 - 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Desechos();
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
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
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Manejo desechos ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Covid-19",
                                      style: TextStyle(color: kLightBlackColor),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Solucion();
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
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
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Preparación de",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " Desinfectante",
                                      style: TextStyle(color: kLightBlackColor),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Videos();
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
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
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Videos",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Tutoriales",
                                      style: TextStyle(color: kLightBlackColor),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Juego();
                              },
                            ),
                          );

                          //deletedata();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
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
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Prueba ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "de conocimientos",
                                      style: TextStyle(color: kLightBlackColor),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              ),
                            ],
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

class BookInfo extends StatelessWidget {
  const BookInfo({
    this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Manejo de desecho",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: this.size.height * .005),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 0),
                    child: Text(
                      "Covid-19",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: this.size.width * .4,
                            padding:
                                EdgeInsets.only(top: this.size.height * .02),
                            child: Text(
                              "Si estas al cuidado de un paciente que se encuentra realizando su aislamiento domiciliario por COVID -19 es tu responsabilidad realizar la gestión adecuada de desechos, por eso te presentamos la siguiente guía.",
                              //maxLines: 5,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: kLightBlackColor,
                              ),
                            ),
                          ),
/*                          Container(
                            margin:
                                EdgeInsets.only(top: this.size.height * .015),
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                "Leer más",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          )*/
                        ],
                      ),
                    ],
                  )
                ],
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.transparent,
                child: Image.asset(
                  "assets/imagenes/desechos.png",
                  height: double.infinity,
                  alignment: Alignment.topRight,
                  fit: BoxFit.fitWidth,
                ),
              )),
        ],
      ),
    );
  }
}
