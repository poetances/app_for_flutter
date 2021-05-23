
import 'package:flutter/material.dart';

class TabBarViewPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageViewPage();
  }
}

class _PageViewPage extends State<TabBarViewPage> with SingleTickerProviderStateMixin {


  TabController _tabController;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("PageViewPage"),
        bottom: PreferredSize(
            child: TabBar(
                tabs: [
                  Tab(text: "PageViewA"),
                  Tab(text: "PageViewB"),
                ],
              controller: _tabController,
            ),
            preferredSize: Size(double.infinity, 40)
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PageViewA(),
          PageViewB()
        ],
      ),
    );
  }
}

//__________----------------
class PageViewA extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageViewAState();
  }
}

class _PageViewAState extends State<PageViewA> with AutomaticKeepAliveClientMixin{

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("_PageViewAState- initaState");
  }

  @override
  Widget build(BuildContext context) {
    print("_PageViewAState- build");

    super.build(context);

    return Container(
      alignment: Alignment(0, 0),
      color: Colors.blueGrey,
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TabBarViewPage()));
        },
        child: Text("PageViewA"),
      ),
    );
  }
}

//...............
class PageViewB extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageViewBState();
  }
}

class _PageViewBState extends State<PageViewB> with AutomaticKeepAliveClientMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("_PageViewBState- initaState");
  }


  @override
  Widget build(BuildContext context) {
    print("_PageViewBState- build");
    super.build(context);

    // TODO: implement build
    return Container(
      alignment: Alignment(0, 0),
      color: Colors.purple,
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TabBarViewPage()));
        },
        child: Text("PageViewB"),
      ),
    );
  }
}



class FatherClas {

  @mustCallSuper
  void run(){}
}

class ChirldClass extends FatherClas {


  @override
  void run() {
    // TODO: implement run
  }

}