import 'package:flutter/material.dart';
import 'package:flutter_animation_basic/widgets/appbar.dart';

class StackedMenuPage extends StatefulWidget {
  const StackedMenuPage({Key key}) : super(key: key);

  @override
  _StackedMenuPageState createState() => _StackedMenuPageState();
}

class _StackedMenuPageState extends State<StackedMenuPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  void stack() {
    _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          print(_animationController.value);
          double slide = 50 * _animationController.value;
          double scale = 1 - (_animationController.value * 0.5);
          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                    left: 16.0,
                    right: 16.0,
                    bottom: 16.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Menu',
                              style: TextStyle(fontSize: 24.0),
                            ),
                            FlatButton(onPressed: () {}, child: Text('Menu 1')),
                            FlatButton(onPressed: () {}, child: Text('Menu 2')),
                            FlatButton(onPressed: () {}, child: Text('Menu 3')),
                            FlatButton(onPressed: () {}, child: Text('Menu 4')),
                            FlatButton(
                                onPressed: () => stack(), child: Text('Close')),
                          ],
                        ),
                        flex: 5,
                      ),
                      Expanded(
                        child: Container(),
                        flex: 5,
                      )
                    ],
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.identity()
                  ..translate(slide)
                  ..scale(scale),
                alignment: Alignment.centerRight,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text('Stacked Menu'),
                    actions: [
                      IconButton(
                        icon: Icon(Icons.dehaze),
                        onPressed: () {
                          stack();
                        },
                      )
                    ],
                  ),
                  body: Container(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
