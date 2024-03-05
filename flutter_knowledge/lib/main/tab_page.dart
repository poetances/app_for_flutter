
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_knowledge/dart/a_dart_page.dart';
import 'package:flutter_knowledge/knowledge/a_knowledge_page.dart';
import 'package:flutter_knowledge/widget/a_widget_page.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {

  int _tabIndex = 0;


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _tabIndex,
        children: const [
          ADartPage(),
          AKnowledgePage(),
          AWidgetPage()
        ],
      ),
      bottomNavigationBar: Banner(
        message: 'debug',
        location: BannerLocation.bottomEnd,
        child: BottomNavigationBar(
          onTap: (index) => setState(() { _tabIndex = index; }),
          currentIndex: _tabIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.book_online),
                label: 'Knowledge'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal),
                label: 'Widget'
            )
          ],
        ),
      ),
    );
  }
}
