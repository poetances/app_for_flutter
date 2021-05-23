
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PickerPage extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return _PickerPageState();
  }
}

class _PickerPageState extends State<PickerPage> with SingleTickerProviderStateMixin {

  AnimationController _animationController;


  CupertinoPicker _picker =  CupertinoPicker(
      itemExtent: 40,
      onSelectedItemChanged: (index){
        print(index);
      },
      children: <Widget>[
        Text("0"),
        Text("1"),
        Text("2"),
        Text("3"),
        Text("4"),
      ]
  );

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this);

    _animationController.duration = Duration(seconds: 1);
    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PickerPage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Divider(),
          MonthPicker(
              selectedDate: DateTime.now(),
              onChanged: (changeTime){
                print(changeTime);
              },
              firstDate: DateTime(2018),
              lastDate: DateTime(2030)
          ),


          Divider(),

          RaisedButton(
              onPressed: (){
                showCupertinoModalPopup(context: context, builder: (context){
                  return Container(
                    height: 200,
//                    child: _picker,
                  );
                });
              },
          ),
          Divider(),
          ScaleTransition(
            scale: Tween(begin: .3, end: 1.5).animate(_animationController),
            child: FlutterLogo(),
          ),
          Divider(),

          Builder(builder: (context){
            return  RaisedButton(
              onPressed: (){

                print(_animationController.isAnimating);

                Scaffold.of(context).showBottomSheet((context){

                  return Container(
                    height: 200,
                  );

                });

                //_animationController.isAnimating? _animationController.stop(canceled: true):_animationController.forward();

              },
              child: Text("start animation"),
            );
          })


        ],
      ),
    );
  }
}