import 'package:flutter/material.dart';

class NotificationRoute extends StatefulWidget {
  @override
  NotificationRouteState createState() {
    return new NotificationRouteState();
  }
}

class NotificationRouteState extends State<NotificationRoute> {
  String _msg="";
  @override
  Widget build(BuildContext context) {
    //监听通知
    return Scaffold(
      appBar: AppBar(
        title: Text('"NotificationRoutte"'),
      ),
      body: NotificationListener<MyNotification>(
        onNotification: (notification) {
          setState(() {
            _msg+=notification.msg+"  ";
          });
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              Builder(
                builder: (context) {
                  return RaisedButton(
                    //按钮点击时分发通知
                    onPressed: () => MyNotification("Hi").dispatch(context),
                    child: Text("Send Notification"),
                  );
                },
              ),
              Text(_msg)
            ],
          ),
        ),
      ),
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}