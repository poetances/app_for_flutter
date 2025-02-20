import 'package:flutter/material.dart';

class InitTutorial extends StatefulWidget {
  const InitTutorial({Key? key}) : super(key: key);

  @override
  State<InitTutorial> createState() => _InitTutorialState();
}

class _InitTutorialState extends State<InitTutorial> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InitPage'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
            },
            child: const Text('Elevated Button'),
          ),
        ],
      ),
    );
  }
}

class SuperClass {

  SuperClass._();
}

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
}

///Named constructors
class Point1 {
  final double x;
  final double y;

  Point1(this.x, this.y);

  // Named constructor
  Point1.origin()
      : x = 12,
        y = 13;
}

///Remember that constructors are not inherited, which means that a superclass’s named constructor is not inherited by a subclass.
/// If you want a subclass to be created with a named constructor defined in the superclass, you must implement that constructor in the subclass.
/// 构造函数不能继承，也就是父类的构造函数，子类必须要重写。
class Person {
  String? firstName;

  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson().
  Employee.fromJson(super.data) : super.fromJson() {
    print('in Employee');
  }
}

class Employee2 extends Person {
  Employee2() : super.fromJson({});
// ···
}

/// 可以使用super关键字进行优化构造器。
class Vector2d {
  final double x;
  final double y;

  Vector2d(this.x, this.y);
}

class Vector3d extends Vector2d {
  final double z;

  // Forward the x and y parameters to the default super constructor like:
  // Vector3d(final double x, final double y, this.z) : super(x, y);
  Vector3d(super.x, super.y, this.z);
}