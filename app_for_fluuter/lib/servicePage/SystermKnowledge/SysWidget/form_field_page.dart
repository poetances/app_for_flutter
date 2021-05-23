import 'package:flutter/material.dart';

class FormFieldPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormFieldPageState();
  }
}

class _FormFieldPageState extends State<FormFieldPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode _nameFocusNode = FocusNode();
  FocusNode _pwdFocusNode = FocusNode();

  String _name, _pwd;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    FocusScope.of(context).unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: GestureDetector(
        onTap: () {
          print("-----");
          FocusScope.of(context).unfocus();
        },
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: FocusScope(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    focusNode: _nameFocusNode,
                    decoration: InputDecoration(
                        hintText: "请输入账号",
                        border: UnderlineInputBorder()
                    ),
                    validator: (value) {
                      if (value.isEmpty) return "请输入用户名";
                      return null;
                    },
                    onSaved: (value) => _name = value,
                  ),
                  TextFormField(
                    focusNode: _pwdFocusNode,
                    decoration: InputDecoration(
                      // InputDecoration有很多属性，我们需要知道每个属性的作用。
                        hintText: "请输入密码",
                        border: UnderlineInputBorder()),
                    validator: (value) {
                      if (value.isEmpty) return "请输入密码";
                      return null;
                    },
                    onSaved: (value) => _pwd = value,

                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 300,
                    height: 46,
                    child: RaisedButton(
                      onPressed: () {
                        // 调用TextFormField中，validator方法。
                        if (!_formKey.currentState.validate()) {
                          print("验证不成功");
                          return;
                        }
                        // 获取数据。调用TextFormField中 onSave方法。
                        _formKey.currentState.save();
                        FocusScope.of(context).unfocus();
                        print("验证成功: name = $_name, pwd = $_pwd");

                      },
                      child: Text("登录"),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
