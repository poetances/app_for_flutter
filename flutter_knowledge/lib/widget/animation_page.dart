
import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // 创建动画
    _controller = AnimationController(vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation'),),
      body: Column(
        children: [
          // 类似于隐士动画
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.red, width: 1)
            ),
            width: 100,
            height: 100
          ),

          // 通过animation controller驱动
          ScaleTransition(scale: _animation),

          // 直接使用AnimationController，搭配Animation listener进行监听和更新。
        ],
      ),
    );
  }
}

