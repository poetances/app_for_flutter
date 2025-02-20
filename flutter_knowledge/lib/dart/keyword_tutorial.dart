import 'package:flutter/material.dart';

/*
abstract
base
final
interface
sealed
mixin

* */
class KeywordTutorial extends StatelessWidget {
  const KeywordTutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/// abstract定义的接口，或者抽象父类。
/// extends类似继承。
/// implement实现。
abstract class Animal {
  void breath();

  @mustCallSuper
  void move() {

  }
}

class Cat extends Animal {

  @override
  void breath() {

  }
}

class Dog implements Animal {

  @override
  void breath() {
  }

  @override
  void move() {
    /// 不需要 super
  }
}

/// interface 如下代码样例，接口类可以实例化、被实现，但是不能被继承：
interface class VehicleInterface {
  void moveForward(int meters) {
    // ...
  }
}
// Error, 官方不建议这样写
class CarInterface extends VehicleInterface {

}


// Library a.dart
base class VehicleBase {
  void moveForward(int meters) {
    // ...
  }
}

// Can be extended
base class CarBase extends VehicleBase {
  int passengers = 4;
// ...
}

// Error,官方不建议这样写
base class MockVehicle implements VehicleBase {

  @override
  void moveForward(int meters) {
    // TODO: implement moveForward
  }
}

/// final
final class VehicleFinal {
  void moveForward(int meters) {
    // ...
  }
}

// Error，不能被继承
// class CarFinal extends VehicleFinal {
//
// }
// 不能被实现
// class CarFinal implements VehicleFinal {
//
// }

/// sealed
sealed class VehicleSealed {

}

class CarSealed extends VehicleSealed {}

class TruckSealed implements VehicleSealed {}

class BicycleSealed extends VehicleSealed {}

String ts() {
  // 1. ERROR: 不能被实例化
  // VehicleSealed myVehicle = VehicleSealed();

// 2. 子类可以被实例化
  VehicleSealed myCar = CarSealed();
  return switch (myCar) {
    CarSealed() => "",
    TruckSealed() => 'VROOOOMM',
    BicycleSealed() => 'VROOOOMM',
  };
}

/// mixin
mixin class VehicleMixin {
  void moveForward(int meters) {
    // ...
  }
}

class CarMixin with VehicleMixin {

}

/// factory
/// 在Dart中，factory关键字用于实现一个工厂构造函数。工厂构造函数与普通构造函数不同，它不会自动创建类的实例，而是通过代码逻辑来决定返回类的哪个实例。这样做的好处包括控制实例的构造过程、实现一个设计模式、或返回单例等。
class Singleton {
  static final Singleton _instance = Singleton._internal();

  // 私有的命名构造函数，外部无法实例化
  Singleton._internal();

  factory Singleton() {
    return _instance;
  }
}