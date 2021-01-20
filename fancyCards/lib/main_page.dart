import 'package:flutter/material.dart';
import 'package:flutterapp/styles.dart';
import 'package:flutterapp/top_half.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TopHalf(),
          BottomHalf()
        ],
      )
    );
  }
}

class BottomHalf extends StatelessWidget {
  const BottomHalf({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .28,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Color(0xFFECECEC),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            "April 24, 2019", 
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          FluffText(),
          SizedBox(height: 10),
          FluffText(),
        ],
      ),
    );
  }
}

class FluffText extends StatelessWidget {
  const FluffText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18)
      ),
      height: 61,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 5,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Color(0xffafafaf),
            ),
          ),
          Container(
            height: 5,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Color(0xffafafaf),
            ),
          ),
        ],
      ),
    );
  }
} 

