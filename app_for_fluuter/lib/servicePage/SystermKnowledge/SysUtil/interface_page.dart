import 'package:flutter/material.dart';

class InterfacePage extends StatefulWidget {
  @override
  _InterfacePageState createState() => _InterfacePageState();
}

class _InterfacePageState extends State<InterfacePage> with MineInterface{

  MinePresenter presenter;


  @override
  void requestSuccess() {
    print("request success");
  }

  @override
  void initState() {
    super.initState();

    presenter = MinePresenter(this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Interface'),),
      body: Column(
        children: [

          RaisedButton(
            child: Text('Interface'),
            onPressed: (){

              presenter.startRequest();
            },
          ),
          Divider(),
          RaisedButton(
            child: Text('Mixin'),
            onPressed: (){

            },
          ),
        ],
      ),
    );
  }


}

class BaseCls {

  void baseFunc(){}
}

abstract class MineInterface {

  void requestSuccess();
}

mixin MineMixin  on BaseCls{

  void mineMixin();


}

class MinePresenter {

  MineInterface interface;
  MinePresenter(this.interface);

  void startRequest() {

    Future.delayed(Duration(seconds: 3)).then((value){
      interface.requestSuccess();
    });
  }
}




