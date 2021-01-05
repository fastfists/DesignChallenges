import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:snapchat/widgets/buttons.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(gradient: backgroundGradient),
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: <Widget>[
                SnapChatButton(
                  context,
                  name: "Recent",
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text(
                    "Trending Lenses",
                    style: whiteTextStyle(context),
                  ),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text(
                    "Popular Games and Minus",
                    style: whiteTextStyle(context),
                  ),
                  onPressed: () {},
                ),
              ]),
            ),
            SizedBox(height: 35),
            SnapchatContainer(
              child: Row(children: [
                Spacer(),
                SnapChatSquare(
                    title: 'Edith Ford',
                    image: AssetImage("assets/images/women_of_year.png")),
                Spacer(),
                SnapChatSquare(
                    title: 'Edith Ford',
                    image: AssetImage("assets/images/women_of_year.png")),
                Spacer(),
                SnapChatSquare(
                    title: 'Edith Ford',
                    image: AssetImage("assets/images/women_of_year.png")),
                Spacer(),
              ]),
            ),
            SizedBox(height: 20),
            Text("Games and Minis",
                style: whiteTextStyle(context).copyWith(fontSize: 20.0)),
            SizedBox(height: 5),
            SnapchatContainer(
              child: Row(children: [
                Spacer(),
                SnapChatSquare(
                    title: 'Edith Ford',
                    image: AssetImage("assets/images/women_of_year.png")),
                Spacer(),
                SnapChatSquare(
                    title: 'Edith Ford',
                    image: AssetImage("assets/images/women_of_year.png")),
                Spacer(),
                SnapChatSquare(
                    title: 'Edith Ford',
                    image: AssetImage("assets/images/women_of_year.png")),
                Spacer(),
              ]),
            ),
            SizedBox(height: 20),
            Text("Popular Snap Stars",
                style: whiteTextStyle(context).copyWith(fontSize: 20.0)),
            SizedBox(height: 5),
          ],
        ),
      ),
    ));
  }
}

class SnapChatSquare extends StatelessWidget {
  final ImageProvider<Object> image;
  final String title;

  const SnapChatSquare({
    Key key,
    @required this.image,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnapchatContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(255, 255, 255, 0.70),
                    Color(0x00FFFFFF),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
              ),
              CircleAvatar(backgroundImage: image),
            ],
          ),
          SizedBox(height: 6),
          Text(
            title,
            style: whiteTextStyle(context),
          ),
        ],
      ),
    );
  }
}

class SnapchatContainer extends StatelessWidget {
  final Widget child;
  const SnapchatContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 7, sigmaX: 7),
        child: Stack(fit: StackFit.loose, children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 255, 255, 1),
                    Color(0x00FFFFFF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(255, 255, 255, 0.15)),
          ),
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 0.5),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.56),
                      Color(0x00FFFFFF),
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  )),
              child: child)
        ]),
      ),
    );
  }
}
