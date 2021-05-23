
import 'package:flutter/material.dart';

class CompositePage extends StatefulWidget {
  
  @override
  _CompositePageState createState() => _CompositePageState();
}

class _CompositePageState extends State<CompositePage> with SingleTickerProviderStateMixin{

  LayerLink _link = LayerLink();

  AnimationController _animationController;
  Animation<double> _translate;

  double _x = 0;

  OverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _translate = Tween(begin: 0.0, end: 100.0).animate(_animationController);

    _overlayEntry = OverlayEntry(builder: (context){
      return Positioned(
        top: 100,
        right: 50,
        height: 200,
        width: 200,
        child: Material(
          child: CompositedTransformFollower(
            link: _link,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text('Follower'),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('CompositePage'),
        actions: [
          FlatButton.icon(
            onPressed: (){
              _x += 20;
              setState(() {});

            },
            icon: Icon(Icons.transform),
            label: Text('移动'),
          ),

          FlatButton.icon(
            onPressed: (){
              Overlay.of(context).insert(_overlayEntry);

            },
            icon: Icon(Icons.add),
            label: Text('添加'),
          ),
          FlatButton.icon(
            onPressed: (){
              _overlayEntry.remove();

            },
            icon: Icon(Icons.remove),
            label: Text('删除'),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        overflow: Overflow.visible,
        children: [

          AnimatedContainer(
            duration: Duration(seconds: 3),
            width: 100,
            height: 100,
            color: Colors.purple,
            alignment: Alignment.center,
            transform: Matrix4.translationValues(0, _x, 0),
            child: CompositedTransformTarget(
              link: _link,
              child: Text('Target'),
            ),
          ),

          Divider(),

          CompositedTransformFollower(
            link: _link,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text('Follower'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
