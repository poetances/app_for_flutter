import 'package:flutter/material.dart';

class MixinTutorial extends StatefulWidget {
  const MixinTutorial({Key? key}) : super(key: key);

  @override
  State<MixinTutorial> createState() => _MixinTutorialState();
}

class _MixinTutorialState extends State<MixinTutorial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grammar'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('''
抽象类和混入在语法和用途上是有很大的不同的。抽象类主要用于表示一种抽象的概念或行为，
限制子类的行为和实现；混入主要用于为类添加一些特定的行为或功能，而不是为了表示一种抽象的概念或行为。
1、其实早起，dart实现接口，一般就是abstract class来实现。但是现在一般使用mixin。
abstract class，可以作为基类，或者接口。
2、mixin混合类，一般是为了给类添加新的功能。
abstract class CanMixinSuper {
  void canMixin() {
    print('CanMixinSuper canMixin');
  }
}

mixin Mixin1 on CanMixinSuper {
  void canMixin1() {
  }
}

mixin Mixin2 on CanMixinSuper {
  void canMixin2() {
  }
}

class CanMixin extends CanMixinSuper with Mixin1, Mixin2 {

  void startMixin() {
    // 开始混入
    canMixin();
    canMixin1();
    canMixin2();
  }
}
          '''),
          ElevatedButton(onPressed: (){
            final mix = CanMixin();
            mix.startMixin();
            setState(() {});

          }, child: const Text('mixin'))
        ],
      ),
    );
  }
}

///
/// extends 继承，是单继承。
abstract class Person {
  void breath();
}

class Student extends Person {

  @override
  void breath() {
    print('student can breath');
  }
}


///
/// implement，可以实现多继承1：n
abstract class Teach {
  void canTeach() {}
}

class Teacher implements Person, Teach {
  @override
  void breath() {

  }

  // from Teach
  @override
  void canTeach() {

  }
}

///
/// with也可以是1：n实现多继承。但是我们经常搭配的是mixin使用。
class Coder implements Person {
  @override
  void breath() {

  }
}

/// 可以使用mixin、with来实现多继承。相比implement的好处。
/// 一般会搭配on使用。
abstract class CanMixinSuper {
  void canMixin() {
    print('CanMixinSuper canMixin');
  }
}

mixin Mixin1 on CanMixinSuper {
  void canMixin1() {
  }
}

mixin Mixin2 on CanMixinSuper {
  void canMixin2() {
  }
}

class CanMixin extends CanMixinSuper with Mixin1, Mixin2 {

  void startMixin() {
    // 开始混入
    canMixin();
    canMixin1();
    canMixin2();
  }
}