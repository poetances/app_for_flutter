
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:dio/dio.dart';

import 'package:chewie/chewie.dart';



class VideoPlayerWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VideoPlayerWidgetState();
  }
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {

  VideoPlayerController _videoPlayerController;

  bool _isInitial = false;

  ChewieController _chewieController;


  @override
  void initState()  {
    // TODO: implement initState
    super.initState();


  }

  _startPlayeVideo() async {


    _videoPlayerController = VideoPlayerController.asset('assets/guide_01.mp4');


//    await _videoPlayerController.initialize();
//
//    await  _videoPlayerController.setLooping(true);
//
//    await  _videoPlayerController.play();
//
//
//    setState(() {
//
//      _isInitial = true;
//
//      print(_videoPlayerController.value.size);
//
//    });

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: true,
      aspectRatio: 16/9,
      materialProgressColors: ChewieProgressColors(
        backgroundColor: Colors.purple,
        playedColor: Colors.red
      )
    );


    setState(() {
      _isInitial = true;
      print(_videoPlayerController.value.size);

    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('VideoPlayer'),
      ),

      body: Column(
        children: <Widget>[

          RaisedButton(
            onPressed: () {
              _startPlayeVideo();
            },
            child: Text('播放'),
          ),

          Container(
            child: _isInitial ?  Chewie(controller: _chewieController,)
             : Text('初始化失败'),

            height: 300,
            alignment: Alignment.center,
            color: Colors.grey,
          ),

        ],
      )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose

    //_chewieController.dispose();
    _videoPlayerController.dispose();

    super.dispose();

  }
}

// 子类不一定要实现父类的所有方法。但是，如果父类有有参构造函数，那么就必须实现。
// 如果父类是抽象类，那么子类也是一定要实现的。dart 像对于java 对abstract 抽象关键字做了一定的改进。而且抽象类很想协议。
// 必须下的例子。如果类声明为抽象类，那么其内部的方法，如果实现就不是抽象方法，如果不实现就是抽象方法。
// 但是java里面。如果不实现，还必须要加上abstract关键字。而且如果父类不实现，那么子类就必须要实现。
// 抽象关键字，很想协议。起规定作用。  非抽象方法，子类可以不用去重写。
// dart语言中，放弃的interface接口关键字。
abstract class Animal {

  void hasFlag();

  void canRun() {

  }
}

class Animal1 {

  void canEat() {

  }
}

mixin Animal2 on Animal{

  void canJump() {

  }


}


class Cat extends Animal with Animal1, Animal2 {
  @override
  void hasFlag() {
    // TODO: implement hasFlag

  }


}



