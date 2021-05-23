

import 'package:flutter/material.dart';



class InheritedPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InheritedPageState();
  }
}

class _InheritedPageState extends State<InheritedPage> {


  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedPage'),
      ),
      body: InheritedShareInfo(
          name: _count.toString(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              ChildWidget(),
              Divider(),
              RaisedButton(
                onPressed: (){
                  _count++;
                  setState(() { });
                },
                child: Text('增加'),
              ),
              RaisedButton(
                onPressed: (){
                  _count--;
                  setState(() { });
                },
                child: Text('减少'),
              ),
            ],
          )
      ),
    );
  }
}


// 从上往下传递数据。
// ignore: must_be_immutable
class InheritedShareInfo extends InheritedWidget {

  String name;
  InheritedShareInfo({Key key, @required this.name, @required Widget child}):
        assert(name != null),
        assert(child != null),
        super(key: key, child: child);


  static InheritedShareInfo of(BuildContext context) {
    // 这种写法。当依赖该widget，子widget不会调用 didChangeDependencies。
    return context.getElementForInheritedWidgetOfExactType<InheritedShareInfo>().widget;

    // 这种写法会调用。didChangeDependencies。
    return context.dependOnInheritedWidgetOfExactType<InheritedShareInfo>();
  }

  /*
  *
  *
@override
InheritedElement getElementForInheritedWidgetOfExactType<T extends InheritedWidget>() {
  assert(_debugCheckStateIsActiveForAncestorLookup());
  final InheritedElement ancestor = _inheritedWidgets == null ? null : _inheritedWidgets[T];
  return ancestor;
}
@override
InheritedWidget dependOnInheritedWidgetOfExactType({ Object aspect }) {
  assert(_debugCheckStateIsActiveForAncestorLookup());
  final InheritedElement ancestor = _inheritedWidgets == null ? null : _inheritedWidgets[T];
  //多出的部分
  if (ancestor != null) {
    assert(ancestor is InheritedElement);
    return dependOnInheritedElement(ancestor, aspect: aspect) as T;
  }
  _hadUnsatisfiedDependencies = true;
  return null;
}
  * */


  @override
  bool updateShouldNotify(InheritedShareInfo oldWidget) {

    return name != oldWidget.name;
  }

}

//=============================================
class ChildWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChildWidgetState();
  }
}

class _ChildWidgetState extends State<ChildWidget> {



  @override
  void initState() {
    super.initState();
    print('ChildWidget---initState');
  }

  // 该方法第一次initState的时候回调用。
  // 如果子widget中，在build方法中依赖了InheritedWidget，父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
  // 如果build中没有依赖InheritedWidget，则此回调不会被调用。

  /*
  * 一般来说，子widget很少会重写此方法，因为在依赖改变后framework也都会调用build()方法。
  * 但是，如果你需要在依赖改变后执行一些昂贵的操作，比如网络请求，这时最好的方式就是在此方法中执行，
  * 这样可以避免每次build()都执行这些昂贵操作。
  *
  * */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('ChildWidget---didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {

    // 下面两种情况因为，在build中依赖了InheritedShareInfo。所以，父widget中InheritedWidget改变
    // 会调用didChangeDependencies。
    return Text(InheritedShareInfo.of(context).name ?? 'name is null');
    return Text(text);

    return Text('data'); // 这种写法。就不会调用didChangeDependencies。
  }

  String get text {
    return InheritedShareInfo.of(context).name ?? 'name is null';
  }
}

