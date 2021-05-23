
import 'package:flutter/material.dart';

class MergeableMaterialPage extends StatefulWidget {
  @override
  _MergeableMaterialPageState createState() => _MergeableMaterialPageState();
}

class _MergeableMaterialPageState extends State<MergeableMaterialPage> {

  List<MergeableMaterialItem> _items ;

  @override
  void initState() {
    super.initState();

    _items = [
      //MaterialGap(key: ValueKey(1)),
      MaterialSlice(
        key: ValueKey(2),
        child: Container(
          color: Colors.blue,
          height: 50,
        ),
      ),
    ];

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("MergeableMaterial"),
        actions: [
          RaisedButton(onPressed: (){
            _items.add(MaterialSlice(
              key: ValueKey(_items.length + 2),
              child: Container(
                color: Colors.red,
                height: 50,
              ),
            ));
            setState(() {
            });
          }, child: Text("增加"),),
          RaisedButton(onPressed: (){
            _items.removeAt(0);
            setState(() {
            });
          }, child: Text("减少"),)

        ],
      ),
      body: SingleChildScrollView(
        child: MergeableMaterial(
          hasDividers: true,
          children: _items,
        ),
      ),
    );
  }
}
