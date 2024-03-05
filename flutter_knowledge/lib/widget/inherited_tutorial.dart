import 'package:flutter/material.dart';

class InheritedTutorial extends StatefulWidget {
  const InheritedTutorial({super.key});

  @override
  State<InheritedTutorial> createState() => _InheritedTutorialState();
}

class _InheritedTutorialState extends State<InheritedTutorial> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('InheritedPage'),),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(),

        ],
      ),
    );
  }
}
