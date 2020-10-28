import 'package:flutter/material.dart';
import 'package:flutter_animation_basic/screens/basic/screen_animation_simple.dart';

class HeroActionButton extends StatelessWidget {
  final String type;

  const HeroActionButton({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SimpleAnimation(
                    animationType: type,
                  )),
        );
      },
      child: Container(
        width: 100,
        child: Row(
          children: [
            Hero(
                tag: "hero-image",
                child: CircleAvatar(
                  maxRadius: 16.0,
                  backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/06/24/15/45/code-820275_960_720.jpg",
                  ),
                )),
            SizedBox(
              width: 24,
            ),
            Text('Hero', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      color: Colors.blue,
    );
  }
}
