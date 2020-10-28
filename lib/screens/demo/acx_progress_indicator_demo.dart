import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'example_page.dart';

class AcxProgressIndicatorDemo extends StatelessWidget {
  const AcxProgressIndicatorDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      title: "Progress Indicator",
      pathToFile: "acx_progress_indicator.dart",
      delayStartup: false,
      builder: (context) => ProgressIndicatorAnimation(),
    );
  }
}

class ProgressIndicatorAnimation extends StatefulWidget {
  ProgressIndicatorAnimation({Key key}) : super(key: key);

  @override
  _ProgressIndicatorAnimationState createState() =>
      _ProgressIndicatorAnimationState();
}

class _ProgressIndicatorAnimationState extends State<ProgressIndicatorAnimation>
    with AnimationMixin {
  AnimationController fadeInController;
  AnimationController fadeOutController;
  Animation<double> translateY;
  Animation<double> scale;

  @override
  void initState() {
    fadeInController = createController();
    fadeOutController = createController();
    translateY = Tween(begin: -100.0, end: 0.0).animate(fadeInController);

    scale = Tween(begin: 0.0, end: 1.0).animate(fadeOutController);
    fadeOutController.forward();
    fadeOutController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _progressIndicator(),
          _requestButton(),
        ],
      ),
    );
  }

  var _showCircularProgressIndicator = false;

  Widget _progressIndicator() {
    print(_showCircularProgressIndicator);
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Transform.translate(
        offset: Offset(0.0, translateY.value),
        child: Transform.scale(
          scale: scale.value,
          child: _showCircularProgressIndicator
              ? CircularProgressIndicator()
              : Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    shape: BoxShape.circle,
                  ),
                  width: 100,
                  height: 100),
        ),
      ),
    );
  }

  Widget _requestButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MaterialButton(
            child: Text(
              "Load data",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: _loadData,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  _loadData() async {
    if (_showCircularProgressIndicator) {
      return;
    }

    _showCircularProgressIndicator = true;
    fadeInController.reset();
    fadeOutController.reset();

    // Simulate HTTP Request
    final futureHttpRequest = Future.delayed(Duration(seconds: 4));

    final futureFadeIn =
        fadeInController.play(duration: Duration(milliseconds: 700));

    await Future.wait([futureHttpRequest, futureFadeIn]);

    // check if widget is still visible (otherwise animation will fail)
    if (mounted) {
      await fadeOutController.play(duration: Duration(milliseconds: 1200));
    }
    setState(() {
      _showCircularProgressIndicator = false;
    });
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}
