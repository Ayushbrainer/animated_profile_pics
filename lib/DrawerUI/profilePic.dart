import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:video_player/video_player.dart';

String video = 'videos/funny/6.mp4';

class getVid{
  String vid;
  getVid({@required this.vid});

  void setVal(){
    video = vid;
  }
}

class vidPlay extends StatefulWidget {
  vidPlay({Key key}) : super(key: key);

  @override
  _vidPlayState createState() => _vidPlayState();
}

class _vidPlayState extends State<vidPlay> {
  VideoPlayerController _controller;
  Future<void> _initialiseVideoPlayer;

  @override
  void initState() {
    // TODO: implement initState
    print('video/$video');
    _controller = VideoPlayerController.asset('$video');
    _initialiseVideoPlayer = _controller.initialize();
    _controller.play();
    _controller.setVolume(0);
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tight(Size(200, 200)),
      width: 200.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: FutureBuilder(
        future: _initialiseVideoPlayer,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ClipOval(
            child: VideoPlayer(_controller),
            clipBehavior: Clip.antiAlias
          );
        },
      ),
    );
  }
}


class profPic extends StatelessWidget {
  const profPic({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200.0,
        height: 200.0,
        constraints: BoxConstraints.tight(Size(200, 200)),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.cyan),
        child: Center(
          child: Center(child: vidPlay()),
          // child: Icon(
          //   Icons.person,
          //   color: Colors.white,
          //   size: 100.0,
          // ),
        ));
  }
}




