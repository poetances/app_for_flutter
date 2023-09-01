import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main/tab_page.dart';

void main() {

  /// 全局收到错误的监听
  FlutterError.onError = (error) {
    print('FlutterRebuild全局接收到错误：-----start-----');
    print(error.exception);
    print(error.stack);
    print('FlutterRebuild全局接收到错误：-----end-----');
  };

  // error widget
  ErrorWidget.builder = (error) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Text(
            'error\n--------\n ${error.exception}',
            style: const TextStyle(fontSize: 12, color: Colors.green),
          ),
          const SizedBox(height: 12),
          Text(
            'stacktrace\n--------\n ${error.stack}',
            style: const TextStyle(fontSize: 12, color: Colors.green),
          ),
        ],
      ),
    );
  };

  runZonedGuarded(() => runApp(const MyApp()), (error, stack) {
    FlutterError.onError = (error) {
      print('RunZonedGuarded全局接收到错误：-----start-----');
      print(error.exception);
      print(error.stack);
      print('RunZonedGuarded全局接收到错误：-----end-----');
    };
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Knowledge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TabPage()
    );
  }
}

