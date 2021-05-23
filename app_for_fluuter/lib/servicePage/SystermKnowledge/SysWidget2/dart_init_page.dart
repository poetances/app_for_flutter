
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DartInitPage extends StatefulWidget {
  @override
  _DartInitPageState createState() => _DartInitPageState();
}

class _DartInitPageState extends State<DartInitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DartInitPage'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: (){

              FatherCls fcls = FatherCls('David', '29');
              print('父类构造结束：${fcls.name}==${fcls.age}');

            },
            child: Text('父类构造函数'),
          ),
          Divider(),
          RaisedButton(
            onPressed: (){
              ChildCls ccls = ChildCls("Davide", "24");
              print('子类构造结束：${ccls.name}==${ccls.age}');
            },
            child: Text('子类构造函数'),
          ),

        ],
      ),
    );
  }
}

// ignore: slash_for_doc_comments
/**
*
关Dart语言的构造函数。默认，我们创建类，系统默认的构造函数是，无参数、无名称构造函数。
子类不会继承父类构造函数，如果父类有构造函数，那么子类一定也要定义构造函数，并且同时需要调用父类的构造函数。

oc、swift是会继承父类的构造方法。

* */
class FatherCls {

  String name;
  final String age;

  // 我们可以使用语法糖。
  FatherCls(String name, this.age){
    print('父类-init');

    this.name = name;
  }

  FatherCls.other(this.age, String name) {
    this.name = name;
  }



}


class ChildCls extends FatherCls {

  String name;
  String age;
  String _height;
  // ChildCls(String name, String age) : assert(age != null),
  //       super(name, age) {
  //   print('子类-init');
  //   this.age = age;
  //   this.name = name;
  // }

  ChildCls(this.name, this.age) :
        assert(age != null),
        _height = "1.78",
        super(name, age);
}