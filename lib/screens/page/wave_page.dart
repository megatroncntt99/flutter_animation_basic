import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animation_basic/widgets/widgets.dart';

class WavePage extends StatelessWidget {
  const WavePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Wave",
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          WaveContainer(
            width: double.infinity,
            height: 300,
            color: Colors.orangeAccent,
          ),
        ],
      )),
    );
  }
}

class WaveContainer extends StatefulWidget {
  WaveContainer({
    Key key,
    this.duration,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);
  final Duration duration;
  final double height;
  final double width;
  final Color color;

  @override
  _WaveContainerState createState() => _WaveContainerState();
}

class _WaveContainerState extends State<WaveContainer>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Duration _duration;
  Color _color;

  @override
  void initState() {
    super.initState();

    _duration = widget.duration ?? const Duration(seconds: 1);
    _color = widget.color ?? Colors.orange;
    _animationController?.dispose();
    _animationController =
        AnimationController(vsync: this, duration: _duration);
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return CustomPaint(
            painter: WavePainter(
              color: _color,
              waveAnimation: _animationController,
            ),
          );
        },
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final Animation<double> waveAnimation;
  final Color color;

  WavePainter({this.waveAnimation, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    for (double i = 0.0; i < size.width; i++) {
      path.lineTo(i,
          sin((i / size.width * 4 * pi) + (waveAnimation.value * 4 * pi)) * 4);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    Paint wavePaint = Paint()..color = color;
    canvas.drawPath(path, wavePaint);
    path.close();
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(WavePainter oldDelegate) => true;
}
