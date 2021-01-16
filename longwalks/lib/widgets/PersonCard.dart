import 'package:flutter/material.dart';
import 'package:longwalks/constants.dart';
import 'package:longwalks/widgets/ProfilePicture.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.53,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 15),
          Row(children: <Widget>[
            ProfilePicture(border: true),
            SizedBox(width: 10),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Alex",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: blueAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("Now")
                ]),
            Spacer(),
            Icon(Icons.more_horiz),
          ]),
          Text.rich(TextSpan(
              text: "My focus on this week is to ",
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: blueAccent, fontSize: 20, fontWeight: FontWeight.w400),
              children: <InlineSpan>[
                TextSpan(
                  text: "enjoy what nature has to offer",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: blueAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ])),
          SizedBox(height: 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                  "https://images.unsplash.com/photo-1533760881669-80db4d7b4c15?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzF8fGJlYWNofGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60")),
          SizedBox(height: 20),
          Row(children: <Widget>[
            Icon(Icons.message_outlined),
            Spacer(),
            Icon(Icons.share),
          ]),
        ],
      ),
    );
  }
}
