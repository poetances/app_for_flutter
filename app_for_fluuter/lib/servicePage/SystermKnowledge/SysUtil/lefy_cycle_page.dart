
import 'package:flutter/material.dart';

class LefyCyclePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LefyCyclePage();
  }
}

class _LefyCyclePage extends State<LefyCyclePage> {


  int value = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('lf-initState');
  }


  // 该方法第一次initState的时候回调用。
  // 如果子widget中，在build方法中依赖了InheritedWidget，父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
  // 如果build中没有依赖InheritedWidget，则此回调不会被调用。
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('lf-didChangeDependencies');

  }

  @override
  void didUpdateWidget(LefyCyclePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('lf-didUpdateWidget');

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('LefyCyclePage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Divider(),
          RaisedButton(
            onPressed: (){
              value++;
              setState(() {});
            },
            child: Text('SetState-$value'),
          ),
          ChirldWidget(),
        ],
      ),
    );
  }
}

class ChirldWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChirldWidgetState();
  }
}

class _ChirldWidgetState extends State<ChirldWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('_ChirldWidgetState-initState');

  }

  // 每次调用initState的时候才会调用。 并不会重复调用。
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('_ChirldWidgetState-didChangeDependencies');

  }


  // 每次rebuild的时候都会调用。
  @override
  void didUpdateWidget(ChirldWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('_ChirldWidgetState-didUpdateWidget');

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('_ChirldWidgetStateild-build');


    return Container(
      width: 200,
      height: 50,
      color: Colors.purple,
    );
  }
}