
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class LocationPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LocationPageState();
  }
}

class _LocationPageState extends State<LocationPage> {

  String _locationString;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("LocationPage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () async {

              rootBundle.loadString("");

//              Geolocator _geolocator = Geolocator();
//              Position position = await _geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//
//              List<Placemark> marks = await _geolocator.placemarkFromCoordinates(position.latitude, position.longitude);
//              Placemark currentMark = marks.first;
//
//              _locationString = currentMark.country + "-" + currentMark.administrativeArea + "-" + currentMark.subAdministrativeArea;
//              setState(() {
//
//
//              });
            },
            child: Text('获取位置信息'),
          ),
          Divider(),
          Text(_locationString ?? "暂无位置信息")
        ],
      ),
    );
  }
}