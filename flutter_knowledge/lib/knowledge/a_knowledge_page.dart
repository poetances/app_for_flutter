
import 'package:flutter/material.dart';
import 'package:flutter_knowledge/knowledge/grammar_page.dart';
import 'package:flutter_knowledge/knowledge/mixin_page.dart';
import 'package:get/get.dart';

import 'isolate_page.dart';

class AKnowledgePage extends StatefulWidget {
  const AKnowledgePage({Key? key}) : super(key: key);

  @override
  State<AKnowledgePage> createState() => _AKnowledgePageState();
}

class _AKnowledgePageState extends State<AKnowledgePage> {

  @override
  Widget build(BuildContext context) {
    List pages = [
      'IsolatePage',
      'Grammar',
      'Mixin'
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Widget'),),
      body: ListView.separated(
        itemBuilder: (context, index) {
          String page = pages[index];
          return GestureDetector(
            onTap: () => _push(page),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              color: Colors.white,
              alignment: Alignment.center,
              child: Text(page),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: pages.length,
      ),
    );
  }

  void _push(String page) {
    switch (page) {
      case 'IsolatePage':
        Get.to(const IsolatePage());
        break;
      case 'Grammar':
        Get.to(const GrammarPage());
        break;
      case 'Mixin':
        Get.to(const MixinPage());
        break;
      default:
        break;
    }
  }
}
