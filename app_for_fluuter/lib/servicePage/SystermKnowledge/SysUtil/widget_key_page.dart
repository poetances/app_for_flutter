
import 'package:flutter/material.dart';


/**
 * flutter的渲染机制。
 * 1、首选我们需要了解widget树 。
 * 1.1、我们使用的所有类都是widget。
 * 1.2、widget是 @immutable（不可变的），所以widget不会管理state，widget只是配置信息，不会显示。
 * 2、我们需要了解element树。
 * 2.1、我们所有的widget都是通过createElement来创建Element。
 * 2.2、Element持有widget和rendObject两个属性。
 * 2.3、Element才是具备显示的控件。
 *
 * flutter的渲染过程。
 * 当我们调用 setState后，widget会重新调用build 方法，创建新的widget树。同时新的widget树会和旧widget树做对比（每个节点都会对比）。
 * 其中对比分为很多过程，我们可以参考elment.updateChilde 方法的说明。比如，如果新的widget树种，某个节点的widget移除，那么通过对比，
 * 会发现需要更新updatechilde，所以就会刷新界面。比如，如果新的widget树，某个节点和旧的widget树的同一个节点对比[canupdate = true],
 * 那么Element就不是更新对于节点的element，而是使用原来的widget，更改其属性就ok。canUpdte会比较widget的runtimeType和key。所以key有时会显得特别重要。
 * 比如：下面这个例子。如果我们不传key的时候，flutter会对比新旧widget，canupdate，然后发现，runtimeType是一样的，然后返回ture
 * 所以不会使用newElement，而是使用了旧element，所以我们会发现widget不会调用createStata 和 initState方法。
 * 同理如果传key，两次的key不一样。那么会将旧的element从element树中移除，将widget映射的新的element插入到新的element树种。
 * */

/**
 * 这里，为了更为深刻的理解以上描述的含义，我们可以举一个更为形象的例子。Widget 作为大 Boss，他把近期的战略部署，即配置信息，
 * 写在纸上下发给经理人 Element，Element 看到详细的配置信息开始真正的开起活来了。我们还需要注意一点，大 Boss 随时会改变战略部署
 * ，然后不会在原有的纸上修改而是重新写下来，这时经理人为了减少工作量需要将新的计划与旧的计划比较来作出相应的更新措施。
 * 这也是 Flutter 框架层做的一大优化。下面又来了，Element 作为经理人也很体面，当然不会把活全干完，
 * 于是又找了一个 RenderObject 的员工来帮它做粗重的累活。
 * RenderObject 在 Flutter 当中做组件布局渲染的工作，其为了组件间的渲染搭配及布局约束也有对应的 RenderObject 树，我们也称之为渲染树。*/


/**
 * flutter中，key的类型。
 * UnicodeKey()，和ValueKey是继承LocalKey，LocalKey是继承Key的 作为唯一标识。一般用来控制子widget是否刷新。
 * GlobleKey() 一般用来获取子widget的state。*/

/**
 * widget是Element的配置信息。 Element是用来显示的。而真正渲染的其实是Rendobject.
 * Element同时拥有widget和RenderObject两个对象。*/

/**
 * 我们发现Widget，表示Element的配置信息。Widget里面的方法也是很少，里面有createElement和canUpdate两个重要方法。
 * StateLessWidget是继承Element的，并且重写了createElement方法。和暴露的一个build方法。
 * StateFullWidget也是继承Element的，并且重写了createElement方法。和暴露的一个createState方法。*/


/**
 * ios中，事件的传递和响应。
 * 1、传递是有UIWindow开始，通过遍历subViews的方式来寻找和是的view。
 *    牵扯到两个重要的方法。-hitText(返回合适的view), -positionInside（判断点击点，是否在view上面。）
 *    其中，-hitText方法的内部实现，
 *       1.1、首选判断self的 userInfterface 、alpha、hidden属性（也就是判读self实现可见）。
 *       1.2、判断-positionInside是否在self上。
 *       1.3、遍历subViews，同样调用subViews的hitTest 和postionInside两个方法，来进行子view是否是合适的view。
 * 2、事件的响应和传递刚好相反。但是事件是否会向父view传递，关键是看当前view是否重写touchBegin并且同时不调用super方法。*/

class WidgetKeyPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WidgetKeyPageState();
  }
}

class _WidgetKeyPageState extends State<WidgetKeyPage> {


  bool _switchValue = false;

  GlobalKey<_TextKeyWidgetState> _globalKey = GlobalKey();

  String text = 'defalute';

  TextWidget _textWidget;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return Scaffold(
      appBar: AppBar(
        title: Text('WidgetKeyPage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          RaisedButton(
              onPressed: () {


                //_globalKey.currentState.changeState();

                text = text + 'onPressed';
                setState(() {

                });

              }
          ),

          Divider(),


          _textWidget = TextWidget(text: text,),
          //TextKeyWidget(key: _globalKey,),


          // 根据品台创建不同分格的widget。
          Switch.adaptive(
              value: _switchValue,
              onChanged:(newValue){
                _switchValue = newValue;
                setState(() {
                });
              }
          ),

          Divider(),
          RaisedButton(
              onPressed: () {


                //_globalKey.currentState.changeState();

                print(_textWidget.runtimeType);

              }
          ),


          Opacity(opacity: 0.5)

        ],
      ),
    );
  }
}

class TextKeyWidget extends StatefulWidget {

  TextKeyWidget({Key key}):super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    print('TextKeyWidget---createState');

    return _TextKeyWidgetState();
  }
}

class  _TextKeyWidgetState extends State<TextKeyWidget> {


  void changeState() {
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('TextKeyWidget---initState');

  }

  @override
  Widget build(BuildContext context) {

    print('TextKeyWidget---build:}');

    return Text('TextKeyWidget >>>>>>>');
  }
}


class TextWidget extends StatefulWidget {

  String text;
  TextWidget({Key key, this.text}):super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    print('TextWidget---createState');

    return _TextWidgetState();
  }
}

class  _TextWidgetState extends State<TextWidget> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('TextWidget---initState');

  }

  @override
  Widget build(BuildContext context) {

    print('TextWidget---build:}');

    return Text(widget.text);
  }
}


class Defy extends RenderObjectWidget {

  String name;
  Defy({Key key, this.name}): assert(name != null),
        super(key:key);



  void doSomething(String name) {

  }

  @override
  RenderObjectElement createElement() {
    // TODO: implement createElement
    return null;
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    return null;
  }

}
