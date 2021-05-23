

import 'package:flutter/material.dart';
import 'dart:async';

class DateTimePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DateTimePageState();
  }
}

class _DateTimePageState extends State<DateTimePage> {

  String _time;
  int _count = 60;


  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("DateTimePage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: (){
              DateTime time = DateTime.now();
              _time = time.toString();
              setState(() {
                
              });
            },
            child: Text("刷新时间"),
          ),
          RaisedButton(
            onPressed: (){
              showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1990),
                  lastDate: DateTime.now(),
              ).then((selectDay){
                _time = selectDay.toString();
                setState(() {


                });

              });

            },
            child: Text("ShowDayPicker"),
          ),
          RaisedButton(
            onPressed: (){
              showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(DateTime.now()),

              ).then((selectTime){
                _time = selectTime.toString();

                setState(() {

                });
              });

            },
            child: Text("ShowTimePicker"),
          ),
          RaisedButton(
            onPressed: (){
              Timer(Duration(seconds: 1), (){


                _time = "Timer(Duration(seconds: 1), (){}";
                setState(() {

                });
              });

            },
            child: Text("定时器-延时执行"),
          ),
          RaisedButton(
            onPressed: (){
              Timer.periodic(Duration(seconds: 1), (timer){
                if(_count == 0){
                  timer.cancel();
                }
                _time = "Timer.periodic(Duration(seconds: 1),(timer){}}:${_count--}";
                setState(() {

                });
              });

            },
            child: Text("定时器-重复执行"),
          ),
          Divider(),
          Wrap(
            children: <Widget>[
              Text("当前时间："),
              Text(_time ?? "请获取时间", softWrap: true),
            ],
          )
        ],
      ),
    );
  }
}