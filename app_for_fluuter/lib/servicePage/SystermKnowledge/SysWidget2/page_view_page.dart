
import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  @override
  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageViewPage'),
      ),
      body: PageView.builder(
        itemBuilder: (context, index) {
          return  Container(
            color: Colors.purple,
            alignment: Alignment.center,
            child: Text('$index'),
          );
        },
        itemCount: 3,
      ),
    );
  }
}
