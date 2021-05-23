
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'swiper.dart';

class GuidePage extends StatefulWidget {


  VoidCallback clickStart;
  GuidePage(this.clickStart);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GuidePageState();
  }
}

class _GuidePageState extends State<GuidePage> {

  List<VideoPlayerController> _guardPlayerController = [];
  SwiperController _swiperController = SwiperController();


  // method-------------

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for(int i = 1,j = 4 ;i< j ;i++) {
      String path = 'assets/guide_0$i.mp4';
      VideoPlayerController _playerVc = VideoPlayerController.asset(path);

      _playerVc.initialize();
      _playerVc.setLooping(true);
      _playerVc.play();
      _guardPlayerController.add(_playerVc);
    }

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Swiper.builder(
          controller: _swiperController,
          autoStart: false,
          childCount: _guardPlayerController.length,
          itemBuilder: (context, index) {

            if(index == _guardPlayerController.length - 1) {
              return Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: <Widget>[
                  VideoPlayer(_guardPlayerController[index]),
                  Positioned(
                      bottom: 50,
                      child: OutlineButton(
                          onPressed: this.widget.clickStart,
                          child: Text('开始使用', style: TextStyle(fontSize: 20 , color: Theme.of(context).primaryColor),),
                      ),
                  )
                ],
              );
            }

            return VideoPlayer(_guardPlayerController[index]);
          }
      )
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _guardPlayerController.forEach((player){
      player.dispose();
    });
  }

}


