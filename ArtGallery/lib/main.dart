import 'package:flutter/material.dart';
import 'package:masonry_grid/masonry_grid.dart';
import 'details_page.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "details": (_) => DetailsPage(),
        "/": (_) => HomePage(),
      },
      initialRoute: "/",
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Text("Discover", style: TextStyle(color: Colors.black)),
              Spacer(),
              Icon(Icons.search, color: Colors.black),
              SizedBox(width: 10),
              Icon(Icons.settings, color: Colors.black)
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(
                title: Text(" you wont see me"), icon: Icon(Icons.disc_full)),
            BottomNavigationBarItem(
                title: Text(" you wont see me"), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                title: Text(" you wont see me"), icon: Icon(Icons.build)),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: MasonryGrid(
                      column: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10,
                      children: List.generate(
                        10,
                        (i) => GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed(
                                  "details",
                                  arguments: i,
                                ),
                            child: MassonaryImage(index: i)),
                      )))
            ],
          ),
        ));
  }
}

class MassonaryImage extends StatelessWidget {
  const MassonaryImage({
    Key key,
    this.index,
    this.scale = 1,
  }) : super(key: key);

  final int index;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: ClipRRect(
          borderRadius: kBorderRadius,
          child: Image.asset("assets/images/$index.jpg")),
    );
  }
}
