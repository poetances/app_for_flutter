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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grammar'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          }, child: const Text('variable'))
        ],
      ),
    );
  }

  void variableFunc() {
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
    print(ary2 == ary3); // true
  }
}
