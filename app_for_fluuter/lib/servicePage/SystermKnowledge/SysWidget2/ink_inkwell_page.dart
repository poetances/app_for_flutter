
import 'package:flutter/material.dart';

class InkAndInkWellPage extends StatefulWidget {
  @override
  _InkAndInkWellPageState createState() => _InkAndInkWellPageState();
}

class _InkAndInkWellPageState extends State<InkAndInkWellPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InkAndInkWell'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFDE2F21), Color(0xFFEC592F)]),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Text(
                  '这是InkWell的点击效果',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () {},
            ),
          ),


          Divider(),
          InkWell(
            onTap: (){

            },
            child: Text('this is Ink well'),
          )

        ],
      ),
    );
  }
}
