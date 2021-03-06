import 'package:flutter/material.dart';

import 'constants.dart';
import 'main.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key}) : super(key:key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  int index;
  changeIndex(int i) {
    setState( () { index = i;} );
  }

  @override
  Widget build(BuildContext context) {
    index = ModalRoute.of(context).settings.arguments;
    var size = MediaQuery.of(context).size;

    var child = Container(
        color: Colors.red, width: 20, height: 20, child: Text("HI there Dude"));

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          fit: StackFit.loose,
          clipBehavior: Clip.hardEdge,
          children: [
            GestureDetector(
                child: Align(alignment: Alignment.centerRight, child: child)),
            Align(alignment: Alignment.center, child: child),
            GestureDetector(
                child: Align(alignment: Alignment.centerLeft, child: child)),
          ],
        ),
      ),
    );
  }
}
