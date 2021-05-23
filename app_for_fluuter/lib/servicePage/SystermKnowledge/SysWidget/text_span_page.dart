
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class TextSpanPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TextSpanPageState();
}

class _TextSpanPageState extends State<TextSpanPage> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("TextSpanPage", style: TextStyle(decoration: TextDecoration.underline, letterSpacing: 2, textBaseline: TextBaseline.ideographic), ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          GestureDetector(),

          Text.rich(
            TextSpan(
              text: "公司简介",
              children: [
                TextSpan(
                  text: "详情",
                  style: TextStyle(color: Colors.green),
                  recognizer: TapGestureRecognizer()..onTap = (){
                    print("点击-详情");
                  },
                  children: [
                    WidgetSpan(child: InkWell(
                      child: Image.asset("assets/home/image0.png", width: 15,height: 15,),
                      onTap: (){
                        print("点击图片");
                      },
                    ),
                    )
                  ]
                ),
              ]
            ),
            style: TextStyle(fontSize: 20),
          ),

          Divider()
        ],
      ),
    );
  }
}