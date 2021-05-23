
import 'package:flutter/material.dart';
import 'dart:io';

class NotifacationListsenPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return NotifacationListsenPageState();
  }
}


class NotifacationListsenPageState extends State<NotifacationListsenPage> {


  String _msg = "empty";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            title: Text("NotifacationListsenPage"),
          ),
          preferredSize: Size(double.infinity, kToolbarHeight)
      ),
      body: NotificationListener<CansendNotify>(
          onNotification: (notify){
            print(notify.sendContent);

            setState(() {
              _msg += notify.sendContent;
            });
            return true;
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              CansendButton(),
              Divider(),
              Text(_msg ?? "empty")

            ],
          )
      ),
    );
  }
}

class CansendButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
          CansendNotify("CansendButton praise").dispatch(context);

          File file = File("");


      },
      child: Text("send notify"),
    );
  }
}


class CansendNotify extends Notification {

  final String sendContent;
  CansendNotify(this.sendContent);
}