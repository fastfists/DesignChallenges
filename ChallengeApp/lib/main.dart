import 'dart:async';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';


void main() {
  runApp(MyApp());
}

enum EventState {
  up,
  down,
  init,
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
        backgroundColor: Color(0xFFD7D0EF),
      ),
      home: MainPage(),
    );
  }
}

class EventModel {

  List<StreamController <EventState>> eventStreams;

  Stream<EventState> getStream(int i) {
    return eventStreams[i].stream;
  }

  changeTo(int j) {
    for(int i = 0; i<j+1; i++) {
      print("Going UP $i");
      eventStreams[i].add(EventState.up);
    }
    for(int i = j+1; i<3; i++) {
      print("Going Down $i");
      eventStreams[i].add(EventState.down);
    }
  }

  EventModel() {
    eventStreams = List<StreamController <EventState>>();
    for(int i =0; i<3; i++) {
      var controller = StreamController<EventState>();

      controller.add(EventState.init);

      eventStreams.add(controller);
    }
  }

  void dispose() {
    for(int i=0; i<3;i++){
      eventStreams[i].close();
    }
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        Provider<EventModel>( create: (_) => EventModel() ),
      ],
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Image.asset(
                  "assets/images/0804201608a.jpg",
                ),
              ),

              NameSection(),

              ChallengeSection(),

              PhotosSection(),

            ]
          ),
        ),
      ),
    );
  }
}

class PhotosSection extends StatelessWidget {
  const PhotosSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> pictures = List<String>();
    for( int i=0; i<8; i++) {
      pictures.add("assets/images/$i.jpg");
    }
    var size = MediaQuery.of(context).size;

    return Section(
      streamIndex: 2,
      initialChildSize: 0.40,
      minChildSize: 0.11,
      maxChildSize: 0.86,
      color: Colors.black,
      child: Wrap(
        children: [
          Row(
            children: [
              Text(
                "Photos",
                style: kBoldSub,
              ),
              Spacer(),
              Text(
                "/ 55",
                style: kStyleSecondary.copyWith(
                        color: kColorPurple),
              ),
            ],
          ),
          ...pictures.map((pic) {
            return Container(
              width: size.width *0.25,
              child: Image.asset(pic));
          }),
        ],
      )
    );
  }
}

class ChallengeSection extends StatelessWidget {
  const ChallengeSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Section(
      streamIndex: 1,
      initialChildSize: 0.65,
      minChildSize: 0.21,
      maxChildSize: 0.88,
      color: Color(0xFF5654FD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Text(
                "Avalible Challenges",
                style: kBoldSub,
              ),
              Positioned(
                right: 10,
                child: Text(
                  "/ 2",
                  style: kStyleSecondary.copyWith(fontSize: 15),
                ),
              ),
            ],
          ),
          FoodHeadline(
            title: "30 days of Health food",
            imageName: "assets/images/food.jpg",
            price: 30,
            date: DateTime(2020, 01, 03),
            buttonName: "Healthy Eating",
          ),
          FoodHeadline(
            title: "Healthy Habbits for a beautfiul body",
            imageName: "assets/images/food2.jpg",
            price: 15,
            date: DateTime(2020, 01, 04),
            buttonName: "Diet",
          ),
        ],
      )
    );
  }
}

class FoodHeadline extends StatelessWidget {
  final String title;
  final String imageName;
  final int price;
  final DateTime date;
  final String buttonName;

  const FoodHeadline({
    Key key, this.title, this.imageName, this.price, this.date, this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatter = DateFormat('M.dd.yyyy');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: Container(
            height: 150,
            child: Image.asset(
              imageName,
            ),
          )
        ),
        SizedBox(height: 10),
        Text(title,
            style: kBoldSub.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            )
        ),
        Row(
          children: [
            Text(
              formatter.format(date),
              style: kStyleGray,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "\$$price",
            ),
            Spacer(),
            FlatButton(
              onPressed:() {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple,
                ),
                padding: EdgeInsets.symmetric(horizontal:20, vertical: 10),
                child: Text(buttonName, style: kStyleGray)
              ),
            ),
          ]
        )
      ],
    );
  }
}

class NameSection extends StatelessWidget {
  const NameSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Section(
      streamIndex: 0,
      initialChildSize: 0.80,
      maxChildSize: 0.9,
      minChildSize: 0.30,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Text(
                "Edith Oyugi",
                style: kBoldMain,
              ),
              Positioned(
                right: -10,
                top: 10,
                child: Row(
                  children: [
                    Text(
                      "Show more",
                      style: kStyleSecondary,
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                ),
            ],
          ),
          SizedBox(height: 10),
          Text("Founder of Crescends Medical",
            style: kStyleSecondary,
          ),
          SizedBox(height: 30),
          Text("I can help you with your nutirion goals , weight loss, healthy eating, hearth health, "),
          SizedBox(height: 10),
          Text("Expertise Area", style: kStyleGray),
          Pills(
            pills: [
              "General Nutrition Wellness",
              "Weight Management",
              "Healthy Eating",
              "Sports Nutrition",
              "Diabetes",
              "Vegeterian Nutrition",
          ]),
          SizedBox(height: 30),
          Text("Design & Experience", style: kStyleGray),
          SizedBox(height: 10),
          Text("Received RDN and an MS degree in Nutrition from Colombia University, completed a dietetic internship at NYP Hospital in New York, a BS degree from Cornell University, and has over 10 years of consulting experience",
          )
        ],
      )
    );
  }
}

class Pills extends StatelessWidget {
  final List<String> pills;

  const Pills({
    Key key, this.pills,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: -10,
      children: [
        ...this.pills.map((pill) {
            return Chip(
                backgroundColor: Color(0xFFB7B9F9),
                label: Text(
                  pill,
                  style: kStyleGray.copyWith(
                           fontWeight: FontWeight.w500,
                           fontSize: 10,
                           color: Colors.black87
                            )
                ),
            );
        }
        )
      ]
    );
  }
}



class Section extends StatefulWidget {
  final Widget child;
  final Color color;

  final double initialChildSize;
  final double maxChildSize;
  final double minChildSize;
  final int streamIndex;

  Section({ Key key, this.child, this.color, this.initialChildSize, this.maxChildSize, this.minChildSize, this.streamIndex}) : super(key: key);

  @override
  _SectionState createState() => _SectionState();
}

class _SectionState extends State<Section> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    var map = {
      EventState.up : widget.maxChildSize,
      EventState.down : widget.minChildSize,
      EventState.init : widget.initialChildSize,
    };

    return Consumer<EventModel>(
      builder: (context, _eventModel, child) {
        return GestureDetector(
          onVerticalDragEnd: (details) => _eventModel.changeTo(widget.streamIndex),
          child: StreamBuilder<EventState>(
            stream: _eventModel.getStream(widget.streamIndex),
            builder: (context, snapshot) {
              switch(snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                    return Text("Loading");
                case ConnectionState.active:
                case ConnectionState.done:
                  print(snapshot.data);
                  return AnimatedContainer(
                        duration: Duration(milliseconds: 750),
                        height: size.height * map[snapshot.data],
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 35, bottom: 20, left: 20, right: 50),
                        decoration: BoxDecoration(
                            color: widget.color,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(100),
                            )
                          ),
                        child: widget.child
                      );
              }
              return Text("Who");
            }
          ),
        );
      }
    );
  }
}

