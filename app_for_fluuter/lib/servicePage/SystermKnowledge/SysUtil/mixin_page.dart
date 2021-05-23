
import 'package:app_for_fluuter/common/mixin.dart';
import 'package:app_for_fluuter/common/progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

class MixinPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MixinPageState1();
  }
}


class _MixinPageState1 extends State<MixinPage> with CanShowProgressHudWidgetMixin {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MixinPage"),
      ),
      body: ProgressHud(
        key: progressHudKey,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment(0, 0),
              child: ClipOval(
                child: Image.asset("assets/home/image0.png", width: 100, height: 100, fit: BoxFit.cover,),
              ),
            ),
            Divider(color: Colors.purple, height: 10,thickness: 10,),
            RaisedButton(
              color: Colors.purple,
              onPressed: (){
                progressHudKey.currentState.showSuccess(text: "-------");
              },
            )
          ],
        ),
      ),
    );
  }

 @override
  GlobalObjectKey<ProgressHudState> get progressHudKey => GlobalObjectKey('_MixinPageState1');

}


class _MixinPageState extends State<MixinPage> with MyDemoMixin {


  @override
  void goto() {
    // TODO: implement goto
  }


  @override
  Widget build(BuildContext context) {

    print("_MixinPageState---build");

    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("MixinPage"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment(0, 0),
            child: ClipOval(
              child: Image.asset("assets/home/image0.png", width: 100, height: 100, fit: BoxFit.cover,),
            ),
          ),
          Divider(color: Colors.purple, height: 10,thickness: 10,),
          RaisedButton(
            color: Colors.purple,
              onPressed: (){
              },
          )
        ],
      ),
    );
  }


}

mixin MyDemoMixin<T extends StatefulWidget> on State<T> {

  void goto();

  void gotoHas() {

  }


  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    print("MyDemo---build");
    return null;
  }
}

