
import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

import 'package:app_for_fluuter/common/event_bus.dart';


// 全局变量只会执行一次，而且是在第一次使用的时候调用。
EventBus bus = EventBus();
EventBus bus1 = EventBus();


class UserLoggedInEvent {
  String text;
  UserLoggedInEvent(String text){
    this.text = text;
  }
}

class EventBusPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {



    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('EventBusPage'),
      ),
      body: Column(
        children: <Widget>[
          IconButton(
              highlightColor: Colors.white30,
              icon: Icon(Icons.send),
              onPressed: (){

                print('点击发送-bus');
                //bus.fire('hello,wold--bus');

                EventBusUtil.instance.fire(EventBusUtilEvent(eventType: EventBusUtilEventType.jumpToGoverment, value: "EventBusUtil.sent, meg"));
              }
          ),
          RaisedButton(
              onPressed: (){
                print('点击发送-bus1');

                //bus1.fire('hello,wold--bus1');
                EventBusUtil.instance.fire("EventBusUtil.sent, meg2");
                EventBusUtil.instance.fire("EventBusUtil.sent, meg3");

                EventBusUtil.instance.fire(EventBusUtilEvent(eventType: EventBusUtilEventType.jumpToGoverment, value: "EventBusUtil.sent, meg2"));

              },
            child: Text('bus1-fire'),
          )
        ],
      )
    );
  }
}

