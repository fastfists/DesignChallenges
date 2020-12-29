import 'package:longwalks/models/days.dart';
import 'package:longwalks/constants.dart';
import 'package:flutter/material.dart';

class Weekdays extends StatelessWidget {
  const Weekdays({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: days.map((day) => Weekday(day: day)).toList());
  }
}

class Weekday extends StatelessWidget {
  final DayOfWeek day;
  final double size;
  final double borderSize;

  const Weekday({
    Key key,
    this.day,
    this.size = 45,
    this.borderSize = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
      child: Stack(alignment: Alignment.center, children: <Widget>[
        if (day.active)
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: blueAccent,
            ),
            width: size + borderSize,
            height: size + borderSize,
          ),
        Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            width: size,
            height: size),
        Container(
            width: size,
            height: size,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text(day.name,
                  style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              if (day.active) Icon(Icons.check, size: 16),
            ]))
      ]),
    );
  }
}
