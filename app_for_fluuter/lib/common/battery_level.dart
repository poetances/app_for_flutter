
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class BatteryLevel extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BatteryLevel();
  }
}

class _BatteryLevel extends State<BatteryLevel> {


  String batteryLevel = 'unkown battery level';

  static const platform = const MethodChannel('com.flutter.cn');

  void _getBatteryLevel() async {

    try {
      final result = await platform.invokeMethod('getBatteryLevel', { "title": "这是一条来自flutter的参数" });
      print('---------------');
      print(result);

    }on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BatteryLevel'),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              child: Text(
                '获取电池容量'
              ),
              textColor: Colors.purple,
              onPressed: (){
                _getBatteryLevel();
                //Navigator.pop(context);
              }
          ),
          Divider(),
          Text("电池容量为:$batteryLevel")
        ],
      )
    );
  }
}