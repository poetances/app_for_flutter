
import 'package:app_for_fluuter/servicePage/SystermKnowledge/SysWidget2/builder_page.dart';
import 'package:app_for_fluuter/servicePage/SystermKnowledge/SysWidget2/composite_page.dart';
import 'package:app_for_fluuter/servicePage/SystermKnowledge/SysWidget2/dart_init_page.dart';
import 'package:app_for_fluuter/servicePage/SystermKnowledge/SysWidget2/dismissible_page.dart';
import 'package:app_for_fluuter/servicePage/SystermKnowledge/SysWidget2/ink_inkwell_page.dart';
import 'package:app_for_fluuter/servicePage/SystermKnowledge/SysWidget2/keep_alive_page.dart';
import 'package:app_for_fluuter/servicePage/SystermKnowledge/SysWidget2/mergeable_material_page.dart';
import 'package:app_for_fluuter/servicePage/SystermKnowledge/SysWidget2/page_view_page.dart';
import 'package:flutter/material.dart';
import 'test_systerm_widget.dart';
import 'platform_view_page.dart';
import 'image_resources_page.dart';
import 'focus_page.dart';
import 'setvalue_page.dart';


class SysWidgetPage2 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SysWidgetPage2State();
  }
}

class _SysWidgetPage2State extends State<SysWidgetPage2> {

  List<String> _list = ["TestSystermWidgetPage","PlatformViewPage",'ImageResourcesPage','FocusPage',
  "SetValuePage", 'BuilderPage', 'PageView', 'DartInitPage', 'MergeableMaterial','KeepAlive', 'Dismissible',
    'Composite',"InkWellAndInk"];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SystermKnowledge"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return ListTile(
              title: Text("${_list[index]}:-------$index"),
              onTap: (){
                if(index == 0){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => TestSystermWidget()));
                }else if(index == 1){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlatformViewPage()));
                }else if(index == 2){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImageResourcesPage()));
                }else if(index == 3){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FocusPage()));
                }else if(index == 4){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SetValuePage()));
                }else if(index == 5) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => BuilderPage())).then((value){
                    print('BuilderPage 返回');
                  });
                }else if(index == 6){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageViewPage()));
                }else if(index == 7){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DartInitPage()));
                }else if(index == 8){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MergeableMaterialPage()));
                }else if(index == 9){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => KeepAlivePage()));
                }else if(index == 10){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DismissiblePage()));
                }else if(index == 11){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CompositePage()));
                }else if(index == 12){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => InkAndInkWellPage()));
                }else {


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