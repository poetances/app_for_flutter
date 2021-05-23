
import 'package:flutter/material.dart';
import 'dart:ui';

export 'shared_preferences.dart';
export 'event_bus.dart';

///--------屏幕宽度
double screenW = MediaQueryData.fromWindow(window).size.width;
///--------屏幕高度
double screenH = MediaQueryData.fromWindow(window).size.height;


class JAssetImage extends StatelessWidget {
  String name;
  BoxFit fit;
  JAssetImage(this.name, {Key key, this.fit = BoxFit.cover}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/$name.png', fit: BoxFit.cover,);
  }
}


class JNetworkImage extends StatelessWidget {
  String name;
  String placeholder;
  BoxFit fit;
  JNetworkImage(this.name, {Key key, this.placeholder, this.fit = BoxFit.cover}): super(key: key);


  @override
  Widget build(BuildContext context) {
    if(placeholder != null && placeholder.length > 0) {
      return FadeInImage.assetNetwork(placeholder: 'assets/$name.png', image: name, fit: fit);
    }
    return Image.network(name, fit: BoxFit.cover,);
  }
}


class JText extends StatelessWidget {
  String title;
  double fontSize;
  Color  color;
  JText(this.title, {Key key, this.fontSize = 20, this.color = Colors.grey}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(fontSize: fontSize, color: color),);
  }
}