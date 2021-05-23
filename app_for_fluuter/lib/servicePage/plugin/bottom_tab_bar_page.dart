
import 'package:flutter/material.dart';

import 'package:bottom_tab_bar/bottom_tab_bar.dart';
class BottomTabBarPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomTabBarPageState();
  }
}

class _BottomTabBarPageState extends State<BottomTabBarPage> {

  int _selectedIndex = 1;


  var titles = ['home', 'video', 'find', 'smallvideo', 'my'];
  var icons = [
    Icons.home,
    Icons.play_arrow,
    Icons.child_friendly,
    Icons.fiber_new,
    Icons.mic_none
  ];

  final _widgetOptions = [
    Text('Index 0: Home'),
    Text('Index 1: Video'),
    Text('Index 2: find someone'),
    Text('Index 3: small Video'),
    Text('Index 4: My'),
  ];

  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomTabBarPage"),
      ),
      bottomNavigationBar: BottomTabBar(
        items: [
          BottomTabBarItem(
              icon: Icon(icons[0]), title: Text(titles[0]), badgeNo: "12"),
          BottomTabBarItem(icon: Icon(icons[1]), title: Text(titles[1])),
          BottomTabBarItem(icon: Icon(icons[2]), title: Text(titles[2])),
          BottomTabBarItem(
              icon: Icon(icons[3]),
              activeIcon: Icon(icons[3]),
              title: Text(titles[3])),
        ],
        fixedColor: Colors.blue,
        currentIndex: _selectedIndex,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomTabBarType.fixed,
        isAnimation: false,
        isInkResponse: false,
        badgeColor: Colors.green,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}