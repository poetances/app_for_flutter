
import 'package:flutter/material.dart';

class FlexableExpandedPage extends StatelessWidget {
  
  
  final _appBar = AppBar(
    title: Text("FlexableExpandedPage"),
    centerTitle: true,
    elevation: 1,
    brightness: Brightness.dark,
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Column(
        children: <Widget>[
          // Flex配合Expanded使用。
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[

              Container(
                color: Color(0xff840228),
                height: 50,
                width: 100,
                child: Text("Container"),
                alignment: Alignment(0, 0),
              ),
              Expanded(child: Container(
                color: Colors.purple,
                height: 50,
              )),
              Expanded(child: Container(
                color: Color(0xffef5b9c),
                height: 50,
              ),flex: 2,),
              Expanded(child: Container(
                color: Color(0xff224b8f),
                height: 50,
              )),
            ],
          ),
          SizedBox(height: 50,),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[

              Container(
                color: Color(0xff840228),
                height: 50,
                width: 100,
                child: Text("Container"),
                alignment: Alignment(0, 0),
              ),
              Flexible(child: Container(
                color: Colors.purple,
                height: 50,
              )),
              Flexible(child: Container(
                color: Color(0xffef5b9c),
                height: 50,
              ),flex: 2,),
              Flexible(child: Container(
                color: Color(0xff224b8f),
                height: 50,
              )),

              SizedBox(height: 30,),

            ],
          ),

        ],
      )
    );
  }
}