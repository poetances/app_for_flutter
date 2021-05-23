
import 'package:flutter/material.dart';

class MultiChildLayoutPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MultiChildLayoutPageState();
  }
}

class _MultiChildLayoutPageState extends State<MultiChildLayoutPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MultiChildLayoutPage'),
      ),
      body: Center(
        child: CustomMultiChildLayout(
            delegate: CustionMultiChildLayoutDelegate(),
          children: <Widget>[

          ],
        ),
      ),

    );
  }
}

class CustionMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    // TODO: implement performLayout
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) {
    // TODO: implement shouldRelayout
    return true;
  }

}