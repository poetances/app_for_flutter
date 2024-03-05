import 'package:flutter/material.dart';

class ClassTutorial extends StatelessWidget {
  const ClassTutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ClassPage'),),
      body: const Column(
        children: [
          Text('''
             1、dart会默认生成一个无名、无参的构造函数。
             2、如果有成员变量，那么成员变量必须是可选类型、或者指定了默认值。
               class SuperClass {
                  int age = 0;
                  String? name;
               }
               否则需要有构造函数去进行初始化。
             3、构造函数不能继承。所以父类有了自定义构造函数，那么子类必须显示声明构造函数，
              同时需要调父类的构造函数。
             4、还可以通过超累构造函数的方式。但是Dart版本必须是2.17之后
                class ChildClass2 extends SuperClass {
                  double score;
                  ChildClass2(this.score, super.age); // 构造函数可以有super关键字
                }
              5、初始化列表
                class Person {
                  String x;
                  String y;
                
                    Person.fromJson(Map<String, String> json)
                      : x = json['x']!,
                        y = json['y']! {
                      print('初始化列表完成');
                    }
                }
                注意其语法。而且初始化列表中可以增加断言。
                  Person.fromJson(Map<String, String> json)
                      : x = json['x']!,
                        y = json['y']!, 
                        asset(x != 'fuck') {
                      print('初始化列表完成');
                   }
              6、重定向构造函数
                class Point {
                  double x, y;
                
                  Point(this.x, this.y);
                
                  Point.alongXAxis(double x) : this(x, 0);
                }
              7、单利写法。
              8、factory的用法。
                在 Dart 中，factory 关键字用于创建一个类的对象，但是与普通的构造函数不同，
                factory 方法可以返回一个已经存在的对象，也可以返回一个新的对象。
          '''),
        ],
      ),
    );
  }

  void _classInitial() {

  }
}

class SuperClass {
  // 必须构造函数中对所有类型进行初始化，除非是可选类型
  String? name;

  int age;

  // 构造函数
  SuperClass(this.age);

  // 遍历构造函数
  SuperClass.newInitial(this.age) {
    print('遍历构造方法');
  }

  // 遍历构造函数
  SuperClass.newInitial2(int n): age = n + 1 {
    print('新遍历方法');
  }
}

// Dart会默认生成一个无名、无参的默认构造函数
class ChildClass extends SuperClass {
  //
  double height;

  ChildClass(this.height) : super(height.toInt());
}

// 还可以通过超累构造函数的方式。但是Dart版本必须是2.17之后
class ChildClass2 extends SuperClass {
  double score;
  ChildClass2(this.score, super.age);
}

class Vector2d {
  final double x;
  final double y;

  Vector2d(this.x, this.y);
}

class Vector3d extends Vector2d {
  final double z;

  // Forward the x and y parameters to the default super constructor like:
  // Vector3d(final double x, final double y, this.z) : super(x, y);
  Vector3d(super.x, this.z, super.y);
}

// 初始化列表
class Person {
  String x;
  String y;

  Person.fromJson(Map<String, String> json)
    : x = json['x']!,
      y = json['y']! {
    print('初始化列表完成');
  }
}

// 重定向构造函数
class Point {
  double x, y;

  Point(this.x, this.y);

  Point.alongXAxis(double x) : this(x, 0);
}

// 单利
// 使用 factory 关键字标识类的构造函数将会令该构造函数变为工厂构造函数，
// 这将意味着使用该构造函数构造类的实例时并非总是会返回新的实例对象。
// 例如，工厂构造函数可能会从缓存中返回一个实例，或者返回一个子类型的实例。
class Singleton {
  static final Singleton _instance = Singleton._();
  Singleton._();

  factory Singleton() {
    return _instance;
  }
}

class Singleton2 {
  static Singleton2? _instance;

  factory Singleton2() {
    _instance ??= Singleton2._internal();
    return _instance!;
  }

  Singleton2._internal();
}

class Rectangle {
  double left, top, width, height;

  // setter、getter方法
  double get right => left + width;
  set right(double value) => left = value - width;

  Rectangle(this.left, this.top, this.width, this.height);
}