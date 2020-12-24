import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: SizedBox(
          width: 50,
          height: 50,
          child:
              Image.network("https://thispersondoesnotexist.com/image")),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: "Daily",
            icon: Icon(Icons.bolt),
          ),
          BottomNavigationBarItem(
            label: "Conversations",
            icon: Icon(Icons.sms_rounded),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.settings_cell),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Icon(Icons.menu),
            SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                child: Row(children: [
                  ProfilePicture(),
                ]),
              ),
            ),
            Icon(Icons.notifications),
          ]),
        ],
      ),
    );
  }
}
