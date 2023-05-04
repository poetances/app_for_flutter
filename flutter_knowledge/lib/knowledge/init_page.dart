import 'package:flutter/material.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {

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