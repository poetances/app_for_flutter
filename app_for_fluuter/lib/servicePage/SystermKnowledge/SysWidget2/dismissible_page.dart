
import 'package:flutter/material.dart';

class DismissiblePage extends StatefulWidget {

  @override
  _DismissiblePageState createState() => _DismissiblePageState();
}

class _DismissiblePageState extends State<DismissiblePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DismissiblePage'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // 一般用于ListView。
          Dismissible(
            key: UniqueKey(),
            child: Container(
              width: 300,
              height: 40,
              alignment: Alignment.center,
              color: Colors.blue,
              child: Text('child'),
            ),
            background: Container(
              alignment: Alignment.center,
              color: Colors.red,
              child: Text('background'),
            ),
            secondaryBackground: Container(
              alignment: Alignment.center,
              color: Colors.purple,
              child: Text('secondaryBackground'),
            ),
          ),
          Divider(),


        ],
      ),
    );
  }
}
