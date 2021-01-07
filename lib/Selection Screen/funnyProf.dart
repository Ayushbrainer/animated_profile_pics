import 'package:flutter/material.dart';
import 'package:movingprofpics/VideoP.dart';

String Category;
List<getVideo> p = [getVideo(vid: 0,category1: 'funny')];

class category {
  String cate;
  category({this.cate});

  void setCate() {
    Category = cate;
  }
}

class selScreen extends StatefulWidget {
  @override
  _selScreenState createState() => _selScreenState();
}

class _selScreenState extends State<selScreen> {
  getVideo d = getVideo(vid: 4, category1: 'funny');
  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 8; i++) {
      p.add(d);
    }
    for (int i = 0; i < 8; i++) {
      print(p[i].vid);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black,
      body: ListView.separated(
        itemCount: 8,
        itemBuilder: (context, index) {
//          if(index==0){
//            setlist();
//          }
          /*  p[index] = */ new getVideo(vid: index, category1: Category).setVal();
          return vidPlay();
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 50,
          );
        },
      ),
//      bottomNavigationBar: BottomNavigationBar(
//
//      ),
    );
  }
}
