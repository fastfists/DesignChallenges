import 'package:flutter/material.dart';
import 'package:longwalks/constants.dart';

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
        scaffoldBackgroundColor: backgroundColor,
        iconTheme: IconThemeData(
          color: blueAccent,
        ),
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


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: "Daily",
            icon: Icon(Icons.wb_sunny),
          ),
          BottomNavigationBarItem(
            label: "Conversations",
            icon: Icon(Icons.sms_rounded),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: ProfilePicture(border: false),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopBar(),
              Weekdays(),
              DailyQuote(),
              SizedBox(height: 30),
              PersonCard(),
              SizedBox(height: 10),
              PersonCard(),
              SizedBox(height: 10),
              PersonCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class Weekdays extends StatelessWidget {
  const Weekdays({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Weekday(day: "Sun"),
    ]);
  }
}

class Weekday extends StatelessWidget {
  const Weekday({
    Key key,
    String day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ProfilePicture extends StatelessWidget {
  final bool border;

  const ProfilePicture({
    Key key,
    this.border = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (border) 
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
            ),

        CircleAvatar(
          radius: 20,
          backgroundColor: blueAccent,
          backgroundImage: NetworkImage("https://thispersondoesnotexist.com/image")),
      ],
    );
  }
}

class PersonCard extends StatelessWidget {
  const PersonCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.53,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 15),
          Row(children: <Widget>[
            ProfilePicture(border: true),
            SizedBox(width: 10),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Alex",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: blueAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("Now")
                ]),
            Spacer(),
            Icon(Icons.more_horiz),
          ]),
          Text.rich(TextSpan(
              text:
                  "My focus on this week is to ",
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: blueAccent, fontSize: 20, fontWeight: FontWeight.w400),
              children: <InlineSpan>[
                TextSpan(
                  text: "enjoy what nature has to offer",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: blueAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ])),
          SizedBox(height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                  "https://images.unsplash.com/photo-1533760881669-80db4d7b4c15?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzF8fGJlYWNofGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60")),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Icon(Icons.message_outlined),
              Spacer(),
              Icon(Icons.share),
            ]
          ),
        ],
      ),
    );
  }
}

class DailyQuote extends StatelessWidget {
  const DailyQuote({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Presence",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: blueAccent, fontWeight: FontWeight.w500)),
          Text("Every Monday, find focus",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: grayAccent, fontSize: 20))
        ],
      ),
    ]);
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(children: [
        Icon(Icons.menu),
        Spacer(),
        Container(
          child: Row(children: [
            ProfilePicture(),
          ]),
        ),
        Spacer(),
        Icon(Icons.notifications_outlined),
      ]),
    );
  }
}
