import 'package:flutter/material.dart';
import 'package:fancyLogin/constants.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children: [
        Text("EMail"),
        Text("Password"),
        Text("FOrotPassowrd?"),
      ])),
    );
  }
}
