
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

abstract class RedBackground extends StatelessWidget {
  const RedBackground({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context);
}

class MineCustomWidget extends RedBackground {


  @override
  Widget buildBody(BuildContext context) {
    return Text("hello, wold");
  }
}



class ExtendsWidgetPage extends StatefulWidget {
  const ExtendsWidgetPage({Key key}) : super(key: key);

  @override
  _ExtendsWidgetPageState createState() => _ExtendsWidgetPageState();
}

class _ExtendsWidgetPageState extends State<ExtendsWidgetPage> {

  @override
  Widget build(BuildContext context) {

    showToast('msg');
    return Scaffold(
      appBar: AppBar(title: Text('ExtendsWidgetPage'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MineCustomWidget()

        ],
      ),
    );
  }
}






