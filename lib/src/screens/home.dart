import 'package:flutter/material.dart';
import 'comunityMain.dart';

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
    Center(child: Text('추천사이트', style: TextStyle(fontFamily: 'MainFont'))),
    Comunitymain(),
    Center(child: Text('마이페이지', style: TextStyle(fontFamily: 'MainFont'))),
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
