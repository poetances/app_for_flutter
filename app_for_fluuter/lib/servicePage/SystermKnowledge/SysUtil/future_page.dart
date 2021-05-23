
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:isolate';

class FuturePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FuturePageState();
  }
}

class _FuturePageState extends State<FuturePage> {


  Future<void> futureFunc() {



    return Future((){

        for(int i = 0, j=1000; i<j; i++){

        }
        print("futureFunc");
        throw Exception("--------Exception");

      });

  }

  Future<int> futureMehod() {

    print("开始");
    return Future((){
      sleep(Duration(seconds: 2));
      print("future 执行");

      return 12;

    }).then((value){
      print("future then");

      return 11;
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("FuturePage"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () async{

              try{
                await futureFunc();
              }catch(error) {
                print("cathchError----$error");
              }

            },
            child: Text("Future"),
          ),
          Divider(),
          RaisedButton(
            onPressed: (){


              futureFunc().catchError((error){
                print("catchError----$error");
              });

            },
            child: Text("report error"),
          ),
          Divider(),
          RaisedButton(
            onPressed: () async{

               int value = await futureMehod();
              print("futureMehod----函数后面$value");
            },
            child: Text("Future method"),
          ),
        ],
      ),
    );
  }


}