
import 'package:flutter/material.dart';

import 'package:app_for_fluuter/common/utils.dart';




class ScrollViewPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    print(screenH);
    print(screenW);

    return _SingleScrollViewPage();
  }
}


// Sliver App Bar
class _ScrollViewPageState extends State<ScrollViewPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    print('_ScrollViewPageState--build');
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, inner){
            return [
              SliverAppBar(
                expandedHeight: 200,

              )
            ];
          },
          body: ListView.separated(itemBuilder: _itemBuilder, separatorBuilder: (contxt, index) => Divider(), itemCount: 20)
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('无与伦比的标题+$index'),
      onTap: () {

      },
    );
  }
}



// flutter中。SingleChildScrollView，比ios中UIScrollView要好用的多。ios中，还需要设置contenSize等属性。
class _SingleScrollViewPage extends State<ScrollViewPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollViewPage"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true, // 相反方向。 默认是从 左->右。 如果设置相反方向，那么就是从右->左。
        child: Text("2018年12月31日 - Flutter SingleChildScrollView菜鸟何时起飞 0.1 2018.12.31 16:18 字数83 this.scrollDirection = Axis.vertical,  //滚动方向 this.reverse =false...",
          maxLines: 1,
        ),
      ),
    );
  }
}