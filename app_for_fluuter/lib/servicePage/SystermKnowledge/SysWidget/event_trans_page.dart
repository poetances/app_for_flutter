
import 'package:flutter/material.dart';


class EventTransPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EventTransPageState();
  }

}

class _EventTransPageState extends State<EventTransPage> with TestMixin{


  void testMethod() {

    print("hello,world");

    for(int a in [1,2,4]) {
      print(a);
    }

    print("hello,world");
  }

  @override
  Widget build(BuildContext context) {


    testMethod();

    print("hello,world");

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("EventTransPage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          // flutter 同样前面的控件能够挡住事件向下传递。
          Container(
            color: Colors.grey,
            width: 150,
            height: 150,
            child: RaisedButton(
                onPressed: () {
                  print("RaisedButton click");




                },
            ),
          ),

          Divider(),





        ],
      ),
    );
  }


}



mixin TestMixin<T extends StatefulWidget> on State<T> {


}