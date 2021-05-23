
import 'package:flutter/material.dart';

class ListWheelScrollViewPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ListWheelScrollViewPageState();
}

class _ListWheelScrollViewPageState extends State<ListWheelScrollViewPage> {

  ScrollController _controller;

  List<String> _titles = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for(int i = 0; i< 20; i++) {
      _titles.add('$i');
    }

    _controller = ScrollController();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: (){
            _controller.animateTo (50, duration: kThemeAnimationDuration, curve: Curves.linear);
          })
        ],
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment(0, 0),
        child: SizedBox(
          height: 100,
          width: 100,
          child: NotificationListener(
            onNotification: (notify){
              if(notify is UserScrollNotification && (notify.direction.index == 0)) {
                   UserScrollNotification endNotification = notify;

                  double offset = endNotification.metrics.pixels % 50;
                  int index = (endNotification.metrics.pixels / 50).toInt();
                  print(endNotification.metrics.pixels);
                  print(offset);
                  print(index);
                  print(notify);

                  if(offset > 25) {
                    _controller.animateTo((index + 1)*50.0, duration: kThemeAnimationDuration, curve: Curves.linear);
                  }else {
                    _controller.animateTo((index)*50.0, duration: kThemeAnimationDuration, curve: Curves.linear);
                  }
              }
              return false;
            },
            child: ListWheelScrollView(
                controller: _controller,
                itemExtent: 50,
                children: _titles.map((f){
                  return Container(
                    height: 50,
                    alignment: Alignment(0, 0),
                    color: Colors.purple,
                    child: Text(f,style: TextStyle(fontSize: 14, color: Colors.red),),
                  );
                }).toList()
            ),
          ),
        ),
      ),
    );
  }
}