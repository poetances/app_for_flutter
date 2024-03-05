import 'package:flutter/material.dart';

class InitTutorial extends StatefulWidget {
  const InitTutorial({Key? key}) : super(key: key);

  @override
  State<InitTutorial> createState() => _InitTutorialState();
}

class _InitTutorialState extends State<InitTutorial> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InitPage'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
            },
            child: const Text('Elevated Button'),
          ),
        ],
      ),
    );
  }
}

class SuperClass {

  SuperClass._();
}