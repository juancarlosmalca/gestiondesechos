import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestiondesechos/constantes.dart';
import 'package:gestiondesechos/paginas_desechos/desechos2.dart';

class Desechos1 extends StatefulWidget {
  @override
  _Desechos1 createState() => _Desechos1();
}
class _Desechos1 extends State<Desechos1> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Paso 1'),
      ),
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
                      top: 20, left: size.width * .1, right: size.width * .02),
                  height: size.height * .45,
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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
/*                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Paso 1: ",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(fontSize: 28),
                          ),
                        ),*/
                        Container(
                          margin: EdgeInsets.only(top: 2),
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 0),
                          child: Text(
                            "Almacenamiento Primario",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 20,
                              //fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * .20 - 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/imagenes/desechos1.png',
                          width: 250, height: 250),
                      Container(
                        //width: this.size.width * .6,
                        padding: EdgeInsets.all(30),
                        alignment: Alignment.center,

                        child: Text(
                          "Es el lugar en donde se generan los desechos del paciente infectado, por ejemplo: mascarillas, servilletas, envolturas de comida, pañuelos desechables, etc.",
                          //maxLines: 5,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: kLightBlackColor,
                          ),
                        ),
                      ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Desechos2();
                          },
                        ),
                      );
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
                              "Siguiente",
                              style: TextStyle(
                                fontSize: 20,
                                color: kBlackColor,
                                fontWeight: FontWeight.bold,
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
