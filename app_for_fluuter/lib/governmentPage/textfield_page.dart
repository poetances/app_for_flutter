
import 'package:flutter/material.dart';
import 'package:app_for_fluuter/common/mixin.dart';
import 'package:app_for_fluuter/common/progress_hud.dart';


class TextFieldWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TextFieldWidgetState();

  }
}

class _TextFieldWidgetState extends State<TextFieldWidget> with CanShowProgressHudWidgetMixin {


  TextEditingController _textFieldVc = TextEditingController(text: 'enha');

  FocusNode _focusNode = FocusNode();

  @override
  GlobalObjectKey<ProgressHudState> get progressHudKey => GlobalObjectKey("progressHudKey");

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
      ),
      body: InkWell(
        onTap: (){
          print('点击屏幕');
          _focusNode.unfocus();
        },
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ProgressHud(
              key: progressHudKey,
              child: Column(
                children: <Widget>[
                  TextField(
                    focusNode: _focusNode,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: 20
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.purple, style: BorderStyle.solid)
                      ),
                      hintText: '请输入姓名',
                      icon: Icon(Icons.add, size: 20,),

                      prefixIcon: Icon(Icons.camera),
                      prefixText: "prefixText ",
                      suffixText: "suffixText ",
                      helperText: "helperText ",
                      counterText: "counterText",
                      errorText: "errorText",
                      labelText: '姓名',

                    ),
                    controller: _textFieldVc,

                    cursorColor: Colors.purple,
                  ),
                  SizedBox(height: 20,),

                  VChild(),


                  IconButton(icon: Icon(Icons.camera), onPressed: (){
                    showHintProgressHud("内部点击-");
                  })

                ],

              )
          )
        ),
      )
    );
  }
}

class VChild extends StatefulWidget {
  @override
  _VChildState createState() => _VChildState();
}

class _VChildState extends State<VChild> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        ProgressHud.of(context).showHint(hint: "错误-");
        //GlobalObjectKey<ProgressHudState>("progressHudKey").currentState.showTextAndDismiss(text: "tap VChild");
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(color: Colors.blue),
      ),
    );
  }
}
