import 'package:flutter/material.dart';
import 'package:flutter_animation_basic/screens/demo/acx_progress_indicator_demo.dart';
import 'package:flutter_animation_basic/widgets/appbar.dart';

class SimpleAnimationsPage extends StatefulWidget {
  const SimpleAnimationsPage({Key key}) : super(key: key);

  @override
  _SimpleAnimationsPageState createState() => _SimpleAnimationsPageState();
}

class _SimpleAnimationsPageState extends State<SimpleAnimationsPage> {
  Widget _sampleButton(String library, WidgetBuilder builder) {
    return FlatButton(
        color: Colors.blue,
        minWidth: 240.0,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: builder));
        },
        child: Text(library, style: TextStyle(color: Colors.white)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "simple_animations",
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _sampleButton('ProgressIndicatorAnimation',
                  (context) => AcxProgressIndicatorDemo()),
            ],
          ),
        ),
      ),
    );
  }
}
