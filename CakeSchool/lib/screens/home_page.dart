import 'package:flutter/material.dart';

import '../constants.dart';

class HomePage extends StatelessWidget {

  HomePage({Key key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("Merul\nSchool",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                SizedBox(height: 20),
                CakeView(
                  cakeName: "Accordian Cake",
                  imageName: "assets/images/FlashlightCake.png",
                ),
                SizedBox(height: 20),
                CakeView(
                  cakeName:"FlashLight Cake",
                  imageName: "assets/images/FlashlightCake.png",
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        )
      ),
    );
  }
}

class CakeView extends StatelessWidget {
  final String imageName;
  final String cakeName;

  const CakeView({
    Key key, this.imageName, this.cakeName,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: kbackgroundGradient,
            color: Color(0xFF6787A3),
            borderRadius: BorderRadius.circular(50),
          ),
          width: double.infinity,
          height: size.height * .50,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal:20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(cakeName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                )
              ),
              Text("Starts on August 20th",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300
                )
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FlatButton(
                    onPressed: () {  },
                    child: Container(
                      width: 175,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Course Details", style: TextStyle(color: kbackgroundColor)),
                          Icon(Icons.arrow_forward, color: kbackgroundColor),
                        ],
                      ),
                    ), 
                  ),
                ),
              ),
            ],
          )
        ),
        Positioned(
          right: -100,
          bottom: 20,
          child: Image.asset(imageName),
        ),
      ],
    );
  }
}
