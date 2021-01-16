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
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: TextFormField(
                        style: whiteTextStyle(context).copyWith(fontSize: 14.0),
                        decoration: InputDecoration(
                          fillColor: Color.fromRGBO(255, 255, 255, 0.56),
                          filled: true,
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                          hintText: "Search ...",
                        )),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Cancel", style: whiteTextStyle(context))),
              ],
            ),
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
            SizedBox(height: 15),
            SnapChatContainer(
              child: Row(children: [
                Spacer(),
                SnapChatSquare(
                    title: 'Edith Ford',
                    subtitle: 'ye ye',
                    image: AssetImage("assets/images/my_women_of_year.png")),
                Spacer(),
                SnapChatSquare(
                    title: 'Edith Ford',
                    image: AssetImage("assets/images/my_women_of_year.png")),
                Spacer(),
                SnapChatSquare(
                    title: 'Edith Ford',
                    image: AssetImage("assets/images/my_women_of_year.png")),
                Spacer(),
              ]),
            ),
            SizedBox(height: 30),
            Text("Games and Minis",
                style: whiteTextStyle(context).copyWith(fontSize: 20.0)),
            SizedBox(height: 5),
            SnapChatContainer(
              child: Row(children: [
                Spacer(),
                SnapChatSquare(
                    title: 'Edith Ford',
                    image: AssetImage("assets/images/my_women_of_year.png")),
                Spacer(),
                SnapChatSquare(
                    title: 'Edith Ford',
                    image: AssetImage("assets/images/my_women_of_year.png")),
                Spacer(),
                SnapChatSquare(
                    title: 'Edith Ford',
                    image: AssetImage("assets/images/my_women_of_year.png")),
                Spacer(),
              ]),
            ),
            SizedBox(height: 20),
            Text("Popular Snap Stars",
                style: whiteTextStyle(context).copyWith(fontSize: 20.0)),
            SizedBox(height: 10),
            SnapChatContainer(
                child: Column(children: [
              SnapChatTile(
                  image: AssetImage("assets/images/my_women_of_year.png"),
                  trailing: SnapChatButton(context,
                      name: "Subscribe", onPressed: () {}),
                  title: "Edith Oyugi",
                  subtitle: "Silver Crescends"),
              Divider(),
              SnapChatTile(
                  image: AssetImage("assets/images/my_women_of_year.png"),
                  trailing: SnapChatButton(context,
                      name: "Subscribe", onPressed: () {}),
                  title: "Edith Oyugi",
                  subtitle: "Silver Crescends"),
              Divider(),
              SnapChatTile(
                  image: AssetImage("assets/images/my_women_of_year.png"),
                  trailing: SnapChatButton(context,
                      name: "Subscribe", onPressed: () {}),
                  title: "Edith Oyugi",
                  subtitle: "Silver Crescends"),
              Divider(),
              SnapChatTile(
                  image: AssetImage("assets/images/my_women_of_year.png"),
                  trailing: SnapChatButton(context,
                      name: "Subscribe", onPressed: () {}),
                  title: "Edith Oyugi",
                  subtitle: "Silver Crescends"),
              // Divider(),
            ])),
          ],
        ),
      ),
    ));
  }
}

class SnapChatTile extends StatelessWidget {
  final ImageProvider image;
  final Widget trailing;
  final String title;
  final String subtitle;

  const SnapChatTile({
    Key key,
    this.image,
    this.trailing,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: SnapChatCircle(
            image: AssetImage("assets/images/my_women_of_year.png")),
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Edith Oyugi", style: whiteTextStyle(context)),
              Text("Silver Crescends",
                  style: whiteTextStyle(context)),
            ]),
        trailing: SnapChatButton(context,
            name: "Subscribe", onPressed: () {}));
  }
}

class SnapChatSquare extends StatelessWidget {
  final ImageProvider<Object> image;
  final String title;
  final String subtitle;

  const SnapChatSquare({
    Key key,
    @required this.image,
    @required this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnapChatContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SnapChatCircle(image: image),
          SizedBox(height: 6),
          Text(
            title,
            style: whiteTextStyle(context),
          ),
          if (subtitle != null)
            Text(subtitle,
                style: whiteTextStyle(context)
                    .copyWith(fontWeight: FontWeight.w400))
          else
            SizedBox(height: 17),
        ],
      ),
    );
  }
}

class SnapChatCircle extends StatelessWidget {
  const SnapChatCircle({
    Key key,
    @required this.image,
  }) : super(key: key);

  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 75,
          height: 75 - 17.0,
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
    );
  }
}

class SnapChatContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const SnapChatContainer(
      {Key key, this.child, this.padding = const EdgeInsets.all(10)})
      : super(key: key);

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
              padding: padding,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 0.5),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, .40),
                      Color(0x00FFFFFF),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                  )),
              child: child)
        ]),
      ),
    );
  }
}
