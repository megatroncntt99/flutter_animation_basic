import 'package:flutter/material.dart';
import 'package:flutter_animation_basic/screens/basic/screen_animation_tickerprovider.dart';

class ActionButton2 extends StatelessWidget {
  final String type;

  const ActionButton2({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AnimationTickerProviderPage(
                    animationType: type,
                  )),
        );
      },
      child: Text(type, style: TextStyle(color: Colors.white)),
      color: Colors.blueAccent,
    );
  }
}
