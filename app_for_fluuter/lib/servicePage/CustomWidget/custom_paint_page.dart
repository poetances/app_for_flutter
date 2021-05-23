
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/cupertino.dart';

class CustomPaintPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomPaintPageState();
  }
}

class _CustomPaintPageState extends State<CustomPaintPage> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  double _progress = 0, _showProgress = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this);
    _animationController.duration = Duration(seconds: 1);

    Animatable<int>  ava = Tween(begin: 12,end: 10);

  }

  // 当父节点调用build 方法的时候，该方法调用。
  @override
  void didUpdateWidget(CustomPaintPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    print("--------didUpdateWidget");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomPaintPage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              onPressed: (){

                _animationController.forward();
              },
            child: Text('RaisedButton'),
          ),
          Divider(),
          CustomPaint(
            size: Size(150, 150),
            painter: CirclePaint(progress: _showProgress),
          ),
          CircularProgressIndicator(value: _progress,),

        ],

      )

    );
  }
}


class CirclePaint extends CustomPainter {

  double progress;

  CirclePaint({@required this.progress});



  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width;
    double h = size.height;


    // paint 最好不要写死。 每次进行绘图，都初始化一个paint画笔。
    Paint tealPaint = _fetCirclePaint(Colors.teal);
    //canvas.drawCircle(Offset(w/2, h/2), w/2, tealPaint);
    canvas.drawArc(Rect.fromLTRB(5/2, 5/2, w-5, h-5), 0, _progressToAngle(this.progress), false , tealPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  
  double _progressToAngle(double progress) {
    return 2*pi*progress;
  }

  Paint _fetCirclePaint(Color color) {

    Paint paint = Paint()
      ..strokeWidth = 5
      ..strokeCap   = StrokeCap.round
      ..strokeJoin  = StrokeJoin.round
      ..style       = PaintingStyle.stroke
      ..color       = color;

    return paint;
  }

}

