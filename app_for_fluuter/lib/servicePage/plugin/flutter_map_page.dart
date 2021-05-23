
import 'package:flutter/material.dart';
//import 'package:amap_map_fluttify/amap_map_fluttify.dart';

class FlutterMapPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _FlutterMapPageState();
}

class _FlutterMapPageState extends State<FlutterMapPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterMapPage"),
      ),
//      body: AmapView(
//        // 是否显示室内地图
//        showIndoorMap: true,
//        // 地图类型
//        mapType: MapType.Standard,
//        // 地图语言
//        language: Language.Chinese,
//        // 是否显示交通情况
//        showTraffic: true,
//        // 是否显示缩放控件
//        showZoomControl: true,
//        // 是否显示指南针控件
//        showCompass: true,
//        // 是否显示定位控件
//        showLocateControl: true,
//        // 是否显示比例尺控件
//        showScaleControl: true,
//        // 是否使能缩放手势
//        zoomGesturesEnabled: true,
//        // 是否使能滚动手势
//        scrollGesturesEnabled: true,
//        // 是否使能旋转手势
//        rotateGestureEnabled: true,
//        // 是否使能倾斜手势
//        tiltGestureEnabled: true,
//        // 是否使能所有手势
//        allGesturesEnabled: true,
//        // 缩放级别
//        zoomLevel: 10,
//        // 中心点坐标
//        centerCoordinate: LatLng(39.992520, 116.336170),
//        // 标记
//        markers: <MarkerOption>[
//
//          MarkerOption(latLng: LatLng(39.992520, 116.336170)),
//          MarkerOption(latLng: LatLng(39.998293, 116.352343)),
//          MarkerOption(latLng: LatLng(39.978234, 116.352792)),
//
//        ],
////        // 标识点击回调
//        onMarkerClick: (Marker marker) {},
//        // 地图点击回调
//        onMapClick: (LatLng coord) {},
//        // 地图拖动回调
//        onMapDrag: (MapDrag drag) {},
//        // 地图创建完成回调
//        onMapCreated: (controller) async {
//          // requestPermission是权限请求方法, 需要你自己实现
//          // 如果不知道怎么处理, 可以参考example工程的实现
//
//          print("======================");
//          await controller.showMyLocation(true);
//
////          if (await requestPermission()) {
////            await controller.showMyLocation(true);
////          }
//        },
//      )
    );
  }
}