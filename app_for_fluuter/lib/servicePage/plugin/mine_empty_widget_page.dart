
import 'dart:async';

import 'package:app_for_fluuter/common/empty_widget.dart';
import 'package:app_for_fluuter/common/mixin.dart';
import 'package:flutter/material.dart';

class MineEmptyWidgetPage extends StatefulWidget {
  @override
  _MineEmptyWidgetPageState createState() => _MineEmptyWidgetPageState();
}

class _MineEmptyWidgetPageState extends State<MineEmptyWidgetPage> with CanShowEmptyWidgetMixin {


  List<String> _values = ["show","loading","hidden","--"];

  @override
  GlobalObjectKey<EmptyWidgetState> get emptyWidgetKey => GlobalObjectKey("_MineEmptyWidgetPageState");

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showLoadingEmptyWidget();
      Future.delayed(Duration(seconds: 10)).then((value) {
        hiddenEmptyWidget();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("空白页"),
      ),
      body: EmptyWidget(
        key: emptyWidgetKey,
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_values[index]),
              onTap: (){
                if(index == 0) {
                  showEmptyWidget(
                      title: Text("标题"),
                      subTitle: Text("新型冠状病毒感染肺炎疫情当前防控工作有关法律知识问答"),
                  );
                }
              },
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: _values.length,
        ),
      ),
    );
  }
}
