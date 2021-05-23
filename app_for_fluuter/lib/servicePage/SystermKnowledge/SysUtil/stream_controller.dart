
import 'package:flutter/material.dart';
import 'dart:async';


/**
 * stream暴露在外的类重要包含了。 StreamController， StreamSink ， Steam， StreamSubcripte四个对象
 * stream 可以跨widget 通知。我们使用的event_bus 就是基于streamController的封装。
 * StreamController()和StreamController.broadcast（）的区别是，StreamController()只能有一个监听对象。
 * */


class StreamControllerPage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StreamControllerPageState();
  }


}

class _StreamControllerPageState extends State<StreamControllerPage> {

  StreamController<int> streamController = StreamController.broadcast();
  int _count = 0;

  StreamSubscription<int> subscription;

  Future<void> futureFunction() async{
    print('futureFunction-start');
    await  Future.delayed(Duration(seconds: 5));
    print('futureFunction-end');

  }

  @override
  void initState() {
    super.initState();

   subscription = streamController.stream.listen((value){
      print('streamController.stream.listen--$value');
    });

   // 该属性，是当stream进行监听，暂停或者取消的时候执行。而且不适用于广播（可能广播是能够多次.stream.lisen的原因）。
//   streamController.onListen = (){
//     print('streamController.onListen');
//   };
//
//   streamController.onPause = (){
//     print('streamController.onPause');
//
//   };
//
//   streamController.onResume = (){
//     print('streamController.onResume');
//
//   };
//
//
//   streamController.onCancel = (){
//     print('streamController.onCancel');
//
//   };

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[

            RaisedButton(onPressed: (){
              streamController.sink.add(++_count);

            }),
            Divider(),

            StreamBuilder(
                stream: streamController.stream,
                builder: (ctx,AsyncSnapshot snapshot){
                  return Text('StreamBuilder--${snapshot.data}');
                }
            ),
            FutureBuilder(
              builder: (context, snapShot) {
                print(snapShot.connectionState);
                return Text('StreamBuilder--${snapShot.connectionState}');
              },
              future: futureFunction(),
            )
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    subscription.cancel();
    streamController.close();
  }
}