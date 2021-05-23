
import 'package:flutter/material.dart';
import 'dart:ui';


class AdaptSr {

  static AdaptSr _instance;
  static AdaptSr get instance {
    if(_instance == null){
      _instance = AdaptSr._();
      MediaQueryData mediaInfo = MediaQueryData.fromWindow(window);
      _instance._screenW = mediaInfo.size.width;
      _instance._screenH = mediaInfo.size.height;



    }
    return _instance;
  }

  AdaptSr._();

  // 指定相对宽高（原型图的宽高）及 当前设备与原型图的比例。
  double width, height, widthScale, heightScale;

  // 屏幕宽高
  double _screenW, _screenH;

  void setupFromAxure(double width, double height) {
    this.width = width;
    this.height = height;

    if(width == 0 || height == 0) { throw Exception("width or height must not zero"); }
    this.widthScale = this._screenW / this.width;
    this.heightScale = this._screenH / this.height;

  }

  double pxW(double width){
    _verifyInputSize(width);
    return widthScale * width;
  }

  double pxH(double height) {
    _verifyInputSize(height);
    return heightScale * height;
  }


  void _verifyInputSize(double inputSize) {
    if(inputSize <= 0) { throw Exception("should setupFromAxure first"); }
  }

}