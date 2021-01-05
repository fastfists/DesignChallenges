import 'package:flutter/material.dart';

// background: linear-gradient(98.65deg, #D55EFF 8.86%, #ED039D 89.83%);
SnapChatButton(BuildContext context, {String name, Function onPressed}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(colors: [
        Color(0xFFD55EFF),
        Color(0xFFED039D),
      ]),
    ),
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    child: GestureDetector(
      onTap: onPressed,
      child: Text(name, style: whiteTextStyle(context)),
    ),
  );
}

var backgroundGradient = LinearGradient(
  colors: [
    Color(0xFF99A5B1),
    Color(0xFFB0B6BA),
    Color(0xFFCCC3B2),
    Color(0xFFE4C79C),
    Color(0xFFFAB752),
    Color(0xFFD6812E),
  ],
  stops: [
    0.0,
    0.2135,
    0.4375,
    0.7032,
    0.9022,
    1.0,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

whiteTextStyle(BuildContext context) => Theme.of(context)
    .textTheme
    .bodyText2
    .copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15);
