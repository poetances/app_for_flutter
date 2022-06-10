import 'dart:ui';

import 'package:app_for_fluuter/common/adapt.dart';
import 'package:app_for_fluuter/common/guide_page.dart';
import 'package:app_for_fluuter/common/shared_preferences.dart';
import 'package:app_for_fluuter/common/shared_preferences_keys.dart';
import 'package:app_for_fluuter/servicePage/plugin/provider_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'common/battery_level.dart';
import 'governmentPage/government_page.dart';
import 'homePage/home_page.dart';
import 'minePage/mine_page.dart';
import 'servicePage/service_page.dart';
import 'generated/l10n.dart';

SpUtil _sp;
void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  _sp = await SpUtil.getInstance();

  AdaptSr.instance.setupFromAxure(414 , 896);
  runApp(MyApp());

}




class MyApp extends StatefulWidget {



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }

}

class _MyAppState extends State<MyApp> {

  _routeToDartFile(String routeName) {

    switch (routeName) {
      case 'Seconde':
        return BatteryLevel();
      case 'Third':
        return MinePage();
      default: {
        print('no this route');
        return  MyHomePage(title: 'Flutter Demo Home Page');
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    print('------------');
    print(window.defaultRouteName);
    print(window.physicalSize);
    print(window.devicePixelRatio);
    print(_sp.getBool(SharePreferencesKeys.kShowGuidePage));
    print('------------');





    _showWelcomPage() {

      if( _sp.getBool(SharePreferencesKeys.kShowGuidePage) == null ||
          _sp.getBool(SharePreferencesKeys.kShowGuidePage)) {
        return GuidePage((){
          _sp.putBool(SharePreferencesKeys.kShowGuidePage, false).then((_){

            print('开始使用----点击');

            setState(() {

            });
          });
        });
      }
      return _routeToDartFile(window.defaultRouteName);
    }

    // MateraiApp 控件，用于app整体的配置。自身并不会显示。其指定home，有点像ios的window。

    // 可以通过这种写法，全局共享ProviderChangeNotifier。
    return ChangeNotifierProvider.value(value: ProviderChangeNotifier(1), child: OKToast(
      child: MaterialApp(
        title: 'MyFlutterApp',
        //theme: ThemeData.fallback(),

        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          // AppBar的主题样式。
            appBarTheme: AppBarTheme(
                elevation: 1,
                brightness: Brightness.dark,
                centerTitle: true
            ),
            // 脚手架背景颜色。
            scaffoldBackgroundColor: Colors.white,

            // 主要的颜色。一般导航导航类颜色。比如Appbar、dateTimePick的导航。
            primarySwatch: Colors.blue,
            // 特点颜色。比如，radioButton、checkBox、floatingButton、progress等颜色。
            accentColor: Colors.blue,

            // 按钮背景颜色。
            buttonColor: null,

            // TabBar的indicator
            indicatorColor: null,

            // 分割线颜色。
            dividerColor: null,
            dividerTheme: null,

            // 高亮颜色。所有的按钮，按下去就是hightlight样式。
            highlightColor: Colors.purple.withAlpha(0),

            // 水波纹效果。带有点击事件的，点击下去的效果。。
            // splashColor: null,
            // splashFactory: NoSplashFactory(),

            materialTapTargetSize: MaterialTapTargetSize.padded,



            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(),
            )

        ),

        home: MyHomePage(),

        //home: _routeToDartFile(window.defaultRouteName),

        // debug模式下，显示右上角的debug样式。默认是true，显示。
        debugShowCheckedModeBanner: false,

        // 显示widget的边框。默认是false
        showSemanticsDebugger: false,

        checkerboardOffscreenLayers: true,

        // 屏幕上面显示一层，CPU、GPU的图标，用于性能的判断。
        showPerformanceOverlay: false,

      ),
    ),);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;
  final _tabBarItemColor = Colors.blue;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  {

  var _currentIndex = 0;

  var _routePages = [HomePage(), GovernmentPage(), ServicePage(), MinePage()];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();




  }

  @override
  Widget build(BuildContext context)  {

    // 脚手架，相当于app的屏幕，并且给屏幕暴露一切功能。
    // 在iOS中，我们知道，苹果的视图结构 window -> TabBarController -> [NavigationController->ViewControlloer,
    // NavigationController->ViewController, ...]

    // 在Flutter中，其实差不多也是这样的。我们通过MaterailApp指定home，而home我们通过Scaffold（window）来进行build。
    // Scaffold就相当于window。我们同样可以指定，bottomNaviagtionBar 相当于window的TabBarController。同样我们通过body来
    // 进行来指定每个bottomNavigationBar对于的页面。


    return Scaffold(
//      appBar: AppBar(
//        title: Text('Scaffold'),
//      ),

      // 背景颜色，默认是白色。默认使用。ThemeData.scaffoldBackgroundColor
      backgroundColor: Colors.white,


      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: widget._tabBarItemColor,),
                title: Text('首页', style: TextStyle(color: widget._tabBarItemColor),),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list, color: widget._tabBarItemColor,),
                title: Text('政务', style: TextStyle(color: widget._tabBarItemColor)),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings, color: widget._tabBarItemColor,),
                title: Text('服务', style: TextStyle(color: widget._tabBarItemColor)),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.info, color: widget._tabBarItemColor,),
                title: Text('我的', style: TextStyle(color: widget._tabBarItemColor)),
            ),
          ],
        fixedColor: Colors.purple,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index){
            setState(() {
              _currentIndex = index;


            });
        },
      ),

      body: _routePages[_currentIndex],
//      // 保持状态。
//      body: IndexedStack(
//        children: _routePages,
//        index: _currentIndex,
//      ),


    );
  }
}




/// 关闭水波纹效果
class NoSplashFactory extends InteractiveInkFeatureFactory {
  const NoSplashFactory();

  @override
  InteractiveInkFeature create(
      {MaterialInkController controller,
        RenderBox referenceBox,
        Offset position,
        Color color,
        TextDirection textDirection,
        bool containedInkWell = false,
        rectCallback,
        BorderRadius borderRadius,
        ShapeBorder customBorder,
        double radius,
        onRemoved}) {
    return new NoSplash(
      controller: controller,
      referenceBox: referenceBox,
    );
  }
}

class NoSplash extends InteractiveInkFeature {
  NoSplash({
    @required MaterialInkController controller,
    @required RenderBox referenceBox,
  })  : assert(controller != null),
        assert(referenceBox != null),
        super(
        controller: controller,
        referenceBox: referenceBox,
        color: Colors.transparent
      );

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {}
}