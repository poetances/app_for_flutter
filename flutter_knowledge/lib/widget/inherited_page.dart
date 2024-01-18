import 'package:flutter/material.dart';

class InheritedPage extends StatefulWidget {
  const InheritedPage({super.key});

  @override
  State<InheritedPage> createState() => _InheritedPageState();
}

class _InheritedPageState extends State<InheritedPage> {
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
