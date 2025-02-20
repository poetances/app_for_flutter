import 'package:flutter/material.dart';

///Dart is a true object-oriented language, so even functions are objects and have a type, Function.
///This means that functions can be assigned to variables or passed as arguments to other functions.
///You can also call an instance of a Dart class as if it were a function. For details, see Callable objects.
///
/// Dart中函数也是一个对象，Function类型。
class FunctionsTutorial extends StatelessWidget {
  FunctionsTutorial({super.key});

  final _nobleGases = {1: 1, 2: 2};

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }


  isNoble1(atomicNumber) {
    return _nobleGases[atomicNumber] != null;
  }
  bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;

  /// 有命名的函数
  void enableFlags({bool? bold, bool? hidden}) { }
  void enableFlags2({bool bold = false, bool hidden = false}) { }

  ///If you instead want a named parameter to be mandatory, requiring callers to provide a value for the parameter, annotate them with required:
  void enableFlags3({required bool bold, bool hidden = false}) { }

  /// Optional positional parameters
  /// 可选位置参数
  String say(String from, String msg, [String? device]) {
    var result = '$from says $msg';
    if (device != null) {
      result = '$result with a $device';
    }
    return result;
  }
}
