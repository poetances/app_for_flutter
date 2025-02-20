import 'package:flutter/material.dart';

/// 内置基本数据类型
class BuildInTypesTutorial extends StatelessWidget {
  const BuildInTypesTutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('基本数据类型'),),
      body: const Column(
        children: [
          Text("""
Dart中内置的基本数据类型：
Numbers (int, double)
Strings (String)
Booleans (bool)
Records ((value1, value2))
Lists (List, also known as arrays)
Sets (Set)
Maps (Map)
Runes (Runes; often replaced by the characters API)
Symbols (Symbol)
The value null (Null)

          """)
        ],
      ),
    );
  }

  /// private method
  /// sealed class num implements Comparable<num>
  /// abstract final class int extends num
  /// abstract final class double extends num
  void numbers() {
    num a = 12;
    double b = 12.0;

    // Dart中没有float类型。 int、double继承了num
  }

  /// strings
  /// abstract final class String implements Comparable<String>, Pattern
  void strings() {
    String a = 'a';

    var b = '$a is good';
  }

  void booleans() {
    var a = true;
  }

  void records() {
    // 和swift中的元祖（tuple)很像
    var record = ('first', a: 2, b: true, 'last');

    print(record.$1); // Prints 'first'
    print(record.a); // Prints 2
    print(record.b); // Prints true
    print(record.$2); // Prints 'last'

    (num, Object) pair = (42, 'a');
    var first = pair.$1; // Static type `num`, runtime type `int`.
    var second = pair.$2; // Static type `Object`, runtime type `String`.

    // 有标签的定义
    (String, {int a, int b}) record2;
    record2 = ('a', a: 12, b: 14);
  }

  void list() {
    var a = <int>[];
    a.add(1);
    a.add(2);

    List b = [1, 2];

    var list = [1, 2, 3];
    var list2 = [0, ...list];

    //If the expression to the right of the spread operator might be null, you can avoid exceptions by using a null-aware spread operator (...?):
    var list3 = [0, ...?list];

    bool promoActive = true;
    var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];

    var listOfInts = [1, 2, 3];
    var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
    assert(listOfStrings[1] == '#1');
  }

  /// Set的最大特点就是无序、唯一。
  void set() {
    var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

    Set a = {1, 2};
    Set b = <int>{};
  }

  void map() {
    var a = {'a': 12, 'b': 14};
    Map b = <String, int>{};
  }
}
