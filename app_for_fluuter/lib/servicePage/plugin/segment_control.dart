
import 'package:flutter/material.dart';
import 'package:segment_control/segment_control.dart';

class SegmentControl1 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _SegmentControlState();
}

class _SegmentControlState extends State<SegmentControl1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SegmentControl'),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.purple,
        child: SegmentControl(tabs: null, selected: null),
      ),
    );
  }
}