import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:async';


class AudioPlayerPage extends StatefulWidget {
  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {

  AudioPlayer _audioPlayer;

  String _path;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setLoopMode(LoopMode.one);

    _path = 'assets/djz_win.mp3';
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("AudioPage"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          RaisedButton(onPressed: () {
            if(_audioPlayer.playing) _audioPlayer.pause();
            _path = 'assets/lucky_flip_bg.mp3';
            _audioPlayer.setAsset(_path).then((value) {
              _audioPlayer.play();
            });
          }, child: Text('lucky_flip'),),
          Divider(),
          RaisedButton(onPressed: (){
            if(_audioPlayer.playing) _audioPlayer.pause();
            _path = 'assets/home_bg.mp3';
            _audioPlayer.setAsset(_path).then((value){
              _audioPlayer.play();
            });

          }, child: Text("home_bg"),),
          Divider(),
          RaisedButton(onPressed: (){
            _audioPlayer.play();
          }, child: Text('播放'),),
          Divider(),
          RaisedButton(onPressed: (){
            _audioPlayer.pause();
          }, child: Text('暂停'),),
          Divider(),
          RaisedButton(onPressed: (){

            AudioPlayer player = AudioPlayer();
            player.setAsset("assets/djz_win.mp3").then((value) {
              player.play();
            });


          }, child: Text('播放单次'),),
          Divider(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _audioPlayer.dispose();
  }
}
