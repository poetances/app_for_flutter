
import 'package:flutter/material.dart';

class MediaQueryPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MediaQueryPageState();
  }
}

class _MediaQueryPageState extends State<MediaQueryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MediaQueryPage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              child: RaisedButton(
                onPressed: () {

                },
                child: Text("RaiseButton", style: TextStyle(backgroundColor: Colors.purple),),
              )
          )


        ],
      ),
    );
  }
}