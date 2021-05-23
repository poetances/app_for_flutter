
import 'package:flutter/material.dart';

class ReorderListViewPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ReorderListViewPageState();
  }
}

class _ReorderListViewPageState extends State<ReorderListViewPage> {

  List<String> _list = ["One","Two","Three","Four","Five"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ReorderListViewPage"),
      ),
      body: ReorderableListView(
          children: _list.map((content){


            return Card(
              key: UniqueKey(),
              color: Colors.grey,
              child: Container(
                alignment: Alignment(0, 0),
                height: 46,
                width: 300,
                child: Text(content),
              ),
            );
          }).toList(),
          onReorder: (oldIndex, newIndex){
            print("oldeIndex-$oldIndex   newIndex-$newIndex");


            // 这个操作非常重要。不然会错乱。
            if(oldIndex < newIndex){
              newIndex -= 1;
            }
            String removeValue = _list.removeAt(oldIndex);
            _list.insert(newIndex, removeValue);
            setState(() {
            });

          }
      ),
    );
  }
}