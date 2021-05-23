
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:app_for_fluuter/methodChannel/third_map_plugin.dart';

class OpenMapAppPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _OpenMapAppPageState();
  }
}

class _OpenMapAppPageState extends State<OpenMapAppPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OpenMapAppPage"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "请输入经度"
              ),
              maxLines: 1,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "请输入维度"
              ),
              maxLines: 1,
            ),
            SizedBox(height: 20,),
            RaisedButton(
              onPressed: () async{

                //launch("http://maps.apple.com");

                //launch("iosamap://path?dlat=39.98848272&dlon=116.47560823&dname=B");

                //launch("baidumap://map/direction?destination=39.98848272,116.47560823&src=andr.baidu.openAPIdemo");

                //launch("http://maps.apple.com/?daddr=zhengyuanxiaoqu");
              },
              child: Text("打开地图"),
            ),
            Divider(),
            RaisedButton(
              onPressed: () async{

                print(await ThirdMapPlugin.hasInstalledMapApp());

              },
              child: Text("支持的地图"),
            ),
            Divider(),
            RaisedButton(
              onPressed: () async{

                print(await ThirdMapPlugin.openBaiduMap(dlongitude: "116.47560823", dlatitude: '39.98848272', dName: "终点地址-enha"));

              },
              child: Text("打开百度地图"),
            ),
            Divider(),
            RaisedButton(
              onPressed: () async{

                print(await ThirdMapPlugin.openAmap(dlongitude: "116.47560823", dlatitude: '39.98848272', dName: "终点地址-"));

              },
              child: Text("打开高德地图"),
            ),
            Divider(),
            RaisedButton(
              onPressed: () async{

                print(await ThirdMapPlugin.openAppleMap(dlongitude: "116.47560823", dlatitude: '39.98848272', dName: "终点地址-"));

              },
              child: Text("打开apple map"),
            )
          ],
        ),
      ),
    );
  }
}