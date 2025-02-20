import 'package:flutter/material.dart';

///If you look at the API documentation for the basic array type, List, you’ll see that the type is actually List<E>.
///The <…> notation marks List as a generic (or parameterized) type—a type that has formal type parameters.
///By convention, most type variables have single-letter names, such as E, T, S, K, and V.
class GenericsTutorial extends StatelessWidget {
  const GenericsTutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

abstract class Cache<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}

class Foo<T extends Object> {
  // Any type provided to Foo for T must be non-nullable.
}

/// 泛型方法
T first<T>(List<T> ts) {
  // Do some initial work or error checking, then...
  T tmp = ts[0];
  // Do some additional checking or processing...
  return tmp;
}