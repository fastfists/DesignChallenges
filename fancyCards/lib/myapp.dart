import 'package:flutter/material.dart';

import 'main_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light, fontFamily: "Nunito"),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
