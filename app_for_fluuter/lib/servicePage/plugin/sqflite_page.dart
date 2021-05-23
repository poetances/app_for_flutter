
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'dart:async';
import 'package:path/path.dart';

class SqfiltePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _SqfiltePageState();
}

class _SqfiltePageState extends State<SqfiltePage> {

  Person _per;
  
  Database _db;

  @override
  void initState() {
    super.initState();

    _per = Person();
    _per.name = 'David';
    _per.age = 15;
    _per.score = 80;
    _per.isPass = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SqfiltePage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          FlatButton(
            onPressed: () async{

              String value = jsonEncode(_per.toJson());

              String path = await getDatabasesPath();

              
              print(path);
              _db = await openDatabase(join(path, 'mine.db',),
                  version: 1,
                  onCreate: (Database db, int version) {

                  }
              );

            },

            child: Text('存储'),
          ),
          Divider(),
          FlatButton(
            onPressed: (){

            },
            child: Text('读取'),
          )
        ],
      ),
    );
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    
    _db.close();
  }
}

class Person {

  String name;
  int age;
  double score;
  bool isPass;

  Map<String, dynamic> toJson() {
    return {
      'name':name,
      'age': age,
      'score':score,
      'isPass': isPass
    };
  }

}