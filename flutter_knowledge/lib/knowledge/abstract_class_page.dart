import 'package:flutter/material.dart';

class AbstractClassPage extends StatelessWidget {
  const AbstractClassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AbstractClass'),),
      body: const SingleChildScrollView(
        child: Center(
          child: Text('''
            Abstract用于定义抽象类。通常用于接口，当然也可以定义方法的实现。
          '''),
        ),
      ),
    );
  }
}

abstract class Runner {

  void run();
}

class Person extends Runner {

  @override
  void run() {
  }
}