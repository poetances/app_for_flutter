import 'package:flutter/material.dart';

export 'package:app_for_fluuter/servicePage/SystermKnowledge/SysWidget/scrollview_page.dart';
//import 'scrollview_page.dart';


String constName = 'constName';

class SliverAppBarPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SliverAppBarPageState();
  }
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: _headerSliverBuilder,
          body: ListView.separated(itemBuilder: _itemBuilder, separatorBuilder: (contxt, index) => Divider(), itemCount: 20)
      )
      ,
    );
  }


  List<Widget> _headerSliverBuilder(BuildContext ctx,bool innerBoxIsScrolled) {

    return <Widget>[
      SliverAppBar(
        centerTitle: true,
        expandedHeight: 200,
        floating: true,
        snap: true,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text('FlexibleSpaceBar'),
          background: Image.asset('assets/home/image0.png', fit: BoxFit.cover,),
        ),
      )
    ];

  }

  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('无与伦比的标题+$index'),

    );
  }

}

