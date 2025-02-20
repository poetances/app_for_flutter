
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

class AnomalyTutorial extends StatefulWidget {
  const AnomalyTutorial({Key? key}) : super(key: key);

  @override
  State<AnomalyTutorial> createState() => _AnomalyTutorialState();
}

class _AnomalyTutorialState extends State<AnomalyTutorial> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnomalyPage'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('''
            Dart通常提供了Error和Exception两种异常
            In contrast to Java, all of Dart’s exceptions are unchecked exceptions. Methods don’t declare which exceptions they might throw, and you aren’t required to catch any exceptions.
            这句话详细说明了，Dart中的异常是未检查的，也就是说一个方法，我们根本看不出来内部是否抛出了异常，而且我们也不需要去捕捉这个异常。

          '''),
          ElevatedButton(onPressed: _error, child: const Text('抛出Error')),
          ElevatedButton(onPressed: () {
            // 最简单的异常捕捉
            try {
              _exception();
            } catch(e) {
              print(e);
            } finally {
              print('捕获到');
            }

            }, child: const Text('抛出Exception')),

          ElevatedButton(onPressed: () {
            // 也可以使用，on指定类型来进行捕捉。
            try {
              _exception();
            } on UnauthorizedException catch(e) {
              print(e);
            } finally {
              print('finally');
            }
          }, child: const Text('try-on')),

          ElevatedButton(onPressed: () {
            // 也可以使用，on指定类型来进行捕捉。
            try {
              _exception();
            } finally {
              print('finally');
            }
          }, child: const Text('try-finally')),

          ElevatedButton(onPressed: () {
            try {
              _anyThrow();
            } catch (e) {
              print(e);
              print(e.runtimeType);
            }
          }, child: const Text('try-any'))
        ],
      )
    );
  }

  void _error() {
    Error e = Error();
    throw e;
  }

  void _exception()  {
    var e = Exception('这是一个Exception');
    throw e;
  }

  void _anyThrow() {
    throw 'hello, throws';
  }
}


