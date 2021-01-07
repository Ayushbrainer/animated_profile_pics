import 'package:flutter/material.dart';
import 'package:movingprofpics/DrawerUI/profilePic.dart';
import 'package:video_player/video_player.dart';

int video;
String category = "funny";
IconData icon = Icons.play_arrow_rounded;

class getVideo {
  int vid;
  String category1;
  getVideo({this.vid, this.category1});

  void setVal() {
    video = vid;
    category = category1;
  }
}



class vidPlay extends StatefulWidget {
  @override
  _vidPlayState createState() => _vidPlayState();
}

class _vidPlayState extends State<vidPlay> {
  VideoPlayerController _controller;
  Future<void> _initialiseVideoPlayer;

  @override
  void initState() {
    // TODO: implement initState
    _controller = VideoPlayerController.asset('videos/$category/$video.mp4');
    _initialiseVideoPlayer = _controller.initialize();
    _controller.pause();
    _controller.setVolume(5.6);
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            FutureBuilder(
              future: _initialiseVideoPlayer,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                );
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Center(
                  child: InkWell(
                    child: Icon(icon,color: Colors.white,),
                    onTap: () {
                      setState(() {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                          icon = Icons.play_arrow_rounded;
                        } else {
                          _controller.play();
                          icon = Icons.pause_circle_filled;
                        }
                      });
                    },
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 20,),
        RaisedButton(
          color: Colors.purple,
            child: Text("Set This Profile Picture"),
          onPressed: (){
            setState(() {
              print(_controller.dataSource);
              getVid(vid: _controller.dataSource).setVal();
            });
          },
        )
      ],
    );
  }
}
