
import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderPage extends StatefulWidget {

  @override
  _StreamBuilderPageState createState() => _StreamBuilderPageState();
}

typedef StreamCallBack = Stream<int> Function(int def);


class _StreamBuilderPageState extends State<StreamBuilderPage> {

  StreamController _streamController;

   Stream<int> _bids = (() async* {
     await Future<void>.delayed(Duration(seconds: 1));
     yield 1;
     await Future<void>.delayed(Duration(seconds: 1));
     yield 2;
   })();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    StreamCallBack a = (int def){

      return Stream<int>.value(1);
    };

    // 这两种写法是一样的。
    String ab(String name) {

      return name + '====ab';
    }

    Function abc = (String name){

      return name + '===abc';
    };

    print(ab('hello'));
    print(abc('hello'));


    _streamController = StreamController(onListen: (){
      print('开始监听');
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StreamBuilder'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: _streamController.stream,
            builder: (context, snap){
              print('----${snap.data}：${snap.connectionState}');
              return Text(snap.data ?? 'nil');
            },
          ),
          Divider(),
          RaisedButton.icon(
            onPressed: (){
              _streamController.sink.add("输入");
            },
            icon: Icon(Icons.ac_unit),
            label: Text('StreamController'),
          ),
          Divider(),
          StreamBuilder(
            stream: _bids,
            builder: (context, snap){
              print('_bids----${snap.data}：${snap.connectionState}');
              return Text(snap.data.toString() ?? 'nil');
            },
          ),

        ],
      ),
    );
  }
}
