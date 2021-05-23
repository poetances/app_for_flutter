
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';


class TransformPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _TransformPageState();
  }
}

class _TransformPageState extends State<TransformPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransformPage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Transform直接使用，进行的4d变换。我们一般使用其提供的构造函数。
          Transform.rotate(
            angle: 0.5,
            child: Container(
              width: 100,
              height: 100,
            ),
          ),
          Divider(height: 50,),
          // RotatedBox 和上面的区别是，这个是先旋转，旋转完后，然后在进行渲染，也就是作用在Layout阶段，所以会影响子控件的布局。
          RotatedBox(
              quarterTurns: 1, // 旋转多个 四分之一 圈。
            child: Container(
              width: 100,
              height: 100,
              child: Text('hello,flutter'),
            ),
          ),
          Divider(),

          // 限制子控件的最大或者最小高度。
          LimitedBox(
            maxHeight: 50,
            maxWidth: 100,
            child: Container(
              width: 200,
              height: 200,
              transform: Matrix4.translation(Vector3(100, 100, 100)),
              child: Text('LimitedBox控件的作用，是对子控件进行宽度和高度的限定 ', style: TextStyle(), softWrap: false,),
            ),
          ),
          Divider(),



        ],
      ),
    );
  }
}


