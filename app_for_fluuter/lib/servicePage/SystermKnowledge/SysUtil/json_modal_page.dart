
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'dart:async';

class JsonModalPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _JsonModalPageState();
  }
}

class _JsonModalPageState extends State<JsonModalPage> {


  final _url =  "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JsonModalPage"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          RaisedButton(
              onPressed: ()async{

                // Flutter中，json知识点。
                
                 try{
                   Response<String> response = await Dio().request(_url);
                   Map<String, dynamic> map = jsonDecode(response.data);
                   print(map);

                 }on DioError catch(error){
                   print("error:--${error.message}");
                 }



              },
            child: Text("jsonStringTojson"),
          ),
          Divider(),
          RaisedButton(
            onPressed: (){

              print("you can use 'josonEncode()进行转换。'");

            },
            child: Text("jsonTojsonString"),
          ),

        ],
      ),
    );
  }
}