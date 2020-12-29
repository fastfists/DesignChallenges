import 'package:flutter/material.dart';
import 'package:longwalks/widgets/ProfilePicture.dart';

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
