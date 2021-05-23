
import 'dart:ffi';
import 'dart:typed_data';

import 'package:app_for_fluuter/common/progress_hud.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';



class DeviceInfoPage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DeviceInfoPageState();
  }
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {


  Future<void> loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    print('3');
    // Response response = await Dio().get(dataURL);
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      print('4');

      //print(response.data);
    });
  }


  @override
  void initState() {
    super.initState();

    print('1');
    loadData().then((value)  {
      print('5');
    });
    print('2');

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('DeviceInfo'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              DeviceInfoPlugin _plugin = DeviceInfoPlugin();
              _plugin.iosInfo.then((iosInfo){

                print(iosInfo.toString());
              });

              print(MediaQuery.of(context).size);
              print(MediaQuery.of(context).padding);
            },
            child: Text('获取设备信息'),
          ),
          Divider()
        ],
      ),
    );
  }
}