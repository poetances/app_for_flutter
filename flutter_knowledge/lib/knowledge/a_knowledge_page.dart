
import 'package:flutter/material.dart';
import 'package:flutter_knowledge/knowledge/abstract_class_tutorial.dart';
import 'package:flutter_knowledge/knowledge/anomaly_tutorial.dart';
import 'package:flutter_knowledge/knowledge/class_tutorial.dart';
import 'package:flutter_knowledge/knowledge/grammar_tutorial.dart';
import 'package:flutter_knowledge/knowledge/life_cycle_tutorial.dart';
import 'package:flutter_knowledge/knowledge/method_tutorial.dart';
import 'package:flutter_knowledge/knowledge/mixin_tutorial.dart';
import 'package:flutter_knowledge/knowledge/notification_tutorial.dart';
import 'package:flutter_knowledge/knowledge/standard_type_tutorial.dart';
import 'package:get/get.dart';

import 'isolate_tutorial.dart';

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
      'Mixin',
      'StandardType',
      'Method',
      'Anomaly',
      'Class',
      'Abstract',
      'Import',
      'LifeCycle',
      'Notification'
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
              alignment: Alignment.centerLeft,
              child: Text(page),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(height: 1,),
        itemCount: pages.length,
        reverse: true,
      ),
    );
  }

  void _push(String page) {
    switch (page) {
      case 'IsolatePage':
        Get.to(const IsolateTutorial());
      case 'Grammar':
        Get.to(const GrammarTutorial());
      case 'Mixin':
        Get.to(const MixinTutorial());
      case 'StandardType':
        Get.to(const StandardTypeTutorial());
      case 'Method':
        Get.to(const MethodTutorial());
      case 'Anomaly':
        Get.to(const AnomalyTutorial());
      case 'Class':
        Get.to(const ClassTutorial());
      case 'Abstract':
        Get.to(const AbstractClassTutorial());
      case 'LifeCycle':
        Get.to(const LifeCycleTutorial());
      case 'Notification':
        Get.to(const NotificationTutorial());
      default:
        break;
    }
  }
}
