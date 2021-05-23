
import 'package:flutter/material.dart';
import 'dart:math';

class SliverPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SliverPageState();
  }
}

class _SliverPageState extends State<SliverPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliverPage'),
      ),
      body: CustomScrollViewWidget(),
//      body: CustomScrollView(
//        slivers: <Widget>[
//
//          ListView.separated(
//              itemBuilder: (context, index) {
//                return ListTile(
//                  title: Text("-----$index"),
//                );
//              },
//              separatorBuilder: (context, index) => Divider(),
//              itemCount: 20
//          ).buildChildLayout(context)
//        ],
//      )
    );
  }
}


class CustomScrollViewWidget extends StatelessWidget {



  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            height: 100,
            alignment: Alignment(0, 0),
            color: Colors.red[100],
            child: Text('SliverToBoxAdapter', style: TextStyle(fontSize: 20),),
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate((context, index){
            return Column(
              children: <Widget>[
                Container(
                  height: 50,
                  color: Colors.grey,
                  alignment: Alignment(-1, 0),
                  child: Text('-----$index'),
                ),
                Divider(color: Colors.purple,)
              ],
            );
          },
              childCount: 3),
        ),

        SliverPersistentHeader(
            floating: false,
            pinned: true,
            delegate: _SliverAppBarDelegate(
                minHeight: 10,
                maxHeight: 200,
                child: Container(
                  color: Colors.purple,
                  child: Image.asset('assets/home/image0.png', fit: BoxFit.cover,),
                )
            )
        ),

        SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index){
              return Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  child: Icon(Icons.add),
                ),
              );
            }, childCount: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10
            )
        ),




      ],
    );
  }
}


class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }


}

