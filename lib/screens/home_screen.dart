import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_basic/widgets/widgets.dart';

import 'basic/screen_animation_page.dart';
import 'page/accordion_page.dart';
import 'page/animated_widgets_page.dart';
import 'page/city_morning_page.dart';
import 'page/liquid_swipe_page.dart';
import 'page/simple_animations_page.dart';
import 'page/stacked_menu_page.dart';
import 'page/wave_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Flutter Animation",
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: IndexedStack(
            index: _bottomNavIndex,
            children: [
              _page(children: [
                Header(text: 'Custom Animations'),
                _customAnimationButton(
                  context: context,
                  animationName: 'Accordion',
                  builder: (context) => AccordionPage(),
                ),
                _customAnimationButton(
                  context: context,
                  animationName: 'Stacked Menu',
                  builder: (context) => StackedMenuPage(),
                ),
                _customAnimationButton(
                  context: context,
                  animationName: 'Morning in the City',
                  builder: (context) => CityMorningPage(),
                ),
                _customAnimationButton(
                  context: context,
                  animationName: 'Wave',
                  builder: (context) => WavePage(),
                ),
              ]),
              _page(children: [
                Header(text: '3rd-party Libraries'),
                _libraryAnimationButton(
                  context: context,
                  library: "animated_widgets",
                  builder: (context) => AnimatedWidgetsPage(),
                ),
                _libraryAnimationButton(
                    context: context,
                    library: "liquid_swipe",
                    builder: (context) => LiquidSwipePage()),
                _libraryAnimationButton(
                    context: context,
                    library: "simple_animations",
                    builder: (context) => SimpleAnimationsPage()),
              ]),
              _page(children: [
                Header(text: 'Animation Widget'),
                ActionButton(type: 'AnimatedAlign'),
                ActionButton(type: 'AnimatedContainer'),
                ActionButton(type: 'AnimatedCrossFade'),
                ActionButton(type: 'AnimatedDefaultTextStyle'),
                ActionButton(type: 'AnimatedListState'),
                ActionButton(type: 'AnimatedOpacity'),
                ActionButton(type: 'AnimatedPhysicalModel'),
                ActionButton(type: 'AnimatedPositioned'),
                HeroActionButton(
                  type: 'Hero',
                ),
                SubHeader(text: 'with AnimationController'),
                ActionButton2(type: 'AnimatedModalBarrier'),
                ActionButton2(type: 'AnimatedSize'),
                ActionButton2(type: 'DecoratedBoxTransition'),
                ActionButton2(type: 'FadeTransition'),
                ActionButton2(type: 'PositionedTransition'),
                ActionButton2(type: 'RotationTransition'),
                ActionButton2(type: 'ScaleTransition'),
                ActionButton2(type: 'SizeTransition'),
                ActionButton2(type: 'SlideTransition'),
                ActionButton2(type: 'AnimatedBuilder'),
                ActionButton2(type: 'AnimatedWidget'),
              ]),
              _page(children: [
                Header(text: 'Page Transition'),
                _pageAnimationButton(context, 'Slide From Edge', 'slide'),
                _pageAnimationButton(
                    context, 'Slide From Left To Right', 'slide_left_to_right'),
                _pageAnimationButton(context, 'Fade', 'fade'),
                _pageAnimationButton(context, 'Scale', 'scale'),
                _pageAnimationButton(context, 'Size', 'size'),
                _pageAnimationButton(context, 'Rotate', 'rotate'),
              ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.work, title: "Work"),
          TabItem(icon: Icons.extension, title: "Library"),
          TabItem(icon: Icons.widgets, title: 'Widget'),
          TabItem(icon: Icons.library_books, title: 'Page'),
        ],
        onTap: (index) => this.setState(() {
          _bottomNavIndex = index;
        }),
        style: TabStyle.reactCircle,
      ),
    );
  }

  Widget _page({List<Widget> children}) {
    return Container(
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 3,
        children: children,
      ),
    );
  }

  Widget _customAnimationButton(
      {BuildContext context, String animationName, WidgetBuilder builder}) {
    return FlatButton(
        color: Colors.lightGreen,
        child: Text(animationName, style: TextStyle(color: Colors.white)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: builder),
          );
        });
  }

  Widget _libraryAnimationButton(
      {BuildContext context, String library, WidgetBuilder builder}) {
    return FlatButton(
        color: Colors.green,
        child: Text(library, style: TextStyle(color: Colors.white)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: builder),
          );
        });
  }

  _pageAnimationButton(
      BuildContext context, String text, String animationType) {
    return FlatButton(
        color: Colors.blueGrey,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  PageAnimation(animationType: text),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                switch (animationType) {
                  case 'slide':
                    return SlideTransition(
                      position: animation.drive(
                          Tween(begin: Offset(-1.0, -1.0), end: Offset.zero)
                              .chain(CurveTween(curve: Curves.easeInCubic))),
                      child: child,
                    );

                  case 'slide_left_to_right':
                    return SlideTransition(
                      position: animation.drive(
                          Tween(begin: Offset(-1.0, 0.0), end: Offset.zero)),
                      child: child,
                    );
                  case 'fade':
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  case 'scale':
                    return ScaleTransition(
                      child: child,
                      scale: animation,
                      // scale: Tween<double>(
                      //   begin: 0.0,
                      //   end: 1.0,
                      // ).animate(
                      //   CurvedAnimation(
                      //     parent: animation,
                      //     curve: Curves.fastOutSlowIn,
                      //   ),
                      // )
                    );
                  case 'size':
                    return Align(
                      child: SizeTransition(
                          child: child,
                          sizeFactor: Tween<double>(
                            begin: 0.0,
                            end: 1.0,
                          ).animate(
                            CurvedAnimation(
                              parent: animation,
                              curve: Curves.fastOutSlowIn,
                            ),
                          )),
                    );
                  case 'rotate':
                    return RotationTransition(child: child, turns: animation);
                }

                //default animation
                return SlideTransition(
                  position: animation
                      .drive(Tween(begin: Offset(0.0, 1.0), end: Offset.zero)),
                  child: child,
                );
              }));
        });
  }
}
