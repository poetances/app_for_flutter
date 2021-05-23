
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'package:flutter/foundation.dart';

// Dart的事件循环机制。
// 其执行顺序。
// 1、执行main()。
// 2、检测microTask队列，是否有任务。如果有，那么会先执行microTask的任务。直到执行完成。
// 3、到microTask队列执行完后，检测eventTask队列，是否有任务。如果有，那么会eventTask队列的任务。执行完后，跳到2.


class DartFuturePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _DartFuturePageState();
  }
}


class _DartFuturePageState extends State<DartFuturePage> {


  List<String> _list = ["micro Task","event Task","Isolate Task","flutter computer","==="];


  Future<void> _doSomeFuture() async{
   return Future((){
      for(int i = 0; i < 10000; i++) {
        print("输出值---$i");
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DartFuturePage"),
        actions: [
          CupertinoActivityIndicator()
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index){

            return ListTile(
              onTap: () async{

                if(index == 0){

                  // event Task
                  Future((){
                    sleep(Duration(seconds: 3));
                    print('event Task');
                  });


                  // 添加micro task的两种方式。
                  scheduleMicrotask((){
                    sleep(Duration(seconds: 3));
                    print('micro Task');
                  });
                  Future.microtask((){
                    sleep(Duration(seconds: 3));
                    print("microTask Task");
                  });

                  print("main task");
                  // 输出结果。可以看出，是先执行micro Task。
                  // flutter: microTask Task
                  // flutter: event Task
                }else if(index == 1){

                  // 从下面可以看出。异步操作，如果添加多个，那么默认是串行执行。
                  print('RaiseButton-click');
                  Future((){

                    print("event Task-start");

                    // dart： io中的操作。
                    sleep(Duration(seconds: 3));
                    print("event Task-end");
                  });

                  Future((){

                    print("event1 Task-start");

                    // dart： io中的操作。
                    sleep(Duration(seconds: 3));
                    print("event1 Task-end");
                  });

                  Future((){

                    print("event2 Task-start");

                    // dart： io中的操作。
                    sleep(Duration(seconds: 3));
                    print("event2 Task-end");
                  });
                  print('RaiseButton-click: end');
                }else if(index == 2) {

                  // 因为dart中，默认都是串行执行，但是我们可以使用Isolate进行并发执行。
                  // 注意Isolate字面意思是隔离。也就是，传的参数，需要时全局方法。相当于重新创建一个内存。
                  // 我们程序入口main（） 其实就是默认的main Isolate。
                  // 而且每个是独立的执行线。但是可以通过。Send 和 Recive来进行通讯。
                  print('Isolate start');
                  Isolate.spawn(_spawnValue, "Isolate");
                  Isolate.spawn(_spawnValue, "Isolate1");
                  Isolate.spawn(_spawnValue, "Isolate2");
                  print('Isolate end');
                }else if(index == 3) {

                  // print('compute start');
                  compute(_spawnValue, "computer");
                  // compute(_spawnValue, "computer1");
                  // print('compute end');

                  // Isolate.spawn((message) {
                  //     _doSomeFuture();
                  // }, 100);


                  print("--- dodo");
                }else {

                  print("============点击了");

                }

              },
              title: Text(_list[index]),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: _list.length
      ),
    );
  }


}

void _spawnValue(value) {

  print("Isolate Task-start: $value");

  // dart： io中的操作。
  sleep(Duration(seconds: 3));
  print("Isolate Task-end");

}
