
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ShaderMaskPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("ShaderMaskPage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ShaderMask(
            shaderCallback: (rect){
              return LinearGradient(
                  colors: [
                    Colors.greenAccent,
                    Colors.deepPurpleAccent,
                    Colors.redAccent,
                  ]
              ).createShader(rect);
            },
            blendMode: BlendMode.modulate,
            child: Image.asset("assets/home/image0.png", width: 200, height: 200,),
          ),

          Divider(),


          Stack(
            children: [
              Image.network(
                "http://qiniu.nightfarmer.top/恶龙咆哮.gif",
                width: 300,
                height: 300,
              ),
              BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child:  Container(
                  width: 300,
                  height: 300,
                  color: Colors.white.withOpacity(0.1),
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}
