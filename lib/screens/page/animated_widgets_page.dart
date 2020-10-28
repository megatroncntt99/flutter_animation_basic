import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_basic/widgets/widgets.dart';

class AnimatedWidgetsPage extends StatefulWidget {
  AnimatedWidgetsPage({Key key}) : super(key: key);

  @override
  _AnimatedWidgetsPageState createState() => _AnimatedWidgetsPageState();
}

class _AnimatedWidgetsPageState extends State<AnimatedWidgetsPage> {
  bool _play = false;
  IconData _fbIcon = Icons.navigate_next;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Animated Widgets Page'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          this.setState(() {
            _fbIcon = _play ? Icons.navigate_next : Icons.navigate_before;
            _play = !_play;
          });
        },
        child: Icon(_fbIcon),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 320,
              child: Column(
                children: [
                  TranslationAnimatedWidget(
                    enabled: _play,
                    duration: Duration(seconds: 1),
                    values: [Offset(0, 0), Offset(-100, 0)],
                    child: Text(
                      'Translation',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                  const SizedBox(height: 24),
                  RotationAnimatedWidget.tween(
                    duration: const Duration(seconds: 1),
                    rotationEnabled:
                        _play ? Rotation.deg(z: 90) : Rotation.deg(z: 0),
                    child: Text(
                      'Rotation',
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  OpacityAnimatedWidget.tween(
                      duration: const Duration(seconds: 1),
                      opacityEnabled: 1, //define start value
                      opacityDisabled: 0.5, //and end value
                      enabled: _play, //bind with the boolean
                      child: Text('Opacity', style: TextStyle(fontSize: 24.0))),
                  const SizedBox(height: 24),
                  SizeAnimatedWidget(
                    duration: const Duration(seconds: 1),
                    enabled: _play,
                    values: [
                      Size(100, 100),
                      Size(200, 150),
                    ],
                    curve: Curves.easeInCirc,
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue)),
                        child: Center(
                            child: Text('Size',
                                style: TextStyle(fontSize: 24.0)))),
                  ),
                  const SizedBox(height: 24),
                  ShakeAnimatedWidget(
                      enabled: _play,
                      duration: const Duration(seconds: 2),
                      curve: Curves.ease,
                      shakeAngle: Rotation.deg(z: 50),
                      child: Text('Shake', style: TextStyle(fontSize: 24.0))),
                  const SizedBox(height: 24),
                  CustomAnimatedWidget(
                    enabled: _play,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeOut,
                    builder: (context, percent) {
                      final int displayedDate = (2020 * percent).floor();
                      return Text(
                        "Custom - Current year : $displayedDate",
                        style: TextStyle(color: Colors.blue, fontSize: 24.0),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  TranslationAnimatedWidget.tween(
                    enabled: _play,
                    translationDisabled: Offset.zero,
                    translationEnabled: Offset(100, 0),
                    child: OpacityAnimatedWidget.tween(
                      enabled: _play,
                      opacityDisabled: 0.5,
                      opacityEnabled: 1,
                      child: ShakeAnimatedWidget(
                        enabled: _play,
                        duration: Duration(milliseconds: 1500),
                        shakeAngle: Rotation.deg(z: 40),
                        child: Text('Translation + Opacity + Shake',
                            style: TextStyle(fontSize: 24.0)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
