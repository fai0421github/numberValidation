import 'package:checknumber/home.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/test.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: null /* add child content here */,
        ),
        Center(
          child: new CircularProgressIndicator(),
        )
      ],
    ));
  }
}
