
import 'package:flutter/material.dart';
import 'package:flutter_barrage/flutter_barrage.dart';
import 'dart:math';
import 'package:barrage/barrage.dart';

class FlutterBarragePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _FlutterBarragePageState();

}

class _FlutterBarragePageState extends State<FlutterBarragePage> {


  Random random = Random();
  ValueNotifier<BarrageValue> timelineNotifier;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    List<Bullet> bullets = List<Bullet>.generate(100, (i) {
      final showTime = random.nextInt(60000); // in 60s
      return Bullet(
        child: Container(
          color: Colors.purple,
          child: Text('$i-$showTime}'),
        ),
        showTime: showTime,
      );
    });


    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterBarragePage'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 100,
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: BarrageWall(
              massiveMode: false, // disabled by default
              //timelineNotifier: timelineNotifier, // send a BarrageValue notifier let bullet fires using your own timeline
              bullets: bullets,
              child: new Container(
                color: Colors.purple,
              ),
            ),
          ),

          Positioned(
            top: 350,
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: BarrageView(
              data: null,
              width: null,
            ),
          )
        ],
      ),
    );
  }
}