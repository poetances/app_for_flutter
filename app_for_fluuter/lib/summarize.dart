
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

class SummarizePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SummarizePageState();
  }
}

class _SummarizePageState extends State<SummarizePage> {



  GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();



  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("SummarizePage"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {

              },

          ),


        ],
      )
    );
  }
}




