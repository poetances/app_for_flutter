
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class ImportPage extends StatelessWidget {
  const ImportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ImportPage'),),
      body: const SingleChildScrollView(
        child: Center(
          child: Text('''
一般import后面会跟一个命名空间
如果对于Dart提供的库，后面跟的是dart如：
import 'dart:async';

而非dart库，后面跟的是package；
import 'package:flutter/material.dart';  // Flutter提供的包
import 'package:flutter/animation.dart'; // 自己的库
同时我们是可以搭配关键字的，as、show、hide、deffer as延时加载，表示只有在使用的时候采取加载。

import 'package:lib2/lib2.dart' as lib2;
// Import only foo.
import 'package:lib1/lib1.dart' show foo;

// Import all names EXCEPT foo.
import 'package:lib2/lib2.dart' hide foo;
          '''),
        ),
      ),
    );
  }
}