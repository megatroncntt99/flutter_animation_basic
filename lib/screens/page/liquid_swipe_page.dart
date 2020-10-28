import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_basic/widgets/widgets.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LiquidSwipePage extends StatefulWidget {
  LiquidSwipePage({Key key}) : super(key: key);

  @override
  _LiquidSwipePageState createState() => _LiquidSwipePageState();
}

class _LiquidSwipePageState extends State<LiquidSwipePage> {
  final pages = [
    Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                CircleAvatar(
                  maxRadius: 124.0,
                  backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/06/24/15/45/code-820275_960_720.jpg",
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Hi",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Billy",
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "It's Me",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Billy",
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Sahdeep",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Billy",
                      fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
    ),
    Container(
      color: Colors.deepPurpleAccent,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Take a",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Billy",
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "look at",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Billy",
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Liquid Swipe",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Billy",
                      fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
    ),
    Container(
      color: Colors.greenAccent,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Liked?",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Billy",
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Fork!",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Billy",
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Give Star!",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Billy",
                      fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  ];
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    print(_bottomNavIndex);
    return Scaffold(
      appBar: MainAppBar(title: 'Liquid Swipe'),
      body: LiquidSwipe(
        pages: pages,
        fullTransitionValue: 500,
        enableSlideIcon: true,
        onPageChangeCallback: (activePageIndex) => this.setState(() {
          _bottomNavIndex = activePageIndex;
        }),
      ),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: "Home"),
          TabItem(icon: Icons.info, title: "Info"),
          TabItem(icon: Icons.widgets, title: 'Widget'),
        ],
        initialActiveIndex: _bottomNavIndex,
        onTap: (index) => this.setState(() {
          _bottomNavIndex = index;
        }),
        style: TabStyle.reactCircle,
      ),
    );
  }
}
