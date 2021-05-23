
import 'package:flutter/material.dart';
import 'SysUtil/sys_util_page.dart';
import 'SysWidget/sys_widget_page.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'SysWidget2/SysWidgetPage2.dart';
import 'dart:ui';



class SystermKnowledgePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SystermKnowledgePageState();
  }
}

class _SystermKnowledgePageState extends State<SystermKnowledgePage> {

  List<String> _list = ["SysUtilPage","SysWidgetPage","SysWidgetPage2",""];



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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SysUtilPage()));
                }if(index == 1){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SysWidgetPage()));
                }if(index == 2){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SysWidgetPage2()));
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
