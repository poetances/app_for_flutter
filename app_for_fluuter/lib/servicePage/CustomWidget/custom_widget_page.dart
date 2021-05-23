
import 'package:flutter/material.dart';
import 'custom_paint_page.dart';
import 'single_child_widget_layout_page.dart';
import 'multity_child_widget_layout_page.dart';
import 'custom_render_object_page.dart';

class CustomWidgetPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _CustomWidgetPageState();
  }
}

class _CustomWidgetPageState extends State<CustomWidgetPage> {

  List<String> _list = ["CustomPaintPage","SingleChirldLayoutPage","MultiChildLayoutPage",

    "CustomRenderObjPage",""];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomWidgetPage"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return ListTile(
              title: Text("${_list[index]}:-------$index"),
              onTap: (){
                if(index == 0){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomPaintPage()));
                }if(index == 1){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingleChirldLayoutPage()));
                }if(index == 2){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MultiChildLayoutPage()));
                }if(index == 3){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomRenderObjPage()));
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