
import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedListPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return AnimatedListPageState();
  }
}

class AnimatedListPageState extends State<AnimatedListPage> {


  GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List<Color> _colors = [Colors.deepPurple, Colors.red[100], Colors.blueGrey];
  Animatable<Offset> _positionAnimationable;
  List<String> _data = ["0-", "1-", "2-"];

  Widget _itemBuilder(BuildContext ctx, int index, Animation<double> aniamtion) {

    print(aniamtion);
      return SlideTransition(
        position: aniamtion.drive(_positionAnimationable),
        child: Container(
          height: 80,
          color: _colors[index % 3],
          child:  ListTile(
            title: Text( _data[index], style: TextStyle(fontSize: 20),),
            trailing: IconButton(
                icon: Icon(Icons.delete_forever, size: 25,),
                onPressed: (){
                  // remove item
                  _data.removeAt(index);
                  _listKey.currentState.removeItem(index, (context, animation){



                    return Container(
                      color: Colors.purple,
                    );
                  },
                  duration: Duration(seconds: 5));

                }
            ),

          ),
        )
      );
  }


  void _addItem() {

    // AnimatedList添加。
    /* 指定位置添加。注意控制数据源。
    _data.insert(index, "insert item: ${index + 1}");

    _listKey.currentState.insertItem(index);
    */

    // 末尾添加。 我们一般会将数据添加位置和动画位置统一。 这个很重要，不然动画效果会很诡异。
    int length = _data.length;
    _data.add("insert item: $length");
    _listKey.currentState.insertItem(length);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _positionAnimationable = Tween(begin: Offset(0, 1), end: Offset(0, 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedListPageState"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: _addItem)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: AnimatedList(
          key: _listKey,
          itemBuilder: _itemBuilder,
          initialItemCount: _data.length,
        ),
      ),
    );
  }
}