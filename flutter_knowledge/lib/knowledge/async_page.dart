import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class AsyncPage extends StatefulWidget {
  const AsyncPage({Key? key}) : super(key: key);

  @override
  State<AsyncPage> createState() => _AsyncPageState();
}

class _AsyncPageState extends State<AsyncPage> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..repeat();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AsyncPage'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('''
Dart 是事件驱动的体系结构，该结构基于具有单个事件循环和两个队列的单线程执行模型。
Dart虽然提供调用堆栈。 但是它使用事件在生产者和消费者之间传输上下文。 事件循环由单个线程支持，因此根本不需要同步和锁定。

还有个问题，就是不管Future、Future.microtask等，这些创建的起参数都是FutureOr<T>。
FutureOr<T> 主要用于在 Dart 中描述异步计算的结果。
具体而言，FutureOr<T> 表示一个可以包含类型为 T 的值或者一个异步计算 T 的结果的对象。
如果 FutureOr<T> 包含了一个 T 类型的值，那么这个值可以直接被访问和使用。
如果 FutureOr<T> 包含了一个异步计算 T 的结果，那么这个计算的结果在完成后会存储在 FutureOr<T> 中，然后可以被访问和使用。
你可以把它理解为受限制的dynamic类型，因为它只能接受Future<T>或者T类型的值
FutureOr<int> a = 1;
FutureOr<int> af = Future.value(1);
FutureOr<int> as = '1'; // 报错。
同时官方也不建议我们直接使用FutureOr类。会使用Future类。
          '''),

            ElevatedButton(onPressed: () {
              print('start');
              Future(() {
                print('event task');
              });
              Future.microtask(() {
                print('micro task');
              });
              print('stop');

            }, child: const Text(r'Micro\Event')),

            ElevatedButton(onPressed: () {
              print('理解Dart的单线程: start');
              Future(() {
                print('理解Dart的单线程: event task');
              });
              sleep(const Duration(seconds: 2));
              print('理解Dart的单线程: stop');

              // 注意执行顺序：
              // 理解Dart的单线程: start
              // 理解Dart的单线程: stop
              // 理解Dart的单线程: event task

              // 但是如果在多线程语言中，比如swift，则执行顺序是：
              // 理解Dart的单线程: start
              // 理解Dart的单线程: event task
              // 理解Dart的单线程: stop
            }, child: const Text('理解Dart的单线程')),

            ElevatedButton(onPressed: () async {
              print('理解Dart的单线程: start');
              await Future(() {
                print('理解Dart的单线程: event task');
              });
              sleep(const Duration(seconds: 2));
              print('理解Dart的单线程: stop');

              // 注意执行顺序：
              // 理解Dart的单线程: start
              // 理解Dart的单线程: event task
              // 理解Dart的单线程: stop
            }, child: const Text('理解Dart的单线程2')),

            RotationTransition(
              turns: _animation,
              child: const FlutterLogo(),
            ),

            ElevatedButton(onPressed: _addMicroTask, child: const Text('AddMicroTask')),

            ElevatedButton(onPressed: _addEventTask, child: const Text('AddEventTask'))
          ],
        ),
      ),
    );
  }

  void _longRunningOperations() {
    for (int i = 0; i < 50; i++) {
      print(i);
    }
  }

  void _longRunningOperationsMicro() {
    for (int i = 0; i < 100; i++) {
      print('micro: $i');
    }
  }

  Future<void> _addMicroTask() async {
    // 第一种方式通过scheduleMicrotask
    // scheduleMicrotask(_longRunningOperations);
    // 第二种通过Future
    Future.microtask(_longRunningOperationsMicro);
  }

  Future<void> _addEventTask() async {
    Future(_longRunningOperations);
  }
}
