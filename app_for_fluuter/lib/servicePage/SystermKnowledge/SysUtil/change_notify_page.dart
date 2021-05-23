
import 'package:flutter/material.dart';

class ChangeNotifyPage extends StatefulWidget {
  @override
  _ChangeNotifyPageState createState() => _ChangeNotifyPageState();
}

class _ChangeNotifyPageState extends State<ChangeNotifyPage> {


  MineChangeNotifier _changeNotifier;
  MineValueChangeNotifier _valueChangeNotifier;
  int _tapCount = 0;

  @override
  void initState() {
    super.initState();

    _changeNotifier = MineChangeNotifier();
    _changeNotifier.addListener(() {
      print("MineChangeNotifier: ${_changeNotifier.name}");
    });

    _valueChangeNotifier = MineValueChangeNotifier(value: "hello");
    _valueChangeNotifier.addListener(() {
      print("MineValueChangeNotifier: ${_valueChangeNotifier.name}");
    });
  }

  @override
  Widget build(BuildContext context) {

    TextEditingController c;
    return Scaffold(
      appBar: AppBar(title: Text("ChangeNotify"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          RaisedButton(
            onPressed: (){
              _tapCount++;
              _changeNotifier.name = "当前点击：$_tapCount";
            },
            child: Text("MineChangeNotifier"),
          ),
          Divider(),
          RaisedButton(
            onPressed: (){

              _tapCount--;
              _valueChangeNotifier.name = "当前点击: $_tapCount";
            },
            child: Text("MineValueChangeNotifier"),
          ),
        ],
      ),
    );
  }
}


class MineChangeNotifier extends ChangeNotifier {

  String _name;

  set name(String value) {
    _name = value;
    notifyListeners();
  }
  String get name {
    return _name;
  }

}

class MineValueChangeNotifier extends ValueNotifier<String> {

  MineValueChangeNotifier({String value}): super(value);

  set name(String newValue) {
    value = newValue;
  }
  String get name {
    return value;
  }
}