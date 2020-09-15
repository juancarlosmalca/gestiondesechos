
//import 'package:artour/Home.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

class informacion extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<informacion> {
  VideoPlayerController _controller;
  @override
  void initState() {
    _controller = VideoPlayerController.network('audios/video_intro.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.play();
    _controller.setLooping(true);
    super.initState();
    _controller.setVolume(90.0);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("imagenes/portada1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                //height: 300,
                //color: Colors.red,
                child: Icon(Icons.cancel),
              ),
              Container(
                height: 300,
                //color: Colors.blue,
                child: Icon(Icons.cancel),
              ),
              Positioned(
                left: 16.0,
                right: 16.0,
                bottom: 16.0,
                child: Text(
                  'Descripcion',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ) /* add child content here */,
        ),
                    //ProductTitleWithImage(product: product)

    );
  }
}


