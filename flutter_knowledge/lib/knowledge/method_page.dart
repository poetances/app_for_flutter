import 'package:flutter/material.dart';

class MethodPage extends StatefulWidget {
  const MethodPage({Key? key}) : super(key: key);

  @override
  State<MethodPage> createState() => _MethodPageState();
}

class _MethodPageState extends State<MethodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Method'),),
      body: const Center(
        child: SingleChildScrollView(
          child:  Text('data'),
        ),
      ),
    );
  }

  void _method1({int? a, int b = 12}) {
  }

  void _method2(int a, [int b = 12, int? c]) {
  }

  void _method3(int a, {required int b}) {
  }

  void _closure() {
    // 匿名函数也就是闭包
    // ([[类型] 参数[, …]]) {
    // 函数体;
    // };
    (int a) {}; // 这就是一个匿名函数
    // 常见使用
    var a = [1,2,3];
    var b = a.map((e) => '$e');
  }
}
