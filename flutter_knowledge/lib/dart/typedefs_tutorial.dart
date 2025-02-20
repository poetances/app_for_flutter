import 'package:flutter/material.dart';

typedef IntList = List<int>;
typedef ListMapper<X> = Map<X, List<X>>;
typedef Compare<T> = int Function(T a, T b);

class TypedefsTutorial extends StatelessWidget {
  const TypedefsTutorial({super.key});


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  /// private method
  void _typedef() {
    IntList il = [1, 2, 3];

    Map<String, List<String>> m1 = {}; // Verbose.
    ListMapper<String> m2 = {}; //

    int sort(int a, int b) => a - b;
    Comparable<int> sort2 = sort as Comparable<int>;
  }
}
