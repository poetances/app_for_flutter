
import 'package:flutter/services.dart';

class ThirdPartMapHelper {

  static const MethodChannel methodChannel = MethodChannel(
    'plugins.flutter.io/ThirdPartMapHelper',
  );


  static List<String> canOpenMapApps() {

  }


  static void openAmap({String dlongitude, String dlatitude, String dName}) {

  }

  static void openBaiduMap({String dlongitude, String dlatitude}) {

  }

  static void openAppleMap({String dlongitude, String dlatitude, String dName}){

  }

  static void openGoogleMap({String dlongitude, String dlatitude, String dName}) {

  }

}