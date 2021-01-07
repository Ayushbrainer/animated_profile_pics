import 'package:flutter/material.dart';

String name = "";
int image = 1;

class valueSetter {
  String name1;
  int image1;

  valueSetter({this.image1, this.name1});

  void valueSet() {
    name = name1;
    image = image1;
  }
}

class profCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0))),
          child: Image.asset(
            'videos/pics/${image}.jpg',
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.09,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0))),
          child: Center(
            child: Text(name.toUpperCase(),style: TextStyle(color: Colors.white),),
          ),
        )
      ],
    );
  }
}

