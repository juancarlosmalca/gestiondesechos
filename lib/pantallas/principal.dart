import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestiondesechos/paginas_desechos/desechos.dart';
import 'package:gestiondesechos/paginas_desechos/desechos1.dart';
import 'package:gestiondesechos/constantes.dart';
import 'package:gestiondesechos/paginas_solucion/solucion.dart';
import 'package:gestiondesechos/paginas_solucion/solucion1.dart';

class Principal extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Principal> {
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
                         /* Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Manejodesechos();
                              },
                            ),
                          );*/
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
                                      text: "Video ",
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
                        /*  Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Manejodesechos();
                              },
                            ),
                          );*/
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
                                      text: "tus conocimientos",
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
                                      text: "Preparación ",
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
    Key key,
    this.size,
  }) : super(key: key);

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
