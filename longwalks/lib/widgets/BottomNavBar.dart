import 'package:flutter/material.dart';
import 'ProfilePicture.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
