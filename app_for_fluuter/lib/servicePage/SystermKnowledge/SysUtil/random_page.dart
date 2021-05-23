
import 'package:flutter/material.dart';
import 'dart:math';

class RandomPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {

  Random _random;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RandomPage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              _random = Random(100);
            },
          ),
          Divider(),
          IconButton(
            icon: Icon(Icons.create_new_folder),
            onPressed: (){
              print(_random.nextInt(100));
            },
          )
        ],
      ),
    );
  }
}