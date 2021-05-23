import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderChangeNotifier extends ChangeNotifier {
  int placeValue;
  ProviderChangeNotifier(this.placeValue);

  int get value {
    return placeValue;
  }

  set value(int newValue) {
    placeValue = newValue;
    notifyListeners();
  }
}

class ProviderPage extends StatefulWidget {
  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    // 这种写法能成功，是因为main.dart中，使用Provider方法。
    // 这就牵扯到InheritWidget的使用。
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProviderChild1(),
          Divider(),
          ProviderChild2(),
          Divider(),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProviderNewPage()));
            },
            child: Text('new page'),
          )
        ],
      ),
    );

    // 这种一些一般是基于单个页面的数据共享。
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: ChangeNotifierProvider.value(
        value: ProviderChangeNotifier(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProviderChild1(),
            Divider(),
            ProviderChild2(),
            Divider(),
          ],
        ),
      ),
    );
  }
}

//--------------------------------------
class ProviderChild1 extends StatefulWidget {
  @override
  _ProviderChild1State createState() => _ProviderChild1State();
}

class _ProviderChild1State extends State<ProviderChild1> {
  @override
  Widget build(BuildContext context) {
    ProviderChangeNotifier provider =
        Provider.of<ProviderChangeNotifier>(context);
    return Container(
      color: Color(int.parse('f7acbc', radix: 16)),
      child: Column(
        children: [
          Text('${provider.value}'),
          RaisedButton(
            onPressed: () {
              provider.value++;
            },
            child: Text('增加'),
          )
        ],
      ),
    );
  }
}

class ProviderChild2 extends StatefulWidget {
  @override
  _ProviderChild2State createState() => _ProviderChild2State();
}

class _ProviderChild2State extends State<ProviderChild2> {
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(int.parse('1d953f', radix: 16)),
      child: Consumer<ProviderChangeNotifier>(
        builder: (context, provider, wid) {
          return Column(
            children: [
              Text('${provider.value}'),
              RaisedButton(
                onPressed: () {
                  provider.value--;
                },
                child: Text('减少'),
              )
            ],
          );
        },
      ),
    );
  }
}

//-------------------------------新页面。

class ProviderNewPage extends StatefulWidget {
  @override
  _ProviderNewPageState createState() => _ProviderNewPageState();
}

class _ProviderNewPageState extends State<ProviderNewPage> {
  @override
  Widget build(BuildContext context) {
    ProviderChangeNotifier provider =
        Provider.of<ProviderChangeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('ProviderNewPage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${provider.value}'),
          Divider(),
          RaisedButton(
            onPressed: () {
              provider.value++;
            },
            child: Text('新页面增加'),
          ),

        ],
      ),
    );
  }
}
