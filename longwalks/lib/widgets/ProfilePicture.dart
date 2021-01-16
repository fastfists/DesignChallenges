import 'package:flutter/material.dart';
import 'package:longwalks/constants.dart';

class ProfilePicture extends StatelessWidget {
  final bool border;

  const ProfilePicture({
    Key key,
    this.border = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (border)
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
          ),
        CircleAvatar(
            radius: 20,
            backgroundColor: blueAccent,
            backgroundImage:
                NetworkImage("https://thispersondoesnotexist.com/image")),
      ],
    );
  }
}

