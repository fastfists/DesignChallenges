import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:longwalks/widgets/BottomNavBar.dart';
import 'package:longwalks/widgets/Weekdays.dart';
import 'package:longwalks/widgets/TopBar.dart';
import 'widgets/PersonCard.dart';

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
      bottomNavigationBar: BottomNavBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopBar(),
              SizedBox(height: 20),
              Weekdays(),
              SizedBox(height: 30),
              DailyQuote(),
              SizedBox(height: 80),

              // Person Cards

              PersonCard(
              ),
            ],
          ),
        ),
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

