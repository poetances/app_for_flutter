
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:app_for_fluuter/common/notification_tool.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';



// flutter 动画的几种方式。
// 使用AnimationController，可以通过Tween进行插值，获取Animatable， 通过Animation.addListen 进行监听，然后通过setState进行rebuild。
// 利用AnimationBuilder，和AniamtionController进行动画,通过AnimationController.forfawd来驱动动画。
// 利用xxxTransition，和AnimationController来进行动画，通过AnimationContrller.forward来驱动动画。
// 利用AniatedxxWidget来进行动画。同时动画是通过，改变其属性来驱动的。

//



class AnimationWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AnimationWidgetS();
  }
}


// 通过这种方式，我们是不需要创建AnimtionController的。
class _AnimationWidgetS extends State<AnimationWidget> with SingleTickerProviderStateMixin {

  double _width = 100;

  AnimationController _controller ;
  Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(vsync: this);
    _animation = Tween(begin: 10.0, end: 100.0).animate(_controller);

    _controller.duration = Duration(seconds: 3);

    _controller.addListener((){
      print('---------_controller.addListener:${_controller.value}');
    });
    _animation.addListener((){
      print('---------_animation.addListener:${_animation.value}');
    });


    AnimationStatus s;
    _controller.addStatusListener((status){
      print('---------_controller.addStatusListener:$status');
    });
    _animation.addStatusListener((status){
      print('---------_animation.addStatusListener:$status');
    });


  }


  @override
  Widget build(BuildContext context) {


    
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationWidget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          // 有点类似oc中的隐式动画。
          AnimatedContainer(
              duration: Duration(seconds: 2),
            color: Colors.purple,

            width: _width,
            height: 200,
          ),
          Divider(),



          RaisedButton(
              onPressed: () {
                setState(() {
                  _width += 50;

                });
              },
              child: Text('StartAnimation')
          ),

          Divider(),

          RaisedButton(
              onPressed: () {
                setState(() {
                  _controller.stop();
                });
              },
              child: Text('StopAnimation')
          ),

          Divider(),

          RaisedButton(
              onPressed: () {
                setState(() {
                  _controller.reverse();
                });
              },
              child: Text('revert')
          ),


          Divider(),

          RaisedButton(
              onPressed: () {
                setState(() {
                  _controller.dispose();
                });
              },
              child: Text('dispose')
          ),
          SizedBox(height: 20,),
          Dismissible(
              direction: DismissDirection.horizontal,

              background: Container(
                color: Colors.black,
              ),
              key: UniqueKey(),
              child: Container(
                alignment: Alignment(0, 0),
                child: Text('hello,fluuter'),
                color: Colors.purple,
                width: 200,
                height: 50,
              )
          ),
          AnimatedBuilder(
              animation: _animation,
              builder: (context, child){
                return Container(
                  color: Colors.purple,
                  width: _animation.value,
                  height: _animation.value,
                  child: FlutterLogo(),
                );
              }
          ),


          // 跟着滑动的。
          SlideTransition(
            position: Tween(begin: Offset(0, 0.0), end: Offset(0, 0.5)).animate(_controller),
            child: Container(
              color: Colors.purple,
              width: 100,
              height: 40,
            ),
          )

        ],
      ),
    );
  }
}


/// 通过这种方式创建动画，一般比较麻烦。
class _AnimationWidgetState extends State<AnimationWidget> with SingleTickerProviderStateMixin {


  AnimationController _animationController;

  CurvedAnimation _curedAnimtion;


  Timer _timer;

  Animation<double> _animation;

  Animation<RelativeRect> _relativeAnimation;


  // method
  @override
  void initState() {
 
    super.initState();



    // 动画控制
    _animationController = AnimationController(
      vsync: this,
      animationBehavior: AnimationBehavior.normal,
      duration: Duration(seconds: 3),
    );


    // 动画控制着，_cureAnition。能够控制动画的线性规律
    _curedAnimtion = CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut
    );

    //Tween 对动画进行进行的时插值截取。
    _animation = Tween(begin: 0.3, end: 1.0).animate(_animationController)..addStatusListener((listener){
      
      if(listener == AnimationStatus.completed) {
        _animationController.reverse();
      }else if(listener == AnimationStatus.dismissed) {
        _animationController.forward();
      }

      print('addStatusListener----');

    })..addListener((){

      // 如果不使用AnimatioWidget， 我们可以使用_animation.value取值，然后通过setState、或者是StreamBuilt来对动画进行刷新。
      // 也可以通过。AnimationBuilder来实现动画通知，这种情况下，就不需要setState，但是和setState的效果是一样的。
      print('动画value----${_animation.value}');

    });
    


    _relativeAnimation = RelativeRectTween(begin: RelativeRect.fromLTRB(0, 0, 0, 0), end: RelativeRect.fromLTRB(50, 50, 50, 50)).animate(_animationController);

    _timer = Timer(Duration(seconds: 5), (){

      print('timer start 5');
    });


  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationWidget'),
      ),
      body: NotificationListener(
          onNotification: (CJNotification notify){
            print('收到通知---$notify.value');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[

              _startAnimtionButton(context),
              Divider(),

              // 缩放
              ScaleTransition(
                scale: _curedAnimtion,
                child: FlutterLogo(size: 50,),
              ),

              // 改变透明度
              FadeTransition(
                opacity: _animation,
                child: FlutterLogo(size: 50,),
              ),

              // 动画嵌套
              FadeTransition(
                opacity: _curedAnimtion,
                child: ScaleTransition(scale: _curedAnimtion, child: FlutterLogo(size: 50,),),
              ),

              // PostionTransition
              Container(
                width: 200,
                height: 200,
                child: Stack(
                  children: <Widget>[

                    // PositionTransition 必须在stack 中使用。
                    PositionedTransition(
                        rect: _relativeAnimation,
                        child: FlutterLogo(size: 50,)
                    )
                  ],
                ),
              ),

              // 平移动画的实现，目前没有找到相应的widget，那么我们就只能使用setState的方式来进行动画。
              AnimatedBuilder(
                  animation: _animation,
                  builder: (context, widget){
                    print('AnimatedBuilder');
                    return FlutterLogo(size: 50 + _animation.value*100,);
                  }
              ),

              



            ],
          ),
      )
    );
  }



  // 开始动画按钮
  Widget _startAnimtionButton(BuildContext context) {

    return NotificationListener<CJNotification>(
        onNotification: (notify){
          print('父节点收到通知---$notify.value');

        },
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Builder(builder: (context){
            return CupertinoButton(
              padding: EdgeInsets.all(10),
              onPressed: () {
                print('开始动画');

                _animationController.forward();

                // 定时器的用法。
                Timer.periodic(Duration(seconds: 1), (timer){
                  print('timer start');

                  // 5秒后动画停止。
                  Future.delayed(Duration(seconds: 5)).then((value){
                    timer.cancel();

                    //Navigator.of(context).pop('动画结束');
                  });
                });



                // 发送通知。
                CJNotification(value: 'CJNotification-开始动画').dispatch(context);


              },
              child: Column(
                children: <Widget>[
                  Icon(Icons.camera),
                  Text('开始动画')
                ],
              ),
            );
          })

        )
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _timer.cancel();
    _animationController.dispose();
    _animation.removeListener(null);
    _animation.removeStatusListener(null);
  }
}





