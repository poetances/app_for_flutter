import 'package:flutter/material.dart';
import 'package:flutter_knowledge/knowledge/isolate_page.dart';
import 'package:flutter_knowledge/widget/animation_page.dart';
import 'package:flutter_knowledge/widget/back_drop_filter_page.dart';
import 'package:flutter_knowledge/widget/inherited_page.dart';
import 'package:flutter_knowledge/widget/keep_alive_page.dart';
import 'package:flutter_knowledge/widget/page_storage_page.dart';
import 'package:get/get.dart';

class AWidgetPage extends StatefulWidget {
  const AWidgetPage({Key? key}) : super(key: key);

  @override
  State<AWidgetPage> createState() => _AWidgetPageState();
}

class _AWidgetPageState extends State<AWidgetPage> {

  final List _pages = [
    'Isolate',
    'Animation',
    'BackDropFilter',
    'KeepAlive',
    'PageStorage',
    'Inherited'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Widget'),),
      body: ListView.separated(
        itemBuilder: (context, index) {
          String page = _pages[index];
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
        itemCount: _pages.length,
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _push(String page) {
    switch (page) {
      case 'Isolate':
        Get.to(const IsolatePage());
        break;
      case 'Animation':
        Get.to(const AnimationPage());
        break;
      case 'BackDropFilter':
        Get.to(BackdropFilterPage());
        break;
      case 'KeepAlive':
        Get.to(const KeepAlivePage());
        break;
      case 'PageStorage':
        Get.to(const PageStoragePage());
        break;
      case 'Inherited':
        Get.to(const InheritedPage());
        break;
      default:
        break;
    }
  }
}
