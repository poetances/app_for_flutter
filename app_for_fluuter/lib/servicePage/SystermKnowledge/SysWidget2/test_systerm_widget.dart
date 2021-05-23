
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class TestSystermWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _TestSystermWidgetState();
  }
}

class _TestSystermWidgetState extends State<TestSystermWidget> with SingleTickerProviderStateMixin {

  double _value = 0.5;
  IconData _iconData;
  
  AnimationController _animationController;
  Animation<double> _animation;

  int _count = 0;
  bool _showCrossFirst = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    
    _iconData = Icons.add;

    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("TestSystermWidget"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Slider(value: _value, onChanged: (value){
            _value = value;
            setState(() {
            });
          }),

          IgnorePointer(
            ignoring: true,
            child: GestureDetector(
              onTap: (){
                print('IgnorePointer-------tap');
              },
              child: Container(
                width: 300,
                height: 100,
                color: Colors.purple,
              ),
            ),
          ),

          SizedBox(height: 20,),
          CircularProgressIndicator(
            value: _value,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
            backgroundColor: Colors.grey,
          ),

          Divider(),
          RaisedButton(
            onPressed: (){
              setState(() {
                if (_iconData == Icons.clear)
                  _iconData = Icons.add;
                else
                  _iconData = Icons.clear;
              });

            },
            child: Text("AnimatedSwitcher"),
          ),

          AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child: Icon(_iconData,key: ValueKey(_iconData),),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(child: child, scale: animation);
            },
          ),

          Divider(),
          RaisedButton(
            onPressed: (){

              _value += 0.1;
              if (_value > 1) {
                return;
              }

              _animationController.forward();

//              setState(() {
//
//              });
//              if (_animationController.isCompleted) {
//                _animationController.reverse();
//              }else {
//                _animationController.forward();
//              }

            },
            child: Text("StartAnimtionController"),
          ),

          FadeTransition(
            opacity: _animation,
            child: Container(
              width: 200,
              height: 100,
              color: Colors.purple,
            ),
          ),

          Divider(),
          RaisedButton(
            onPressed: (){
              _showCrossFirst = !_showCrossFirst;
              setState(() {});
            },
          ),
          AnimatedCrossFade(
            firstChild: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(100)
              ),
            ),
            secondChild: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.blue,
              ),
            ),
            crossFadeState: _showCrossFirst? CrossFadeState.showFirst:CrossFadeState.showSecond,
            duration: Duration(seconds: 2),
          )


        ],
      ),
    );
  }
}