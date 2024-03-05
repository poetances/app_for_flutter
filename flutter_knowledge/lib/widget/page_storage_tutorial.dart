import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ScrollController有一个主要属性keepScrollOffset，表示是否存储滚动位置
class PageStorageTutorial extends StatefulWidget {
  const PageStorageTutorial({super.key});

  @override
  State<PageStorageTutorial> createState() => _PageStorageTutorialState();
}

class _PageStorageTutorialState extends State<PageStorageTutorial> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _controller = ScrollController(keepScrollOffset: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
             Tab(icon: Icon(Icons.category)),
             Tab(icon: Icon(Icons.star)),
          ],
        ),
        title: const Text('Tab Page'),
        actions: [
          TextButton(
            onPressed: () {
              Get.to(const PageStorageSecondPage());
            },
            child: const Icon(Icons.add_circle_outline, color: Colors.white,),
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // 页面 1
          ListView.builder(
            key: const PageStorageKey('pageOne'),  // 使用 PageStorageKey
            itemCount: 50,
            itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
            controller: _controller,
          ),
          // 页面 2
          ListView.builder(
            key: const PageStorageKey('pageTwo'),  // 使用 PageStorageKey
            itemCount: 50,
            itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

/// 如果定义全局
final PageStorageBucket _bucket = PageStorageBucket();

class PageStorageSecondPage extends StatefulWidget {
  const PageStorageSecondPage({super.key});

  @override
  State<PageStorageSecondPage> createState() => _PageStorageSecondPageState();
}

class _PageStorageSecondPageState extends State<PageStorageSecondPage> {

  var _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PageStorageSecondPage'),),
      body: PageStorage(
        bucket: _bucket,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_count'),
            ElevatedButton(
              onPressed: () => setState(() {
                _count++;
              }),
              child: const Icon(Icons.add),
            ),
            Expanded(
              child: ListView.separated(
                  key: const PageStorageKey('list'),
                  itemBuilder: (ctx, index) => Text('$index'),
                  separatorBuilder: (ctx, index) => const Divider(),
                  itemCount: 50),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
