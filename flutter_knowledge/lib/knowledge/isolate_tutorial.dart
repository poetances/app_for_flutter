import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IsolateTutorial extends StatefulWidget {
  const IsolateTutorial({Key? key}) : super(key: key);

  @override
  State<IsolateTutorial> createState() => _IsolateTutorialState();
}

class _IsolateTutorialState extends State<IsolateTutorial> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IsolatePage'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          ElevatedButton(
              onPressed: () async {
                print('start::$_count');
                // countEven(1000000000).then((value) {
                //   _count = value;
                //   setState(() {});
                // });

                // A function that spawns an isolate and runs a callback on that isolate.
                // 通过官方文档，我们知道compute，其实就是通过Isolate.spawn来创建一个隔离。
                compute(computeCountEvent, 1000000000).then((value) {
                  _count = value;
                  setState(() {});
                });
                print('end::$_count');
              },
              child: Text(
                _count.toString(),
              ),
          ),

          const Divider(),

          ElevatedButton(onPressed: () async{
            _count = await _createIsolate(1000000000);
            setState(() {});
          }, child: const Text('Create Isolate')),
          
        ],
      ),
    );
  }

  // 计算偶数的个数。 我们发现不管怎么操作，其都会阻塞ui线程。
  // 根本原因就是，async/await并不会开启新的线程。相当于我们还是在当前线程，只是
  // 增加了协程的调用。 其解决办法就是使用computer（本质上是开启新的Isolate）
  Future<int> countEven(int num) async {
    int count = 0;
    await Future(() {
      while (num > 0) {
        if (num % 2 == 0) {
          count++;
        }
        num--;
      }
    });
    return count;
  }

  // 通过compute创建Isolate。注意必须static或者全局函数。
  // 这样我们虽然可以解决复杂事情的占ui的问题，但是：isolate的创建同样会消耗掉50-150ms 的时间。
  static int computeCountEvent(int  num) {
    int count = 0;
    while (num > 0) {
      if (num % 2 == 0) {
        count++;
      }
      num--;
    }
    return count;
  }

  // 自己创建Isolate
  static Future<dynamic> _createIsolate(int num) async {
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(_createIsolate2, receivePort.sendPort);
    SendPort sendPort = await receivePort.first;

    ReceivePort answer = ReceivePort();
    sendPort.send([answer.sendPort, num]);
    return answer.first;
  }

  static void _createIsolate2(SendPort port) {
    final rPort = ReceivePort();
    port.send(rPort.sendPort);
    rPort.listen((message) {
      final send = message[0] as SendPort;
      final n = message[1] as int;
      send.send(computeCountEvent(n));
    });
  }
}
