import 'package:flutter/material.dart';
import 'package:flutter_animation_basic/screens/basic/screen_animation_simple.dart';

class ActionButton extends StatelessWidget {
  final String type;

  const ActionButton({Key key, this.type}) : super(key: key);

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
      child: Text(type, style: TextStyle(color: Colors.white)),
      color: Colors.blue,
    );
  }
}
