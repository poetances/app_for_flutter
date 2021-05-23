
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_for_fluuter/common/shared_preferences.dart';


class ShareDatasPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState


    return _ShareDatasPageDate();
  }
}

class _ShareDatasPageDate extends State<ShareDatasPage> {

  String _saveString;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('SharePage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[


          Text(_saveString ?? "",style: TextStyle(fontSize: 20),),
          Divider(),

          IconButton(
              icon: Icon(Icons.save),
              onPressed: (){

                SpUtil.getInstance().then((spUtil){
                  spUtil.putBool('age', false);
                });
//                _spUtil.putString('age', '_spUtil save');
//                SharedPreferences.getInstance().then((share){
//                  share.setString('name', 'sharePreferences-保存');
//                });
              }
          ),
          Divider(),
          IconButton(
              icon: Icon(Icons.vertical_align_bottom),
              onPressed: (){

                SpUtil.getInstance().then((spUtil){

                  setState(() {
                    _saveString = spUtil.getBool('age') ?"true":"false";
                  });
                });

//                SharedPreferences.getInstance().then((share){
//                  setState(() {
//                    _saveString = share.get('name');
//                  });
//
//                });
              }
          ),

        ],
      )
    );
  }
}