import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movingprofpics/DrawerUI/profilePic.dart';
import 'package:movingprofpics/Selection%20Screen/funnyProf.dart';
import 'package:movingprofpics/mainScreenCards/mainCard.dart';
import 'package:movingprofpics/profClasses/mainScreenList.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
      home: homeScr(),
    ));

class homeScr extends StatefulWidget {
  homeScr({Key key}) : super(key: key);

  @override
  _homeScrState createState() => _homeScrState();
}

class _homeScrState extends State<homeScr> {
  List<mainProfClass> homeScreen = [
    mainProfClass(categoryshown: "Funny Profiles", categoryPic: 1, category: "funny"),
    mainProfClass(categoryshown: 'Sad Profiles', categoryPic: 0, category: "sad")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Animated Profile Pic"),
        backgroundColor: Colors.black87,
        elevation: 0.0,
      ),
      backgroundColor: Colors.black,
      drawer: Drawer(
        elevation: 20,
        child: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [profPic()],
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: homeScreen.length,
        itemBuilder: (context, index) {
          valueSetter(
                  image1: homeScreen[index].categoryPic,
                  name1: homeScreen[index].category)
              .valueSet();
          return InkWell(
            child: profCard(),
            onTap: () {
              setState(() {
                category(cate: homeScreen[index].category).setCate();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => selScreen()));
              });
            },
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
      ),
    );
  }
}
