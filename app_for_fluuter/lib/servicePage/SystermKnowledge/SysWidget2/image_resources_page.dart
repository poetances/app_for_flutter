
import 'package:flutter/material.dart';

class ImageResourcesPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ImageResourcesPageState();
  }
}

class _ImageResourcesPageState extends State<ImageResourcesPage> {

  Image _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VetAppBar(
        titleValue: 'ImageResourcesPage',
      ),
      body: Column(
        children: <Widget>[
          _image = Image.asset('assets/home/icon_shoucang.png', color: Colors.purple,),
          Divider(),
          RaisedButton(
            onPressed: (){
              print(_image.toString());
              print(_image.height);

            },
          )
        ],
      ),
    );
  }
}


class VetAppBar extends AppBar {

  final String titleValue;

  VetAppBar({Key key, this.titleValue}) :
        super(
          key: key,
          title: Text(titleValue),
          centerTitle: true
      );
}