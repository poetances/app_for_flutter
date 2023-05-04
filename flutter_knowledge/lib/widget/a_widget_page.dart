import 'package:flutter/material.dart';
import 'package:flutter_knowledge/knowledge/isolate_page.dart';
import 'package:flutter_knowledge/widget/animation_page.dart';
import 'package:get/get.dart';

class AWidgetPage extends StatefulWidget {
  const AWidgetPage({Key? key}) : super(key: key);

  @override
  State<AWidgetPage> createState() => _AWidgetPageState();
}

class _AWidgetPageState extends State<AWidgetPage> {


  @override
  Widget build(BuildContext context) {
    List pages = [
      'Isolate',
      'Animation'
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
      case 'Isolate':
        Get.to(const IsolatePage());
        break;
      case 'Animation':
        Get.to(const AnimationPage());
        break;
      default:
        break;
    }
  }
}
