
import 'package:flutter/material.dart';

class KeepAlivePage extends StatefulWidget {
  @override
  _KeepAlivePageState createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('KeepAlivePage'),),
      body: ListView.separated(
        itemBuilder: (context, index) => _KeepAliveItem('$index:------'),
        separatorBuilder: (context, index) => Divider(),
        itemCount: 20,
      ),
    );
  }
}

class _KeepAliveItem extends StatefulWidget {

  final String title;
  _KeepAliveItem(this.title);
  

  @override
  __KeepAliveItemState createState() => __KeepAliveItemState();
}

class __KeepAliveItemState extends State<_KeepAliveItem> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('initState == ${widget.title}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(widget.title ?? ''),
    );
  }
}

