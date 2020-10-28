import 'package:flutter/material.dart';
import 'package:flutter_animation_basic/widgets/widgets.dart';

class AccordionPage extends StatelessWidget {
  AccordionPage({Key key}) : super(key: key);

  List<Section> _sections = [
    Section(
      title: Text('Section 1'),
      content: Column(
        children: [
          Center(
              child: FlutterLogo(
            size: 250,
          )),
          Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '),
        ],
      ),
    ),
    Section(
        title: Text('Section 2'),
        content: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')),
    Section(
        title: Text('Section 3'),
        content: Text(
            '"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?')),
    Section(
        title: Text('Section 4'),
        content: Text(
            '"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?')),
    Section(
        title: Text('Section 5'),
        content: Text(
            '"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Accordion'),
      body: SafeArea(
        minimum: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: _sections,
          ),
        ),
      ),
    );
  }
}

class Section extends StatefulWidget {
  final Text title;
  final Widget content;

  const Section({Key key, this.title, this.content}) : super(key: key);

  @override
  _SectionState createState() => _SectionState();
}

class _SectionState extends State<Section> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  bool _expanded = false;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Reload");
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
        ),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              this.setState(() {
                _expanded
                    ? _animationController.reverse()
                    : _animationController.forward();
                _expanded = !_expanded;
              });
            },
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: widget.title,
                    flex: 9,
                  ),
                  Expanded(
                    child: _expanded
                        ? Icon(
                            Icons.arrow_downward_rounded,
                            size: 20.0,
                          )
                        : Icon(
                            Icons.arrow_forward_ios,
                            size: 20.0,
                          ),
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: SizeTransition(
              key: widget.key,
              sizeFactor: CurvedAnimation(
                  parent: _animationController, curve: Curves.easeInSine),
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: widget.content,
              ),
            ),
          )
        ],
      ),
    );
  }
}
