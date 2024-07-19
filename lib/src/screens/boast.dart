import 'package:flutter/material.dart';

final List<Tab> tabs = <Tab>[
  Tab(child: Text('자식자랑', style: TextStyle(fontFamily: 'MainFont'))),
  Tab(child: Text('육아꿀팁', style: TextStyle(fontFamily: 'MainFont'))),
  Tab(child: Text('입양', style: TextStyle(fontFamily: 'MainFont'))),
];

final List<Widget> tabItems = [
  Center(child: Text('자식자랑', style: TextStyle(fontFamily: 'MainFont'))),
  Center(child: Text('육아꿀팁', style: TextStyle(fontFamily: 'MainFont'))),
  Center(child: Text('입양', style: TextStyle(fontFamily: 'MainFont'))),
];

class Boast extends StatelessWidget {
  const Boast({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('PetStory', style: TextStyle(fontFamily: 'MainFont')),
          bottom: TabBar(
            tabs: tabs,
            indicatorColor: Color(0xffFF4081),
            labelColor: Colors.black,
            overlayColor: MaterialStatePropertyAll(
              Color(0xffFFEEEE),
            ),
          ),
        ),
        body: TabBarView(
          children: tabItems,
        ),
      ),
    );
  }
}
