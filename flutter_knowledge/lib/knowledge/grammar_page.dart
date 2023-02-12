import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GrammarPage extends StatefulWidget {
  const GrammarPage({Key? key}) : super(key: key);

  @override
  State<GrammarPage> createState() => _GrammarPageState();
}

class _GrammarPageState extends State<GrammarPage> {

  // 我们可以这样写但是不建议。会报警告
  String _nm = '';
  set name(String nm) {
    _nm = nm;
  }
  String get name => _nm;
  // 可以通过，下面这种方式进行写
  String goodName = '';

  Completer _completer = Completer();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grammar'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CupertinoActivityIndicator(),

          ElevatedButton(onPressed: (){
            String? tmp = '12';
            // tmp ??= 'ab';
            print(tmp); // 12


            String? tmp1;
            tmp1 ??= 'ab';
            print(tmp1); // ab
          }, child: const Text('??')),
          const Divider(),
          ElevatedButton(onPressed: (){
            variableFunc();
          }, child: const Text('variable')),

          const Text(r'hello,\nworld'),
          ElevatedButton(onPressed: (){
            var set1 = {1, 2, 3 ,4, 4, 3, 2, 1, 5};
            var list = [1, 2, 3 ,4, 4, 3, 2, 1, 5];
            var set2 = Set.from(list);
            var set3 = Set.of(list);
            print(set1);
            print(set2);
            print(set3);

          }, child: const Text('Set')),

          ElevatedButton(onPressed: (){
            print('start test');
            someFutureResult().then((value) {
               print('someFutureResult---end');
             });
             print('end test');
          }, child: const Text('start complete')),
        ],
      ),
    );
  }

  void variableFunc() async {
    // 万物皆对象
    int? lineCount;
    if (lineCount == null) {
      print('line count not init');
    }

    // 使用var 代替指定类型
    var str1 = "Hello";
    String str2 = "world";

    // final和const区别。 const编译的时候就会确定值。final只能赋值一次。
    const str3 = "David";

    final ary1 = [1, 2];
    ary1.add(3);

    const ary2 = [1, 2];
    // ary2.add(4); // Unsupported operation: Cannot add to an unmodifiable list

    var ary3 = const [1, 2];
    // ary3.add(5); // Unsupported operation: Cannot add to an unmodifiable list

    print(ary1);
    print(ary2);
    print(ary3);
    print(ary1 == ary2); // false
    print(ary2 == ary3); // t


  }

  // 基本数据类型
  void baseDataType() {
    // 注意：int、double和num的关系。
    int a = 12;
    double b = 13.0;
    num n1 = 12;
    num n2 = 13.0;

    // String
    String str1 = r"hello,world\n";
  }

  Future<void> futureFor() async {
    _completer.complete(
      forMethod()
    );

    return _completer.future;
  }

  int forMethod() {
    int c = 0;
    for (int i = 0; i < 1000000; i++) {
      print(i);
      c = i;
    }
    return c;
  }

  Future<String> someFutureResult(){
    final c = Completer<String>();
    // complete will be called in 3 seconds by the timer.
    Timer(const Duration(seconds: 3), () {
      c.complete("you should see me second");
    });
    return c.future;
  }
}
