import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: ProgressBar(height: 10));
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.lightBlue,
        child: HomePage(),
      ),
    );
  }
}

class ProgressBar extends StatefulWidget {
  final double height;

  const ProgressBar({Key key, this.height}) : super(key: key);

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation progressAnimation;
  Animation sizeAnimation;
  Animation dyingAnimation;
  Animation bouncingAnimation;

  final formatter = new NumberFormat("###");
  String get percent => formatter.format(progressAnimation.value * 100);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    sizeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.2,
          curve: Curves.bounceInOut,
        )));

    progressAnimation = Tween<double>(
      begin: 0.0,
      end: 0.5,
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.4,
          0.8,
          curve: Curves.easeOut,
        )));

    bouncingAnimation = Tween<Offset>(
      begin: Offset(-10, 20),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.4,
          0.8,
          curve: Curves.bounceInOut,
        )));
    
    dyingAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.8,
          1.0,
          curve: Curves.easeOut,
        )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 100 + sizeAnimation.value * 250,
                    height: 100 - sizeAnimation.value * (100 - widget.height),
                    child: FlatButton(
                        color: Color(0xFF1C455B),
                        onPressed: toggle,
                        child: Icon(Icons.download_sharp,
                            color: Colors.white,
                            size: 70.0 * (1 - sizeAnimation.value))),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Opacity(
                    opacity:
                        sizeAnimation.value > 0.5 ? sizeAnimation.value : 0,
                    child: Container(
                      width: 350.0 * progressAnimation.value,
                      height: (1 - dyingAnimation.value) * widget.height,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              PercentageLabel(
                  opacity: sizeAnimation.value > 0.5 ? sizeAnimation.value : 0,
                  offset: bouncingAnimation.value,
                  height: widget.height,
                  percent: percent,
              ),
            ],
          );
        });
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
}

class PercentageLabel extends StatelessWidget {
  const PercentageLabel({
    Key key,
    this.opacity,
    this.height,
    this.percent,
    this.offset,
  }) : super(key: key);

  final double opacity;
  final double height;
  final String percent;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Opacity(
        opacity: opacity,
        child: Transform.translate(
          offset: Offset(0, -40) + offset,
          child: Center(
            child: Container(
              height: height * 4 + 20,
              width: 100,
              color: Colors.white,
              child: Center(
                child: Text("$percent%",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                        )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
