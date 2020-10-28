import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String text;

  const Header({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 24),
          )
        ],
      ),
    );
  }
}
