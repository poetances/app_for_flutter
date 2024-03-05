import 'package:flutter/material.dart';

/*
* Flutter中的滚动渲染是当在视窗内才显示。
* 所以，ScrollView画出视窗后Widget、Element、RenderObject默认会被销毁。可以通过AutomaticKeepAliveClientMixin来保存状态。
* 其原理：
* 可以看到，item Widget上有KeepAlive、AutomaticKeepAlive、_SliverFillViewportRenderObjectWidget。后面会一一介绍其作用。
*_SliverFillViewportRenderObjectWidget
_SliverFillViewportRenderObjectWidget的父类为SliverMultiBoxAdaptorWidget，可以看做Sliver模型中能够容纳多个child的容器。
在item划出显示区域，_SliverFillViewportRenderObjectWidget的RenderSliver(RenderSliverFillViewport实例)对象，销毁item RenderObject。

void _destroyOrCacheChild(RenderBox child) {
  final SliverMultiBoxAdaptorParentData childParentData = child.parentData! as SliverMultiBoxAdaptorParentData;
  if (childParentData.keepAlive) {
    assert(!childParentData._keptAlive);
    remove(child);
    _keepAliveBucket[childParentData.index!] = child;
    child.parentData = childParentData;
    super.adoptChild(child);
    childParentData._keptAlive = true;
  } else {
    assert(child.parent == this);
    _childManager.removeChild(child);
    assert(child.parent == null);
  }
}
* 从上面可以清楚看到，被标记为keepAlive的RenderObject将会被缓存。
*
* 注意上面所有的推理都是基于ListView的一个属性：addAutomaticKeepAlives，默认是true，会增加KeepAiveWidget
*
* KeepAlive组件通常不单独使用。
*
* 相对应KeepAlive，PageStorage更加彻底。
* */
class KeepAliveTutorial extends StatefulWidget {
  const KeepAliveTutorial({super.key});

  @override
  State<KeepAliveTutorial> createState() => _KeepAliveTutorialState();
}

class _KeepAliveTutorialState extends State<KeepAliveTutorial> with SingleTickerProviderStateMixin {
  final _tabs = [
    '壹',
    '贰',
    '叁',
    '肆',
    '伍',
  ];

  late TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListViewPage'),
      ),
      body: Column(
        children: [
          TabBar(
            tabs: _tabs
                .map((e) => Tab(
                      text: e,
                      height: 40,
                    ))
                .toList(),
            controller: _controller,
            labelColor: Colors.red,
          ),
          const Divider(),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: _tabs.map((e) {
                return ListView.separated(
                  addAutomaticKeepAlives: true,
                  itemBuilder: (ctx, index) => ListItem(
                    text: '$index',
                  ),
                  separatorBuilder: (ctx, _) => const Divider(),
                  itemCount: 50,
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class ListItem extends StatefulWidget {
  final String text;

  const ListItem({super.key, required this.text});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print('initState-${widget.text}');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      height: 60,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.centerLeft,
      child: Text(widget.text),
    );
  }
}
