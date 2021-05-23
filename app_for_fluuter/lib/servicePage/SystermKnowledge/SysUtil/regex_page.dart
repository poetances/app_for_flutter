
import 'package:flutter/material.dart';
import 'dart:core';

class RegexPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RegexPageState();
  }
}

class _RegexPageState extends State<RegexPage> {

  StringBuffer _matchString = StringBuffer("匹配到的字符有：\n");

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("RegexPage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: (){
              RegExp regex = RegExp(r'1[3587]\d{9}');

              Iterable<Match> allMatchs = regex.allMatches("我的电话号码18553098742，以前用过18823746391");
              for(Match m in allMatchs) {
                for(int i = 0; i < m.groupCount+1 ; i++){
                  String matchValue = m.group(i);
                  _matchString.writeln(matchValue);
                }
              }

              setState(() {

              });
            },
            child: Text("开始匹配"),
          ),
          Divider(),
          Text(_matchString.toString())
        ],
      ),
    );
  }

}

