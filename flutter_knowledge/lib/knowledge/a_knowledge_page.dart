
import 'package:flutter/material.dart';
import 'package:flutter_knowledge/knowledge/abstract_class_page.dart';
import 'package:flutter_knowledge/knowledge/anomaly_page.dart';
import 'package:flutter_knowledge/knowledge/class_page.dart';
import 'package:flutter_knowledge/knowledge/enum_page.dart';
import 'package:flutter_knowledge/knowledge/grammar_page.dart';
import 'package:flutter_knowledge/knowledge/import_page.dart';
import 'package:flutter_knowledge/knowledge/init_page.dart';
import 'package:flutter_knowledge/knowledge/method_page.dart';
import 'package:flutter_knowledge/knowledge/mixin_page.dart';
import 'package:flutter_knowledge/knowledge/operator_page.dart';
import 'package:flutter_knowledge/knowledge/standard_type_page.dart';
import 'package:flutter_knowledge/knowledge/variable_page.dart';
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
      'Import'
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
        Get.to(const IsolatePage());
        break;
      case 'Grammar':
        Get.to(const GrammarPage());
        break;
      case 'Mixin':
        Get.to(const MixinPage());
        break;
      case 'Init':
        Get.to(const InitPage());
        break;
      case 'Variable':
        Get.to(const VariablePage());
        break;
      case 'StandardType':
        Get.to(const StandardTypePage());
        break;
      case 'Method':
        Get.to(const MethodPage());
        break;
      case 'Operator':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const OperatorPage()),
        );
        break;
      case 'Anomaly':
        Get.to(const AnomalyPage());
        break;
      case 'Class':
        Get.to(const ClassPage());
        break;
      case 'Abstract':
        Get.to(const AbstractClassPage());
        break;
      case 'Enum':
        Get.to(const EnumPage());
        break;
      case 'Import':
        Get.to(const ImportPage());
        break;
      default:
        break;
    }
  }
}
