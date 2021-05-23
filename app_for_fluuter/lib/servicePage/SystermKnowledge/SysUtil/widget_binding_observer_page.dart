
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class WidgetBindingObserverPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _WidgetBindingObserverPageState();
  }
}

class _WidgetBindingObserverPageState extends State<WidgetBindingObserverPage> with WidgetsBindingObserver{


  /// 需要添加监听Observer。
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addObserver(this);


    WidgetsBinding.instance.addPostFrameCallback((_) {

      print('addPostFrameCallback--------页面绘制完成，调用，只调用一次。');
    });

    WidgetsBinding.instance.addPersistentFrameCallback((_){
      //print('addPersistentFrameCallback-------每次页面绘制完成，都会调用。频繁调用');

    });
  }

  /// 注意移除。
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    WidgetsBinding.instance.removeObserver(this);

  }

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("WidgetBindingObserverPage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Builder(builder: (context){


            return  RaisedButton(onPressed: (){

              // 获得尺寸。
              print(context.findRenderObject().paintBounds);
              print(context.size);

              Vector3 vector3 = context.findRenderObject().getTransformTo(null)?.getTranslation();
            
              print(vector3.x);
              print(vector3.y);

            });
          }),
          Divider(),
          SizedBox(
            width: 400,
            height: 46,
            child: TextField(

            ),
          ),


        ],
      ),
    );
  }

  ///-------------WidgetsBindingObserver
  @override
  Future<bool> didPopRoute() {
    // TODO: implement didPopRoute
    print("------didPopRoute");
    return super.didPopRoute();
  }

  @override
  Future<bool> didPushRoute(String route) {
    // TODO: implement didPushRoute
    print("------didPushRoute");

    return super.didPushRoute(route);
  }

  // 应用尺寸发生改变调用。比如设备，旋转、键盘弹起。
  @override
  void didChangeMetrics() {
    // TODO: implement didChangeMetrics
    super.didChangeMetrics();


    Size size = WidgetsBinding.instance.window.physicalSize;
    double ratio = WidgetsBinding.instance.window.devicePixelRatio;



    print("------didChangeMetrics:$size|$ratio");
  }

  // app状态改变。
  // resumed. 激活状态，从后台->前台。
  // inactive.用户可见，但是不能点击。会在resumed->inactive->paused， paused->inactive->resumed。
  // paused. app切换到后台。

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    print("------didChangeAppLifecycleState: $state");
    super.didChangeAppLifecycleState(state);
  }

  // 当app 权限发生改变的时候调用。
  @override
  void didChangeAccessibilityFeatures() {
    // TODO: implement didChangeAccessibilityFeatures
    super.didChangeAccessibilityFeatures();
  }

  // app在设置->辅助功能中调节app字体调用。
  @override
  void didChangeTextScaleFactor() {
    // TODO: implement didChangeTextScaleFactor
    super.didChangeTextScaleFactor();
    print("------didChangeTextScaleFactor");

    // 可以通过window或者MediaQueryData来获得。

  }


  // 用户本地设置改变。比如用户语言等设置。
  @override
  void didChangeLocales(List<Locale> locale) {
    // TODO: implement didChangeLocales、
    super.didChangeLocales(locale);
    print("------didChangeLocales");

  }

  // 内存出现警告时候调用。
  @override
  void didHaveMemoryPressure() {
    // TODO: implement didHaveMemoryPressure
    super.didHaveMemoryPressure();
    print("------didHaveMemoryPressure");

  }

  // 亮度改变
  @override
  void didChangePlatformBrightness() {
    // TODO: implement didChangePlatformBrightness
    super.didChangePlatformBrightness();
    print("------didChangePlatformBrightness");
  }


}