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
          }, child: const Text('??'))


        ],
      ),
    );
  }
}
