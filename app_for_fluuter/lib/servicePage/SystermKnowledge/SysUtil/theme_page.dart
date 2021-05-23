

import 'package:flutter/material.dart';


class ThemePage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ThemePageState();
  }
}


class _ThemePageState extends State<ThemePage> {


  ThemeData _themeData;

  Future gog() async{

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _themeData = ThemeData(
      primarySwatch: Colors.purple, //样本颜色。其很多主题受此影响。
      accentColor: Colors.purple, // 文本、按钮。
      accentColorBrightness: Brightness.light, // 亮度。
      primaryColor: Colors.purple, // 主要颜色。Appbar、TabBar。
      textTheme: TextTheme(
        button: TextStyle(fontSize: 20)
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ThemePage"),
      ),
      body: Theme(
          data: _themeData,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              RaisedButton(
                onPressed: (){
                  _themeData = _themeData.copyWith(
                    textTheme: TextTheme(
                      button: TextStyle(fontSize: 18)
                    )
                  );
                  setState(() {

                  });
                },
                child: Text("切换主题"),
              ),
              Divider(),
              Text("hello,text")
            ],
          ),
      )
    );
  }
}