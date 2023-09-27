import 'package:flutter/material.dart';

class PageStoragePage extends StatefulWidget {
  const PageStoragePage({super.key});

  @override
  State<PageStoragePage> createState() => _PageStoragePageState();
}

class _PageStoragePageState extends State<PageStoragePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // 页面 1
          ListView.builder(
            key: const PageStorageKey('pageOne'),  // 使用 PageStorageKey
            itemCount: 50,
            itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
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
