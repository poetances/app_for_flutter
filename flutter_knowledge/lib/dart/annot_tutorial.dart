import 'package:flutter/material.dart';

class AnnotTutorial extends StatelessWidget {
  const AnnotTutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('注释'),),
      body: const Column(
        children: [
           Text("""
注释有单行和多行。
单行注释//
多行注释
/**

*/

///
///
/// 这种多行注释可以使用[Class]从而成类的引用。         
          """)
        ],
      ),
    );
  }
}
