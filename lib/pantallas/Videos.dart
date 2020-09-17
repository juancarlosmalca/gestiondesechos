import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class Videos extends StatefulWidget {
  @override
  _Videos createState() => _Videos();
}

class _Videos extends State<Videos> {
  VideoPlayerController _controller1;
  Future<void> _initializeVideoPlayerFuture1;
  VideoPlayerController _controller2;
  Future<void> _initializeVideoPlayerFuture2;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller1 = VideoPlayerController.network(
      'https://warmibusiness.com/wp-content/uploads/2020/09/video2.mp4',
    );
    _controller2 = VideoPlayerController.network(
      'https://warmibusiness.com/wp-content/uploads/2020/09/video2.mp4',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture1 = _controller1.initialize();
    _initializeVideoPlayerFuture2 = _controller2.initialize();

    // Use the controller to loop the video.
    _controller1.setLooping(true);
    _controller2.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Videos'),
      ),
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture1,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the VideoPlayerController has finished initialization, use
                    // the data it provides to limit the aspect ratio of the video.
                    return Column(
                        //mainAxisAlignment: ,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 2),
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 0),
                            child: Text(
                              "Video Guía para la gestión interna de desechos - Covid 19",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 20,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: _controller1.value.aspectRatio,
                            // Use the VideoPlayer widget to display the video.
                            child: VideoPlayer(_controller1),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              // Wrap the play or pause in a call to `setState`. This ensures the
                              // correct icon is shown.
                              setState(() {
                                // If the video is playing, pause it.
                                if (_controller1.value.isPlaying) {
                                  _controller1.pause();
                                } else {
                                  // If the video is paused, play it.
                                  _controller1.play();
                                }
                              });
                            },
                            // Display the correct icon depending on the state of the player.
                            child: Icon(
                              _controller1.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                          ),
                        ]);
                  } else {
                    // If the VideoPlayerController is still initializing, show a
                    // loading spinner.
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Container(
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture2,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the VideoPlayerController has finished initialization, use
                    // the data it provides to limit the aspect ratio of the video.
                    return Column(
                        //alignment: Alignment.topCenter,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 2),
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 0),
                            child: Text(
                              "Video Guía para la preparación de desinfectante",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 20,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: _controller2.value.aspectRatio,
                            // Use the VideoPlayer widget to display the video.
                            child: VideoPlayer(_controller2),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              // Wrap the play or pause in a call to `setState`. This ensures the
                              // correct icon is shown.
                              setState(() {
                                // If the video is playing, pause it.
                                if (_controller2.value.isPlaying) {
                                  _controller2.pause();
                                } else {
                                  // If the video is paused, play it.
                                  _controller2.play();
                                }
                              });
                            },
                            // Display the correct icon depending on the state of the player.
                            child: Icon(
                              _controller2.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                          ),
                        ]);
                  } else {
                    // If the VideoPlayerController is still initializing, show a
                    // loading spinner.
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
