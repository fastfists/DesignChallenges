import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:snapchat/widgets/buttons.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.network(
            "https://images.unsplash.com/photo-1599842057874-37393e9342df?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D"),
        SafeArea(
          child: Container(
            decoration: BoxDecoration(),
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
                SizedBox(height: 70),
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 7, sigmaX: 7),
                    child: Stack(children: [
                      Container(
                        padding: EdgeInsets.all(10),
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
                              stops: [
                                0.0,
                                0.5,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(255, 255, 255, 0.23)),
                          width: 400,
                          height: 100),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(255, 255, 255, 0.15)),
                          width: 400,
                          height: 100),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
