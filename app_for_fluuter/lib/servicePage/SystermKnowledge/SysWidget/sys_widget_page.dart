
import 'package:app_for_fluuter/servicePage/SystermKnowledge/SysWidget/stream_builder.dart';
import 'package:flutter/material.dart';
import 'animated_widget.dart';
import 'constrains_page.dart';
import 'future_builder_page.dart';
import 'gesture_page.dart';
import 'offstage_page.dart';
import 'scrollview_page.dart';
import 'sliver_appBar_page.dart';
import 'slivers_page.dart';
import 'transform_page.dart';
import 'value_listen_builder_page.dart';
import 'event_trans_page.dart';
import 'data_table_page.dart';
import 'reorder_list_view_page.dart';
import 'over_lay_page.dart';
import 'form_field_page.dart';
import 'notifycation_listen_page.dart';
import 'animated_list_page.dart';
import 'material_page.dart';
import 'hero_page.dart';
import 'shader_mask_page.dart';
import 'picker_page.dart';
import 'show_page.dart';
import 'media_query_page.dart';
import 'flex_flexable_expanded_page.dart';
import 'expension_widget_page.dart';
import 'step_page.dart';
import 'chips_page.dart';
import 'tabBar_view_page.dart';
import 'text_span_page.dart';
import 'list_wheel_scrollview.dart';

class SysWidgetPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SysWidgetPageState();
  }
}

class _SysWidgetPageState extends State<SysWidgetPage> {

  List<String> _list = ["AnimatedWidgetPage","ConstransiPage","FutureBuilderPage","GesturePage",
    "OffstagePage","ScrollviewPage","SliverAppBarPage","SliversPage","TransformPage","ValueListenBuilderPage",
    "EventTransPage","DataTablePage","ReorderListViewPage","OverlayPage","FormFieldPage","NotifacationListsenPage",
    "AnimatedListPage","MaterialPage","HeroPage","ShaderMaskPage","PickerPage","ShowPage","MediaQueryPage",
    "FlexableExpandedPage","ExpansionTitlePage","StepperPage","ChipsPage","PageViewPage","TextSpanPage","ListWheelScrollViewPage",
    "ValueListenBuilder", "StreamBuilder"];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("SysWidgetPage"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return ListTile(
              title: Text("${_list[index]}:-------$index"),
              onTap: (){
                if(index == 0){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnimatedListSample()));
                }if(index == 1){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConstrainsPage()));
                }if(index == 2){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FutureBuilderPage()));
                }if(index == 3){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => GesturePage()));
                }if(index == 4){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OffStagePage()));
                }if(index == 5){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScrollViewPage()));
                }if(index == 6){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SliverAppBarPage()));
                }if(index == 7){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SliverPage()));
                }if(index == 8){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransformPage()));
                }if(index == 9){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ValueLisentedBuilderPage()));
                }if(index == 10){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventTransPage()));
                }if(index == 11){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DataTablePage()));
                }if(index == 12){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReorderListViewPage()));
                }if(index == 13){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OverLayPage()));
                }if(index == 14){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FormFieldPage()));
                }if(index == 15){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotifacationListsenPage()));
                }if(index == 16){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnimatedListPage()));
                }if(index == 17){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MineMaterialPage()));
                }if(index == 18){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HeroPage()));
                }if(index == 19){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShaderMaskPage()));
                }if(index == 20){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PickerPage()));
                }if(index == 21){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowPage()));
                }if(index == 22){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MediaQueryPage()));
                }if(index == 23){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FlexableExpandedPage()));
                }if(index == 24){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpensionWidgetPage()));
                }if(index == 25){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => StepperPage()));
                }if(index == 26){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChipsPage()));
                }if(index == 27){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => TabBarViewPage()));
                }if(index == 28){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => TextSpanPage()));
                }if(index == 29){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListWheelScrollViewPage()));
                }if(index == 30){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ValueLisentedBuilderPage()));
                }if(index == 31){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => StreamBuilderPage()));
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