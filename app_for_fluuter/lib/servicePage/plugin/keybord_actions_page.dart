
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class KeyboardActionsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _KeyboardActionsPageState();
  }
}

class _KeyboardActionsPageState extends State<KeyboardActionsPage>with WidgetsBindingObserver {


  @override
  void initState() {
    super.initState();

    //WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.addObserver(this);
  }


  @override
  void deactivate() {
    print("deactivate");

    super.deactivate();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            title: Text("KeyboardActionsPage"),
          ),
          preferredSize: Size.fromHeight(46)
      ),
      body: Container(),
    );
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    print("000000000---------");

    super.didChangeAppLifecycleState(state);
  }

  @override
  void didChangeMetrics() {
    print("didChangeMetrics---------");

    super.didChangeMetrics();
  }

  @override
  Future<bool> didPopRoute() {
    print("didPopRoute---------");
    return super.didPopRoute();
  }

  @override
  Future<bool> didPushRoute(String route) {
    print("didPushRoute---------");
    return super.didPushRoute(route);
  }

}

class ChirldWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChirldWidgetState();
  }
}

class _ChirldWidgetState extends State<ChirldWidget> {

  GlobalKey<FormState> _formKey;
  FocusNode _loginNode;
  FocusNode _pwdNode;


  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey();
    _loginNode = FocusNode();
    _pwdNode = FocusNode();

  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Padding(
        padding: EdgeInsets.only(left: 10,top: 20,right: 10),
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                focusNode: _loginNode,
                validator: (value){
                  if(value == null || value.length == 0){
                    return "用户名不能为空";
                  }
                  return null;
                },
                maxLength: 12,
                decoration: InputDecoration(
                  hintText: "请输入用户名"
                ),
              ),
              TextFormField(
                focusNode: _pwdNode,
                validator: (value){
                  if(value == null || value.length == 0){
                    return "密码不能为空";
                  }else if(value.length < 6){
                    return "密码长度不能小于6位";
                  }
                  return null;
                },
                maxLength: 12,
                decoration: InputDecoration(
                  hintText: "请输入密码"
                ),
              ),

              SizedBox(height: 20,),

              SizedBox(
                width: 300,
                height: 46,
                child: RaisedButton(
                    onPressed: (){

                      if(_formKey.currentState.validate()){
                        print("校验通过");
                      }else {
                        print("校验失败");
                      }
                    },
                  child: Text("登录"),
                ),
              ),

              SizedBox(height: 20,),

              RaisedButton(
                onPressed: (){


                  _loginNode.nextFocus();
                },
                child: Text("唤起键盘"),
              ),
            ],
          )
      ),
    );
  }
}

