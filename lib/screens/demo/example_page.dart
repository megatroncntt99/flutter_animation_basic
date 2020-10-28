import 'package:flutter/material.dart';
import 'package:flutter_animation_basic/widgets/widgets.dart';

class ExamplePage extends StatefulWidget {
  final String title;
  final String pathToFile;
  final WidgetBuilder builder;
  final bool delayStartup;

  ExamplePage(
      {this.title, this.pathToFile, this.builder, this.delayStartup = false})
      : assert(!pathToFile.contains("-"),
            "Don't use minus character in filenames.");

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  var renderBuilder = true;

  @override
  void initState() {
    if (widget.delayStartup) {
      renderBuilder = false;
      Future.delayed(Duration(milliseconds: 500)).then((_) {
        setState(() => renderBuilder = true);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: widget.title,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: _buildPage(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    if (!renderBuilder) {
      return Container();
    }
    return this.widget.builder(context);
  }
}
