import 'package:flutter/material.dart';
import 'package:flutter_knowledge/dart/annot_tutorial.dart' deferred as annot;
import 'package:flutter_knowledge/dart/buid_in_types_tutorial.dart';
import 'package:flutter_knowledge/dart/codelabs_tutorial.dart';
import 'package:flutter_knowledge/dart/future_tutorial.dart';
import 'package:flutter_knowledge/dart/generics_tutorial.dart';
import 'package:flutter_knowledge/dart/keyword_tutorial.dart';
import 'package:flutter_knowledge/dart/stream_controller_tutorial.dart';
import 'package:flutter_knowledge/dart/typedefs_tutorial.dart';
import 'package:flutter_knowledge/dart/variable_tutorial.dart';
import 'package:get/get.dart';

import 'enum_tutorial.dart';
import 'import_tutorial.dart';
import 'init_tutorial.dart';
import 'operator_tutorial.dart';

class ADartPage extends StatefulWidget {
  const ADartPage({super.key});

  @override
  State<ADartPage> createState() => _ADartPageState();
}

class _ADartPageState extends State<ADartPage> {

  final _contents = [
    'Codelabs',
    'Variable',
    'Operator',
    'Annot',
    'Import',
    'Keyword',
    'BuildInTypes',
    'Typedefs',
    'Init',
    'Enum',
    'Future',
    'StreamController'
  ];

  /// life recycle
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DartPage'),
      ),
      body: ListView.separated(
          itemBuilder: (ctx, index) {
            final page = _contents[index];
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
          separatorBuilder: (ctx, index) => const Divider(height: 1,),
          itemCount: _contents.length),
    );
  }

  /// private method
  void _push(String page) {
    switch (page) {
      case 'Codelabs':
        Get.to(const CodeLabsTutorial());
      case 'Variable':
        Get.to(const VariableTutorial());
      case 'Operator':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const OperatorTutorial()),
        );
      case 'Annot':
        Future(() async {
          await annot.loadLibrary();
          Get.to(annot.AnnotTutorial());
        });
      case 'Import':
        Get.to(const ImportTutorial());
      case 'Keyword':
        Get.to(const KeywordTutorial());
      case 'BuildInTypes':
        Get.to(const BuildInTypesTutorial());
      case 'Generics':
        Get.to(const GenericsTutorial());
      case 'Typedefs':
        Get.to(const TypedefsTutorial());
      case 'Init':
        Get.to(const InitTutorial());
      case 'Enum':
        Get.to(const EnumTutorial());
      case 'Future':
        Get.to(const FutureTutorial());
      case 'StreamController':
        Get.to(const StreamControllerTutorial());
      default: break;
    }
  }
}
