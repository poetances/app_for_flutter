
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class GesturePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GesturePageState();
  }

}

class _GesturePageState extends State<GesturePage> with SingleTickerProviderStateMixin {

  GlobalKey<_CustomRoutePageState> _customKey = GlobalKey();


  // 转场动画。
  void _customTransform() {

    Navigator.of(context).push(
        PageRouteBuilder(
            barrierColor: Colors.grey.withOpacity(0.25),
            barrierDismissible: true, // 点击蒙版，是否隐藏
            opaque: false,

            pageBuilder: (context, start, end){
              return GesturePage();
            },
            transitionsBuilder: (context, start, end, child){

              return SlideTransition(
                position: Tween<Offset>(
                    begin: Offset(1.0, 0.0),
                    end: Offset(0.25, 0.0)
                ).animate(CurvedAnimation(parent: start, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            }
        )
    );
  }

  //DragAble 和 DragTarget一般成对出现。
  Widget _dragAbleAndDragTarget() {
    return  Row(
      children: <Widget>[
        MyDraggable(),
        MyDragTarget()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('GesturePage'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.slideshow),
              onPressed: (){
                _customKey.currentState.show();
              }),
          IconButton(
              icon: Icon(Icons.change_history),
              onPressed: (){
                _customKey.currentState.hidden();
              }),
          IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: (){
                _customTransform();
              }
          ),

        ],
      ),
      body: GestureDetectorWidget(),
//      body: CustomRoutePage(
//        key: _customKey,
//      ),
    );
  }

}


// 关于手势，我们可以使用，InkWell、InkResponse来添加一些手势。这两个手势的特点是，会有水波纹动画。
// 如果我没想使用更多的动画，那么可以使用GestureDetector来进行装饰。这个手势的特点是没有水波纹效果的。
class GestureDetectorWidget extends StatefulWidget {
 @override
  State<StatefulWidget> createState() {
    return _GestureWidgetState();
  }
}

class _GestureWidgetState extends State<GestureDetectorWidget> {

  Offset dragOffset = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Transform.translate(
      offset: dragOffset,
      child: GestureDetector(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.purple
          ),
        ),
//      onHorizontalDragStart: (drag){
//        print(drag);
//      },
//      onHorizontalDragUpdate: (drag){
//        print('${drag.delta}---${drag}---${drag.sourceTimeStamp}--${drag.globalPosition}');
//      },
        onPanUpdate: (DragUpdateDetails drag){
          dragOffset += drag.delta;
          print(dragOffset.dy);
          setState(() {
          });
        },
      ),
    );
  }
}

///draggable 是一个可以拖拽到DragTarget的widget。没什么鸟用。
class MyDraggable extends StatelessWidget {
  final data;
  const MyDraggable({this.data = "MyDraggable", Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: data,
      child: Container(
        width: 150.0,
        height: 150.0,
        color: Colors.red[500],
        child: Center(
          child: Text('Draggable'),
        ),
      ),
      feedback: Container(
        width: 150.0,
        height: 150.0,
        color: Colors.blue[500],
        child: Icon(Icons.feedback),
      ),
    );
  }
}

class MyDragTarget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyDragTargetState();
}
class _MyDragTargetState extends State<MyDragTarget> {
  var targetText = "Target";//用于显示的文案
  @override
  Widget build(BuildContext context) {
    return DragTarget(
      onWillAccept: (data) {
        print("data = $data onWillAccept");
        return data != null;//当Draggable传递过来的dada不是null的时候 决定接收该数据。
      },
      onAccept: (data) {
        print("data = $data onAccept");
        setState(() {
          targetText = data;//接收该数据后修改文案内容。
        });
      },
      onLeave: (data) {
        print("data = $data onLeave");//我来了 我又走了
      },
      builder: (context, candidateData, rejectedData) {
        //这是DragTarget实际展示给用户看到的样子
        return Container(
          width: 150.0,
          height: 150.0,
          color: Colors.blue[500],
          child: Center(
            child: Text(targetText),
          ),
        );
      },
    );
  }
}



//---------------------
class CustomRoutePage extends StatefulWidget {

  CustomRoutePage({Key key}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CustomRoutePageState();
  }
}

class _CustomRoutePageState extends State<CustomRoutePage> with SingleTickerProviderStateMixin {

  AnimationController _fadeAnimationVc;
  Animation<double> _fadeAnimation;

  void show() {
    _fadeAnimationVc.forward();
  }

  void hidden() {
    _fadeAnimationVc.reverse();
  }

  @override
  void initState() {
    super.initState();


    _fadeAnimationVc = AnimationController(vsync: this);
    _fadeAnimationVc.duration = Duration(seconds: 1);

    _fadeAnimation = Tween<double>(begin: 0, end: 0.25).animate(_fadeAnimationVc);

    _fadeAnimation.addListener((){
      print('--------${_fadeAnimation.value}');
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: Colors.grey.withOpacity(_fadeAnimation.value),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _fadeAnimationVc.dispose();
  }
}



