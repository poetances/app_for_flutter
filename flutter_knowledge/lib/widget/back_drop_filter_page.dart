
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackdropFilterPage extends StatelessWidget {
  BackdropFilterPage({super.key});

  final List<int> rainbow = [
    0xffff0000,
    0xffFF7F00,
    0xffFFFF00,
    0xff00FF00,
    0xff00FFFF,
    0xff0000FF,
    0xff8B00FF
  ];

  final List<double> stops = [0.0, 1 / 6, 2 / 6, 3 / 6, 4 / 6, 5 / 6, 1.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BackdropFilterPage'),),
      body: DecoratedBox(
        decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: rainbow.map((e) => Color(e)).toList(),
              stops: stops,
              radius: 1.8
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Wrap(
            spacing: 10,
            children: [
              CupertinoPopupSurface(
                isSurfacePainted: true,
                child: Container(
                  width: 150,
                  height: 100,
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
              CupertinoPopupSurface(
                isSurfacePainted: false,
                child: Container(
                  width: 150,
                  height: 100,
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  width: 150,
                  height: 100,
                  color: Colors.white.withOpacity(0.3),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
