import 'package:flutter/material.dart';

class CodeLabsTutorial extends StatelessWidget {
  const CodeLabsTutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Codelabs'),),
      body: Column(
        children: [
            TextButton(onPressed: _codeExample, child: const Text('Example'))
        ],
      ),
    );
  }

  /// private method
  // Dart官网建议每个方法提供返回值类型
  void _codeExample() {
      var a = 12;

      // 非空，默认就是null
      int? b;
      b ??= 1;

      int? c;
      c = 12;

      const iterable = ['Salad', 'Popcorn', 'Toast'];
      for (final element in iterable) {
        print(element);
      }

      for (int month = 1; month < 12; month++) {
        print(month);
      }
  }
}
