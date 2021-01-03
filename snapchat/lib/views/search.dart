import 'package:flutter/material.dart';
import 'package:snapchat/widgets/buttons.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: backgroundGradient,
        ),
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
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
            Container(
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: Colors.white),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.56),
                        Color(0x00FFFFFF),
                      ],
                    )),
                padding: EdgeInsets.all(2),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)))),
            SizedBox(height: 30),
            Stack(children: [
              Transform.translate(
                offset: Offset(-5, -5),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(255, 255, 255, 0.56),
                          Color(0x00FFFFFF),
                        ],
                      )),
                  width: 400,
                  height: 100,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(255, 255, 255, 0.23)),
                width: 400,
                height: 100,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(255, 255, 255, 0.15)),
                width: 400,
                height: 100,
              ),
            ]),
          ],
        ),
      ),
    ));
  }
}

