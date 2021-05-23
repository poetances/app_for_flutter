
import 'package:app_for_fluuter/servicePage/plugin/z_scaffold_page.dart';
import 'package:app_for_fluuter/servicePage/plugin/audio_player_page.dart';
import 'package:app_for_fluuter/servicePage/plugin/device_info_page.dart';
import 'package:app_for_fluuter/servicePage/plugin/mine_empty_widget_page.dart';
import 'package:app_for_fluuter/servicePage/plugin/provider_page.dart';
import 'package:flutter/material.dart';
import 'dio_page.dart';
import 'event_bus_page.dart';
import 'location_page.dart';
import 'url_launch_page.dart';
import 'video_player_page.dart';
import 'web_view_plugin_page.dart';
import 'bmprogresshud_page.dart';
import 'cache_image_page.dart';
import 'path_provider_page.dart';
import 'keybord_actions_page.dart';
import 'flutter_picker_page.dart';
import 'flutter_map_page.dart';
import 'bottom_tab_bar_page.dart';
import 'photo_view_page.dart';
import 'spinkit_page.dart';
import 'sqflite_page.dart';
import 'flutter_barrier_page.dart';

class PluginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _PluginPageState();
  }
}

class _PluginPageState extends State<PluginPage> {

  List<String> _list = ["DioPage","EventBus","LocationPage","UrlLaunchPage","Video_Player","WebViewPluginPage",
    "BMProgressHudPage","CacheImagePage","PathProviderPage","KeyboardActionsPage","FlutterPickerPage",
    "FlutterMapPage","FlutterBlocPage","BottomTabBarPage", "PhotoViewPage","SpinKitPage","SqflitePage",
    'FlutterBarrage', "EmptyWidget", "Provider", "DeviceInfo", 'AudioPlayer','ZScaffold'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PluginPage"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return ListTile(
              title: Text("${_list[index]}:-------$index"),
              onTap: (){
                if(index == 0){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DioPage()));
                }if(index == 1){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventBusPage()));
                }if(index == 2){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LocationPage()));
                }if(index == 3){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => UrlLaunchPage()));
                }if(index == 4){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoPlayerWidget()));
                }if(index == 5){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebViewPluginPage()));
                }if(index == 6){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => BMProgressHudPage()));
                }if(index == 7){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CacheImagePage()));
                }if(index == 8){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PathProviderPage()));
                }if(index == 9){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => KeyboardActionsPage()));
                }if(index == 10){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FlutterPickerPage()));
                }if(index == 11){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FlutterMapPage()));
                }if(index == 12){
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => FlutterBlocPage()));
                }if(index == 13){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomTabBarPage()));
                }if(index == 14){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PhotoViewPage()));
                }if(index == 15){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SpinKitPage()));
                }if(index == 16){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SqfiltePage()));
                }if(index == 17){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FlutterBarragePage()));
                }if(index == 18){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MineEmptyWidgetPage()));
                }else if(index == 19){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProviderPage()));
                }else if(index == 20){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DeviceInfoPage()));
                }else if(index == 21){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AudioPlayerPage()));
                }else if(index == 22){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ZScaffoldPage()));
                }else {


                  FocusScope.of(context).requestFocus(FocusNode());


                }
              },
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: _list.length
      ),
    );
  }
}