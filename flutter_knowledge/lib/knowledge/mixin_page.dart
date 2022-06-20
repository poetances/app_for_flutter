import 'package:flutter/material.dart';

class MixinPage extends StatefulWidget {
  const MixinPage({Key? key}) : super(key: key);

  @override
  State<MixinPage> createState() => _MixinPageState();
}

class _MixinPageState extends State<MixinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grammar'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
class Coder with Person, Teach {
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

  @override
  void canMixin() {
    super.canMixin();
    print('mixin1 canMixin');
  }
}

mixin Mixin2 on CanMixinSuper{

  @override
  void canMixin() {
    super.canMixin();
    print('mixin2 canMixin');
  }

}

class CanMixin extends CanMixinSuper with Mixin1, Mixin2 {

  void startMixin() {
    // 开始混入
    canMixin();
  }

}