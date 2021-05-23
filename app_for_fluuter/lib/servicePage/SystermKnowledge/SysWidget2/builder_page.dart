
import 'package:app_for_fluuter/common/progress_hud.dart';
import 'package:app_for_fluuter/servicePage/SystermKnowledge/SysWidget2/image_resources_page.dart';
import 'package:flutter/material.dart';

class BuilderPage extends StatefulWidget {

  @override
  _BuilderPageState createState() => _BuilderPageState();
}

class _BuilderPageState extends State<BuilderPage> {


  // 注意使用需要注意的。
  void _raiseButtonClick() {
    //BuilderChild.of(context).ifFetch();
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('内容')));

  }

  @override
  Widget build(BuildContext context) {
    print('外层context: -- $context');
    return Scaffold(
      appBar: VetAppBar(titleValue: 'Builder'),
      body: ProgressHud(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            BuilderChild(
              child: StatefulBuilder(builder: (context, setter){
                print('内层context: -- $context');

                return RaisedButton(
                  onPressed: (){
//                    BuilderChild.of(context).ifFetch();
//                    setter((){});
                    _raiseButtonClick();
                  },
                  child: Text('RaisedButton'),
                );
              }),
            ),

            Divider()
          ],
        ),
      ),
    );
  }
}


class BuilderChild extends StatefulWidget {

  static BuilderChildState of(BuildContext context) {
    return context.findAncestorStateOfType<BuilderChildState>();
  }

  final Widget child;
  BuilderChild({this.child});

  @override
  BuilderChildState createState() => BuilderChildState();
}

class BuilderChildState extends State<BuilderChild> {


  void ifFetch() {
    print('ifFetch ------- yes');
    ProgressHud.of(context).showLoading();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.red,
      child: widget.child,
    );
  }
}
