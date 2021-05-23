
import 'package:flutter/material.dart';

class OverLayPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OverLayPageState();
  }
}


// OverLay 非常重要的一个知识点。
// 当我们创建MateryApp的时候，系统会创建一个Navigator和一个Overlay。这也是，我们可以通过push进行导航栏管理的原因。
// 所以，我们使用的使用直接可以通过OverLay.of(context)获得，系统创建的OverLay。
// 而我们需要用到的核心是OverlayEnry。
// OverlayEnry 在创建的时候，需要注意几点。
// 1、需要用Material 控件包裹，因为。Overlay的其实就是相当于stack控件，有堆叠效果。其实相当于新建一个window。所以级别很高。
// 2、可以使用Position控件来进行位置控制。

class _OverLayPageState extends State<OverLayPage> {

  OverlayEntry  weixinOverlayEntry;

  /**
   * 展示微信下拉的弹窗
   */
  void showWeixinButtonView() {
    Overlay.of(context).insert(weixinOverlayEntry);
  }

  void hiddenWeixinButtonView() {
    weixinOverlayEntry.remove();
  }



@override
  void initState() {
    // TODO: implement initState
    super.initState();


    weixinOverlayEntry =  OverlayEntry(builder: (context) {

      return  Positioned(
          top: kToolbarHeight,
          right: 20,
          width: 200,
          height: 320,
          child:  SafeArea(child:
          Material(child:
          Container(
            color: Colors.black,
            child:  Column(
              children: <Widget>[
                Expanded(
                  child:  ListTile(
                    leading: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    title:  Text(
                      "发起群聊",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child:  ListTile(
                    leading: Icon(Icons.add, color: Colors.white),
                    title:  Text("添加朋友",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                Expanded(
                  child:  ListTile(
                    leading: Icon(Icons.add, color: Colors.white),
                    title:  Text("扫一扫",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                Expanded(
                  child:  ListTile(
                    leading: Icon(Icons.add, color: Colors.white),
                    title:  Text("首付款",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                Expanded(
                  child:  ListTile(
                    leading: Icon(Icons.add, color: Colors.white),
                    title:  Text("帮助与反馈",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),),)
      );
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("OverLayPage"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                hiddenWeixinButtonView();
              }
          ),
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                showWeixinButtonView();
              }
          ),
        ],
      ),

      body: ListView.separated(
          itemBuilder: (context, index){
            return Container(
              height: 46,
              alignment: Alignment(0, 0),
              child: Text("$index"),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: 5
      ),
    );
  }
}