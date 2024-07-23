import 'package:flutter/material.dart';
import 'mypage/index.dart';
import 'comunityMain.dart';
import 'shop/index.dart';

final List<BottomNavigationBarItem> navbar = [
  BottomNavigationBarItem(icon: Icon(Icons.web), label: '추천사이트'),
  BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
  BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 1;

  final List<Widget> _navbarViews = [
    ShopIndex(),
    Comunitymain(),
    MyPageIndex(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navbarViews[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: navbar,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xffFF4081),
      ),
    );
  }
}
