import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPluginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _WebViewPluginPageState();
  }
}

class _WebViewPluginPageState extends State<WebViewPluginPage> {

  // 该对象，是和webView绑定的唯一实例。所以，我们可以在项目的任意地方，来进行webView的加载进度。
  FlutterWebviewPlugin _webviewPlugin;

  @override
  void initState() {
    super.initState();
    
    _webviewPlugin = FlutterWebviewPlugin();
    _webviewPlugin.onStateChanged.listen((state){

      print('_webviewPlugin:-----${state.url}====${state.type}');
    });

    _webviewPlugin.onHttpError.listen((error){
      print('_webviewPlugin:-----error:${error.code}');

    });




  }

  @override
  Widget build(BuildContext context) {


    return WebviewScaffold(
      url: 'http://www.baidu.com',
      appBar: AppBar(
        title: Text('WebViewPluginPage'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.send),
              onPressed: (){


                // map-> 映射。
                List<String> a = ['h', 'e', 'l','w'];
                List newAry = a.map((value){
                  return value + '1';
                }).toList();
                print(newAry);

                // for-each 遍历。
                newAry.forEach((value){
                  print(value);
                });

              }
          )
        ],
      ),
//      initialChild: Container( //initialChild 当webview不显示的时候，会显示该widget。
//        color: Colors.teal,
//      ),
      hidden: true,
    );
  }
}