import 'package:flutter/material.dart';
import 'views/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        dividerTheme: DividerThemeData(
          color: Color.fromRGBO(255, 255, 255, 0.20),
          thickness: 2,
          endIndent: 50,
          indent: 50,
        ),
      ),
      routes: {
        "/search": (context) => SearchPage(),
      },
      initialRoute: '/search',
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hi"),
      ),
      body: Center(),
    );
  }
}
