
import 'package:flutter/material.dart';
import 'package:flutter_knowledge/knowledge/abstract_class_tutorial.dart';
import 'package:flutter_knowledge/knowledge/anomaly_tutorial.dart';
import 'package:flutter_knowledge/knowledge/async_tutorial.dart';
import 'package:flutter_knowledge/knowledge/class_tutorial.dart';
import 'package:flutter_knowledge/knowledge/enum_tutorial.dart';
import 'package:flutter_knowledge/knowledge/grammar_tutorial.dart';
import 'package:flutter_knowledge/knowledge/import_tutorial.dart';
import 'package:flutter_knowledge/knowledge/init_tutorial.dart';
import 'package:flutter_knowledge/knowledge/life_cycle_tutorial.dart';
import 'package:flutter_knowledge/knowledge/method_tutorial.dart';
import 'package:flutter_knowledge/knowledge/mixin_tutorial.dart';
import 'package:flutter_knowledge/knowledge/operator_tutorial.dart';
import 'package:flutter_knowledge/knowledge/standard_type_tutorial.dart';
import 'package:flutter_knowledge/knowledge/variable_tutorial.dart';
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
      'Init',
      'Variable',
      'StandardType',
      'Method',
      'Operator',
      'Anomaly',
      'Class',
      'Abstract',
      'Enum',
      'Import',
      'Async',
      'LifeCycle'
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
        reverse: true,
      ),
    );
  }

  void _push(String page) {
    switch (page) {
      case 'IsolatePage':
        Get.to(const IsolateTutorial());
        break;
      case 'Grammar':
        Get.to(const GrammarTutorial());
        break;
      case 'Mixin':
        Get.to(const MixinTutorial());
        break;
      case 'Init':
        Get.to(const InitTutorial());
        break;
      case 'Variable':
        Get.to(const VariableTutorial());
        break;
      case 'StandardType':
        Get.to(const StandardTypeTutorial());
        break;
      case 'Method':
        Get.to(const MethodTutorial());
        break;
      case 'Operator':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const OperatorTutorial()),
        );
        break;
      case 'Anomaly':
        Get.to(const AnomalyTutorial());
        break;
      case 'Class':
        Get.to(const ClassTutorial());
        break;
      case 'Abstract':
        Get.to(const AbstractClassTutorial());
        break;
      case 'Enum':
        Get.to(const EnumTutorial());
        break;
      case 'Import':
        Get.to(const ImportTutorial());
        break;
      case 'Async':
        Get.to(const AsyncTutorial());
        break;
      case 'LifeCycle':
        Get.to(const LifeCycleTutorial());
        break;
      default:
        break;
    }
  }
}
