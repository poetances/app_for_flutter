
import 'package:flutter/material.dart';
import 'dart:ui';

class ConstrainsPage extends StatelessWidget {





  @override
  Widget build(BuildContext context) {


    print(MediaQueryData.fromWindow(window).size);
    print(MediaQueryData.fromWindow(window).padding);

    
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ConstrainsPage'),
      ),
      body: SafeArea(

        child: StackPostionWidget(),
      )
    );
  }
}



//  Container自身尺寸的调节分两种情况：
//
//没有子节点Container会尽可能大的撑满父节点。有子节点会尽可能小的适配子节点。 当然这样的前提是，我们没有设置width、heigh等宽高约束。
//Container布局的特性就是，其布局会受子节点和父节点的影响。
//而且父节点的影响大于子节点。
//我们可以使用UnConstransBox组件，进行包装，来解决其受父节点的影响。
//影响顺序我们可以理解为:
//父节点>>>自身约束>>>子节点约束。
//也就是说，如果父节点尺寸固定。那么哪怕自身设置约束，也无法限制其宽高（可以使用UnConstrainsBox来剪短父节点的影响）
class ContainerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10),
      height: MediaQueryData.fromWindow(window).size.height - 20 - 34 - 88,
      width: MediaQueryData.fromWindow(window).size.width - 20,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.purple, style: BorderStyle.solid),
        shape: BoxShape.rectangle,
        // 三种渐变方式，圆形放射、线性、扫描型
        //gradient: RadialGradient(colors: [Color(0xFFFFFF00), Color(0xFF00FF00), Color(0xFF00FFFF)])
        //gradient: LinearGradient(colors: [Color(0xFFFFFF00), Color(0xFF00FF00), Color(0xFF00FFFF)], begin: FractionalOffset(1, 0), end: FractionalOffset(0, 1))
        //gradient: SweepGradient(colors: [Color(0xFFFFFF00), Color(0xFF00FF00), Color(0xFF00FFFF)], startAngle: 0.0, endAngle: 1*3.14)
      ),
      child: UnconstrainedBox(
        child: Container(
            height: 500,
            width: 300,
            color: Colors.purple,
            child: Text('hello,flutter', style: TextStyle(backgroundColor: Colors.blue),)
        ),

      ),
    );
  }
}

//Stack、Position的合理使用。
class StackPostionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 100),
      width: MediaQueryData.fromWindow(window).size.width,
      height: 150,
      color: Colors.purple,
      child: Container(
        margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
        color: Colors.grey,
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
                child: Text('江苏省退役军人事务厅正式挂牌成立',style: TextStyle(backgroundColor: Colors.blue),)
            ),
            Positioned(
              child: Text('新华社 2019-6-28',style: TextStyle(backgroundColor: Colors.red),),
              bottom: 0,
            ),
            Positioned(
              child: ClipRRect(child: Image.asset('assets/home/image0.png', fit: BoxFit.cover,), borderRadius: BorderRadius.circular(10),),
              width: 150,
              right: 0,
              bottom: 0,
              top: 0,
            ),


          ],
        ),
      ),
    );
  }
}