import 'dart:math';

import 'package:flutter/material.dart';

class SpinningContainer extends AnimatedWidget {
  const SpinningContainer({Key key, AnimationController controller})
      : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2.0 * pi,
      child: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          color: Colors.blueAccent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterLogo(
                  size: 200,
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'SpinningContainer extends AnimatedWidget',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
