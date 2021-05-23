
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter/cupertino.dart';


// flutter picker 其实就是利用ScaffoldState系统自带方法显示。
class FlutterPickerPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FlutterPickerPageState();
  }
}

class FlutterPickerPageState extends State<FlutterPickerPage> {


  List<String> _list = ["showPicker"];

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterPickerPageState"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index){

            return ListTile(
              title: Text(_list[index]),
              onTap: () {
                Picker picker = Picker(
                  adapter: PickerDataAdapter(
                      pickerdata: [
                        "hello",
                        "word",
                        "change"
                      ]
                  ),
                );

                picker.show(Scaffold.of(context));
              }

            );
          },
          separatorBuilder: (context, index){
            return Divider();
          },
          itemCount: _list.length
      ),
    );
  }
}