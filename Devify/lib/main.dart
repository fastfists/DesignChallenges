import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var skills = ["python", "java", "html", "c++"];
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.7,
            width: size.width,
            child: Stack(
              fit: StackFit.loose,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/4.jpg")),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SwipeButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SwipeButton(
                    icon: Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Edith Oyugi"),
                    Text("Biosurgion"),
                  ],
                ),
                Row(
                  children: [
                    Text("Age:17"),
                    Text("Timezone:CST"),
                  ],
                ),
                Text(
                    "Hi everyone! I am Emily and I love building apps and participating in Hackathons. I am most experienced in Python, but I can do Java, HTML, and C++ too."),
                SingleChildScrollView(
                  child: Row(
                    children: [
                      Text("Skills: "),
                      ...skills
                          .map((skill) => Chip(
                                label: Text(skill),
                                backgroundColor: Color(0xFF5CE3A2),
                              ))
                          .toList()
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SwipeButton extends StatelessWidget {
  final Icon icon;

  const SwipeButton({
    Key key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
        child: icon);
  }
}
