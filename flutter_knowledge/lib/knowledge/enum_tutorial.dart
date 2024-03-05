import 'package:flutter/material.dart';
class EnumTutorial extends StatelessWidget {
  const EnumTutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EnumPage'),),
      body: const SingleChildScrollView(
        child: Center(
          child: Text('''
/// 普通枚举
enum _Direction {
  left,
  right,
  top
}

void _test() {
  var es = Estate.apartment;
  es.printName();
  print(es.index);
  print(es.name);
}
/// 特殊枚举
enum Estate {
  apartment(area: 90),
  house(area: 110),
  cottage(area: 260);

  final double area;
  const Estate({required this.area});

  void printName() {
    print(name);
    print(area);
    print(index);
    print(Estate.values);
  }
}

/// 可以实现超级enum，并且能够实现接口。
/// 同时枚举也是支持属性、常量构造方法、增加方法。
enum Vehicle implements Comparable<Vehicle> {
  car(tires: 4, passengers: 5, carbonPerKilometer: 400),
  bus(tires: 6, passengers: 50, carbonPerKilometer: 800),
  bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0);


  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonPerKilometer,
  });

  final int tires;
  final int passengers;
  final int carbonPerKilometer;

  int get carbonFootprint => (carbonPerKilometer / passengers).round();

  @override
  int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;
} 
          '''),
        ),
      ),
    );
  }
}


/// 普通枚举
enum _Direction {
  left,
  right,
  top
}

void _test() {
  var es = Estate.apartment;
  es.printName();
  print(es.name);
  print(es.index);
}
/// 特殊枚举
enum Estate {
  apartment(area: 90),
  house(area: 110),
  cottage(area: 260);

  final double area;
  const Estate({required this.area});

  void printName() {
    print(name);
    print(area);
    print(index);
    print(Estate.values);
  }
}

/// 可以实现超级enum，并且能够实现接口。
/// 同时枚举也是支持属性、常量构造方法、增加方法。
enum Vehicle implements Comparable<Vehicle> {
  car(tires: 4, passengers: 5, carbonPerKilometer: 400),
  bus(tires: 6, passengers: 50, carbonPerKilometer: 800),
  bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0);


  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonPerKilometer,
  });

  final int tires;
  final int passengers;
  final int carbonPerKilometer;

  int get carbonFootprint => (carbonPerKilometer / passengers).round();

  @override
  int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;
}
