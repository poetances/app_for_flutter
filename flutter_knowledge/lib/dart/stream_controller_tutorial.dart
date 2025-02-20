import 'dart:async';

import 'package:flutter/material.dart';
class StreamControllerTutorial extends StatefulWidget {
  const StreamControllerTutorial({super.key});

  @override
  State<StreamControllerTutorial> createState() => _StreamControllerTutorialState();
}

class _StreamControllerTutorialState extends State<StreamControllerTutorial> {

  late StreamController<String> _streamController;
  late StreamSink<String> _streamSink;
  late Stream<String> _stream;
  StreamSubscription? _streamSubscription;

  int _count = 0;

  /// life recycle
  @override
  void initState() {
    super.initState();
    // _streamController = StreamController.broadcast(); // 可以定义多次监听的StreamController.
    _streamController = StreamController(onListen: () {
      print('On Listen');
    }, onPause: () {
      print('On Pause');
    }, onResume: () {
      print('On Resume');
    }, onCancel: () {
      print('On Cancel');
    });
    _streamSink = _streamController.sink;
    _stream = _streamController.stream;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StreamController'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
                _streamSubscription = _stream.listen((event) {
                print('Listen $event');
              });
            }, child: const Text('Listen')),

            ElevatedButton(onPressed: () {
              _streamSubscription?.pause();
            }, child: const Text('Pause')),

            ElevatedButton(onPressed: () {
              _streamSubscription?.resume();
            }, child: const Text('Resume')),

            ElevatedButton(onPressed: () {
              _streamSubscription?.cancel();
            }, child: const Text('Cancel')),

            ElevatedButton(onPressed: () {
              _count++;
              _streamSink.add('$_count');
            }, child: const Text('Sink')),
            const Divider()
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription?.cancel();
  }

  /// private method
}
