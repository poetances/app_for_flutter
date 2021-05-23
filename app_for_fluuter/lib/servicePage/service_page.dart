import 'package:flutter/material.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';


import 'CustomWidget/custom_widget_page.dart';
import 'plugin/pluginPage.dart';
import 'SystermKnowledge/systerm_knowledget_page.dart';


class ServicePage  extends StatefulWidget {

  static ServicePageState of(BuildContext context) {
    return context.findAncestorStateOfType();
  }

  @override
  ServicePageState createState() {
    return ServicePageState();
  }
}

/*
  对于AutomaticKeepAliveClientMixin的作用的深刻理解。
  1、能够保持状态的前提是。widget.canupdate 返回的是true。也就是说，在指定节点，widget.runtimeType 和 key 是一样的。
  所以，flutter中tabBar是可以使用的。bottomNavigationBar是不能够使用的。
 */

class ServicePageState extends State<ServicePage>  with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;


  ScrollController _scrollVc = ScrollController(initialScrollOffset: 0, );

  RefreshController _refreshVc = RefreshController(initialRefresh: false);


  List<String> _titles = ["CustomWidgetPage","PluginPage", "SystermknowledgetPage"];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("++++++++++++++++++++++++++");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('服务'),
      ),
      body: NotificationListener(
          onNotification: (ScrollUpdateNotification notify){
            //print(notify.scrollDelta);
            return true;
          },
          child: SmartRefresher(
              controller: _refreshVc,
              child: ListView.separated(
               itemBuilder: (context, index){
                 return ListTile(
                   title: Text(_titles[index] + '---$index'),
                   onTap: (){
                     if (index == 0) {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => CustomWidgetPage()));
                     }else if (index == 1) {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => PluginPage()));
                     }else if (index == 2) {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => SystermKnowledgePage()));
                     }else if (index == 3) {

                     }else {



                     }
                   },
                 );
               },
               separatorBuilder: (context, index) {
                 return SizedBox(
                   height: 1,
                   child: DecoratedBox(decoration: BoxDecoration(color: Colors.lightBlueAccent)),
                 );
               },
               itemCount: _titles.length,
               controller: _scrollVc,
             ),
            enablePullUp: false,
            enablePullDown: false,
          )
      ),
    );

  }

}

