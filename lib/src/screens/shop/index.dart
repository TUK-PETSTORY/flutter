import 'package:flutter/material.dart';
import 'package:front/src/screens/shop/show.dart';

final List<Tab> tabs = <Tab>[
  Tab(child: Text('전체보기', style: TextStyle(fontFamily: 'MainFont'))),
  Tab(child: Text('즐겨찾기', style: TextStyle(fontFamily: 'MainFont')))
];

final List<Widget> tabItems = [
  ShopListItem(),
  Center(child: Text('즐겨찾기', style: TextStyle(fontFamily: 'MainFont')))
];

class ShopIndex extends StatelessWidget {
  const ShopIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('Pet Story', style: TextStyle(fontFamily: 'MainFont')),
          bottom: TabBar(
            tabs: tabs,
            indicatorColor: Color(0xffFF4081),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
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
