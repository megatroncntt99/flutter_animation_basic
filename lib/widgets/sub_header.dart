import 'package:flutter/material.dart';

class SubHeader extends StatelessWidget {
  final String text;

  const SubHeader({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          )
        ],
      ),
    );
  }
}
