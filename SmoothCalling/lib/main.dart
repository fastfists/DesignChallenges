import 'package:flutter/material.dart';

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (ctx) => HomePage(),
      },
      initialRoute: '/',
    );
  }
}


class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        fit: StackFit.loose,
        children: [
          Container(
            height: size.height * 0.3,
            color: Colors.purple,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children : [
                Icon(Icons.circle),
                SizedBox(width: 30),
                Text(
                  "Edith Oyugi",
                  style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white)
                ),
              ]
            ),
          ),
          Positioned(
            top: size.height *0.25,
            left: size.width *0.42,
            child: Ink(
              decoration: ShapeDecoration(
                color: Colors.red,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(Icons.phone),
                onPressed:() => Navigator.of(context).pushNamed("/call"),
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: size.height*0.3,
            left: 0.0,
            child: Container(
              child: Column(
                children: [
                  Tile(
                    header: "Phone",
                    body: "203 343 7380",
                    icon: Icon(Icons.phone),
                  ),
                  Divider(),
                  Tile(
                    header: "Email",
                    body: "edithoyu@gmail.com",
                    icon: Icon(Icons.mail),
                  ),
                ]
              ),
            ),
          ),
        ],
      )
    );
  }
}

class Tile extends StatelessWidget {

  final Widget icon;
  final String header;
  final String body;

  const Tile({Key key, this.icon, this.header, this.body}): super(key : key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20),
        icon,
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(header,style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.black45)),
            SizedBox(height: 5),
            Text(body, style: Theme.of(context).textTheme.headline5),
          ]
        ),
      ]
    );
  }
}
