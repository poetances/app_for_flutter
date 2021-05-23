
import 'package:app_for_fluuter/servicePage/SystermKnowledge/SysUtil/change_notify_page.dart';
import 'package:app_for_fluuter/servicePage/SystermKnowledge/SysUtil/interface_page.dart';
import 'package:flutter/material.dart';
import 'http_page.dart';
import 'inherited_page.dart';
import 'regex_page.dart';
import 'root_bundle_page.dart';
import 'stream_controller.dart';
import 'widget_key_page.dart';
import 'dart_io_page.dart';
import 'dart_future_page.dart';
import 'mehod_channel_page.dart';
import 'widget_binding_observer_page.dart';
import 'date_time_page.dart';
import 'theme_page.dart';
import 'json_modal_page.dart';
import 'future_page.dart';
import 'route_page.dart';
import 'mixin_page.dart';
import 'open_map_app_page.dart';
import 'show_page.dart';
import 'lefy_cycle_page.dart';
import 'random_page.dart';


class SysUtilPage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _SysUtilPageState();
  }
}

class _SysUtilPageState extends State<SysUtilPage> {

  List<String> _list = ["HttpPage","InheritedPage","RegexPage","RootBundlePage","StreamControllerPage","WidgetKeyPage",
    "DartIoPage","DartFuturePage","MethodChannelPage","WidgetBindingObserverPage","DateTimePage","ThemePage","JsonModalPage",
    "Future","RoutePage","MixinPage","OpenMapAppPage","ShowPage",'LefyCyclePage','RandomPage', 'ChangeNotification', 'Interface'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SysUtilPage"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return ListTile(
              title: Text("${_list[index]}:-------$index"),
              onTap: (){
                if(index == 0){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HttpPage()));
                }if(index == 1){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => InheritedPage()));
                }if(index == 2){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegexPage()));
                }if(index == 3){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RootBundlePage()));
                }if(index == 4){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => StreamControllerPage()));
                }if(index == 5){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => WidgetKeyPage()));
                }if(index == 6){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DartIoPage()));
                }if(index == 7){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DartFuturePage()));
                }if(index == 8){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MethodChannelPage()));
                }if(index == 9){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => WidgetBindingObserverPage()));
                }if(index == 10){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DateTimePage()));
                }if(index == 11){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ThemePage()));
                }if(index == 12){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => JsonModalPage()));
                }if(index == 13){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FuturePage()));
                }if(index == 14){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RoutePage()));
                }if(index == 15){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MixinPage()));
                }if(index == 16){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OpenMapAppPage()));
                }if(index == 17){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowPage()));
                }if(index == 18){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LefyCyclePage()));
                }if(index == 19){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RandomPage()));
                }if(index == 20){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeNotifyPage()));
                }if(index == 21){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => InterfacePage()));
                }else {

                  // Dart中的所有类都是继承Object类。
                  Iterator iterator = _list.iterator;
                  while(iterator.moveNext()) {
                    print(iterator.current);
                  }
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

