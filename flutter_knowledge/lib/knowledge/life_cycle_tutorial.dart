import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LifeCycleTutorial extends StatefulWidget {
  const LifeCycleTutorial({super.key});

  @override
  State<LifeCycleTutorial> createState() => _LifeCycleTutorialState();
}

class _LifeCycleTutorialState extends State<LifeCycleTutorial> {

  int _count = 0;

  @override
  void initState() {
    super.initState();

    print('initState-只调用一次');
  }

  /// 组件依赖的State发生变化时候调用，这里的State是全局State比如，系统语言、主题等
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies-组件依赖的State发生变化时候调用，这里的State是全局State比如，系统语言、主题等');
  }

  /// 当父 Widget 触发 build() 重建（rebuild） 该 Widget 时，引发该回调
  @override
  void didUpdateWidget(covariant LifeCycleTutorial oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget-当父 Widget 触发 build() 重建（rebuild） 该 Widget 时，引发该回调');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LifeCyclePage'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const _Child(),
          const Divider(),
          IconButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              icon: const Icon(Icons.abc)
          ),

        ],
      ),
    );
  }

  /// 销毁阶段
  @override
  void deactivate() {
    super.deactivate();
    print('deactivate-当 State 对象从树中被移除时，会调用此回调。如果移除后没有重新插入到树中则紧接着会调用 dispose() 方法。');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }
}

class _Child extends StatefulWidget {
  const _Child({super.key});

  @override
  State<_Child> createState() => _ChildState();
}

class _ChildState extends State<_Child> {

  /// 组件依赖的State发生变化时候调用，这里的State是全局State比如，系统语言、主题等
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('_Child:didChangeDependencies-组件依赖的State发生变化时候调用，这里的State是全局State比如，系统语言、主题等');
  }

  /// 当父 Widget 触发 build() 重建（rebuild） 该 Widget 时，引发该回调
  @override
  void didUpdateWidget(covariant _Child oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('_Child:didUpdateWidget-当父 Widget 触发 build() 重建（rebuild） 该 Widget 时，引发该回调');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.deepOrange,
    );
  }

  /// 销毁阶段
  @override
  void deactivate() {
    super.deactivate();
    print('_Child:deactivate-当 State 对象从树中被移除时，会调用此回调。如果移除后没有重新插入到树中则紧接着会调用 dispose() 方法。');
  }

  @override
  void dispose() {
    super.dispose();
    print('_Child:dispose');
  }
}

