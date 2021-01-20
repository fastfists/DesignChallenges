import 'package:flutter/material.dart';
import 'package:flutterapp/styles.dart';

class TopHalf extends StatefulWidget {
  const TopHalf({
    Key key,
  }) : super(key: key);

  @override
  _TopHalfState createState() => _TopHalfState();
}

class _TopHalfState extends State<TopHalf> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  void toggle() =>
      _controller.isDismissed ? _controller.forward() : _controller.reverse();

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [black, purple],
            )),
            height:
                (_controller.value * MediaQuery.of(context).size.height * .18) +
                    MediaQuery.of(context).size.height * 0.72,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 20),
            child: Column(
              children: <Widget>[
                FlatButton(
                  onPressed: toggle,
                  child: Text("hit me bigggg dadtty "),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 30),
                    Text(
                      "Today's Tidbits",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 7),
                    Text(
                      "April 24, 2019",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          Block(),
                          Block(),
                          Block(),
                          Block(),
                        ],
                      ),
                    ),
                    LiveIndicator(),
                  ],
                ),
              ],
            ),
          );
        });
  }
}

class LiveIndicator extends StatelessWidget {
  const LiveIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(70, 0, 0, 0),
          borderRadius: BorderRadius.circular(18),
        ),
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: <Widget>[
              Icon(
                Icons.stop,
                color: Color(0xffcf8bff),
                size: 10,
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                "live".toUpperCase(),
                style: TextStyle(
                  color: Color(0xffcf8bff),
                  fontSize: 10,
                ),
              ),
            ]),
            Text(
              "UI Design in 2018 is Getting ...",
              style: Theme.of(context).textTheme.headline5.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 22),
            ),
          ],
        ));
  }
}

class Block extends StatelessWidget {
  const Block({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            width: 200,
            height: 300,
            margin: EdgeInsets.only(right: 20),
            padding: EdgeInsets.all(13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Watch as Gary Simon Demonstrates how to Create a User Interface in Adobe XD",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                Text(
                  "At vero eos et et iusto odio ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia anim",
                  style: TextStyle(fontSize: 10),
                ),
              ],
            )),
        NameBar()
      ],
    );
  }
}

class NameBar extends StatelessWidget {
  const NameBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFDD92FF), borderRadius: BorderRadius.circular(12.0)),
      margin: EdgeInsets.only(top: 270, left: 20),
      width: 160,
      height: 50,
      child: Row(children: <Widget>[
        Spacer(),
        Icon(Icons.chat_bubble, color: Colors.white, size: 20),
        Text("44", style: TextStyle(color: Colors.white, fontSize: 11)),
        Spacer(),
        Icon(Icons.favorite, color: Colors.white, size: 20),
        Text("11", style: TextStyle(color: Colors.white, fontSize: 11)),
        Spacer(),
      ]),
    );
  }
}

