import 'package:flutter/material.dart';
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

  final formatter = new NumberFormat("###.00");

  String get percent => formatter.format(progressAnimation.value * 100);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              Align(
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
                    opacity: sizeAnimation.value > 0.5 ? sizeAnimation.value : 0,
                    child: Container(
                      width: 350.0 * progressAnimation.value,
                      height: widget.height,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Align(
                child: Opacity(
                  opacity: sizeAnimation.value > 0.5 ? sizeAnimation.value : 0,
                  child: Transform.translate(
                    offset: Offset(0, -35),
                    child: Container(
                      height: widget.height * 4,
                      width: 140,
                      color: Colors.white,
                      child: Center(
                        child: Text("$percent%",
                            style: Theme.of(context).textTheme.bodyText1.copyWith(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                )),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    sizeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
           0.0, 0.2,
           curve: Curves.bounceInOut,
        )
      )
    );

    progressAnimation = Tween<double>(
      begin: 0.0,
      end: 0.43,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.4, 0.8,
          curve: Curves.easeOut,
        )
      )
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
}


