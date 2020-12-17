import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: ProgressBar());
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          ThemeData(primarySwatch: Colors.blue, backgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: Container(color: Colors.lightBlue, child: HomePage()),
    );
  }
}

class ProgressBar extends StatefulWidget {
  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  void toggle() async {
    if (!_controller.isAnimating) {
      if (_controller.isCompleted) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              width: 100 + _controller.value * 300,
              height: 100 - _controller.value * (100 - 20),
              child: FlatButton(
                  color: Colors.blueGrey,
                  onPressed: toggle,
                  child: Icon(Icons.download_sharp,
                      color: Colors.white,
                      size: 70.0 * (1 - _controller.value))),
            );
          }),
    );
  }
}
