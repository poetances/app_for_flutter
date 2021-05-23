
import 'package:flutter/material.dart';
import 'dart:core';

class SingleChirldLayoutPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SingleChirldLayoutPageState();
  }
}

class _SingleChirldLayoutPageState extends State<SingleChirldLayoutPage> {



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChirldLayoutPage"),
      ),
      body: Container(
        alignment: Alignment(0, 0),
        width: 150,
        height: 150,
        color: Colors.purple,
        child: CustomSingleChildLayout(
            delegate: CustomChildLayoutDelegate(),
          child: Container(color: Colors.teal,),
        ),
      ),

    );
  }
}

class CustomChildLayoutDelegate extends SingleChildLayoutDelegate {

  @override
  bool shouldRelayout(SingleChildLayoutDelegate oldDelegate) {
    // TODO: implement shouldRelayout
    return true;
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // TODO: implement getPositionForChild
    return super.getPositionForChild(size, childSize);
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    return super.getSize(constraints);
  }
}


class P extends SingleChildRenderObjectWidget {

  @override 
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    return null;
  }



}
