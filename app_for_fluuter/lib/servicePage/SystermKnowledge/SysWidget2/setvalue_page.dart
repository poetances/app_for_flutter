
import 'package:flutter/material.dart';

class InfoModel {
   String name = "默认值";

   static InfoModel _instance;
   static InfoModel get instance {
     if(_instance == null) {
       _instance = InfoModel._();
     }
     return _instance;
   }
   InfoModel._();
}

class SetValuePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SetValuePageState();
  }
}

class _SetValuePageState extends State<SetValuePage> {


  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3)).then((vlaue){
      InfoModel.instance.name = "3秒后设置的值";
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SetValuePage"),
      ),
      body: Center(
        child: Text(InfoModel.instance.name ),
      ),
    );

  }
}