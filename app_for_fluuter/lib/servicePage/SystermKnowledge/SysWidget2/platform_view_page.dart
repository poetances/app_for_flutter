
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class PlatformViewPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _PlatformViewPageState();
  }
}

class _PlatformViewPageState extends State<PlatformViewPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PlatformViewPage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 300,
            height: 200,
            color: Colors.grey,
            child: UIActivityIndicator(),
          ),
          Divider()
        ],
      ),
    );
  }
}


class UIActivityIndicator extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _UIActivityIndicatorState();
}

class _UIActivityIndicatorState extends State<UIActivityIndicator> {



  @override
  Widget build(BuildContext context) {


    if(defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'com.FlutterUIActivityViewFactory.cn',
        onPlatformViewCreated: (value){

          print('vale---$value');
        },
        creationParams: <String, dynamic>{
          'color':'f47920',
          'value': 0.5
        },
        creationParamsCodec: StandardMessageCodec(),
      );
    }
    return Container(
      alignment: Alignment.center,
      child: Text("defaultTargetPlatform == TargetPlatform.Android"),
    );
  }
}
























