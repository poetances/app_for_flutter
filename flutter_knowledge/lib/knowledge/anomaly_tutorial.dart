
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
            //Dart通常提供了Error和Exception两种异常
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

            // 也可以使用，on指定类型来进行捕捉。
            try {
              _exception();
            } on UnauthorizedException catch(e) {
              print(e);
            } finally {
              print('finally');
            }

            // 也可以配合final
            try {
              _exception();
            } finally {
              print('finally2');
            }

          }, child: const Text('抛出Exception'))
        ],
      )
    );
  }

  void _error() {
    Error e = Error();
    throw e;
  }

  void _exception() {
    var e = Exception('这是一个Exception');
    throw e;
  }
}


