
import 'package:flutter/material.dart';

class OperatorTutorial extends StatelessWidget {
  const OperatorTutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Operator'),),
      body: const SingleChildScrollView(
        child: Center(
          child: Text('''
          正常的操作符其实Dart都是支持的。
          比如：++、--等
          ~/取整
          b ??= value，表示如果value非null，那么b就是value，否则保持b
          is as as? as!
          is可以用于判断是否是一个类。我们可以使用if (a is Type) 来进行提前判断，然后可以在后续作用域使用该类型。
          
          同样我们可重写操作符
          '''),
        ),
      ),
    );
  }

  void _operator1() {
    String? value;
    String? b = '12';
    b ??= value;
  }

  void _operator2() {
    dynamic a = 12;
    assert(a is int);
    if (a is int) {
      print(a.isOdd); //
    }
  }

  void _operator3() {
    dynamic a = 12;
    var b = a as int;

    // 联机运算符
    var c = const Text('')
      ..maxLines;
  }
}

class OperatorClass {
  final int x, y;

  OperatorClass(this.x, this.y);
  
  @override
  bool operator ==(Object other) {
    if (other is OperatorClass) {
      return other.x == x && other.y == y;
    }
    return false;
  }
  
  @override
  int get hashCode => Object.hash(x, y);

  // 操作符
  int operator +(OperatorClass other) {
    return x + other.x + y + other.y;
  }
}
