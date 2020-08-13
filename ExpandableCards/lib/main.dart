import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

enum CardState {
  FullScreen,
  Expanded,
  Contracted
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sliding Card',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        backgroundColor: Color(0xFFDC9B6E),
        secondaryHeaderColor: Color(0xFFDC9B6E),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> 
  with SingleTickerProviderStateMixin {

  AnimationController _controller;
  StreamController<CardState> state;
  CardState lastState;
  bool appear = false;
  
  @override
  void initState() {
    super.initState();
    state = StreamController<CardState>.broadcast(
      onListen: () => state.add(CardState.Contracted)
    );
    state.add(CardState.Contracted);
    lastState = CardState.Contracted;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    state.stream.asBroadcastStream().listen( (newState)  {
        switch(newState) {
          case CardState.FullScreen:
              break;
          case CardState.Expanded:
              if( lastState == CardState.Contracted) {
                 _controller.forward();
              }
              break;
          case CardState.Contracted:
              if( lastState == CardState.Expanded) {
                 _controller.reverse();
              }
            break;
        }
        lastState = newState;
    });
  }

  Animation get animation => _controller;

  void toggle() async {
      CardState currentState = lastState;
      switch(currentState){
        case CardState.FullScreen:
            state.add(CardState.Expanded);
            break;
        case CardState.Expanded:
            state.add(CardState.Contracted);
            break;
        case CardState.Contracted:
          state.add(CardState.Expanded);
          break;
      }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    double width = size.width;
    double height = size.height *  3 / 16 + ( 30 );

    return Scaffold(
      body: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            color: Color.lerp(Color(0xFFEEC59D), Color(0xFFDC9B6E), animation.value),
            width: size.width,
            height: size.height,
            child: Stack(
              overflow: Overflow.visible,
              children: [
                CardLists(state: state,
                        inAnimation: animation,
                        width: width,
                        height: height),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Transform.rotate(
                    angle: animation.value * math.pi / 2,
                    child: FlatButton(
                      onPressed: toggle,
                      child: Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF473245),
                        ),
                        child: Icon(Icons.exit_to_app)
                      ),
                    ),
                  ),
                )
              ],
            )
          );
        }
      ),
    );
  }
}

class CardLists extends StatefulWidget {
  const CardLists({
    Key key,
    @required this.inAnimation,
    @required this.width,
    @required this.height,
    @required this.state,
  }) : super(key: key);

  final Animation inAnimation;
  final double width;
  final double height;
  final StreamController<CardState> state;

  @override
  _CardListsState createState() => _CardListsState();
}

class _CardListsState extends State<CardLists>
  with SingleTickerProviderStateMixin {

  AnimationController _controller;
  int currentIndex;
  List<int> order;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500)
    );
   int currentIndex = 0;
   order = List.generate(3, (i) => i);

    widget.state.stream.asBroadcastStream().listen( (state) {
        switch(state) {
          case CardState.FullScreen:
            _controller.forward();
            setState( () {
              order.sort( (a, b) {
                if (a == currentIndex) return b;
                if (b == currentIndex) return a;
                  return (a - currentIndex) < (b - currentIndex).abs() ? b: a;
              });
              print(order);
            });
            break;
          case CardState.Expanded:
            if(!_controller.isDismissed) {
                _controller.reverse();
            }
            break;
          case CardState.Contracted:
            break;
        }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Animation get fullScreenAnimation => _controller;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Stack(
            overflow: Overflow.visible,
            children: order.map(
              (i) => Positioned(
                top: 20 + i * (widget.height + 20),
                left: 0,
                child: GestureDetector(
                  onTap: () {
                    setState( () => currentIndex = i);
                    print("sending");
                    widget.state.add(CardState.FullScreen);
                    print("sent");
                  },
                  child: buildCard(context, i),
                ),
              )).toList(),
            )
    );
  }

  Widget buildCard(BuildContext context, int index) {
    var size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: fullScreenAnimation,
      builder: (context, snapshot) {
        return StreamBuilder<CardState>(
          stream: widget.state.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // In Animation
              double translateYin = 35 + (1 - widget.inAnimation.value) * 100;

              // FullScreen Animation
              double scaleX = 1.0 + (fullScreenAnimation.value * 0.1);
              double scaleY = 1.0 + (fullScreenAnimation.value * 2.5);
              double rotateFull = -math.pi * fullScreenAnimation.value * 0.25;

              return Opacity(
                opacity: widget.inAnimation.value,
                child: Transform(
                  alignment: Alignment.topCenter,
                  transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..translate(0.0, translateYin)
                            ..scale(scaleX, scaleY)
                            ..translate(0.0, fullScreenAnimation.value * -20),
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    width: widget.width,
                    height: widget.height,
                    child: Text("$index"),
                    decoration: BoxDecoration(
                      color: 
                        Color.lerp(Color(0xFF473245), Colors.black, fullScreenAnimation.value*index/5),
                      borderRadius: BorderRadius.circular(20),
                    )),
                ),
              );
            } else {
              return Container();
            }
          }
        );
      }
    );
  }
}

